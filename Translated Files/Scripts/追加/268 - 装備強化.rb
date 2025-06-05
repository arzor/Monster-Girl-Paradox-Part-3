#==============================================================================
# ■ NWConst::Smith
#==============================================================================
module NWConst::Smith
  SMITH_TEXT = "%s will be reinforced.\\nProceed? (Second equipment will be destroyed.)"
end

class Game_Party < Game_Unit
  def synthesis_item(base_item, material_item)
    lose_item(material_item, 1)
    base_item.plus_num += 1
  end
end

#==============================================================================
# ■ Scene_Smith
#==============================================================================
class Scene_Smith < Scene_Item
  #--------------------------------------------------------------------------
  # ● 簡易操作説明テキスト
  #--------------------------------------------------------------------------
  def show_key_text
    if @category_window.active
      [ShowKey_Help.favorite_mode(@item_window.favorite_mode)]
    elsif @item_window.active
      [ShowKey_Help.equip_info,
       ShowKey_Help.favorite_item(@item_window.get_favorite_item_state),
       ShowKey_Help.favorite_mode(@item_window.favorite_mode),
       ShowKey_Help.lr_scroll]
    elsif @material_item_window && @material_item_window.active
      [ShowKey_Help.equip_info,
       ShowKey_Help.lr_scroll]
    end
  end

  #--------------------------------------------------------------------------
  # ● 性能差比較ウィンドウを非表示にするか
  #--------------------------------------------------------------------------
  def equip_info_hide?
    @item_window.active == false && @material_item_window.active == false
  end

  #--------------------------------------------------------------------------
  # ● 性能差比較アイテム
  #--------------------------------------------------------------------------
  def equip_info_select_item
    if @item_window.active
      @item_window.item
    elsif @material_item_window && @material_item_window.active
      @material_item_window.item
    end
  end

  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    create_material_item_window
    create_gold_window
    create_desc_window
    create_popup_confirm_window
    @item_window.refresh
  end

  #--------------------------------------------------------------------------
  # ● 確認ポップアップウィンドウの作成
  #--------------------------------------------------------------------------
  def create_popup_confirm_window
    @popup_confirm_window = Window_PopupConfirm.new
    @popup_confirm_window.viewport = @viewport
    @popup_confirm_window.set_title(NWConst::Smith::SMITH_TEXT)
    @popup_confirm_window.hide
    @popup_confirm_window.set_handler(:ok, method(:on_number_ok))
    @popup_confirm_window.set_handler(:cancel, method(:on_number_cancel))
  end

  #--------------------------------------------------------------------------
  # ● カテゴリウィンドウの作成
  #--------------------------------------------------------------------------
  def create_category_window
    @category_window = Window_SmithItemCategory.new
    @category_window.viewport = @viewport
    @category_window.help_window = @help_window
    @category_window.y = @help_window.height
    @category_window.set_handler(:ok,     method(:on_category_ok))
    @category_window.set_handler(:cancel, method(:return_scene))
  end

  #--------------------------------------------------------------------------
  # ● ベースアイテムウィンドウの作成
  #--------------------------------------------------------------------------
  def create_item_window
    wy = @category_window.y + @category_window.height
    wh = Graphics.height - wy
    @item_window = Window_SmithBaseItemList.new(0, wy, Graphics.width / 2 + 30, wh)
    @item_window.height -= @item_window.fitting_height(1)
    @item_window.viewport = @viewport
    @item_window.help_window = @help_window
    @item_window.set_handler(:ok,     method(:on_item_ok))
    @item_window.set_handler(:cancel, method(:on_item_cancel))
    @item_window.money = $game_party.gold
    @category_window.item_window = @item_window
  end

  #--------------------------------------------------------------------------
  # ● 素材アイテムウィンドウの作成
  #--------------------------------------------------------------------------
  def create_material_item_window
    wy = @category_window.y + @category_window.height
    wh = Graphics.height - wy
    @material_item_window = Window_SmithMaterialItemList.new(Graphics.width / 2 + 30, wy, Graphics.width / 2 - 30, wh)
    @material_item_window.height -= @item_window.fitting_height(1)
    @material_item_window.viewport = @viewport
    @material_item_window.help_window = @help_window
    @material_item_window.set_handler(:ok,     method(:on_material_item_ok))
    @material_item_window.set_handler(:cancel, method(:on_material_item_cancel))
    @item_window.material_item_window = @material_item_window
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
  # ● 操作説明ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_desc_window
    wy = @item_window.y + @item_window.height
    wh = wh = Graphics.height - wy
    @desc_window = Window_Description.new(0, wy, Graphics.width, wh)
  end

  #--------------------------------------------------------------------------
  # ● カテゴリ［決定］
  #--------------------------------------------------------------------------
  def on_category_ok
    @item_window.activate
    @item_window.select(0)
    @desc_window.list_type = :base_item
  end

  #--------------------------------------------------------------------------
  # ● アイテム［決定］
  #--------------------------------------------------------------------------
  def on_item_ok
    @item_window.base_item = @item_window.item
    @material_item_window.select(0)
    @material_item_window.activate
    @desc_window.list_type = :material_item
  end

  #--------------------------------------------------------------------------
  # ● アイテム［キャンセル］
  #--------------------------------------------------------------------------
  def on_item_cancel
    @item_window.unselect
    @category_window.activate
    @desc_window.list_type = :nil
  end

  #--------------------------------------------------------------------------
  # ● 素材アイテム［決定]
  #--------------------------------------------------------------------------
  def on_material_item_ok
    @popup_confirm_window.refresh
    @popup_confirm_window.show.activate
    case @item_window.item
    when RPG::Item then   text = "\\T[#{@item_window.item.id}]"
    when RPG::Weapon then text = "\\W[#{@item_window.item.id}]"
    when RPG::Armor then  text = "\\A[#{@item_window.item.id}]"
    end
    @popup_confirm_window.set_name(text)
    @popup_confirm_window.select(0)
  end

  #--------------------------------------------------------------------------
  # ● 素材アイテム［キャンセル］
  #--------------------------------------------------------------------------
  def on_material_item_cancel
    @material_item_window.unselect
    @item_window.activate
    @desc_window.list_type = :base_item
  end

  def on_number_ok
    Sound.play_ok
    $game_party.lose_gold(@item_window.price(@item_window.item))
    $game_party.synthesis_item(@item_window.item, @material_item_window.item)
    @gold_window.refresh
    @item_window.money = $game_party.gold
    @popup_confirm_window.hide
    @material_item_window.refresh
    @material_item_window.unselect
    @item_window.select_base_item
    @item_window.activate
    @desc_window.list_type = :base_item
  end

  def on_number_cancel
    Sound.play_cancel
    @popup_confirm_window.hide
    @material_item_window.activate
  end
