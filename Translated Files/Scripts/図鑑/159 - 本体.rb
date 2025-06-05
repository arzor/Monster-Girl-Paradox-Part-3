=begin
=図鑑スクリプト本体

図鑑に関する機能の本体です。


==更新履歴
  Date     Version Author Comment
==14/12/13 2.0.0   トリス 統合A～E E
==15/09/03 2.0.2   トリス 統合J～U K M N O Q S T
==17/05/16 2.0.4   トリス 統合V～W V
==17/09/21 2.2.0   ひまわり　統合3 tp
=end

#==============================================================================
# ■ NWRegexp::BaseItem
#==============================================================================
module NWRegexp::BaseItem 
  EXCLUDE   = /<図鑑除外>/i
end

#==============================================================================
# ■ NWConst::Library
#----------------------------------------------------------------------------
# 図鑑に関するウィンドウにmixinして使用します。
#==============================================================================
module NWConst::Library
  #--------------------------------------------------------------------------
  # ● 定数
  #--------------------------------------------------------------------------
  HEADER_LINE = 2   # 左上ウィンドウの行数
  LEFT_WIDTH  = 250 # 左カラムの幅。右カラムは画面幅 - これ
  FOOTER_LINE = 1   # 下ウィンドウの行数
  LINE_HEIGHT = 4   # 行間pixel
  # 項目名の設定
  INDEX_STRING = {
    :lib_top        => "Library",
    :lib_return     => "Return to Top",
    :lib_close      => "Close Library",
    :lib_actor      => "Character Book",
    :lib_enemy      => "Monster Book",
    :lib_weapon     => "Weapon Book",
    :lib_armor      => "Armor Book",
    :lib_accessory  => "Accessory Book",
    :lib_item       => "Item Book",
    :lib_record     => "Adventure Log",
    :lib_medal      => "Achievements",
  }
  # 冒険の記録タイトル
  RECORD_STRING = {
    1 => "Current Adventure",
    2 => "All Adventures",
  }
  # アイテム入手に関する定数
  # 項目名
  ENCOUNTER_ENEMY_PLACE_NAME = "Encountered in:"
  GET_ITEM_PLACE_NAME = "Acquired from:"
  GET_ITEM_DROP_NAME  = "Dropped by:"
  GET_ITEM_STEAL_NAME = "Stolen from:"
  GET_ITEM_ACTOR_NAME = "Received from ally:"  
  GET_ITEM_NO_NAME    = "None"
  GET_ITEM_ETC_NAME   = " etc."
  # 最大表示サイズ
  ENCOUNTER_ENEMY_PLACE_MAX = 5
  GET_ITEM_PLACE_MAX = 5
  GET_ITEM_DROP_MAX  = 3
  GET_ITEM_STEAL_MAX = 3
  GET_ITEM_ACTOR_MAX = 3
  # BGM
  BGM = RPG::BGM.new("zukan", 100, 100)  
  #--------------------------------------------------------------------------
  # ● 図鑑での、文字描画用の標準範囲取得
  #--------------------------------------------------------------------------
  def standard_rect(y = 0)
    Rect.new(4, y, self.contents.width - 4, self.line_height)
  end
  #--------------------------------------------------------------------------
  # ● 図鑑での、文字描画用の左半分範囲取得
  #--------------------------------------------------------------------------
  def half_left_rect(y = 0)
    Rect.new(4, y, self.contents.width / 2 - self.padding / 2, self.line_height)
  end
  #--------------------------------------------------------------------------
  # ● 図鑑での、文字描画用の右半分範囲取得
  #--------------------------------------------------------------------------
  def half_right_rect(y = 0)
    Rect.new(self.contents.width / 2 + self.padding / 2, y, 
    self.contents.width / 2 - 4, self.line_height)
  end
end

#==============================================================================
# ■ Game_Temp
#==============================================================================
class Game_Temp
  #--------------------------------------------------------------------------
  # ● 公開インスタンス
  #--------------------------------------------------------------------------
  attr_accessor   :lib_enemy_index
end

#==============================================================================
# ■ Window_Library_HeaderNav
#------------------------------------------------------------------------------
# 表示中の項目名などを表示するウィンドウです。
#==============================================================================
class Window_Library_HeaderNav < Window_Base
  #--------------------------------------------------------------------------
  # ● Mix-in
  #--------------------------------------------------------------------------
  include NWConst::Library
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化 (オーバーライド)
  #--------------------------------------------------------------------------
  def initialize
    super(window_x, window_y, window_width, window_height)
    @text = ""
    refresh
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ横幅
  #--------------------------------------------------------------------------
  def window_x
    0
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ高さ
  #--------------------------------------------------------------------------
  def window_y
    0
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ横幅
  #--------------------------------------------------------------------------
  def window_width
    LEFT_WIDTH
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ高さ
  #--------------------------------------------------------------------------
  def window_height
    fitting_height(HEADER_LINE)
  end
  #--------------------------------------------------------------------------
  # ● テキスト設定
  #--------------------------------------------------------------------------
  def set_text(text)
    if text != @text
      @text = text
      refresh
    end
  end
  #--------------------------------------------------------------------------
  # ● クリア
  #--------------------------------------------------------------------------
  def clear
    set_text("")
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    draw_text_ex(4, 0, @text)
  end
end

#==============================================================================
# ■ Window_Library_FooterHelp
#------------------------------------------------------------------------------
# 操作のヒントを表示するウィンドウです。
#==============================================================================
class Window_Library_FooterHelp < Window_Library_HeaderNav
  #--------------------------------------------------------------------------
  # ● Mix-in
  #--------------------------------------------------------------------------
  include NWConst::Library
  #--------------------------------------------------------------------------
  # ● ウィンドウ横幅
  #--------------------------------------------------------------------------
  def window_x
    0
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ高さ
  #--------------------------------------------------------------------------
  def window_y
    Graphics.height - window_height
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ横幅
  #--------------------------------------------------------------------------
  def window_width
    Graphics.width
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ高さ
  #--------------------------------------------------------------------------
  def window_height
    fitting_height(FOOTER_LINE)
  end
end

