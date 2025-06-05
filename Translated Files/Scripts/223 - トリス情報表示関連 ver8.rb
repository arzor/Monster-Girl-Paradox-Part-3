
=begin

もんむす・くえすと！ＲＰＧ
　トリス情報表示関連  ver8  2017/05/16

2017/10/21 表示方法調整


機能一覧　説明は下　このverで新規追加したものは●　変更したものは○
・各画面に装備情報を追加　装備選択中に4ボタンで切り替え
・ステータスの「基本情報」に職業と種族の情報を追加
・ステータスの「基本情報」に好感度の項目を追加
・城のパーティ編成画面のミニステータスに好感度を追加
・ステータス画面で78ボタンのアクター切り替えで、下ウィンドウのカーソル位置を保持
・ステータス画面で78ボタンのアクター切り替えを、下ウィンドウ選択中でも可能に
・装備画面で78ボタンのアクター切り替えを、スロット選択中でも可能に
・装備画面でスロット選択中に1ボタンでそのスロットの装備を外す
・ハーピーの羽などのワープ先選択ウィンドウを上下端でループ
・戦闘中のパーティコマンドとアクターコマンドを上下端でループ
●トリス 統合V～W V


機能　説明
・各画面に装備情報を追加　装備選択中に4ボタンで切り替え
　図鑑、アイテム、装備、ステータス、ショップ売却
　4ボタンを押すたびに「装備比較情報→基礎性能と特殊効果(→ページ切り替え)→消去」
　「基礎性能と特殊効果」は
　・情報が１つもない場合は、代わりに1ページだけ「効果　なし」と表示する
　・それ以外の場合は、ショップの右ウィンドウの装備情報と同じ情報を表示する

=end

#==============================================================================
# ■ Scene_Shop
#==============================================================================
class Scene_Shop < Scene_MenuBase
  include EquipInfoScene
  #--------------------------------------------------------------------------
  # ● 性能差比較ウィンドウを非表示にするか
  #--------------------------------------------------------------------------
  def equip_info_hide?
    return true if super
    !@sell_window.active && !@select_actor_window.active && !@buy_window.active && !@number_window.active
  end
  #--------------------------------------------------------------------------
  # ● 性能差比較アイテム
  #--------------------------------------------------------------------------
  def equip_info_select_item
    return @sell_window.item if @sell_window.active

    @buy_window.item
  end

  def __equip_info_windows
    return super if @sell_window.active

    [@compare_ex_window]
  end
end
#==============================================================================
# ■ Scene_Library
#==============================================================================
class Scene_Library < Scene_MenuBase
  include EquipInfoScene
  #--------------------------------------------------------------------------
  # ● 性能差比較ウィンドウを非表示にするか
  #--------------------------------------------------------------------------
  def equip_info_hide?
    return true if super
    return true if @main_command_window.active == false
    return true if ![3, 4, 5].include?(@main_command_window.category)
    return false
  end
  #--------------------------------------------------------------------------
  # ● 性能差比較アイテム
  #--------------------------------------------------------------------------
  def equip_info_select_item
    ext = @main_command_window.current_ext[1] % 10000
    case @main_command_window.category
    when 3
      $data_weapons[ext]
    when 4, 5
      $data_armors[ext]
    end
  end
  #--------------------------------------------------------------------------
  # ● 性能差比較アイテム名の文字色を明るくするか
  #--------------------------------------------------------------------------
  def equip_info_enable
    ext = @main_command_window.current_ext[1] % 10000
    case @main_command_window.category
    when 3
      $data_library.weapon_had?(ext)
    when 4
      $data_library.armor_had?(ext)
    when 5
      $data_library.accessory_had?(ext)
    end
  end
end
#==============================================================================
# ■ Scene_Synthesize
#==============================================================================
class Scene_Synthesize < Scene_MenuBase
  include EquipInfoScene
  def __equip_info_windows
    [@compare_ex_window]
  end
  #--------------------------------------------------------------------------
  # ● 性能差比較アイテム
  #--------------------------------------------------------------------------
  def equip_info_select_item
    @lineup_window.item
  end

  def equip_info_hide?
    super || !@lineup_window.visible
  end
end
#==============================================================================
# ■ Scene_CasinoPrize
#==============================================================================
class Scene_CasinoPrize < Scene_MenuBase
  include EquipInfoScene
  def __equip_info_windows
    [@compare_ex_window]
  end
  #--------------------------------------------------------------------------
  # ● 性能差比較アイテム
  #--------------------------------------------------------------------------
  def equip_info_select_item
    @lineup_window.item
  end
end



#==============================================================================
# ■ Window_Library_MainCommand
#==============================================================================
class Window_Library_MainCommand < Window_Command
  #--------------------------------------------------------------------------
  # ● ヘルプウィンドウの更新【オーバーライド】
  #--------------------------------------------------------------------------
  def update_help
    ct = current_ext[1] / 10000
    id = current_ext[1] % 10000
    
    str  = Help.library[:btn_column]
    str += "　" + Help.library[:btn_page] if (id != 0) && (2..6).include?(ct)
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
end


#==============================================================================
# ■ NWConst::Status
#==============================================================================
module NWConst::Status
  # 項目名
  BASIC_COMMAND         = ["Stats", "Adv. Stats", "Damage Mult.", "State Chance",
                           "Job", "Race", "Affection"]