end

#==============================================================================
# ■ Window_SmithItemCategory
#==============================================================================
class Window_SmithItemCategory < Window_ItemCategory
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
    add_command(Vocab.weapon, :weapon)
    add_command(Vocab.armor, :armor)
  end
end

#==============================================================================
# ■ Window_SmithBaseItemList
#==============================================================================
class Window_SmithBaseItemList < Window_ItemList
  attr_accessor :base_item

  def initialize(x, y, w, h)
    super(x, y, w, h)
    @money = 0
  end

  def material_item_window=(w)
    @material_item_window = w
    w.category = @category
  end

  def category=(category)
    @material_item_window.category = category if @material_item_window
    super
  end

  #--------------------------------------------------------------------------
  # ● 所持金の設定
  #--------------------------------------------------------------------------
  def money=(money)
    @money = money
    refresh
  end

  #--------------------------------------------------------------------------
  # ● 桁数の取得
  #--------------------------------------------------------------------------
  def col_max
    1
  end

  #--------------------------------------------------------------------------
  # ● カーソル位置の設定
  #--------------------------------------------------------------------------
  def index=(index)
    super
    @material_item_window.base_item = item
  end

  #--------------------------------------------------------------------------
  # ● アイテムリストの作成
  #--------------------------------------------------------------------------
  def make_item_list
    @data = $game_party.enchant_weapons { |e| e } + $game_party.enchant_armors { |e| e }
    @data.reject! { |item| !$game_party.favorite_item?(item) } if @favorite_mode
    @data.select! { |item| include?(item) }
    sort_item_list
  end

  #--------------------------------------------------------------------------
  # ● アイテムリストの表示順調整
  #--------------------------------------------------------------------------
  def sort_item_list
    @data.sort_by! do |item|
      [$game_party.item_number(item), item.sort_obj]
    end
  end

  #--------------------------------------------------------------------------
  # ● アイテムを許可状態で表示するかどうか
  #--------------------------------------------------------------------------
  def enable?(item)
    return false unless item
    return false unless @material_item_window && @material_item_window.enable_base_item?(item)
    return false unless @money >= price(item)

    true
  end

  #--------------------------------------------------------------------------
  # ● 強化アイテムの位置へ移動
  #--------------------------------------------------------------------------
  def select_base_item
    select(@data.index(@base_item) || 0)
  end

  #--------------------------------------------------------------------------
  # ●　合成金額を描画
  #--------------------------------------------------------------------------
  def draw_item_price(rect, item)
    rect.x += rect.width
    rect.width = text_size(price(item)).width + 24
    change_color(normal_color, enable?(item))
    draw_text(rect, price(item), 2)
  end

  #--------------------------------------------------------------------------
  # ●　合成金額を取得
  #--------------------------------------------------------------------------
  def price(item)
    p = item.plus_num + 1
    eval(NWConst::Enchantment::PLUS_UP_PRICE)
  end

  #--------------------------------------------------------------------------
  # ● 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    if item
      rect = item_rect(index)
      rect.width -= text_size(price(item)).width + 24
      draw_item_name(item, rect.x, rect.y, enable?(item), rect.width)
      draw_item_price(rect, item)
    end
  end
