# 合成屋 by Foo

#==============================================================================
# ■ NWConst::Synthesize
#==============================================================================
module NWConst::Synthesize
    CONFIRM_TEXT = "%s will be synthesized. Proceed?"
  EQUIP_ACTOR_TEXT = "※ The equipped gear will be used as a material."
  EQUIP_ACTOR_TEXT_CONTENTS = "  %s(%s)"
    SELECT_BEFORE_ACTOR_TEXT = "Synthesizing %s while equipped.\\nSelect the character equipped it's equipped on."
end

module Synthesize
  def recipe_item(recipe)
    Container.item(recipe[:kind], recipe[:id])
  end
end

#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ● 合成屋の呼び出し
  #--------------------------------------------------------------------------
  def call_synthesize(shop_id)
    SceneManager.call(Scene_Synthesize)
    SceneManager.scene.prepare(shop_id)
    Fiber.yield
  end
end

#==============================================================================
# ■ Window_SynthesizeCommand
#==============================================================================
class Window_SynthesizeCommand < Window_HorzCommand
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0)
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得
  #--------------------------------------------------------------------------
  def window_width
    480
  end

  #--------------------------------------------------------------------------
  # ● 桁数の取得
  #--------------------------------------------------------------------------
  def col_max
    2
  end

  #--------------------------------------------------------------------------
  # ● コマンドリストの作成
  #--------------------------------------------------------------------------
  def make_command_list
    add_command("Synthesize", :synthesize)
    add_command("Leave", :cancel)
  end
end

