module NWConst::Storehouse
  MAX_ITEM_NUMBER = 999
end

class Item_Data
  attr_accessor :storehouse_item_number
  alias storehouse_initialize initialize
  def initialize
    storehouse_initialize
    @storehouse_item_number = 0
  end
end

class << ShowKey_Help
  #--------------------------------------------------------------------------
  # ● アイテム保管
  #--------------------------------------------------------------------------
  def lr_keep
    "#{Vocab.key_l}/#{Vocab.key_r}:Move 10"
  end

  def arrow_keep
    "←/→:Move 1"
  end

  def ud_keep
    "↑/↓:Move all"
  end
end
class Scene_Storehouse < Scene_Item
  #--------------------------------------------------------------------------
  # 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    create_item_keep_window
  end

  #--------------------------------------------------------------------------
  # ● アイテム保管ウィンドウ作成
  #--------------------------------------------------------------------------
  def create_item_keep_window
    @item_keep_window = Window_ItemKeep.new
    @item_keep_window.set_handler(:ok,     method(:on_item_keep_ok))
    @item_keep_window.set_handler(:cancel, method(:on_item_keep_ok))
    @item_window.item_keep_window = @item_keep_window
  end

  #--------------------------------------------------------------------------
  # ● カテゴリ［決定］
  #--------------------------------------------------------------------------
  def on_category_ok
    @item_window.activate
    @item_window.select(0)
  end

  #--------------------------------------------------------------------------
  # ● カテゴリウィンドウの作成
  #--------------------------------------------------------------------------
  def create_category_window
    @category_window = Window_StorehouseItemCategory.new
    @category_window.viewport = @viewport
    @category_window.help_window = @help_window
    @category_window.y = @help_window.height
    @category_window.set_handler(:ok,     method(:on_category_ok))
    @category_window.set_handler(:cancel, method(:return_scene))
  end

  #--------------------------------------------------------------------------
  # ● アイテムウィンドウの作成
  #--------------------------------------------------------------------------
  def create_item_window
    wy = @category_window.y + @category_window.height
    wh = Graphics.height - wy
    @item_window = Window_StorehouseItemList.new(0, wy, Graphics.width, wh)
    @item_window.viewport = @viewport
    @item_window.help_window = @help_window
    @item_window.set_handler(:ok,     method(:on_item_ok))
    @item_window.set_handler(:cancel, method(:on_item_cancel))
    @category_window.item_window = @item_window
  end

  #--------------------------------------------------------------------------
  # ● アイテム［決定］
  #--------------------------------------------------------------------------
  def on_item_ok
    @item_keep_window.show
    @item_keep_window.activate
  end

  #--------------------------------------------------------------------------
  # ● アイテム保管[決定＆キャンセル]
  #--------------------------------------------------------------------------
  def on_item_keep_ok
    @item_keep_window.hide
    @item_keep_window.deactivate
    @item_window.activate
    @item_window.refresh
  end

  def show_key_text
    ret = super
    return super if super

    if @item_keep_window && @item_keep_window.active
      [ShowKey_Help.arrow_keep,
       ShowKey_Help.lr_keep,
       ShowKey_Help.ud_keep]
    end
  end
end

class Window_StorehouseItemCategory < Window_ItemCategory
  #--------------------------------------------------------------------------
  # ● 桁数の取得
  #--------------------------------------------------------------------------
  def col_max
    return 4 if display_stone?

    3
  end

  #--------------------------------------------------------------------------
  # ● コマンドリストの作成
  #--------------------------------------------------------------------------
  def make_command_list
    add_command(Vocab.item, :item)
    add_command(Vocab.weapon,   :weapon)
    add_command(Vocab.armor,    :armor)
    add_command(Vocab::ENCHANT_STONE, :enchant_stone) if display_stone?
  end
end