#==============================================================================
# ■ Window_Library_MainCommand
#----------------------------------------------------------------------------
# 図鑑画面の左カラムに配置するメインメニューです。
#==============================================================================
class Window_Library_MainCommand < Window_Command
  #--------------------------------------------------------------------------
  # ● Mix-in
  #--------------------------------------------------------------------------
  include NWConst::Library
  include NWConst::LibraryManager
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :category
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super(0, fitting_height(HEADER_LINE))
    @category = 0
  end
  #--------------------------------------------------------------------------
  # ● カーソルの移動処理【オーバーライド】
  #--------------------------------------------------------------------------
  def process_cursor_move
    return unless cursor_movable?
    last_index = @index
    cursor_down (Input.trigger?(:DOWN))  if Input.repeat?(:DOWN)
    cursor_up   (Input.trigger?(:UP))    if Input.repeat?(:UP)
    cursor_right(Input.trigger?(:RIGHT)) if !handle?(:input_right) && Input.repeat?(:RIGHT)
    cursor_left (Input.trigger?(:LEFT))  if !handle?(:input_left)  && Input.repeat?(:LEFT)
    cursor_pagedown   if !handle?(:pagedown) && Input.trigger?(:R)
    cursor_pageup     if !handle?(:pageup)   && Input.trigger?(:L)
    Sound.play_cursor if @index != last_index
  end
  #--------------------------------------------------------------------------
  # ● 決定やキャンセルなどのハンドリング処理【オーバーライド】
  #--------------------------------------------------------------------------
  def process_handling
    return unless open? && active
    return process_ok         if ok_enabled?        && Input.trigger?(:C)
    return process_cancel     if cancel_enabled?    && Input.trigger?(:B)
    return process_right      if handle?(:input_right) && Input.trigger?(:RIGHT) && (1 < @contents_window.page_max)
    return process_left       if handle?(:input_left)  && Input.trigger?(:LEFT) && (1 < @contents_window.page_max)
    return process_scrolldown if handle?(:scrolldown)  && Input.press?(:Z)
    return process_scrollup   if handle?(:scrollup)    && Input.press?(:Y)
  end
  #--------------------------------------------------------------------------
  # ● 決定処理の有効状態を取得【オーバーライド】
  #--------------------------------------------------------------------------
  def ok_enabled?
    return handle?(current_symbol)
  end
  #--------------------------------------------------------------------------
  # ● X ボタン（Scroll）が押されたときの処理【オーバーライド】
  #--------------------------------------------------------------------------
  def process_scrollup
    Input.update
    deactivate
    call_handler(:scrollup)
  end
  #--------------------------------------------------------------------------
  # ● Y ボタン（Scroll）が押されたときの処理【オーバーライド】
  #--------------------------------------------------------------------------
  def process_scrolldown
    Input.update
    deactivate
    call_handler(:scrolldown)
  end
  #--------------------------------------------------------------------------
  # ● RIGHT ボタン（RIGHT）が押されたときの処理
  #--------------------------------------------------------------------------
  def process_right
    Sound.play_cursor
    Input.update
    deactivate
    call_handler(:input_right)
  end
  #--------------------------------------------------------------------------
  # ● LEFT ボタン（LEFT）が押されたときの処理
  #--------------------------------------------------------------------------
  def process_left
    Sound.play_cursor
    Input.update
    deactivate
    call_handler(:input_left)
  end
  #--------------------------------------------------------------------------
  # ● 項目の選択【オーバーライド】
  #--------------------------------------------------------------------------
  def select(index)
    super(index)
    if @contents_window
      @contents_window.id = current_ext[0]
      @contents_window.ext = current_ext[1]
      @contents_window.refresh
    end
    call_update_help
  end
  #--------------------------------------------------------------------------
  # ● ヘルプウィンドウの更新【オーバーライド】
  #--------------------------------------------------------------------------
  def update_help
    ct = current_ext[1] / 10000
    id = current_ext[1] % 10000
    
    str  = Help.library[:btn_column]
    str += "　" + Help.library[:btn_page] if @contents_window.page_max > 1 
    if (ct == 2) && (@contents_window.page == 3)
      str += "　" + Help.library[:btn_scroll]
    else
      str += "　" + Help.library[:btn_jump]
    end    
    if (id != 0) &&
        (
        (ct == 1 && !actor_had?(id))     ||
        (ct == 2 && !enemy_had?(id))     ||
        (ct == 3 && !weapon_had?(id))    ||
        (ct == 4 && !armor_had?(id))     ||
        (ct == 5 && !accessory_had?(id)) ||
        (ct == 6 && !item_had?(id))
        )
      str = Help.library[:discovery]
    end
    if @category > 0 and [3, 4, 5].include?(ct)
      str += "　" + Help.library[:btn_equip]
    end
    @help_window.set_text(str)
  end
  #--------------------------------------------------------------------------
  # ● インデックスウィンドウの設定
  #--------------------------------------------------------------------------
  def index_window=(index_window)
    @index_window = index_window
    call_index_help
  end
  #--------------------------------------------------------------------------
  # ● コンテンツウィンドウの設定
  #--------------------------------------------------------------------------
  def contents_window=(contents_window)
    @contents_window = contents_window
    call_contents_refresh
  end
  #--------------------------------------------------------------------------
  # ● ヘルプウィンドウ更新メソッドの呼び出し
  #--------------------------------------------------------------------------
  def call_index_help
    update_index if active && @index_window
  end
  #--------------------------------------------------------------------------
  # ● ヘルプウィンドウ更新メソッドの呼び出し
  #--------------------------------------------------------------------------
  def call_contents_refresh
    @contents_window.refresh if active && @contents_window
  end
  #--------------------------------------------------------------------------
  # ● インデックスウィンドウの更新
  #--------------------------------------------------------------------------
  def update_index
    case @category
    when 1
      @index_window.set_text("#{INDEX_STRING[:lib_actor]}\r\nPercent Complete:" + sprintf("%3d", collect_per_actor) + "%")
    when 2
      @index_window.set_text("#{INDEX_STRING[:lib_enemy]}\r\nPercent Complete:" + sprintf("%3d", collect_per_enemy) + "%")
    when 3
      @index_window.set_text("#{INDEX_STRING[:lib_weapon]}\r\nPercent Complete:" + sprintf("%3d", collect_per_weapon) + "%")
    when 4
      @index_window.set_text("#{INDEX_STRING[:lib_armor]}\r\nPercent Complete:" + sprintf("%3d", collect_per_armor) + "%")
    when 5
      @index_window.set_text("#{INDEX_STRING[:lib_accessory]}\r\nPercent Complete:" + sprintf("%3d", collect_per_accessory) + "%")
    when 6
      @index_window.set_text("#{INDEX_STRING[:lib_item]}\r\nPercent Complete:" + sprintf("%3d", collect_per_item) + "%")
    when 7
      @index_window.set_text("#{INDEX_STRING[:lib_record]}")
    when 8
      @index_window.set_text("#{INDEX_STRING[:lib_medal]}\r\nAchieved:" + sprintf("%3d", collect_per_medal) + "%")
    when 9
      @index_window.set_text("#{INDEX_STRING[:lib_stone]}\r\nPercent Complete:" + sprintf("%3d", collect_per_stone) + "%")
    else
      @index_window.set_text("#{INDEX_STRING[:lib_top]}\r\nPercent Complete:" + sprintf("%3d", collect_per_all) + "%")
    end
  end
  #--------------------------------------------------------------------------
  # ● アクティブ状態の変更【オーバーライド】
  #--------------------------------------------------------------------------
  def active=(active)
    super
    call_index_help
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得【オーバーライド】
  #--------------------------------------------------------------------------
  def window_width
    LEFT_WIDTH
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウの高さの取得【オーバーライド】
  #--------------------------------------------------------------------------
  def window_height
    Graphics.height - fitting_height(HEADER_LINE) - fitting_height(FOOTER_LINE)
  end
  #--------------------------------------------------------------------------
  # ● コマンドリストの作成【オーバーライド】
  #--------------------------------------------------------------------------
  def make_command_list
    case @category
    when 1
      make_actor_main_command
      make_return_command
    when 2
      make_enemy_main_command
      make_return_command
    when 3
      make_weapon_main_command
      make_return_command
    when 4
      make_armor_main_command
      make_return_command
    when 5
      make_accessory_main_command
      make_return_command
    when 6
      make_item_main_command
      make_return_command
    when 7
      make_record_main_command
      make_return_command
    when 8
      make_medal_main_command
      make_return_command
    when 9
      make_stone_main_command
      make_return_command
    else
      make_record_index_command
      make_medal_index_command
      make_actor_index_command
      make_enemy_index_command
      make_weapon_index_command
      make_armor_index_command
      make_accessory_index_command
      make_item_index_command
      make_stone_index_command
      make_class_index_command
      make_tribe_index_command
    end
    make_close_command
  end
  #--------------------------------------------------------------------------
  # ● 冒険の記録コマンド
  #--------------------------------------------------------------------------
  def make_record_index_command
    add_command(INDEX_STRING[:lib_record], :lib_record, true, [7, 70000])
  end
  #--------------------------------------------------------------------------
  # ● 冒険の記録コマンド
  #--------------------------------------------------------------------------
  def make_record_main_command
    RECORD_STRING.each{|id, name|
      add_command(name, :select, true, [7, 70000+id])
    }
  end
  #--------------------------------------------------------------------------
  # ● 実績indexコマンド
  #--------------------------------------------------------------------------
  def make_medal_index_command
    add_command(INDEX_STRING[:lib_medal], :lib_medal, true, [8, 80000]) if lib_medal_unlocked?
  end
  #--------------------------------------------------------------------------
  # ● 実績メインコマンド
  #--------------------------------------------------------------------------
  def make_medal_main_command
    get_valid_medals.sort{|a, b|
      [medal_priority(a), a] <=> [medal_priority(b), b]
    }.each{|id|
      next unless has_medal?(id)
      add_command(medal_title(id), :select, true, [8, 80000+id])
    }
  end  
  #--------------------------------------------------------------------------
  # ● 人物indexコマンド
  #--------------------------------------------------------------------------
  def make_actor_index_command
    add_command(INDEX_STRING[:lib_actor], :lib_actor, true, [1, 10000]) if lib_actor_unlocked?
  end
  #--------------------------------------------------------------------------
  # ● 人物メインコマンド
  #--------------------------------------------------------------------------
  def make_actor_main_command
    $data_library.actor.each_with_index do |id, i|
      item = $data_actors[id]
      if actor_had?(id)
        add_command("#{item.name}", :on_actor, true, [i+1, 10000 + id])
      elsif actor_discovery?(id)
        add_command("#{item.name}", :select, false, [i+1, 10000 + id])
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 敵キャラindexコマンド
  #--------------------------------------------------------------------------
  def make_enemy_index_command
    add_command(INDEX_STRING[:lib_enemy], :lib_enemy, true, [2, 20000]) if lib_enemy_unlocked?
  end
  #--------------------------------------------------------------------------
  # ● 敵キャラメインコマンド
  #--------------------------------------------------------------------------
  def make_enemy_main_command
    $data_library.enemy.each_with_index do |id, i|
      item = $data_enemies[id]
      if enemy_had?(id)
        add_command("#{item.lib_name}", :on_enemy, true, [i+1, 20000 + id])
      elsif enemy_discovery?(id)
        add_command("#{item.lib_name}", :select, false, [i+1, 20000 + id])
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 武器indexコマンド
  #--------------------------------------------------------------------------
  def make_weapon_index_command
    add_command(INDEX_STRING[:lib_weapon], :lib_weapon, true, [3, 30000]) if lib_weapon_unlocked?
  end
  #--------------------------------------------------------------------------
  # ● 武器メインコマンド
  #--------------------------------------------------------------------------
  def make_weapon_main_command
    $data_library.weapon.each_with_index do |id, i|
      item = $data_weapons[id]
      if weapon_had?(id)
        add_command("#{item.name}", :select, true, [i+1, 30000 + id])
      elsif weapon_discovery?(id)
        add_command("#{item.name}", :select, false, [i+1, 30000 + id])
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 防具indexコマンド
  #--------------------------------------------------------------------------
  def make_armor_index_command
    add_command(INDEX_STRING[:lib_armor], :lib_armor, true, [4, 40000]) if lib_armor_unlocked?
  end
  #--------------------------------------------------------------------------
  # ● 防具メインコマンド
  #--------------------------------------------------------------------------
  def make_armor_main_command
    $data_library.armor.each_with_index do |id, i|
      item = $data_armors[id]
      if armor_had?(id)
        add_command("#{item.name}", :select, true, [i+1, 40000 + id])
      elsif armor_discovery?(id)
        add_command("#{item.name}", :select, false, [i+1, 40000 + id])
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● アクセサリindexコマンド
  #--------------------------------------------------------------------------
  def make_accessory_index_command
    add_command(INDEX_STRING[:lib_accessory], :lib_accessory, true, [5, 50000]) if lib_accessory_unlocked?
  end
  #--------------------------------------------------------------------------
  # ● アクセサリメインコマンド
  #--------------------------------------------------------------------------
  def make_accessory_main_command
    $data_library.accessory.each_with_index do |id, i|
      item = $data_armors[id]
      if accessory_had?(id)
        add_command("#{item.name}", :select, true, [i+1, 50000 + id])
      elsif accessory_discovery?(id)
        add_command("#{item.name}", :select, false, [i+1, 50000 + id])
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● アイテムindexコマンド
  #--------------------------------------------------------------------------
  def make_item_index_command
    add_command(INDEX_STRING[:lib_item], :lib_item, true, [6, 60000]) if lib_item_unlocked?
  end
  #--------------------------------------------------------------------------
  # ● アイテムメインコマンド
  #--------------------------------------------------------------------------
  def make_item_main_command
    $data_library.item.each_with_index do |id, i|
      item = $data_items[id]
      if item_had?(id)
        add_command("#{item.name}", :select, true, [i+1, 60000 + id])
      elsif item_discovery?(id)
        add_command("#{item.name}", :select, false, [i+1, 60000 + id])
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● アイテムindexコマンド
  #--------------------------------------------------------------------------
  def make_stone_index_command
    add_command(INDEX_STRING[:lib_stone], :lib_stone, true, [9, 60000]) if lib_stone_unlocked?
  end

  def make_stone_main_command
    $data_library.stone.each_with_index do |id, i|
      item = $data_items[id]
      if item_had?(id)
        add_command("#{item.name}", :select, true, [i+1, 60000 + id])
      elsif item_discovery?(id)
        add_command("#{item.name}", :select, false, [i+1, 60000 + id])
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 職業indexコマンド
  #--------------------------------------------------------------------------
  def make_class_index_command
    enable = !$game_party.temp_actors_use?
    add_command(INDEX_STRING[:lib_class], :lib_class, enable, [ 9,  90000])
  end
  #--------------------------------------------------------------------------
  # ● 種族indexコマンド
  #--------------------------------------------------------------------------
  def make_tribe_index_command
    enable = !$game_party.temp_actors_use?
    add_command(INDEX_STRING[:lib_tribe], :lib_tribe, enable, [10, 100000])
  end
  #--------------------------------------------------------------------------
  # ● トップに戻る(表示種別選択に戻る)コマンド
  #--------------------------------------------------------------------------
  def make_return_command
    add_command(INDEX_STRING[:lib_return], :lib_return, true, [-1, -10000])
  end
  #--------------------------------------------------------------------------
  # ● 図鑑を閉じる(元のシーンに戻る)コマンド
  #--------------------------------------------------------------------------
  def make_close_command
    add_command(INDEX_STRING[:lib_close], :lib_close, true, [-2, -20000])
  end
  #--------------------------------------------------------------------------
  # ● 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    if @category == 2 and exist_enemy_include?(index)
      change_color(tp_gauge_color2, command_enabled?(index))
    else
      change_color(normal_color, command_enabled?(index))
    end
    draw_text(item_rect_for_text(index), command_name(index), alignment)
  end
  #--------------------------------------------------------------------------
  # ● 敵IDの取得（魔物図鑑かどうかは考慮しない）
  #--------------------------------------------------------------------------
  def command_enemy_id(index)
    return @list[index][:ext][1] % 10000
  end
  #--------------------------------------------------------------------------
  # ● 戦闘中かつその項目の敵が出現しているかどうか
  #--------------------------------------------------------------------------
  def exist_enemy_include?(index)
    return false unless $game_party.in_battle
    enemy_id = command_enemy_id(index)
    return unless $data_enemies[enemy_id]
    return $game_troop.alive_members.map(&:enemy_id).include?(enemy_id)
  end
end