#==============================================================================
# ■ Window_SynthesizeStatus
#==============================================================================
class Window_SynthesizeStatus < Window_Base
  include Synthesize
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super(304, 120, window_width, 360)
    @item = nil
    @befores = nil
    @page_index = 0
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得
  #--------------------------------------------------------------------------
  def window_width
    336
  end

  #--------------------------------------------------------------------------
  # ● アイテムのセット
  #--------------------------------------------------------------------------
  def set_item(after_item, befores)
    @item = after_item
    @befores = befores
    @page_index = 0
    refresh
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    return if @item.nil?

    draw_possession(4, 0)
    draw_button(0, contents.height - (line_height * 2)) unless @item.is_a?(RPG::Item)
    method_name = draw_methods[@page_index][:name]
    index = draw_methods[@page_index][:index]
    send(method_name, 0, 28, index)
  end

  #--------------------------------------------------------------------------
  # ● 描画命令メソッド配列の取得
  #--------------------------------------------------------------------------
  def draw_methods
    methods = []
    methods.push({ :name => :draw_before_items, :index => 0 })
    param_page_max.times { |i| methods.push({ :name => :draw_params, :index => i }) }
    enchant_page_max.times { |i| methods.push({ :name => :draw_enchants, :index => i }) }
    methods
  end

  #--------------------------------------------------------------------------
  # ● 所持数の描画
  #--------------------------------------------------------------------------
  def draw_possession(x, y)
    rect = Rect.new(x, y, contents.width - 4 - x, line_height)
    change_color(system_color)
    draw_text(rect, Vocab::Possession)
    change_color(normal_color)
    draw_text(rect, $game_party.item_number(@item), 2)
  end

  #--------------------------------------------------------------------------
  # ● ボタン説明の描画
  #--------------------------------------------------------------------------
  def draw_button(x, y)
    rect = Rect.new(x, y, contents.width, line_height)
    change_color(system_color)
    if 1 < page_max
      draw_text(rect, Help.shop_equip_change)
      draw_text(rect, "#{@page_index + 1}/#{page_max}", 2)
    end
    rect.y += line_height
    draw_text(rect, Help.shop_param_compare)
  end

  #--------------------------------------------------------------------------
  # ● 必要素材の描画
  #--------------------------------------------------------------------------
  def draw_before_items(x, y, dummy)
    rect = Rect.new(x, y, contents.width, line_height)
    change_color(system_color)
    draw_text(rect, "Materials Needed")
    rect.y += line_height + 2
    change_color(normal_color)
    @befores.each do |before|
      item = recipe_item(before)
      party_num = $game_party.item_number_include_uniq(item, true)
      need_num = before[:num]
      draw_item_name(item, rect.x, rect.y, need_num <= party_num)
      draw_text(rect, "#{need_num}/#{party_num}", 2)
      rect.y += line_height
    end
  end

  #--------------------------------------------------------------------------
  # ● 基礎性能の描画
  #--------------------------------------------------------------------------
  def draw_params(x, y, index)
    rect = Rect.new(x, y, contents.width, line_height)
    param_names = @item.param_names[index * NWConst::Shop::STATUS_MAX, NWConst::Shop::STATUS_MAX]
    change_color(system_color)
    draw_text(rect, "Base Stats")
    rect.y += line_height + 2
    change_color(normal_color)
    param_names.each  do |name|
      draw_text(rect, name)
      rect.y += line_height
    end
  end

  #--------------------------------------------------------------------------
  # ● 特殊効果の描画
  #--------------------------------------------------------------------------
  def draw_enchants(x, y, index)
    rect = Rect.new(x, y, contents.width, line_height)
    enchant_names = @item.enchant_names[index * NWConst::Shop::STATUS_MAX, NWConst::Shop::STATUS_MAX]
    change_color(system_color)
    draw_text(rect, "Special Effects")
    rect.y += line_height + 2
    change_color(normal_color)
    enchant_names.each do |name|
      draw_text_plus(rect, name)
      rect.y += line_height
    end
  end

  #--------------------------------------------------------------------------
  # ● 基礎性能最大ページ数の取得
  #--------------------------------------------------------------------------
  def param_page_max
    return 0 if @item.is_a?(RPG::Item)

    (@item.param_names.size - 1) / NWConst::Shop::STATUS_MAX + 1
  end

  #--------------------------------------------------------------------------
  # ● 特殊効果最大ページ数の取得
  #--------------------------------------------------------------------------
  def enchant_page_max
    return 0 if @item.is_a?(RPG::Item)

    (@item.enchant_names.size - 1) / NWConst::Shop::STATUS_MAX + 1
  end

  #--------------------------------------------------------------------------
  # ● 最大ページ数の取得
  #--------------------------------------------------------------------------
  def page_max
    1 + param_page_max + enchant_page_max
  end

  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    update_page
  end

  #--------------------------------------------------------------------------
  # ● ページの更新
  #--------------------------------------------------------------------------
  def update_page
    return unless visible && @item.is_a?(RPG::EquipItem) && page_max > 1

    if Input.trigger?(:RIGHT)
      @page_index = (@page_index + 1) % page_max
      refresh
    elsif Input.trigger?(:LEFT)
      @page_index = ((@page_index - 1) + page_max) % page_max
      refresh
    end
  end
end