end

#==============================================================================
# ■ Foo::JobChange::Window_ClassStatusEx
#==============================================================================
class Foo::JobChange::Window_ClassStatusEx < Foo::JobChange::Window_ClassStatus
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super
    #self.back_opacity  = 224
    self.y = 0
    self.height = Graphics.height
    self.z = 1000
  end
end
#==============================================================================
# ■ Foo::Status::Window_MainStatus
#==============================================================================
class Foo::Status::Window_MainStatus < Window_Selectable
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_writer   :now_class_window
  attr_reader   :now_class_state
  #--------------------------------------------------------------------------
  # ● リフレッシュ【オーバーライド】
  #--------------------------------------------------------------------------
  def refresh
    now_class_tribe_hide
    super
    draw_headword
    return unless @actor
    x = index == -1 ? 0 : 160
    y = line_height
    refresh_symbol = []
    refresh_symbol[0] = [:basic_param_refresh, :special_param_refresh,
                         :element_resist_refresh, :state_resist_refresh,
                         :now_class_refresh, :now_tribe_refresh, :friend_refresh]
    refresh_symbol[1] = [:equips_refresh] * data[1].size
    refresh_symbol[2] = [:class_history_refresh, :class_history_refresh]
    refresh_symbol[3] = [:fix_ability_refresh]
    method(refresh_symbol[root_index][index]).call(x, y)
  end
  #--------------------------------------------------------------------------
  # ● 職業種族を隠す
  #--------------------------------------------------------------------------
  def now_class_tribe_hide
    return unless @now_class_window
    @now_class_state = 0
    @now_class_window.actor_id = -1
    @now_class_window.class_id = -1
  end
  #--------------------------------------------------------------------------
  # ● 職業の表示
  #--------------------------------------------------------------------------
  def now_class_refresh(x, y)
    return unless @now_class_window
    @now_class_state = 1
    @now_class_window.actor_id = @actor.id
    @now_class_window.class_id = @actor.class_id
    @now_class_window.refresh
  end
  #--------------------------------------------------------------------------
  # ● 種族の表示
  #--------------------------------------------------------------------------
  def now_tribe_refresh(x, y)
    return unless @now_class_window
    @now_class_state = 2
    @now_class_window.actor_id = @actor.id
    @now_class_window.class_id = @actor.tribe_id
    @now_class_window.refresh
  end
  #--------------------------------------------------------------------------
  # ● 好感度の描画
  #--------------------------------------------------------------------------
  def friend_refresh(x, y)
    rect = Rect.new(x, y, 220, line_height)
    text = @actor.luca? ? "-----" : "#{@actor.love}"
    draw_text(rect, "Affection: #{text}")
  end
end
module WindowSelect_Loop
  #--------------------------------------------------------------------------
  # ● カーソルを右に移動
  #--------------------------------------------------------------------------
  def cursor_right(wrap = false)
    if index < item_max - 1 || wrap
      select((index + 1) % item_max)
    end
  end
  #--------------------------------------------------------------------------
  # ● カーソルを左に移動
  #--------------------------------------------------------------------------
  def cursor_left(wrap = false)
    if index > 0 || wrap
      select((index - 1 + item_max) % item_max)
    end
  end
  #--------------------------------------------------------------------------
  # ● カーソルを下に移動
  #--------------------------------------------------------------------------
  def cursor_down(wrap = false)
    if !cursor_down_over?
      select((index + col_max) % item_max)
    elsif wrap || [index % 2, (item_max - 1) % 2] == [1, 0]
      case [index % 2, (item_max - 1) % 2]
      when [0, 0] then select(index % 2)
      when [0, 1] then select(index % 2)
      when [1, 0] then select(index + 1)
      when [1, 1] then select(index % 2)
      end
    end
  end

  def cursor_down_over?
    index + col_max > item_max - 1
  end

  def cursor_up_over?
    index < col_max
  end

  def cursor_right_over?
    index == item_max - 1 || (index + 1) % col_max == 0 
  end

  def cursor_left_over?
    index % col_max == 0
  end
  #--------------------------------------------------------------------------
  # ● カーソルを上に移動
  #--------------------------------------------------------------------------
  def cursor_up(wrap = false)
    if !cursor_up_over?
      select((index - col_max + item_max) % item_max)
    elsif wrap
      case [index % 2, (item_max - 1) % 2]
      when [0, 0] then select(item_max - 1)
      when [0, 1] then select(item_max - 2)
      when [1, 0] then select(item_max - 1)
      when [1, 1] then select(item_max - 1)
      end
    end
  end
end
#==============================================================================
# ■ Foo::Warp::Window_SelectPlace
#==============================================================================
class Foo::Warp::Window_SelectPlace < Window_Command
  include WindowSelect_Loop
end
#==============================================================================
# ■ Window_ActorCommand
#==============================================================================
class Window_ActorCommand < Window_Command
  include WindowSelect_Loop
end
#==============================================================================
# ■ Window_PartyCommand
#==============================================================================
class Window_PartyCommand < Window_Command
  include WindowSelect_Loop
end

class Window_StoneList
  include WindowSelect_Loop
end