#==============================================================================
# ■ Window_Library_RightMain
#------------------------------------------------------------------------------
# 図鑑画面の右カラムに配置するメインコンテンツです。
#==============================================================================
class Window_Library_RightMain < Window_Selectable
  #--------------------------------------------------------------------------
  # ● Mix-in
  #--------------------------------------------------------------------------
  include NWConst::Library
  include NWConst::LibraryManager
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :id
  attr_accessor :ext
  attr_accessor :page
  attr_reader   :page_max
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    # 基本
    @id = 0
    @ext = 0
    @chara = {} # キャラ画像キャッシュ
    @description = {} # 解説画像キャッシュ
    @last_ext = @ext
    @src_rect = Rect.new
    @dest_rect = Rect.new
    page_init
    super(window_x, window_y, window_width, window_height)
  end
  #--------------------------------------------------------------------------
  # ● 頁の初期化
  #--------------------------------------------------------------------------
  def page_init
    @page = 0
    @page_max = 1    
  end
  #--------------------------------------------------------------------------
  # ● 解放【オーバーライド】
  #--------------------------------------------------------------------------
  def dispose
    dispose_chara_bitmap
    dispose_description_bitmap
    super
  end
  #--------------------------------------------------------------------------
  # ● スクロール下方向処理
  #--------------------------------------------------------------------------
  def scroll_down
    return unless @description.key?(@ext)
    return if @src_rect.y >= @description[@ext].height - @dest_rect.height
    @src_rect.y += Input.press?(:A) ? line_height : line_height / 4
    @src_rect.y = [[@src_rect.y, 0].max, @description[@ext].height - @dest_rect.height].min
    refresh
  end
  #--------------------------------------------------------------------------
  # ● スクロール上方向処理
  #--------------------------------------------------------------------------
  def scroll_up
    return unless @description.key?(@ext)
    return if @src_rect.y <= 0
    @src_rect.y -= Input.press?(:A) ? line_height : line_height / 4
    @src_rect.y = [[@src_rect.y, 0].max, @description[@ext].height - @dest_rect.height].min
    refresh
  end
  #--------------------------------------------------------------------------
  # ● ページ送り処理
  #--------------------------------------------------------------------------
  def next_page
    return if (@page_max - 1) == 0
    @page = @page + 1 >= @page_max ? 0 : @page + 1
    refresh
  end
  #--------------------------------------------------------------------------
  # ● ページ戻り処理
  #--------------------------------------------------------------------------
  def previous_page
    return if (@page_max - 1) == 0
    @page = @page - 1 < 0 ? @page_max - 1 : @page - 1
    refresh
  end
  #--------------------------------------------------------------------------
  # ● キャラクター画像解放
  #--------------------------------------------------------------------------
  def dispose_chara_bitmap
    return if @chara.empty?
    @chara.each_value{|bmp| bmp.dispose unless bmp.disposed?}
    @chara.clear    
    print "Notice:図鑑画面のキャラクター画像を開放しました。\n" if $TEST
  end
  #--------------------------------------------------------------------------
  # ● 解説文章画像解放
  #--------------------------------------------------------------------------
  def dispose_description_bitmap
    return if @description.empty?
    @description.each_value{|bmp| bmp.dispose unless bmp.disposed?}
    @description.clear
    print "Notice:図鑑画面の解説文章画像を開放しました。\n" if $TEST
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ横幅
  #--------------------------------------------------------------------------
  def window_x
    LEFT_WIDTH
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ高さ
  #--------------------------------------------------------------------------
  def window_y
    0
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得
  #--------------------------------------------------------------------------
  def window_width
    Graphics.width - LEFT_WIDTH
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウの高さの取得
  #--------------------------------------------------------------------------
  def window_height
    Graphics.height - fitting_height(FOOTER_LINE)
  end
  #--------------------------------------------------------------------------
  # ● スクロール可能か？
  #--------------------------------------------------------------------------
  def scrollable?
    return false unless @description.key?(@ext)
    return false if @dest_rect.height > @description[@ext].height
    true
  end
  #--------------------------------------------------------------------------
  # ● 自動改行テキスト表示
  #--------------------------------------------------------------------------
  def draw_text_auto_line(rect, text)
    array = []
    s = ""    
    text.size.times{|i|
      s += text[i]
      next unless self.contents.width < text_size(s).width + (standard_padding * 2)
      array.push(s)
      s = ""
    }
    array.push(s)
    array.each{|str| draw_text(rect, str); rect.y += rect.height}
    return rect
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ【オーバーライド】
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    draw_contents
    call_update_help
    @last_ext = @ext
  end
  #--------------------------------------------------------------------------
  # ● 何も描画しない
  #--------------------------------------------------------------------------
  def draw_contents_empty
    # 表示ページのリセット
    @page = 0
    @page_max = 1
    # 画像キャッシュの解放
    dispose_chara_bitmap
    dispose_description_bitmap
  end
  #--------------------------------------------------------------------------
  # ● 共通ID描画(全)
  #--------------------------------------------------------------------------
  def draw_common_id(item)
    rect = standard_rect
    # 1行目 キャラクター名の描画
    reset_font_settings
    name = item.respond_to?(:lib_name) ? item.lib_name : item.name
    draw_text(rect, name)
    rect.y += rect.height + LINE_HEIGHT
    return rect.y
  end
  #--------------------------------------------------------------------------
  # ● 共通ページ描画(全)
  #--------------------------------------------------------------------------
  def draw_common_page(page_max = 1)
    rect = standard_rect
    txt  = "Page #{@page + 1}/#{page_max}"
    change_color(system_color)
    draw_text(rect, txt, 2)
    change_color(normal_color)
    rect.y += rect.height + LINE_HEIGHT
    return rect.y
  end
  #--------------------------------------------------------------------------
  # ● 共通発見アイテムの描画
  #--------------------------------------------------------------------------  
  def draw_contents_discovery(item)
    return unless item    
    @page = 0
    @page_max = 1
    draw_get_items_common(item)    
  end
  #--------------------------------------------------------------------------
  # ● 内容の描画
  #--------------------------------------------------------------------------
  def draw_contents
    ct = @ext / 10000
    id = @ext % 10000
    
#~     if ct == -1 || ct == -2
    if ct < 0
      draw_contents_empty
    elsif id == 0
      draw_contents_empty
    elsif ct == 1
      if actor_had?(id)
        draw_contents_actor
      else
        draw_contents_empty
      end
    elsif ct == 2
      if enemy_had?(id)
        draw_contents_enemy
      else
        draw_contents_empty
      end
    elsif ct == 3
      if weapon_had?(id)
        draw_contents_weapon
      else
#~         draw_contents_empty
        draw_contents_discovery($data_weapons[id])
      end
    elsif ct == 4
      if armor_had?(id)
        draw_contents_armor
      else
#~         draw_contents_empty
        draw_contents_discovery($data_armors[id])
      end
    elsif ct == 5
      if accessory_had?(id)
        draw_contents_accessory
      else
#~         draw_contents_empty
        draw_contents_discovery($data_armors[id])
      end
    elsif ct == 6
      if item_had?(id)
        draw_contents_item
      else