#==============================================================================
# ■ Window_SynthesizeLineUp
#==============================================================================
class Window_SynthesizeLineUp < Window_Selectable
  include Synthesize
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_reader :status_window # ステータスウィンドウ

  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(shop_id)
    super(0, 120, window_width, 360)
    @shop_id = shop_id
    @money = 0
    refresh
    select(0)
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得
  #--------------------------------------------------------------------------
  def window_width
    304
  end

  #--------------------------------------------------------------------------
  # ● 項目数の取得
  #--------------------------------------------------------------------------
  def item_max
    @data ? @data.size : 1
  end

  #--------------------------------------------------------------------------
  # ● アイテムの取得
  #--------------------------------------------------------------------------
  def item
    @data[index]
  end

  #--------------------------------------------------------------------------
  # ● 商品の値段を取得
  #--------------------------------------------------------------------------
  def price(item)
    @price[item]
  end

  #--------------------------------------------------------------------------
  # ● 材料品の取得
  #--------------------------------------------------------------------------
  def befores(item)
    @befores[item]
  end

  #--------------------------------------------------------------------------
  # ● 所持金の設定
  #--------------------------------------------------------------------------
  def money=(money)
    @money = money
    refresh
  end

  #--------------------------------------------------------------------------
  # ● 選択項目の有効状態を取得
  #--------------------------------------------------------------------------
  def current_item_enabled?
    enable?(@data[index])
  end

  #--------------------------------------------------------------------------
  # ● アイテムを許可状態で表示するかどうか
  #--------------------------------------------------------------------------
  def enable?(item)
    item && price(item) <= @money && need_before_item?(item) && !$game_party.item_max?(item)
  end

  #--------------------------------------------------------------------------
  # ● 合成材料を持っているか？
  #--------------------------------------------------------------------------
  def need_before_item?(after_item)
    befores(after_item).all? do |before|
      item = recipe_item(before)
      item && (before[:num] <= $game_party.item_number_include_uniq(item, true))
    end
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    make_item_list
    create_contents
    draw_all_items
  end

  #--------------------------------------------------------------------------
  # ● アイテムリストの作成
  #--------------------------------------------------------------------------
  def make_item_list
    @data = []
    @price = {}
    @befores = {}
    recipes = NWConst::Synthesize::Shops[@shop_id].collect do |recipe_id|
      NWConst::Synthesize::Recipes[recipe_id]
    end
    recipes.each do |recipe|
      after_item = recipe_item(recipe[:after])
      next unless after_item

      @data.push(after_item)
      @price[after_item] = recipe[:price]
      @befores[after_item] = recipe[:befores]
    end
  end

  def sort_item_list; end

  #--------------------------------------------------------------------------
  # ● 項目の描画
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
  # ● ステータスウィンドウの設定
  #--------------------------------------------------------------------------
  def status_window=(status_window)
    @status_window = status_window
    call_update_help
  end

  #--------------------------------------------------------------------------
  # ● ヘルプテキスト更新
  #--------------------------------------------------------------------------
  def update_help
    @help_window.set_item(item) if @help_window
    @status_window.set_item(item, befores(item)) if @status_window
  end
end

