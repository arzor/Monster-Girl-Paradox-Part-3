# =改造/汎用店 by Foo
#
#
#
#
# ==更新履歴
#   Date     Version Author Comment
# ==15/09/03 2.0.2   トリス 統合J～U R
# ==17/05/16 2.0.4   トリス 統合V～W V

#==============================================================================
# ■ NWRegexp::BaseItem
#==============================================================================
module NWRegexp::BaseItem
  SELLD_DRAW = /<特殊売却(?::|：)(\S+)>/i
end

#==============================================================================
# ■ NWConst::Shop
#==============================================================================
module NWConst::Shop
  STATUS_MAX = 9
  NotEquip = "Unable to equip"
  SELECT_ACTOR_TEXT = "Who will equip this?"
end

#==============================================================================
# ■ RPG::BaseItem
#==============================================================================
class RPG::BaseItem
  # ● 特殊売却
  #--------------------------------------------------------------------------
  def selld_draw
    data_ex.fetch(:selld_draw, nil)
  end
end

#==============================================================================
# ■ Window_ShopBuy
#==============================================================================
class Window_ShopBuy < Window_Selectable
  #--------------------------------------------------------------------------
  # ○ 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    rect = item_rect(index)
    name_width = rect.width - text_size(price(item)).width - 24
    draw_item_name(item, rect.x, rect.y, enable?(item), name_width)
    rect.width -= 4
    draw_text(rect, price(item), 2)
  end

  #--------------------------------------------------------------------------
  # ○ ヘルプテキスト更新
  #--------------------------------------------------------------------------
  def update_help
    @help_window.set_item(item) if @help_window
    @status_window.item = item if @status_window
  end

  def make_item_list
    shop_id = $game_system.enchant_shop_id || :temp
    @data = []
    @price = {}
    @shop_goods.each do |goods|
      item = $game_party.shop_enchant_item(shop_id, Container.item(goods[0], goods[1]))
      if item
        @data.push(item)
        @price[item] = goods[2] == 0 ? item.price : goods[3]
      end
    end
    $game_system.temp_add_shop_items.each do |type, item_id, price, condition_text|
      item = $game_party.shop_enchant_item(shop_id, Container.item(type, item_id))
      next unless item

      v = $game_variables
      s = $game_switches
      result = begin
        eval(condition_text)
      rescue StandardError
        false
      end
      next unless result

      @data.push(item)
      @price[item] = price
    end
  end

  def sort_item_list; end
end