#~         draw_contents_empty
        draw_contents_discovery($data_items[id])
      end
    elsif ct == 7
      draw_contents_record
    elsif ct == 8
      draw_contents_medal
    else 
      draw_contents_empty
    end
  end
  #--------------------------------------------------------------------------
  # ● 冒険の記録
  #--------------------------------------------------------------------------
  def draw_contents_record
    @page_max = 1
    id = @ext % 70000
    reset_font_settings
    
    if RECORD_STRING.key?(id)
      rect = standard_rect
      draw_text(rect, RECORD_STRING[id])
      rect.y += rect.height + LINE_HEIGHT
      send("draw_record#{id}", rect) if respond_to?("draw_record#{id}".to_sym)
    else
      self.clear
    end
  end
  #--------------------------------------------------------------------------
  # ● 冒険の記録-page1
  #--------------------------------------------------------------------------
  def draw_record1(rect)
    lr = Rect.new(rect.x, rect.y, Integer(rect.width * 0.65), rect.height)
    rr = Rect.new(rect.x + Integer(rect.width * 0.65), rect.y, Integer(rect.width * 0.35), rect.height)    
    change_color(system_color)
    draw_text(lr, "Playtime:");                        lr.y += rect.height
    draw_text(lr, "Saves:");                        lr.y += rect.height
    draw_text(lr, "Cleared:");                            lr.y += rect.height
    draw_text(lr, "Difficulty:");                      lr.y += rect.height
    draw_text(lr, "Highest Cleared:");                lr.y += rect.height
    draw_text(lr, "Battles:");                          lr.y += rect.height
    draw_text(lr, "Defeats:");                      lr.y += rect.height        
    draw_text(lr, "Companions:");                          lr.y += rect.height
    draw_text(lr, "BF Wins:");        lr.y += rect.height
    draw_text(lr, ex_dungeon_record[0]);                lr.y += rect.height
    draw_text(lr, ex_dungeon_record2[0]);               lr.y += rect.height
    change_color(normal_color)
    draw_text(rr, $game_system.playtime_s);              rr.y += rect.height    
    draw_text(rr, "#{$game_system.save_count}");       rr.y += rect.height    
    draw_text(rr, track);                                rr.y += rect.height    
    draw_text(rr, current_difficulty);                   rr.y += rect.height
    draw_text(rr, clear_difficulty);                     rr.y += rect.height    
    draw_text(rr, "#{$game_system.battle_count}");     rr.y += rect.height    
    draw_text(rr, "#{$game_system.party_lose_count}"); rr.y += rect.height    
    draw_text(rr, "#{party_friendly}");                rr.y += rect.height
    draw_text(rr, battlefucker_defeat);                  rr.y += rect.height
    draw_text(rr, ex_dungeon_record[1]);                 rr.y += rect.height
    draw_text(rr, ex_dungeon_record2[1]); rr.y += rect.height
  end
  #--------------------------------------------------------------------------
  # ● 冒険の記録-page1　混沌の迷宮の到達階層
  #--------------------------------------------------------------------------
  def ex_dungeon_record
    var = $game_variables[NWConst::Var::EX_DUNGEON_REACH]
    if var > 0
      return ["Lab. of Chaos Highest Floor:", "#{var}"]
    else
      return ["", ""]
    end
  end

  def ex_dungeon_record2
    var = $game_variables[NWConst::Var::EX_DUNGEON_REACH2]
    if var > 0
      return ["Carnage LoC Highest Floor:", "#{var}"]
    else
      return ["", ""]
    end
  end
  #--------------------------------------------------------------------------
  # ● 冒険の記録-page2 // Overwritten by Script 231 t修正X
  #--------------------------------------------------------------------------
  def draw_record2(rect)
		@page_max = 2
		draw_common_page(@page_max)
		lr = Rect.new(rect.x, rect.y, Integer(rect.width * 0.65), rect.height)
		rr = Rect.new(rect.x + Integer(rect.width * 0.65), rect.y, Integer(rect.width * 0.35), rect.height)    
		change_color(system_color)
		case @page
		when 0
			draw_text(lr, "Total Battles:");                              lr.y += rect.height
			draw_text(lr, "Enemies Defeated:");                          lr.y += rect.height
			draw_text(lr, "Defeats (Luka):");                    lr.y += rect.height
			draw_text(lr, "Climaxes (Luka):");                  lr.y += rect.height
			draw_text(lr, "Luka Raped by Companion:");            lr.y += rect.height
			draw_text(lr, "Defeats (All):");                    lr.y += rect.height
			draw_text(lr, "Climaxes (All):");                  lr.y += rect.height
			draw_text(lr, "Escapes from Battle:");                            lr.y += rect.height
			draw_text(lr, "Wiped Out:");                          lr.y += rect.height    
			draw_text(lr, "Max. Damage Dealt:");												lr.y += rect.height
			draw_text(lr, "Max. Damage Received:");												lr.y += rect.height
			draw_text(lr, "BF Wins:");                  lr.y += rect.height
			draw_text(lr, "BF Defeats:");                  lr.y += rect.height
			draw_text(lr, "Gold spent:");                            lr.y += rect.height
			draw_text(lr, "Synthesizes:");                            lr.y += rect.height
			change_color(normal_color)
			draw_text(rr, "#{party_battle}");                      rr.y += rect.height
			draw_text(rr, "#{party_defeat}");                      rr.y += rect.height
			draw_text(rr, "#{actor_down(NWConst::Actor::LUCA)}");  rr.y += rect.height
			draw_text(rr, "#{actor_orgasm(NWConst::Actor::LUCA)}");rr.y += rect.height
			draw_text(rr, "#{friendly_orgasm}");                   rr.y += rect.height
			draw_text(rr, "#{party_down}");                        rr.y += rect.height
			draw_text(rr, "#{party_orgasm}");                      rr.y += rect.height
			draw_text(rr, "#{party_escape}");                      rr.y += rect.height
			draw_text(rr, "#{party_lose}");                        rr.y += rect.height    
			damage_record = party_damage_record_actor >= NWConst::Damage::GIVE_UNIT ? party_damage_record_actor.give_unit_floor(12) : party_damage_record_actor
			draw_text(rr, "#{damage_record}");                      rr.y += rect.height
			damage_record = party_damage_record_enemy >= NWConst::Damage::GIVE_UNIT ? party_damage_record_enemy.give_unit_floor(12) : party_damage_record_enemy
			draw_text(rr, "#{damage_record}");                        rr.y += rect.height
			draw_text(rr, "#{battlefuck_win}");                    rr.y += rect.height
			draw_text(rr, "#{battlefuck_lose}");                   rr.y += rect.height
			draw_text(rr, "#{purchase_gold}#{Vocab.currency_unit}"); rr.y += rect.height
			draw_text(rr, "#{party_synthesize}");                  rr.y += rect.height
		when 1
			draw_text(lr, "Total Job Changes:");                          lr.y += rect.height
			draw_text(lr, "Total Race Changes:");                          lr.y += rect.height
			change_color(normal_color)  
			draw_text(rr, "#{party_class_change}");                rr.y += rect.height
			draw_text(rr, "#{party_tribe_change}");                rr.y += rect.height
		end	
  end
  #--------------------------------------------------------------------------
  # ● アクターの与えた最大ダメージ
  #--------------------------------------------------------------------------
	def party_damage_record_actor
		return $game_library.party_damage_record_actor
	end
  #--------------------------------------------------------------------------
  # ● アクターの受けた最大ダメージ
  #--------------------------------------------------------------------------
	def party_damage_record_enemy
		return $game_library.party_damage_record_enemy
	end
  #--------------------------------------------------------------------------
  # ● 周回数
  #--------------------------------------------------------------------------
  def track
    num = $game_variables[NWConst::Var::TRACK]
    return 0 < num ? "#{num}" : "None"
  end
  #--------------------------------------------------------------------------
  # ● 数値を難易度文字列に変換
  #--------------------------------------------------------------------------
  def convert_difficulty(key)
    key = [[-3, key].max, 4].min
    {
      -3 => "None",
      -2 => "VERY EASY",
      -1 => "EASY",
      0  => "NORMAL",
      1  => "HARD",
      2  => "VERY HARD",
      3  => "HELL",
      4  => "PARADOX",
    }[key]
  end
  #--------------------------------------------------------------------------
  # ● 現在の難易度
  #--------------------------------------------------------------------------
  def current_difficulty
    convert_difficulty($game_variables[NWConst::Var::CURRENT_DIFFICULTY])
  end  
  #--------------------------------------------------------------------------
  # ● クリアした最高難度
  #--------------------------------------------------------------------------
  def clear_difficulty
    convert_difficulty($game_variables[NWConst::Var::CLEAR_DIFFICULTY])    
  end  
  #--------------------------------------------------------------------------
  # ● バトルファッカー撃破数
  #--------------------------------------------------------------------------
  def battlefucker_defeat
    "#{$game_variables[NWConst::Var::BATTLEFUCKER_DEFEAT]}"
  end
  #--------------------------------------------------------------------------
  # ● 実績
  #--------------------------------------------------------------------------
  def draw_contents_medal
    @page = 0
    @page_max = 1
    id = @ext % 80000
    rect = standard_rect
    reset_font_settings
    change_color(normal_color)
    draw_icon(medal_icon_id(id), rect.x, rect.y)
    rect.x     += 24
    rect.width -= 24
    draw_text(rect,medal_title(id))
    rect = standard_rect
    rect.y += rect.height + LINE_HEIGHT
    change_color(system_color)
    draw_text(rect,"Achieved on:")
    rect.y += rect.height
    change_color(normal_color)
    draw_text(rect,medal_gain_time(id))
    rect.y += rect.height + LINE_HEIGHT
    change_color(system_color)
    draw_text(rect,"Details:")
    rect.y += rect.height
    change_color(normal_color)
    draw_text_auto_line(rect, medal_description(id))
  end
  #--------------------------------------------------------------------------
  # ● 人物
  #--------------------------------------------------------------------------
  def draw_contents_actor
    @page_max = 2
    actor = $data_actors[@ext % 10000]
    return unless actor
    # 共通項目の描画
    draw_actor_image(actor)
    draw_common_page(@page_max)
    rect = standard_rect
    rect.y = draw_common_id(actor)
    case @page
    when 0
      rect.y = draw_actor_stat(rect.y, actor)
    when 1
      rect.y = draw_actor_fix_ability(rect.y, actor)
    end
    draw_actor_illustrator(actor)
  end
  #--------------------------------------------------------------------------
  # ● アクターの統計
  #--------------------------------------------------------------------------
  def draw_actor_stat(y, actor)
    lr = half_left_rect(y)
    rr = half_right_rect(y)
    reset_font_settings
    # 好感度
    unless actor.luca?
      draw_common_friend(lr,rr,actor)
      lr.y += lr.height
      rr.y += rr.height
    end
    # 戦闘回数
    txt = "Battles:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{$game_library.actor_battle(actor.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height    
    # 討伐数
    txt = "Enemies Defeated:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{actor_defeat(actor.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    # イかせた回数
    txt = "Enemies Raped:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{actor_carry(actor.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    # 戦闘不能回数
    txt = "Times Defeated:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{actor_down(actor.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    # イかされた回数
    txt = "Times Came:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{actor_orgasm(actor.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    # 盗んだ回数
    txt = "Items Stolen:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{$game_library.actor_steal(actor.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    return rr.y + LINE_HEIGHT
  end
  #--------------------------------------------------------------------------
  # ● アクターの固有アビリティ
  #--------------------------------------------------------------------------
  def draw_actor_fix_ability(y, actor)
    fix_abilities = ACTOR_FIX_ABILITY[actor.ability_id]
    return y unless fix_abilities

    rect = standard_rect(y)
    reset_font_settings
    change_color(system_color)
    draw_text(rect, FIX_ABILITY_NAME)
    rect.y += rect.height
    change_color(special_color)
    draw_text(rect, fix_abilities.first)
    rect.y += rect.height
    change_color(normal_color)
    fix_abilities[1..-1].each do |text|
      reset_font_settings
      before_text = text.gsub(/\e\w(?:\[\d*\])?/, "")
      contents.font.size -= 1 while rect.width < text_size(before_text).width * 0.7
      draw_text(rect, text)
      rect.y += rect.height
    end
    rect.y
  end
  #--------------------------------------------------------------------------
  # ● 自動改行テキスト表示　配列の区切りで改行
  #--------------------------------------------------------------------------
  def draw_text_auto_line_ex(rect, text)
    array = []
    s = ""
    text.size.times do |i|
      case text[i]
      when"{"
        s += '\{'
        make_font_bigger
        next
      when "}"
        s += '\}'
        make_font_smaller
        next
      when "\n"
      else
        s += text[i]
      end
      s_for_calc_width = s.gsub('\{', "").gsub('\}', "")
      s_width_for_calc_new_line = text_size(s_for_calc_width).width + (standard_padding * 2)
      if (text[i] == "\n") or self.contents.width < s_width_for_calc_new_line
        array.push(s) if s != ""
        s = ""
      end
    end
    array.push(s)
    all_text = array.inject("") {|text, line| text += line + "\n"}
    contents.font.size = Font.default_size
    draw_text_ex(rect.x, rect.y, all_text)
    rect
  end

  #--------------------------------------------------------------------------
  # ● フォントを大きくする
  #--------------------------------------------------------------------------
  def make_font_bigger
    contents.font.size += 1
  end
  #--------------------------------------------------------------------------
  # ● フォントを小さくする
  #--------------------------------------------------------------------------
  def make_font_smaller
    contents.font.size -= 1
  end

  #--------------------------------------------------------------------------
  # ● アクターのイラストレーター
  #--------------------------------------------------------------------------
  def draw_actor_illustrator(actor)
    reset_font_settings
    contents.font.size = 20
    rect = Rect.new(0, contents.height - 20, contents.width, 20)
    draw_text(rect, "Artist: #{actor.illustrator_name}", 2)
  end
  #--------------------------------------------------------------------------
  # ● 敵キャラ
  #--------------------------------------------------------------------------
  def draw_contents_enemy
    enemy = $data_enemies[@ext % 10_000]
    return unless enemy

    @page_max = 5 + enemy_skill_page(enemy)
    if @page >= @page_max
      @page = 0
      return refresh
    end
    # ページに応じた項目描画
    rect = standard_rect
    draw_enemy_image(enemy)
    draw_common_page(@page_max)
    rect.y = draw_common_id(enemy)
    case @page
    when 0
      # 1ページ目 基本情報
      draw_enemy_status(rect.y, enemy)
    when 1
      draw_element_resists(rect.y, enemy)
    when 2
      draw_enemy_tropy(rect.y, enemy)
    when 3
      draw_enemy_stat(rect.y, enemy)
    when 4
      draw_chara_description(rect.y, enemy)
    else
      draw_enemy_skill(rect.y, enemy, @page - 5)
    end
  end
  #--------------------------------------------------------------------------
  # ● 武器
  #--------------------------------------------------------------------------
  def draw_contents_weapon
    @page_max = 2
    weapon = $data_weapons[@ext % 10000]
    return unless weapon
    # ページに応じた項目描画
    rect = standard_rect
    case @page
    when 0
      # 1ページ目 基本情報
      draw_common_page(@page_max)
      rect.y = draw_items_common(weapon)
      rect.y = draw_weapon_basic(rect.y, weapon)
    when 1
      # 2ページ目 入手方法
      draw_common_page(@page_max)
      draw_get_items_common(weapon)
    else
      @page = 0
      self.refresh
    end
  end
  #--------------------------------------------------------------------------
  # ● 武器基本情報の描画
  #--------------------------------------------------------------------------
  def draw_weapon_basic(y, weapon)
    # 5行目左半分 種別
    rect = half_left_rect(y)
    change_color(system_color)
    txt = "Type:"
    draw_text(rect, txt)
    reset_font_settings
    w = text_size(txt).width
    rect.x += w
    rect.width -= w
    txt = $data_system.weapon_types[weapon.wtype_id]
    draw_text(rect, txt, 2)
    # 5行目右半分 価格の描画
    rect = half_right_rect(rect.y)
    txt = "Cost:"
    w = text_size(txt).width
    change_color(system_color)
    draw_text(rect, txt)
    reset_font_settings
    self.draw_currency_value(weapon.price, Vocab.currency_unit, rect.x + w, rect.y, rect.width - w)
    rect.y += rect.height + LINE_HEIGHT
    # 6行目～ 能力補正
    rect.y = draw_equips_common(rect.y, weapon)
  end  
  #--------------------------------------------------------------------------
  # ● 防具
  #--------------------------------------------------------------------------
  def draw_contents_armor
    @page_max = 2
    armor = $data_armors[@ext % 10000]
    return unless armor
    rect = standard_rect
    case @page
    when 0
      # 1ページ目 基本情報
      draw_common_page(@page_max)
      rect.y = draw_items_common(armor)
      rect.y = draw_armor_basic(rect.y, armor)
    when 1
      # 2ページ目 入手方法
      draw_common_page(@page_max)
      draw_get_items_common(armor)
    else
      @page = 0
      self.refresh
    end
  end
  #--------------------------------------------------------------------------
  # ● 防具基本情報の描画
  #--------------------------------------------------------------------------
  def draw_armor_basic(y, armor)
    rect = standard_rect
    rect.y = draw_items_common(armor)
    # 5行目左半分 種別
    rect = half_left_rect(rect.y)
    txt = "Type:"
    change_color(system_color)
    draw_text(rect, txt)
    reset_font_settings
    w = text_size(txt).width
    rect.x += w
    rect.width -= w
    txt = $data_system.armor_types[armor.atype_id]
    draw_text(rect, txt, 2)
    # 5行目右半分 価格の描画
    rect = half_right_rect(rect.y)
    txt = "Cost:"
    w = text_size(txt).width
    change_color(system_color)
    draw_text(rect, txt)
    reset_font_settings
    self.draw_currency_value(armor.price, Vocab.currency_unit, rect.x + w, rect.y, rect.width - w)
    rect.y += rect.height + LINE_HEIGHT
    # 6行目左半分 装備箇所
    rect = half_left_rect(rect.y)
    txt = "Slot:"
    change_color(system_color)
    draw_text(rect, txt)
    reset_font_settings
    txt = Vocab.etype(armor.etype_id)
    draw_text(rect, txt, 2)
    rect.y += rect.height + LINE_HEIGHT
    # 7行目～ 能力補正
    rect.y = draw_equips_common(rect.y, armor)
  end
  #--------------------------------------------------------------------------
  # ● アクセサリ
  #--------------------------------------------------------------------------
  def draw_contents_accessory
    @page_max = 2
    accessory = $data_armors[@ext % 10000]
    return unless accessory
    rect = standard_rect
    case @page
    when 0
      # 1ページ目 基本情報
      draw_common_page(@page_max)
      rect.y = draw_items_common(accessory)
      rect.y = draw_accessory_basic(rect.y, accessory)
    when 1
      # 2ページ目 入手方法
      draw_common_page(@page_max)
      draw_get_items_common(accessory)
    else
      @page = 0
      self.refresh
    end
  end
  #--------------------------------------------------------------------------
  # ● アクセサリ基本情報の描画
  #--------------------------------------------------------------------------
  def draw_accessory_basic(y, accessory)
    rect = standard_rect
    rect.y = draw_items_common(accessory)
    # 5行目左半分 種別
    rect = half_left_rect(rect.y)
    txt = "Type:"
    change_color(system_color)
    draw_text(rect, txt)
    reset_font_settings
    txt = $data_system.armor_types[accessory.atype_id]
    draw_text(rect, txt, 2)
    # 5行目右半分 価格の描画
    rect = half_right_rect(rect.y)
    txt = "Cost:"
    w = text_size(txt).width
    change_color(system_color)
    draw_text(rect, txt)
    reset_font_settings
    self.draw_currency_value(accessory.price, Vocab.currency_unit, rect.x + w, rect.y, rect.width - w)
    rect.y += rect.height + LINE_HEIGHT
    # 6行目左半分 装備箇所
    rect = half_left_rect(rect.y)
    txt = "Slot:"
    change_color(system_color)
    draw_text(rect, txt)
    reset_font_settings
    txt = Vocab.etype(accessory.etype_id)
    draw_text(rect, txt, 2)
    rect.y += rect.height + LINE_HEIGHT
    # 7行目～ 能力補正
    rect.y = draw_equips_common(rect.y, accessory)
  end
  #--------------------------------------------------------------------------
  # ● 道具
  #--------------------------------------------------------------------------
  def draw_contents_item
    @page_max = 2
    item = $data_items[@ext % 10000]
    return unless item
    rect = standard_rect
    case @page
    when 0
      # 1ページ目 基本情報
      draw_common_page(@page_max)
      rect.y = draw_items_common(item)
      rect.y = draw_item_basic(rect.y, item)
    when 1
      # 2ページ目 入手方法
      draw_common_page(@page_max)
      draw_get_items_common(item)
    else
      @page = 0
      self.refresh
    end
  end
  #--------------------------------------------------------------------------
  # ● 道具基本情報の描画
  #--------------------------------------------------------------------------
  def draw_item_basic(y, item)
    rect = standard_rect
    rect.y = draw_items_common(item)
    # 5行目左半分 価格の描画
    rect = half_left_rect(rect.y)
    txt = "Cost:"
    w = text_size(txt).width
    change_color(system_color)
    draw_text(rect, txt)
    reset_font_settings
    self.draw_currency_value(item.price, Vocab.currency_unit, rect.x + w, rect.y, rect.width - w)
    rect.y += rect.height + LINE_HEIGHT
  end
  #--------------------------------------------------------------------------
  # ● 好感度（友好度）描画
  #--------------------------------------------------------------------------
  def draw_common_friend(lr, rr, item)
    if item.is_a?(RPG::Actor)
      text = "Affection:"
      friend = $game_variables[NWConst::Var::ACTOR_REL_BASE + item.id]
    else
      text = "Affinity:"
      friend = item.friend
    end
    reset_font_settings
    change_color(system_color)
    draw_text(lr, text)
    change_color(normal_color)
    draw_text(rr, friend)
  end
  #--------------------------------------------------------------------------
  # ● キャラ説明描画(アクター, エネミー)
  #--------------------------------------------------------------------------
  def draw_chara_description(y, chara)
    # 描画域の生成
    rect = standard_rect(y)
    rect.height = self.contents.height - rect.y
    @dest_rect = rect
    @src_rect.y = 0 if @last_ext != @ext
    # 解説文章の取得
    desc = ["No description"]
    if chara.is_a?(RPG::Enemy)
      key = chara.id
      desc = ENEMY_DESCRIPTION[key] if ENEMY_DESCRIPTION.key?(key)
    end
    
    # 解説文章のビットマップを生成 (キャッシュへのキーは@ext)
    if @description[@ext].nil? || @description[@ext].disposed?
      if @description.size > 10
        k = @description.keys.first
        @description[k].dispose unless @description[k].disposed?
        @description.delete(k)
      end
      @description[@ext] = Bitmap.new(rect.width, desc.size * line_height)
      @src_rect = @description[@ext].rect
      i = 0
      desc.each{|txt|
        r = standard_rect(i * line_height)
        @description[@ext].draw_text(r, txt)
        i += 1
      }
    end
    bmp = @description[@ext]
    # ビットマップの範囲を設定
    @src_rect.height = bmp.height - @src_rect.y
    # 解説文章を描画域へ転送する。
    self.contents.blt(@dest_rect.x, @dest_rect.y, bmp, @src_rect)
    # スクロールカーソルを転送する。
    # 上
    if @src_rect.y > 0 && bmp.height > @dest_rect.height
      arrow_rect = Rect.new(88, 14, 14, 10)
      self.contents.blt((self.contents.width - 14) / 2, rect.y - 10,
        self.windowskin, arrow_rect)
    end
    # 下
    if @src_rect.height > @dest_rect.height
      arrow_rect = Rect.new(88, 38, 14, 10)
      self.contents.blt((self.contents.width - 14) / 2, rect.y + rect.height - 10,
        self.windowskin, arrow_rect)
    end
    # 戻る
    reset_font_settings
    return rect.y + rect.height
  end
  #--------------------------------------------------------------------------
  # ● 敵キャラ能力描画
  #--------------------------------------------------------------------------
  def draw_enemy_status(y, enemy)
    rect = standard_rect(y)
    # 能力描画
    # パラメータ文字列の最大の幅を持つものを取得
    max_width = 0
    for i in 0..7
      txt = "#{Vocab::param(i)}"
      now_w = text_size(txt).width
      max_width = now_w + 10 if max_width < now_w + 10
    end
    # 描画処理
    for i in 0..7
      if i % 2 == 0
        # 能力描画用の矩形作成
        lr = Rect.new(rect.x, rect.y, max_width, rect.height)
        rr = Rect.new(rect.x + max_width, rect.y, self.contents.width / 2 - max_width - 24, rect.height)
      else
        # 能力描画用の矩形作成
        lr = Rect.new(self.contents.width / 2, rect.y, max_width, rect.height)
        rr = Rect.new(self.contents.width / 2 + max_width, rect.y, self.contents.width / 2 - max_width - 24, rect.height)
        rect.y += rect.height
      end
      change_color(system_color)
      txt = "#{Vocab::param(i)}"
      draw_text(lr, txt, 2)
      change_color(normal_color)
      param_base = enemy.params[i]
      param_rate = enemy_features_pi(enemy, Game_BattlerBase::FEATURE_PARAM, i)
      i = (param_base * param_rate).to_i
      i = i.give_unit_floor(4) if i > 1000000
      draw_text(rr, i, 2)
    end
    return rect.y + rect.height
  end

  def draw_element_resists(y, enemy)
    rect = standard_rect(y)
    change_color(system_color)
    draw_text(rect, "Element Resistances")
    rect.y += rect.height
    r = []
    elements = $game_switches[NWConst::Sw::ADD_ELEMENT_RESIST] ? NWConst::Status::ADD_ELEMENT_RESIST : NWConst::Status::ELEMENT_RESIST
    icons = $game_switches[NWConst::Sw::ADD_ELEMENT_RESIST] ? NWConst::Status::ADD_ELEMENT_ICONS : NWConst::Status::ELEMENT_ICONS
    elements.size.times{r.push(half_left_rect(rect.y))}
    r.each_with_index { |elem, i|
      elem.x += elem.width * (i % 2)
      elem.y += elem.height * (i / 2)
      elem.width -= 16
    }
    r.each_with_index do |rect, i|
      element_id = elements[i]
      icon_id = icons[i]
      draw_element_resist(rect, enemy, element_id, icon_id)
    end
    return r[-1].y + r[-1].height
  end
  #--------------------------------------------------------------------------
  # ● 属性耐性描画
  #--------------------------------------------------------------------------
  def draw_element_resist(rect, enemy, element_id, icon_id)
    draw_icon(icon_id, rect.x, rect.y)
    rect.x += 24
    rect.width -= 24
    r1 = Rect.new(rect.x, rect.y, rect.width/2, rect.height)
    r2 = Rect.new(rect.x+rect.width/2, rect.y, rect.width/2, rect.height)
    reset_font_settings
    change_color(system_color)
    text = "#{$data_system.elements[element_id]}"
    draw_text(r1, text)
    reset_font_settings
    e = Game_Enemy.new(0,enemy.id)
    element_rate = e.element_rate(element_id)
    resist = Integer(element_rate * 100)
    if e.element_reflection(element_id)
      color = special_color
      text = "REFLECT"
    elsif e.element_drain?(element_id)
      color = special_color
      text = "ABSORB"
    else
      if resist == 0
        color = special_color
      elsif resist > 100
        color = bad_color
      elsif resist < 100
        color = good_color
      else
        color = normal_color
      end
      text = resist == 0 ? "NULL" : "#{resist}%"
    end
    change_color(color)
    draw_text(r2, text, 2)
  end
  #--------------------------------------------------------------------------
  # ● 敵獲得物描画
  #--------------------------------------------------------------------------
  def draw_enemy_tropy(y, enemy)
    rect = standard_rect(y)
    # 経験値
    lr = half_left_rect(rect.y)
    rr = half_right_rect(rect.y)
    txt = "XP:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{enemy.exp}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    # 職業経験値
    txt = "Job XP:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{enemy.class_exp}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height 
    # お金
    txt = "G:"
    change_color(system_color)
    draw_text(lr, txt)
    reset_font_settings
    draw_currency_value(enemy.gold, Vocab.currency_unit, rr.x, rr.y, rr.width, 0)
    lr.y += lr.height + LINE_HEIGHT
    rr.y += rr.height + LINE_HEIGHT 
    reset_font_settings
    # ドロップアイテムの描画
    y = draw_enemy_tropy_drop_item(lr.y, enemy)
    # 盗めるアイテムの描画
    y = draw_enemy_tropy_steal_item(y, enemy)
    return y
  end
  #--------------------------------------------------------------------------
  # ● 敵ドロップ描画 【落とすアイテム】
  #--------------------------------------------------------------------------
  def draw_enemy_tropy_drop_item(y, enemy)
    rect = standard_rect(y)
    txt = "Drops"
    reset_font_settings
    change_color(system_color)
    draw_text(rect, txt)
    rect.y += rect.height
    reset_font_settings
    unless enemy.drop_items.all?{|drop|drop.kind == 0}
      i = 0
      r = [
        Rect.new(rect.x, rect.y, rect.width/2, rect.height),
        Rect.new(rect.x+rect.width/2, rect.y, rect.width/2, rect.height),
        Rect.new(rect.x, rect.y+rect.height, rect.width/2, rect.height),
      ]
      enemy.drop_items.each do |drop|
				
        num = $game_library.enemy_item_drop_num(enemy.id, drop)
        if 1 <= num || ($TEST && Input.press?(:CTRL))
          case drop.kind
          when 1; item = $data_items[drop.data_id]
          when 2; item = $data_weapons[drop.data_id]
          when 3; item = $data_armors[drop.data_id]
          else; item = nil
          end
          draw_item_name(item, r[i].x, r[i].y, true, r[i].width) if item
        else
          txt = "?" * 8
          draw_text(r[i], txt)
        end
        i += 1
      end
      return r[i-1].y + rect.height + LINE_HEIGHT
    end
    
    draw_text(rect, GET_ITEM_NO_NAME)      
    return rect.y + rect.height + LINE_HEIGHT
  end
  #--------------------------------------------------------------------------
  # ● 敵スティール描画 【盗めるアイテム】
  #--------------------------------------------------------------------------
  def draw_enemy_tropy_steal_item(y, enemy)    
    rect = standard_rect(y)
    reset_font_settings
    
    enemy.steal_list.each{ |list_id, list|
      next unless steal_item_list_index.key?(list_id)
      rect = standard_rect(rect.y)
      txt = steal_item_list_index[list_id]
      change_color(system_color)
      draw_text(rect, txt)
      rect.y += rect.height
      i = 0
      r = [
        Rect.new(rect.x,rect.y,rect.width/2,rect.height),
        Rect.new(rect.x+rect.width/2,rect.y,rect.width/2,rect.height)
      ]
      change_color(normal_color)
      list.each { |steal|
        num = $game_library.enemy_item_steal_num(enemy.id, list_id, steal)
        if 1 <= num || ($TEST && Input.press?(:CTRL))
          item = nil
          case steal[:kind]
          when 1; item = $data_items[steal[:data_id]]
          when 2; item = $data_weapons[steal[:data_id]]
          when 3; item = $data_armors[steal[:data_id]]
          end
          draw_item_name(item, r[i].x, r[i].y, true, r[i].width) if item
        else
          txt = "?" * 8
          draw_text(r[i], txt)
        end
        break if r.size - 1 <= i
        i += 1
      }
      draw_text(rect, GET_ITEM_NO_NAME) if list.empty?
      rect.y += rect.height + LINE_HEIGHT
    }
    return rect.y + rect.height + LINE_HEIGHT
  end
  #--------------------------------------------------------------------------
  # ● 敵ドロップ描画 【盗めるアイテム】用リスト別インデックス
  #--------------------------------------------------------------------------
  def steal_item_list_index
    {
      1 => "Stolen Items",
      2 => "Stolen Food",
      3 => "Stolen Materials",
      4 => "Stolen Panties"
    }
  end  
   #--------------------------------------------------------------------------
  # ● 敵キャラ統計描画
  #--------------------------------------------------------------------------
  def draw_enemy_stat(y, enemy)
    rect = standard_rect(y)
    lr = half_left_rect(rect.y)
    rr = half_right_rect(rect.y)
    join_flag = false
    join_exist = false
    if enemy.follower?
      join_flag = true
      join_exist = $game_party.follow?(enemy.follower_actor_id)
    elsif enemy.join_switch
      join_flag = true
      join_actor_id = enemy.join_switch - NWConst::Sw::ADD_ACTOR_BASE
      join_exist = $game_party.follow?(join_actor_id)
    end
    if join_flag
      txt = "Recruited: #{ join_exist ? "Yes" : "No" }"
      change_color(normal_color)
      draw_text(lr, txt)
      lr.y += lr.height + LINE_HEIGHT
      rr.y += rr.height + LINE_HEIGHT
    end
    txt = "Race:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = enemy.lib_category.to_s
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    draw_common_friend(lr, rr, enemy)
    lr.y += lr.height
    rr.y += rr.height    
    txt = "Times Defeated:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{enemy_down(enemy.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    txt = "Times Came:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{enemy_orgasm(enemy.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    txt = "Times Raped:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{enemy_victory(enemy.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height + LINE_HEIGHT
    rr.y += rr.height + LINE_HEIGHT
    y = draw_encounter_enemy_place(lr.y, enemy)
    return y
  end
  #--------------------------------------------------------------------------
  # ● エネミー遭遇場所の描画
  #--------------------------------------------------------------------------
  def draw_encounter_enemy_place(y, enemy)    
    encounter_enemy_place = $game_library.encounter_enemy_place(enemy.id)
    return y unless encounter_enemy_place
    rect = standard_rect(y)
    reset_font_settings
    change_color(system_color)
    draw_text(rect, ENCOUNTER_ENEMY_PLACE_NAME)
    encounter_enemy_place[0...ENCOUNTER_ENEMY_PLACE_MAX].each{|place|
      rect.y += rect.height
      reset_font_settings          
      if $game_library.place?(place) || ($TEST && Input.press?(:CTRL))
        place_name = place.to_s
      else
        place_name = "?" * 8
      end
      draw_text(rect, place_name)
    }
    draw_etc_common(rect.y) if ENCOUNTER_ENEMY_PLACE_MAX <= encounter_enemy_place.size
    return rect.y + rect.height + LINE_HEIGHT
  end
  #--------------------------------------------------------------------------
  # ● 敵キャラスキル描画
  #--------------------------------------------------------------------------
  ENEMY_SKILL_PAGE_MAX = 14
  def draw_enemy_skill(y, enemy, page = 0)
    lr = standard_rect(y)
    lr.width *= 0.7
    rr = standard_rect(y)
    rr.x += rr.width * 0.7
    rr.width *= 0.3

    reset_font_settings
    change_color(system_color)
    draw_text(lr, "Skill")
    draw_text(rr, "Times Taken")
    lr.y += lr.height + LINE_HEIGHT
    rr.y += rr.height + LINE_HEIGHT
    start_index = ENEMY_SKILL_PAGE_MAX * page

    enemy_show_skills(enemy)[start_index, ENEMY_SKILL_PAGE_MAX].each do |skill|
      name = skill.lib_name
      num  = $game_library.enemy_skill_used_num(enemy.id, skill.id)
      change_color(normal_color, 0 < num)
      draw_text(lr, name)
      draw_text(rr, num)
      lr.y += lr.height
      rr.y += rr.height
    end
    rr.y
  end

  def enemy_show_skills(enemy)
    enemy.actions.map(&:skill).compact.uniq.reject do |skill|
      skill.lib_name.empty? || skill.lib_exclude?
    end
  end

  def enemy_skill_page(enemy)
    ([enemy_show_skills(enemy).count - 1, 0].max / ENEMY_SKILL_PAGE_MAX) + 1
  end

  #--------------------------------------------------------------------------
  # ● 描画共通部分(武器, 防具, アクセサリ, アイテム)
  #--------------------------------------------------------------------------
  def draw_items_common(item)
    rect = standard_rect
    reset_font_settings
    # アイテム名の描画
    draw_item_name(item, rect.x, rect.y)
    rect.y = self.contents.height - (line_height * 5)
    
    # 解説の描画
    change_color(system_color)
    draw_text(rect, "Details")
    rect.y += rect.height
    change_color(normal_color)
    all_text = ""
    item.description.each_line do |d|
      d.slice!(/【\S+】/)
      d.chomp!
      next if d == ""
      all_text += d
      all_text += "\n"
    end
    rect = draw_text_auto_line_ex(rect, all_text)
    
    return line_height + LINE_HEIGHT
  end
  #--------------------------------------------------------------------------
  # ● 入手方法一覧描画共通部分(武器, 防具, アイテム)
  #--------------------------------------------------------------------------
  def draw_get_items_common(item)
    rect = standard_rect
    # 1行目 アイテム名の描画
    reset_font_settings
    draw_item_name(item, rect.x, rect.y)
    rect.y += rect.height + LINE_HEIGHT
    # 
    kind = item.is_a?(RPG::Item) ? 1 : item.is_a?(RPG::Weapon) ? 2 : 3 
    rect.y = draw_get_items_place_common(rect.y, kind, item)
    rect.y = draw_get_items_drop_common(rect.y, kind, item)
    rect.y = draw_get_items_steal_common(rect.y, kind, item)
    rect.y = draw_get_items_actor_common(rect.y, kind, item)
    return rect.y
  end
  #--------------------------------------------------------------------------
  # ● 入手方法一覧描画共通部分(武器, 防具, アイテム)【入手場所】
  #--------------------------------------------------------------------------
  def draw_get_items_place_common(y, kind, item)    
    get_item_places = $game_library.get_item_places(kind, item.id)
    return y unless get_item_places
    rect = standard_rect(y)
    reset_font_settings
    change_color(system_color)
    draw_text(rect, GET_ITEM_PLACE_NAME)
    get_item_places[0...GET_ITEM_PLACE_MAX].each{|place|
      rect.y += rect.height
      reset_font_settings
      if $game_library.place?(place) || ($TEST && Input.press?(:CTRL)) 
        place_name = place.to_s 
      else
        place_name = "?" * 8
      end
      draw_text(rect, place_name)
    }
    draw_etc_common(rect.y) if GET_ITEM_PLACE_MAX < get_item_places.size
    return rect.y + rect.height + LINE_HEIGHT
  end
  #--------------------------------------------------------------------------
  # ● 入手方法一覧描画共通部分(武器, 防具, アイテム)【落とす敵】
  #--------------------------------------------------------------------------
  def draw_get_items_drop_common(y, kind, item)
    get_item_drop = $game_library.get_item_drop(kind, item.id)    
    return y unless get_item_drop
    rect = standard_rect(y)
    reset_font_settings
    change_color(system_color)
    draw_text(rect, GET_ITEM_DROP_NAME)      
    get_item_drop[0...GET_ITEM_DROP_MAX].each{|id|
      rect.y += rect.height
      reset_font_settings
      enemy_name = $game_library.enemy.had?(id) ? $data_enemies[id].lib_name : "？" * 8
      draw_text(rect, enemy_name)
    }
    draw_etc_common(rect.y) if GET_ITEM_DROP_MAX < get_item_drop.size
    return rect.y + rect.height + LINE_HEIGHT
  end
  #--------------------------------------------------------------------------
  # ● 入手方法一覧描画共通部分(武器, 防具, アイテム)【盗める敵】
  #--------------------------------------------------------------------------
  def draw_get_items_steal_common(y, kind, item)
    get_item_steal = $game_library.get_item_steal(kind, item.id)
    return y unless get_item_steal
    rect = standard_rect(y)
    reset_font_settings
    change_color(system_color)
    draw_text(rect, GET_ITEM_STEAL_NAME)      
    get_item_steal[0...GET_ITEM_STEAL_MAX].each{|id|
      rect.y += rect.height
      reset_font_settings
      enemy_name = $game_library.enemy.had?(id) ? $data_enemies[id].lib_name : "？" * 8
      draw_text(rect, enemy_name)
    }
    draw_etc_common(rect.y) if GET_ITEM_STEAL_MAX < get_item_steal.size
    return rect.y + rect.height + LINE_HEIGHT
  end
  #--------------------------------------------------------------------------
  # ● 入手方法一覧描画共通部分(武器, 防具, アイテム)【もらえる仲間】
  #--------------------------------------------------------------------------
  def draw_get_items_actor_common(y, kind, item)    
    get_item_actors = $game_library.get_item_actors(kind, item.id)
    return y unless get_item_actors
    rect = standard_rect(y)
    reset_font_settings
    change_color(system_color)
    draw_text(rect, GET_ITEM_ACTOR_NAME)
    get_item_actors[0...GET_ITEM_ACTOR_MAX].each{|actor_id|
      rect.y += rect.height
      reset_font_settings
      if $game_library.actor.discovery?(actor_id) 
        actor_name = $data_actors[actor_id].name
      else
        actor_name = "?" * 8
      end
      draw_text(rect, actor_name)
    }
    draw_etc_common(rect.y) if GET_ITEM_ACTOR_MAX < get_item_actors.size
    return rect.y + rect.height + LINE_HEIGHT
  end
  #--------------------------------------------------------------------------
  # ● 入手方法一覧描画共通部分(武器, 防具, アイテム)【など】
  #--------------------------------------------------------------------------
  def draw_etc_common(y)
    rect = contents.text_size(GET_ITEM_ETC_NAME)
    rect.width += 8 # マージン
    rect.x = standard_rect.width - rect.width
    rect.y = y
    reset_font_settings
    draw_text(rect, GET_ITEM_ETC_NAME)
  end
  #--------------------------------------------------------------------------
  # ● 描画共通部分(武器, 防具)
  #--------------------------------------------------------------------------
  def draw_equips_common(y, equip)
    # パラメータ文字列の最大の幅を持つものを取得
    max_width = 0
    for i in 0..7
      txt = "#{Vocab::param(i)}"
      rect = text_size(txt)
      max_width = rect.width + 10 if max_width < rect.width + 10
    end
    # 左半分 パラメータ補正
    lr = Rect.new(4, y, max_width, line_height)
    rr = Rect.new(4 + max_width, y, 
      self.contents.width / 2 - max_width - padding / 2, line_height)
    for i in 0..7
      # 補正値が0の項目は飛ばす
      next if equip.params[i] == 0
      # パラメーター名
      change_color(system_color)
      txt = "#{Vocab::param(i)}"
      draw_text(lr, txt)
      # 補正値
      reset_font_settings
      draw_text(rr, sprintf("%+d",equip.params[i]), 2)
      # 矩形座標の更新
      lr.y += lr.height
      rr.y += rr.height
    end
    return rr.y
  end
  #--------------------------------------------------------------------------
  # ● 仲間キャラ画像描画
  #--------------------------------------------------------------------------
  def draw_actor_image(actor, opacity = 128)
    # エラーチェック
    return unless actor.is_a?(RPG::Actor)
    return unless ACTOR_IMAGE[actor.id].is_a?(Array)
    # 読み込み対象ファイルを取得
    path = ACTOR_IMAGE[actor.id][0]
    name = ACTOR_IMAGE[actor.id][1]
    hue  = ACTOR_IMAGE[actor.id][2].nil? ? 0 : ACTOR_IMAGE[actor.id][2]
    x_ajust = ACTOR_IMAGE[actor.id][3].nil? ? 0 : ACTOR_IMAGE[actor.id][3]
    y_ajust = ACTOR_IMAGE[actor.id][4].nil? ? 0 : ACTOR_IMAGE[actor.id][4]
    ratio = ACTOR_IMAGE[actor.id][5].nil? ? 1.00 : ACTOR_IMAGE[actor.id][5]
    auto_ajust = ACTOR_IMAGE[actor.id][3].nil? ? true : false
    # エラーチェック
    return unless path.is_a?(String) || name.is_a?(String) || hue.is_a?(Integer)
    return if path.empty? || name.empty?
    return unless NWFileTest.image_exist?(path, name)
    # 描画共通部呼び出し
    draw_common_image(Cache.load_bitmap(path, name, hue), opacity, x_ajust, y_ajust, ratio, auto_ajust)
  end
  #--------------------------------------------------------------------------
  # ● 敵キャラ画像描画
  #--------------------------------------------------------------------------
  def draw_enemy_image(enemy, opacity = 128)
    # エラーチェック
    return unless enemy.is_a?(RPG::Enemy)
    data = ENEMY_IMAGE[enemy.base_enemy.id]
    if data.is_a?(Array)
      # 読み込み対象ファイルを取得
      path = data[0]
      name = data[1]
      hue = data ? 0 : data[2]
      hue = enemy.battler_hue if enemy.ex_enemy?
      x_ajust = data.nil? ? 0 : data[3]
      y_ajust = data[4].nil? ? 0 : data[4]
      ratio = data[5].nil? ? 1.00 : data[5]
      auto_ajust = data[3].nil? ? true : false
      # エラーチェック
      return unless path.is_a?(String) || name.is_a?(String) || hue.is_a?(Integer)
      return if path.empty? || name.empty?
      return unless NWFileTest.image_exist?(path, name)

      # 描画共通部呼び出し
      draw_common_image(Cache.load_bitmap(path, name, hue), opacity, x_ajust, y_ajust, ratio, auto_ajust)
    else
      # バトラーのファイル名が空なら戻る
      return if enemy.battler_name.empty?
      # 読み込んでバトラー画像のハッシュに代入

      # 描画共通部呼び出し
      draw_common_image(Cache.battler(enemy.battler_name, enemy.battler_hue), opacity)      
    end
  end
  #--------------------------------------------------------------------------
  # ● 画像描画共通部
  #--------------------------------------------------------------------------
  def draw_common_image(bitmap, opacity = 128, x_ajust = 0, y_ajust = 0, ratio=1.00, auto_ajust = true)
    w = self.contents.rect.width
    h = self.contents.rect.height
    bw = bitmap.rect.width
    bh = bitmap.rect.height
    # バトラー画像がウィンドウより大きい場合は、
    # 縦横比を維持しながらx = 中央, y = 下限に合わせて縮小転送する
    # そうでなければx = 中央, y = 下限に合わせて転送する
    if (bw > w || bh > h) && auto_ajust
      ratio = [w.to_f / bw.to_f, h.to_f / bh.to_f].min
      rect = Rect.new(((w - Integer(bw * ratio)) / 2), (h - Integer(bh * ratio)), 
        Integer(bw * ratio), Integer(bh * ratio))
      self.contents.stretch_blt(rect, bitmap, bitmap.rect, opacity)
    else # 手動設定
      rect = Rect.new(((w - Integer(bw * ratio)) / 2) + x_ajust,
        (h - Integer(bh * ratio)) - y_ajust, 
        Integer(bw * ratio), Integer(bh * ratio))
      self.contents.stretch_blt(rect, bitmap, bitmap.rect, opacity)
    end
  end
end

#==============================================================================
# ■ Window_Library_EnemyCommand
#==============================================================================
class Window_Library_EnemyCommand < Window_Command
  #--------------------------------------------------------------------------
  # ● 公開インスタンス
  #--------------------------------------------------------------------------
  attr_accessor   :enemy_id  
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    @enemy_id = 1
    super(240, 180)
    hide.deactivate
  end
  #--------------------------------------------------------------------------
  # ● 敵かどうか
  #--------------------------------------------------------------------------
  def enemy?
    return (@enemy_id < 10000 ? true : false)
  end
  #--------------------------------------------------------------------------
  # ● 選択RPG::Actorの取得
  #--------------------------------------------------------------------------
  def actor
    return $data_actors[@enemy_id - 10000]
  end
  #--------------------------------------------------------------------------
  # ● 選択RPG::Enemyの取得
  #--------------------------------------------------------------------------
  def enemy
    return $data_enemies[@enemy_id]
  end
  #--------------------------------------------------------------------------
  # ● アライメントの取得
  #--------------------------------------------------------------------------
  def alignment
    return 1
  end
  #--------------------------------------------------------------------------
  # ● コマンドリストの作成
  #--------------------------------------------------------------------------
  def make_command_list
    enable = !$game_party.in_battle
    if enemy?
      add_command("Replay Scene",   :memory_event, enable && memory_event?)
      add_command("View Images",   :cg_view, enable && cg_view?)
      add_command("Cancel", :cancel, true)
      self.height = fitting_height(3) unless disposed?
    else
      enable &&= $game_variables[NWConst::Var::ACTOR_REL_BASE + actor.id] >= 100
      add_command("View Images",   :actor_cg_view, enable && actor_cg_view?)
      add_command("Cancel", :cancel, true)
      self.height = fitting_height(2) unless disposed?
    end
  end
  #--------------------------------------------------------------------------
  # ● 回想イベントに対応している？
  #--------------------------------------------------------------------------  
  def memory_event?
    return false if enemy.no_lose_skip?
    event = $data_common_events[enemy.lose_event_id]
    return false unless event
    return true
  end
  #--------------------------------------------------------------------------
  # ● 閲覧用ＣＧが存在する？
  #--------------------------------------------------------------------------  
  def cg_view?
    NWConst::Library::CG_VIEW_IMAGE.key?(enemy.id)
  end
  #--------------------------------------------------------------------------
  # ● 閲覧用ＣＧが存在する？
  #-------------------------------------------------------------------------- 
  def actor_cg_view?
    NWConst::Library::ACTOR_CG_VIEW_IMAGE.key?(actor.id)
  end
end

#==============================================================================
# ■ Scene_Library
#----------------------------------------------------------------------------
# 図鑑画面のシーンです。
#==============================================================================
class Scene_Library < Scene_MenuBase
  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    create_header_window
    create_footer_window
    create_right_column_window
    create_left_column_window
    create_enemy_command_window
    window_setting
  end
  #--------------------------------------------------------------------------
  # ● 終了処理 図鑑/本体
  #--------------------------------------------------------------------------
  def terminate
    super
    replay_bgm_and_bgs unless SceneManager.scene_is?(Scene_CGViewer) ||
                              SceneManager.scene_is?(Scene_ActorCGViewer) ||
                              SceneManager.scene_is?(Scene_Novel) ||
                              SceneManager.scene_is?(Scene_JobShow) ||
                              SceneManager.scene_is?(Scene_Library_H)
  end
  #--------------------------------------------------------------------------
  # ● BGMの演奏
  #--------------------------------------------------------------------------
  def play_bgm
    @prev_bgm = RPG::BGM.last 
    @prev_bgs = RPG::BGS.last 
    NWConst::Library::BGM.play
    RPG::BGS.stop
  end
  #--------------------------------------------------------------------------
  # ● 直前BGMの保存を行わずに図鑑BGMの演奏　敗北回想からの復帰用
  #--------------------------------------------------------------------------
  def play_bgm_no_save
    NWConst::Library::BGM.play
    RPG::BGS.stop
  end
  #--------------------------------------------------------------------------
  # ● BGM と BGS の再開
  #--------------------------------------------------------------------------  
  def replay_bgm_and_bgs
    @prev_bgm.replay
    @prev_bgs.replay
  end
  #--------------------------------------------------------------------------
  # ● ヘッダーウィンドウの作成
  #--------------------------------------------------------------------------
  def create_header_window
    @header_nav_window = Window_Library_HeaderNav.new
  end
  #--------------------------------------------------------------------------
  # ● フッターウィンドウの作成
  #--------------------------------------------------------------------------
  def create_footer_window
    @footer_help_window = Window_Library_FooterHelp.new
  end
  #--------------------------------------------------------------------------
  # ● 右カラムウィンドウの作成
  #--------------------------------------------------------------------------
  def create_right_column_window
    @main_contents_window = Window_Library_RightMain.new
  end
  #--------------------------------------------------------------------------
  # ● 左カラムウィンドウの作成
  #--------------------------------------------------------------------------
  def create_left_column_window
    @main_command_window = Window_Library_MainCommand.new
    @main_command_window.set_handler(:lib_record, method(:on_record_index))
    @main_command_window.set_handler(:lib_medal, method(:on_medal_index))
    @main_command_window.set_handler(:lib_actor,  method(:on_actor_index))
    @main_command_window.set_handler(:lib_enemy,  method(:on_enemy_index))
    @main_command_window.set_handler(:lib_weapon, method(:on_weapon_index))
    @main_command_window.set_handler(:lib_armor,  method(:on_armor_index))
    @main_command_window.set_handler(:lib_accessory,  method(:on_accessory_index))
    @main_command_window.set_handler(:lib_item,   method(:on_item_index))
    @main_command_window.set_handler(:lib_stone, method(:on_stone_index))
    @main_command_window.set_handler(:lib_class,  method(:on_class_index))
    @main_command_window.set_handler(:lib_tribe,  method(:on_tribe_index))
    @main_command_window.set_handler(:lib_return, method(:return_index))
    @main_command_window.set_handler(:lib_close,  method(:return_scene))
    @main_command_window.set_handler(:cancel,     method(:on_command_cancel))
    @main_command_window.set_handler(:input_right, method(:on_next_page))
    @main_command_window.set_handler(:input_left,  method(:on_previous_page))
    @main_command_window.set_handler(:scrolldown,   method(:on_scroll_down))
    @main_command_window.set_handler(:scrollup,     method(:on_scroll_up))
    @main_command_window.index_window = @header_nav_window
    @main_command_window.contents_window = @main_contents_window      
    @main_command_window.help_window  = @footer_help_window 
  end
  #--------------------------------------------------------------------------
  # ● エネミー選択ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_enemy_command_window
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウの設定準備
  #--------------------------------------------------------------------------
  def window_setting
    if $game_temp.lib_enemy_index != -1
      play_bgm_no_save
      @main_command_window.category = $game_temp.lib_enemy_index < 10000 ? 2 : 1
      @main_command_window.refresh
      @main_command_window.select($game_temp.lib_enemy_index % 10000)
      @main_command_window.activate
      $game_temp.lib_enemy_index = -1
    else
      @main_command_window.select(0)
      @main_command_window.activate
    end
  end
  #--------------------------------------------------------------------------
  # ● 冒険の記録の項
  #--------------------------------------------------------------------------
  def on_record_index
    @main_command_window.category = 7
    @main_command_window.refresh
    @main_command_window.select(0)
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 実績の項
  #--------------------------------------------------------------------------
  def on_medal_index
    @main_command_window.category = 8
    @main_command_window.refresh
    @main_command_window.select(0)
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 人物の項
  #--------------------------------------------------------------------------
  def on_actor_index
    @main_command_window.category = 1
    @main_command_window.refresh
    @main_command_window.select(0)
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 魔物の項
  #--------------------------------------------------------------------------
  def on_enemy_index
    @main_command_window.category = 2
    @main_command_window.refresh
    @main_command_window.select(@main_command_window.item_max - 1)
    @main_command_window.select(battle_enemy_index)
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 戦闘中の魔物図鑑のカーソル開始位置
  #--------------------------------------------------------------------------
  def battle_enemy_index
    return 0 unless $game_party.in_battle
    result = nil
    alive_enemies = $game_troop.alive_members.map(&:enemy_id)
    @main_command_window.item_max.times do |i|
      enemy_id = @main_command_window.command_enemy_id(i)
      next unless $data_enemies[enemy_id]
      result = (result ? [result, i].min : i) if alive_enemies.include?(enemy_id)
    end
    return result ? result : 0
  end
  #--------------------------------------------------------------------------
  # ● 武器の項
  #--------------------------------------------------------------------------
  def on_weapon_index
    @main_command_window.category = 3
    @main_command_window.refresh
    @main_command_window.select(0)
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 防具の項
  #--------------------------------------------------------------------------
  def on_armor_index
    @main_command_window.category = 4
    @main_command_window.refresh
    @main_command_window.select(0)
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● アクセサリの項
  #--------------------------------------------------------------------------
  def on_accessory_index
    @main_command_window.category = 5
    @main_command_window.refresh
    @main_command_window.select(0)
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 道具の項
  #--------------------------------------------------------------------------
  def on_item_index
    @main_command_window.category = 6
    @main_command_window.refresh
    @main_command_window.select(0)
    @main_command_window.activate
  end

  def on_stone_index
    @main_command_window.category = 9
    @main_command_window.refresh
    @main_command_window.select(0)
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 職業の項
  #--------------------------------------------------------------------------
  def on_class_index
    $game_temp.lib_class_type_id = 0
    SceneManager.call(Scene_JobShow)
  end
  #--------------------------------------------------------------------------
  # ● 種族の項
  #--------------------------------------------------------------------------
  def on_tribe_index
    $game_temp.lib_class_type_id = 1
    SceneManager.call(Scene_JobShow)
  end
  #--------------------------------------------------------------------------
  # ● 索引へ戻る
  #--------------------------------------------------------------------------
  def return_index
    @main_contents_window.page_init
    @main_command_window.category = 0
    @main_command_window.refresh
    @main_command_window.select(0)
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● キャンセル
  #--------------------------------------------------------------------------
  def on_command_cancel
    if @main_command_window.category > 0
      return_index
    else
      return_scene
    end
  end
  #--------------------------------------------------------------------------
  # ● 次のページへ
  #--------------------------------------------------------------------------
  def on_next_page
    @main_contents_window.next_page
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 前のページへ
  #--------------------------------------------------------------------------
  def on_previous_page
    @main_contents_window.previous_page
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 上スクロール
  #--------------------------------------------------------------------------
  def on_scroll_up
    @main_contents_window.scroll_up
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 下スクロール
  #--------------------------------------------------------------------------
  def on_scroll_down
    @main_contents_window.scroll_down
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 魔物図鑑の決定
  #--------------------------------------------------------------------------
  def on_enemy_ok
    @enemy_command_window.enemy_id = @main_contents_window.id
    @enemy_command_window.refresh
    @enemy_command_window.show.activate
    @enemy_command_window.select(0)
  end
  #--------------------------------------------------------------------------
  # ● 魔物図鑑のキャンセル
  #--------------------------------------------------------------------------
  def on_enemy_cancel
    @enemy_command_window.hide
    @main_command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 魔物：回想イベント
  #--------------------------------------------------------------------------
  def on_memory_event
    $game_temp.lib_enemy_index = @main_command_window.index
    if NWConst::Library::MEMORY_BG_IMAGE.key?(@enemy_command_window.enemy.id)
      $game_novel.bg_data = NWConst::Library::MEMORY_BG_IMAGE[@enemy_command_window.enemy.id]
    else
      $game_novel.bg_data = {:pic => NWConst::Library::DEFAULT_MEMORY_BG_IMAGE}
    end
    $game_novel.setup(@enemy_command_window.enemy.lose_event_id)
    SceneManager.call(Scene_Novel)
  end
  #--------------------------------------------------------------------------
  # ● 魔物：ＣＧ閲覧
  #--------------------------------------------------------------------------
  def on_cg_view
    $game_temp.lib_enemy_index = @main_command_window.index
    if NWConst::Library::MEMORY_BG_IMAGE.key?(@enemy_command_window.enemy.id)
      $game_novel.bg_data = NWConst::Library::MEMORY_BG_IMAGE[@enemy_command_window.enemy.id]
    else
      $game_novel.bg_data = {:pic => NWConst::Library::DEFAULT_MEMORY_BG_IMAGE}
    end
    SceneManager.call(Scene_CGViewer)
    SceneManager.scene.prepare(@enemy_command_window.enemy.id)    
  end
  #--------------------------------------------------------------------------
  # ● キャラ図鑑の決定
  #--------------------------------------------------------------------------
  def on_actor_ok
    @enemy_command_window.enemy_id = @main_contents_window.id + 10000
    @enemy_command_window.refresh
    @enemy_command_window.show.activate
    @enemy_command_window.select(0)
  end
  #--------------------------------------------------------------------------
  # ● キャラ：ＣＧ閲覧
  #--------------------------------------------------------------------------
  def on_actor_cg_view
    $game_temp.lib_enemy_index = @main_command_window.index + 10000
    if NWConst::Library::ACTOR_MEMORY_BG_IMAGE.key?(@enemy_command_window.actor.id)
      $game_novel.bg_data = NWConst::Library::ACTOR_MEMORY_BG_IMAGE[@enemy_command_window.actor.id]
    else
      $game_novel.bg_data = {:pic => NWConst::Library::ACTOR_DEFAULT_MEMORY_BG_IMAGE}
    end
    SceneManager.call(Scene_ActorCGViewer)
    SceneManager.scene.prepare(@enemy_command_window.actor.id)    
  end
end