#==============================================================================
# ■ Scene_Synthesize
#==============================================================================
class Scene_Synthesize < Scene_MenuBase
  include Synthesize
  #--------------------------------------------------------------------------
  # ● 準備
  #--------------------------------------------------------------------------
  def prepare(shop_id)
    @shop_id = shop_id
  end

  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    create_help_window
    create_gold_window
    create_command_window
    create_dummy_window
    create_status_window
    create_lineup_window
    create_popup_confirm_window
    create_before_actors_window
    create_after_actors_window
  end

  #--------------------------------------------------------------------------
  # ● ゴールドウィンドウの作成
  #--------------------------------------------------------------------------
  def create_gold_window
    @gold_window = Window_Gold.new
    @gold_window.viewport = @viewport
    @gold_window.x = Graphics.width - @gold_window.width
    @gold_window.y = @help_window.height
  end

  #--------------------------------------------------------------------------
  # ● コマンドウィンドウの作成
  #--------------------------------------------------------------------------
  def create_command_window
    @command_window = Window_SynthesizeCommand.new
    @command_window.viewport = @viewport
    @command_window.y = @help_window.height
    @command_window.set_handler(:synthesize, method(:command_synthesize))
    @command_window.set_handler(:cancel, method(:return_scene))
  end

  #--------------------------------------------------------------------------
  # ● コマンド：合成
  #--------------------------------------------------------------------------
  def command_synthesize
    @lineup_window.money = money
    @dummy_window.hide
    @lineup_window.show
    @status_window.show
    @lineup_window.activate
  end

  #--------------------------------------------------------------------------
  # ● ダミーウィンドウの作成
  #--------------------------------------------------------------------------
  def create_dummy_window
    wy = @command_window.y + @command_window.height
    wh = Graphics.height - wy
    @dummy_window = Window_Base.new(0, wy, Graphics.width, wh)
    @dummy_window.viewport = @viewport
  end

  #--------------------------------------------------------------------------
  # ● ステータスウィンドウの作成
  #--------------------------------------------------------------------------
  def create_status_window
    @status_window = Window_SynthesizeStatus.new
    @status_window.viewport = @viewport
    @status_window.hide
  end

  #--------------------------------------------------------------------------
  # ● ラインナップウィンドウの作成
  #--------------------------------------------------------------------------
  def create_lineup_window
    @lineup_window = Window_SynthesizeLineUp.new(@shop_id)
    @lineup_window.viewport = @viewport
    @lineup_window.hide
    @lineup_window.set_handler(:ok, method(:synthesize_ok))
    @lineup_window.set_handler(:cancel, method(:synthesize_cancel))
    @lineup_window.help_window = @help_window
    @lineup_window.status_window = @status_window
  end

  def create_before_actors_window
    @before_actors_window = Window_PopupConfirm.new(Window_SelectSynthesizeMaterialActor.new)
    @before_actors_window.set_title(NWConst::Synthesize::SELECT_BEFORE_ACTOR_TEXT)
    @before_actors_window.hide
    @before_actors_window.viewport = @viewport
    @before_actors_window.set_handler(:cancel, method(:before_actors_cancel))
    @before_actors_window.set_handler(:ok, method(:before_actors_ok))
  end

  def create_after_actors_window
    @after_actors_window = Window_PopupConfirm.new(Window_SelectActorSlotEquip.new)
    @after_actors_window.set_title(NWConst::Shop::SELECT_ACTOR_TEXT)
    @after_actors_window.hide
    @after_actors_window.viewport = @viewport
    @after_actors_window.set_handler(:cancel, method(:after_actors_cancel))
    @after_actors_window.set_handler(:ok, method(:after_actors_ok))
  end

  def before_actors_ok
    Sound.play_ok
    i = @before_actors_window.item
    @diff[i] -= 1
    actor, index = @before_actors_window.current_ext
    @synthesize_select_history.push([actor, index, i])
    return @before_actors_window.activate.select(0) if setting_before_actors_window

    @before_actors_window.deactivate.hide
    show_popup_confirm_window
  end

  def before_actors_cancel
    i = @synthesize_select_history.pop
    if i.nil?
      @before_actors_window.deactivate.hide
      @lineup_window.activate
    else
      @diff[i[2]] += 1
      setting_before_actors_window
      @before_actors_window.activate.select_ext(i[0])
    end
  end

  def setting_before_actors_window
    i = @diff.select { |_k, v| v > 0 }.first
    return nil unless i

    i = i[0]
    @before_actors_window.item = i
    @before_actors_window.set_name(i.window_name)
    eq = equip_before_data(i).map { |r| [r[0], r[1], r[2].base_data] }
    @before_actors_window.actors = (eq - @synthesize_select_history).map { |r| r[0, 2] }
    true
  end

  def equip_before_data(bitem)
    $game_party.all_members.each_with_object([]) do |m, a|
      m.base_equips.each_with_index do |e, i|
        next unless e

        a << [m, i, e] if e.base_data == bitem && m.equip_change_ok?(i)
      end
    end
  end

  #--------------------------------------------------------------------------
  # ● 合成：決定
  #--------------------------------------------------------------------------
  def synthesize_ok
    @lose_items = []
    @synthesize_select_history = []
    @synthesize_result = []
    @diff = {}
    @lineup_window.befores(@lineup_window.item).each do |before|
      before_item = recipe_item(before)
      r = $game_party.lose_items_include_uniq(before_item, before[:num])
      d = before[:num] - r.size
      @lose_items += r.map { |r| [nil, 0, r] }
      next unless d > 0

      data = equip_before_data(before_item)
      if data.count == d || data.map(&:first).uniq.length <= 1
        @lose_items += data[0, d]
      else
        @diff[before_item] = d
      end
    end

    @popup_confirm_window.set_name(@lineup_window.item.window_name)
    if @diff.keys.empty?
      @popup_confirm_window.refresh
      show_popup_confirm_window
      @popup_confirm_window.select(0)
    else
      @before_actors_window.width = @popup_confirm_window.width
      setting_before_actors_window
      @before_actors_window.show.activate.select(0)
    end
  end

  def lose_item(actor, item)
    return $game_party.lose_item(item, 1) unless actor

    actor.discard_equip_include_uniq(item)
  end

  def show_popup_confirm_window
    title = NWConst::Synthesize::CONFIRM_TEXT
    x = false
    @lose_items.each do |actor, _index, item|
      next unless actor

      title += "\\n#{NWConst::Synthesize::EQUIP_ACTOR_TEXT}" unless x
      title += format("\\n#{NWConst::Synthesize::EQUIP_ACTOR_TEXT_CONTENTS}", item.window_name, actor.name)
      x = true
    end
    @popup_confirm_window.set_title(title)
    @popup_confirm_window.show.activate
  end

  #--------------------------------------------------------------------------
  # ● 合成：キャンセル
  #--------------------------------------------------------------------------
  def synthesize_cancel
    @lineup_window.hide
    @status_window.hide
    @dummy_window.show
    @help_window.clear
    @command_window.activate
  end

  #--------------------------------------------------------------------------
  # ● 確認ポップアップウィンドウの作成
  #--------------------------------------------------------------------------
  def create_popup_confirm_window
    @popup_confirm_window = Window_PopupConfirm.new
    @popup_confirm_window.set_title(NWConst::Synthesize::CONFIRM_TEXT)
    @popup_confirm_window.viewport = @viewport
    @popup_confirm_window.hide
    @popup_confirm_window.set_handler(:ok, method(:confirm_ok))
    @popup_confirm_window.set_handler(:cancel, method(:confirm_cancel))
  end

  #--------------------------------------------------------------------------
  # ● 確認：決定
  #--------------------------------------------------------------------------
  def confirm_ok
    @after_item = @lineup_window.item
    price = @lineup_window.price(@after_item)
    lose_items = @lose_items + @synthesize_select_history
    $game_party.lose_gold(price)
    $game_party.gain_item(@after_item, 1)
    @after_item = $game_party.create_socket_item(@after_item) do |i|
      lose_items.each { |_, _, item| item.trade_stone(i) if item.respond_to?(:trade_stone) }
    end
    lose_items.each { |actor, _, item| lose_item(actor, item) }
    @gold_window.refresh
    @lineup_window.money = money
    @lineup_window.refresh
    @popup_confirm_window.hide

    @after_actors_window.prioritize_list = lose_items.select(&:first).map { |a| a[0, 2] }
    actors = $game_party.members.select { |m| m.equippable?(@after_item) }
    if actors.empty? || !@after_item.equip_item?
      Sound.play_shop
      @lineup_window.activate
      return
    end

    Sound.play_ok
    @after_actors_window.item = @after_item
    @after_actors_window.actors = actors
    @after_actors_window.show.activate.select(0)
  end

  def after_actors_cancel
    Sound.play_shop
    @after_actors_window.hide.deactivate
    @lineup_window.activate
  end

  def after_actors_ok
    Sound.play_equip
    Sound.play_shop
    actor, slot_id = @after_actors_window.current_ext
    actor.change_equip(slot_id, @after_item)
    after_actors_cancel
  end

  #--------------------------------------------------------------------------
  # ● 確認：キャンセル
  #--------------------------------------------------------------------------
  def confirm_cancel
    @popup_confirm_window.hide
    @before_actors_window.show.activate
    before_actors_cancel
  end

  #--------------------------------------------------------------------------
  # ● 所持金の取得
  #--------------------------------------------------------------------------
  def money
    @gold_window.value
  end
end