#==============================================================================
# ■ Scene_Shop
#==============================================================================
class Scene_Shop < Scene_MenuBase
  #--------------------------------------------------------------------------
  # ○ 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    create_help_window
    create_gold_window
    create_command_window
    create_dummy_window
    create_number_window
    create_status_window
    create_buy_window
    create_category_window
    create_sell_window
    create_popup_confirm_window
    create_select_actor_window
  end

  #--------------------------------------------------------------------------
  # ○ 個数入力ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_number_window
    wy = @dummy_window.y
    wh = @dummy_window.height
    @number_window = Window_ShopNumber.new(0, wy, wh)
    @number_window.viewport = @viewport
    @number_window.hide
    @number_window.set_handler(:ok,     method(:unavailable_check))
    @number_window.set_handler(:cancel, method(:on_number_cancel))
  end

  #--------------------------------------------------------------------------
  # ○ 購入ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_buy_window
    wy = @dummy_window.y
    wh = @dummy_window.height
    @buy_window = Window_ShopBuy.new(0, wy, wh, @goods)
    @buy_window.viewport = @viewport
    @buy_window.help_window = @help_window
    @buy_window.status_window = @status_window
    @buy_window.hide
    @buy_window.set_handler(:ok,     method(:on_buy_ok))
    @buy_window.set_handler(:cancel, method(:on_buy_cancel))
  end

  #--------------------------------------------------------------------------
  # ● 確認ポップアップウィンドウの作成
  #--------------------------------------------------------------------------
  def create_popup_confirm_window
    @popup_confirm_window = Window_PopupConfirm.new
    @popup_confirm_window.viewport = @viewport
    @popup_confirm_window.hide
    @popup_confirm_window.set_handler(:ok, method(:on_number_ok))
    @popup_confirm_window.set_handler(:cancel, method(:on_number_cancel))
  end

  def create_select_actor_window
    @select_actor_window = Window_PopupConfirm.new(Window_SelectActorSlotEquip.new)
    @select_actor_window.set_title(NWConst::Shop::SELECT_ACTOR_TEXT)
    @select_actor_window.hide
    @select_actor_window.set_handler(:ok, method(:select_actor_ok))
    @select_actor_window.set_handler(:cancel, method(:select_actor_cancel))
  end

  #--------------------------------------------------------------------------
  # ● 再入手不可能アイテムかチェック
  #--------------------------------------------------------------------------
  def unavailable_check
    if @command_window.current_symbol == :sell && @sell_window.item.selld_draw
      @popup_confirm_window.refresh
      @popup_confirm_window.show.activate
      @popup_confirm_window.set_title(@sell_window.item.selld_draw)
      @popup_confirm_window.set_name(@sell_window.item.name)
      @popup_confirm_window.select(1)
    else
      on_number_ok
    end
  end

  #--------------------------------------------------------------------------
  # ○ 購入［決定］
  #--------------------------------------------------------------------------
  def on_buy_ok
    @item = @buy_window.item
    @buy_window.hide
    @number_window.set(@item, max_buy, buying_price, currency_unit)
    @number_window.show.activate
    @status_window.deactivate
  end

  #--------------------------------------------------------------------------
  # ○ 売却［決定］
  #--------------------------------------------------------------------------
  def on_sell_ok
    @item = @sell_window.item
    @status_window.item = @item
    @category_window.hide
    @sell_window.hide
    @number_window.set(@item, max_sell, selling_price, currency_unit)
    @number_window.show.activate
    @status_window.show.deactivate
  end

  #--------------------------------------------------------------------------
  # ○ 個数入力［決定］
  #--------------------------------------------------------------------------
  def on_number_ok
    @popup_confirm_window.hide if @popup_confirm_window.visible
    case @command_window.current_symbol
    when :buy
      do_buy(@number_window.number)
    when :sell
      do_sell(@number_window.number)
    end
    if select_actor?
      Sound.play_ok
      select_actor
    else
      Sound.play_shop
      end_number_input
    end
    @gold_window.refresh
    @status_window.refresh
  end

  #--------------------------------------------------------------------------
  # ○ 個数入力［キャンセル］
  #--------------------------------------------------------------------------
  def on_number_cancel
    @popup_confirm_window.hide if @popup_confirm_window.visible
    end_number_input
  end

  def select_actor?
    @item && @command_window.current_symbol == :buy && @number_window.number == 1 && $game_party.members.any? do |m|
      m.equippable?(@item)
    end
  end

  #--------------------------------------------------------------------------
  # ○ 個数入力の終了
  #--------------------------------------------------------------------------
  def end_number_input
    @number_window.hide
    @status_window.activate
    case @command_window.current_symbol
    when :buy
      activate_buy_window
    when :sell
      activate_sell_window
    end
  end

  def select_actor
    @number_window.deactivate
    @select_actor_window.item = @item
    @select_actor_window.actors = $game_party.members.select { |m| m.equippable?(@item) }
    @select_actor_window.show.activate.select(0)
  end

  def select_actor_ok
    Sound.play_equip
    Sound.play_shop
    actor, slot_id = @select_actor_window.current_ext
    actor.change_equip(slot_id, @item)
    @select_actor_window.hide.deactivate
    end_number_input
  end

  def select_actor_cancel
    Sound.play_shop
    @select_actor_window.hide.deactivate
    end_number_input
  end

  def return_scene
    super
    $game_system.enchant_shop_id = nil
    $game_party.delete_shop_enchant_item(:temp)
  end
end