end

#==============================================================================
# ■ Window_SmithMaterialItemList
#==============================================================================
class Window_SmithMaterialItemList < Window_ItemList
  attr_reader :base_item

  #--------------------------------------------------------------------------
  # ● 桁数の取得
  #--------------------------------------------------------------------------
  def col_max
    1
  end

  def base_item=(base_item)
    unless @base_item == base_item
      @base_item = base_item
      self.oy = 0
      refresh
    end
  end

  #--------------------------------------------------------------------------
  # ● アイテムリストの作成
  #--------------------------------------------------------------------------
  def make_item_list
    return [] unless base_item

    @data = all_items.select do |item|
      include?(item, base_item)
    end
    sort_item_list
  end

  def include?(item, base_item)
    super(item) && base_item && base_item != item && base_item.plus_num <= item.plus_num && !item.favorite?
  end

  def sort_item_list
    @data.sort_by! do |item|
      [item.plus_num, item.sort_obj]
    end
  end

  #--------------------------------------------------------------------------
  # ● 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    if item
      rect = item_rect(index)
      draw_item_name(item, rect.x, rect.y, enable?(item))
    end
  end

  #--------------------------------------------------------------------------
  # ● アイテムを許可状態で表示するかどうか
  #--------------------------------------------------------------------------
  def enable?(item)
    item
  end

  #--------------------------------------------------------------------------
  # ● アイテムが存在する？
  #--------------------------------------------------------------------------
  def enable_base_item?(base_item)
    all_items.any? { |item| include?(item, base_item) }
  end

  def all_items
    ($game_party.enchant_weapons + $game_party.enchant_armors).uniq
  end
end

class Window_Description < Window_Base
  attr_accessor :list_type

  def list_type=(list_type)
    if list_type != @list_type
      @list_type = list_type
      refresh
    end
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    @text = case list_type
            when :base_item
              "Select the equipment to reinforce."
            when :material_item
              "Select the equipment to use as a catalyst."
            end
    draw_text(4, 0, contents_width, contents_height, @text)
  end
end