class Window_StorehouseItemList < Window_ItemList
  attr_accessor :item_keep_window

  #--------------------------------------------------------------------------
  # ● アイテムを許可状態で表示するかどうか
  #--------------------------------------------------------------------------
  def enable?(item)
    item
  end

  #--------------------------------------------------------------------------
  # ● 桁数の取得
  #--------------------------------------------------------------------------
  def col_max
    2
  end

  #--------------------------------------------------------------------------
  # ● アイテムリストの作成
  #--------------------------------------------------------------------------
  def make_item_list
    @data = ($game_party.all_items + $game_party.storehouse_all_items).uniq.select { |item| include?(item) }
    @data.reject! { |item| !$game_party.favorite_item?(item) } if @favorite_mode
    sort_item_list
  end

  #--------------------------------------------------------------------------
  # ● アイテムリストのソート
  #--------------------------------------------------------------------------
  def sort_item_list
    @data.sort_by! do |data|
      data.sort_obj
    end
  end

  #--------------------------------------------------------------------------
  # ● 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    if item
      rect = item_rect(index)
      rect.width -= 4
      # draw_item_name(item, rect.x, rect.y, enable?(item) ,410 - rect.x)
      # draw_item_number(rect, item)
      draw_item_name(item, rect.x, rect.y, enable?(item), 180)
      draw_item_number(rect, item)
    end
  end

  #--------------------------------------------------------------------------
  # ● アイテムの個数を描画
  #--------------------------------------------------------------------------
  #   def draw_item_number(rect, item)
  # 		change_color(text_color(5))
  #     draw_text(410, rect.y, 40, line_height, "所持",2)
  # 		change_color(text_color(0))
  # 		draw_text(430, rect.y, 50, line_height, sprintf(":%2d", $game_party.item_number(item)) ,2)
  # 		change_color(text_color(5))
  # 		draw_text(520, rect.y, 40, line_height, "倉庫",2)
  # 		change_color(text_color(0))
  # 		draw_text(540, rect.y, 60, line_height, sprintf(":%3d", $game_party.storehouse_item_number(item)),2)
  #   end
  def draw_item_number(rect, item)
    draw_text(rect, format(":%2d(%3d)", $game_party.item_number(item), $game_party.storehouse_item_number(item)), 2)
  end

  def update_help
    super
    @item_keep_window.item = item
  end
end

class Window_ItemKeep < Window_Selectable
  attr_reader :item
  attr_accessor :item_number
  attr_accessor :storehouse_item_number

  def initialize
    super((Graphics.width / 2) - (window_width / 2), (Graphics.height / 2) - (window_height / 2), window_width, window_height)
    self.z = 200
    self.back_opacity = 255
    hide
  end

  def window_width
    236 + standard_padding * 2
  end

  def window_height
    fitting_height(3)
  end

  def item=(item)
    if @item != item
      @item = item
      refresh
    end
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear

    draw_item
    draw_item_number if item
    draw_storehouse_item_number if item
    draw_arrow
  end

  #--------------------------------------------------------------------------
  # ● アイテム名の描画
  #--------------------------------------------------------------------------
  def draw_item
    draw_item_name(@item, 0, 0, true, contents.width)
  end

  def draw_item_number
    rect = item_number_rect
    draw_rect = text_size("Held")
    change_color(system_color)
    draw_text(rect, "Held")
    change_color(normal_color)
    rect.width = draw_rect.width
    rect.y += line_height
    draw_text(rect, $game_party.item_number(item), 1)
  end

  def draw_storehouse_item_number
    rect = item_number_rect
    draw_rect = text_size("Stored")
    change_color(system_color)
    draw_text(rect, "Stored", 2)
    change_color(normal_color)
    rect.x = contents_width - 50 - draw_rect.width
    rect.width = draw_rect.width
    rect.y += line_height
    draw_text(rect, $game_party.storehouse_item_number(item), 1)
  end

  def draw_arrow
    dfont = contents.font.size
    contents.font.size = 20
    change_color(tp_gauge_color2)
    rect = item_number_rect
    rect.y += line_height * 1 / 2
    rect.height = line_height * 2 / 3
    draw_text(rect, "→", 1)
    rect.y += line_height * 2 / 3
    draw_text(rect, "←", 1)
    change_color(normal_color)
    contents.font.size = dfont
  end

  def item_number_rect
    Rect.new(50, line_height, contents_width - 100, line_height)
  end

  #--------------------------------------------------------------------------
  # ● カーソルの移動処理
  #--------------------------------------------------------------------------
  def process_cursor_move
    return unless open? && active

    cursor_item_keep(1) if Input.repeat?(:RIGHT)
    cursor_item_keep(-1) if Input.repeat?(:LEFT)
    cursor_item_keep(10) if Input.trigger?(:R)
    cursor_item_keep(-10) if Input.trigger?(:L)
    cursor_item_keep($game_party.max_item_number(item)) if Input.trigger?(:DOWN)
    cursor_item_keep(-$game_party.max_item_number(item)) if Input.trigger?(:UP)
  end

  #--------------------------------------------------------------------------
  # ● アイテム預ける
  #--------------------------------------------------------------------------
  def cursor_item_keep(amount)
    if $game_party.item_keep(item, amount)
      Sound.play_cursor
      refresh
    end
  end
end
