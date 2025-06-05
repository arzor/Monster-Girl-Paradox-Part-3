=begin
=改造/ステータス画面 by Foo




==更新履歴
  Date     Version Author Comment


=end

#==============================================================================
# ■ NWConst::Status
#==============================================================================
module NWConst::Status
  # 項目名
  ROOT_COMMAND          = ["Basic Info","Equipment","Jobs and Races","Trait"]
  BASIC_COMMAND         = ["Stats", "Adv. Stats", "Resists", "Status Resists"]
  CLASS_HISTORY_COMMAND = ["Jobs", "Races"]
  # 基本能力
  BASIC_PARAM_VOCAB     = [
    "Max HP", "Max MP", "Attack", "Defense", "Magic", "Willpower", "Agility", "Dexterity",
    "Hit Rate", "Critical Rate","Magic Critical Rate","Critical Damage","Evasion Rate", "Magic Evasion Rate","Auto-Hit Evasion Rate", "Counter Rate", "Magic Counter Rate","Auto-Hit Counter Rate"
  ]
  # 特殊能力
  SPECIAL_PARAM_VOCAB   = [
    "HP Recovery Rate", "MP Recovery Rate", "SP Recovery Rate", "SP Charge Rate", "MP Consumption", "SP Consumption",
    "Recovery Effectiveness", "Item Effectiveness", "Steal Success Rate", "Physical Reflect", "Magic Reflect", "Auto-Hit Reflect",
    "XP Rate", "Job XP Rate", "Gold Bonus", "Item Drop Rate" ,"Encounter Rate"
  ]
  # 属性対応アイコンID
  ELEMENT_ICONS         = [244,188,144,145,146,149,148,147,150,151,51,176]
  ADD_ELEMENT_ICONS     = [244,245,188,3671,144,185,145,165,146,166,149,168,148,167,147,169,150,303,151,274,51,176,3610]

  # 表示用属性耐性
  ELEMENT_RESIST        = [1,2,3,4,5,6,7,8,9,10,36,35]
  ADD_ELEMENT_RESIST = [1,51,2,52,3,43,4,44,5,45,6,46,7,47,8,48,9,49,10,50,36,35,41]

  # 表示用状態異常耐性
  STATE_RESIST          = [230,231,232,28,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]
  # １頁あたり職業種族履歴の最大表示数
  HISTORY_MAX           = 24
  # １頁あたり装備品エンチャントの最大表示数
  EQUIP_ENCHANT_MAX     = 18
end

# 重複防止用ネームスペース
module Foo; module Status; end; end

#==============================================================================
# ■ Foo::Status::Window_RootCommand
#==============================================================================
class Foo::Status::Window_RootCommand < Window_Command
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化【オーバーライド】
  #--------------------------------------------------------------------------
  def initialize(main_status)
    @main_status = main_status
    super(0, 0)
  end  
  #--------------------------------------------------------------------------
  # ● ウィンドウ高さの取得【オーバーライド】
  #--------------------------------------------------------------------------
  def window_height
    fitting_height(4)
  end
  #--------------------------------------------------------------------------
  # ● 項目の選択【オーバーライド】
  #--------------------------------------------------------------------------
  def select(index)
    super
    @main_status.root_index = self.index
  end  
  #--------------------------------------------------------------------------
  # ● コマンドリストの作成【オーバーライド】
  #--------------------------------------------------------------------------
  def make_command_list
    NWConst::Status::ROOT_COMMAND.each{|name| add_command(name, :ok)}
  end
  #--------------------------------------------------------------------------
  # ● 決定ボタンが押されたときの処理【オーバーライド】
  #--------------------------------------------------------------------------
  def process_ok
    return if [3].include?(self.index)
    super
  end
end

#==============================================================================
# ■ Foo::Status::Window_SimpleStatus
#==============================================================================
class Foo::Status::Window_SimpleStatus < Window_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化【オーバーライド】
  #--------------------------------------------------------------------------
  def initialize
    super(160, 0, 480, fitting_height(4))
  end
  #--------------------------------------------------------------------------
  # ● アクターの設定
  #--------------------------------------------------------------------------
  def actor=(actor)
    return if @actor == actor
    @actor = actor
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    draw_actor_face(@actor, 0, 0)
    draw_actor_simple_status(@actor, 100, 0, true)
  end
end

#==============================================================================
# ■ Foo::Status::Window_MainStatus
#==============================================================================
class Foo::Status::Window_MainStatus < Window_Selectable
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor   :root_index
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化【オーバーライド】
  #--------------------------------------------------------------------------
  def initialize
    super(0, fitting_height(4), 640, 480 - fitting_height(4))
    self.root_index = 0
    @branch_index = 0
  end 
  #--------------------------------------------------------------------------
  # ● アクターの設定
  #--------------------------------------------------------------------------
  def actor=(actor)
    return if @actor == actor
    @actor = actor
    @branch_index = 0
  end
  #--------------------------------------------------------------------------
  # ● ルートインデックスの設定
  #--------------------------------------------------------------------------
  def root_index=(index)
    @root_index = index
    0 < item_max ? select(0) : unselect
  end
  #--------------------------------------------------------------------------
  # ● カーソル位置の設定【オーバーライド】
  #--------------------------------------------------------------------------
  def index=(index)
    super
    @branch_index = 0
    refresh
  end  
  #--------------------------------------------------------------------------
  # ● 選択コマンドの取得
  #--------------------------------------------------------------------------
  def data
    [
      NWConst::Status::BASIC_COMMAND,
#~       (1..5).collect{|i| "装備品#{i}"},
      @actor ? @actor.basic_equip_slots.map{|i| "#{Vocab.etype(i)} Info"} : [],
      NWConst::Status::CLASS_HISTORY_COMMAND,
      [],
    ]
  end
  #--------------------------------------------------------------------------
  # ● 項目の幅を取得【オーバーライド】
  #--------------------------------------------------------------------------
  def item_width
    160 - standard_padding * 2
  end
  #--------------------------------------------------------------------------
  # ● 項目数の取得【オーバーライド】
  #--------------------------------------------------------------------------
  def item_max
    root_index ? data[root_index].size : 0
  end
  #--------------------------------------------------------------------------
  # ● 項目を描画する矩形の取得【オーバーライド】
  #--------------------------------------------------------------------------
  def item_rect(index)
    rect = Rect.new
    rect.width = item_width
    rect.height = item_height
    rect.x = 0
    rect.y = index * item_height + 26
    rect
  end
  #--------------------------------------------------------------------------
  # ● カーソルを右に移動【オーバーライド】
  #--------------------------------------------------------------------------
  def cursor_right(wrap = false)
    return unless [1, 2].include?(root_index)
    @branch_index += 1
    @branch_index %= branch_page_max
    refresh
  end
  #--------------------------------------------------------------------------
  # ● カーソルを左に移動【オーバーライド】
  #--------------------------------------------------------------------------
  def cursor_left(wrap = false)
    return unless [1, 2].include?(root_index)
    @branch_index += branch_page_max - 1
    @branch_index %= branch_page_max    
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 履歴表示用クラスID配列の取得
  #--------------------------------------------------------------------------
  def history_all_id
    return [] unless root_index == 2
    symbols = [:job?, :tribe?]
    all_id = @actor.level_list.keys.select{|id| $data_classes[id].method(symbols[index]).call}
    return all_id.sort{|a, b| [$data_classes[a].class_lank, a] <=> [$data_classes[b].class_lank, b]}
  end
  #--------------------------------------------------------------------------
  # ● 装備品エンチャント名配列の取得
  #--------------------------------------------------------------------------
  def equip_enchant_names
    return [] unless root_index == 1
    return [] unless @actor.equips[index]
    equip = @actor.equips[index]
    dummy_names = [""] * (equip_enchant_column - equip.param_names.size)
    return equip.param_names + dummy_names + equip.enchant_names
  end
  #--------------------------------------------------------------------------
  # ● 小項目表示最大頁数の取得
  #--------------------------------------------------------------------------
  def branch_page_max
    return equip_enchant_page_max if root_index == 1
    return history_page_max if root_index == 2
    return 1
  end
  #--------------------------------------------------------------------------
  # ● 履歴表示用最大頁数の取得
  #--------------------------------------------------------------------------
  def history_page_max
    return ([history_all_id.size - 1, 0].max / NWConst::Status::HISTORY_MAX) + 1
  end
  #--------------------------------------------------------------------------
  # ● 装備品エンチャント用最大頁数の取得
  #--------------------------------------------------------------------------
  def equip_enchant_page_max
    return ([equip_enchant_names.size - 1, 0].max / NWConst::Status::EQUIP_ENCHANT_MAX) + 1
  end
  #--------------------------------------------------------------------------
  # ● 装備品エンチャント用表示列の取得
  #--------------------------------------------------------------------------
  def equip_enchant_column
    return NWConst::Status::EQUIP_ENCHANT_MAX / 2
  end  
  #--------------------------------------------------------------------------
  # ● 項目の描画【オーバーライド】
  #--------------------------------------------------------------------------
  def draw_item(index)
    change_color(normal_color)
    draw_text(item_rect_for_text(index), data[root_index][index], 0)
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ【オーバーライド】
  #--------------------------------------------------------------------------
  def refresh
    super
    draw_headword
    return unless @actor
    x = index == -1 ? 0 : 160
    y = line_height
    refresh_symbol = []
    refresh_symbol[0] = [:basic_param_refresh, :special_param_refresh, :element_resist_refresh, :state_resist_refresh]
    refresh_symbol[1] = [:equips_refresh] * data[1].size
    refresh_symbol[2] = [:class_history_refresh, :class_history_refresh]
    refresh_symbol[3] = [:fix_ability_refresh]
    method(refresh_symbol[root_index][index]).call(x, y)
  end  
  #--------------------------------------------------------------------------
  # ● 見出しの描画
  #--------------------------------------------------------------------------
  def draw_headword
    contents.gradient_fill_rect(0, line_height - 8, contents.width, 6, text_color(23), text_color(17))
    change_color(normal_color)
    rect = Rect.new(0, 0, 160, line_height)
    draw_text(rect, NWConst::Status::ROOT_COMMAND[root_index], 0)
  end
  #--------------------------------------------------------------------------
  # ● 装備構成の描画
  #--------------------------------------------------------------------------
  def equips_refresh(x, y)
    return unless @actor.equips[index]
    equip = @actor.equips[index]
    #
    draw_item_name(equip, x, y, true, 468)
    draw_equip_enchants(x, y + line_height + 4)
    #
    draw_horz_line(264)
    change_color(normal_color)
    draw_text_ex(4, 288, equip.description)
  end
  #--------------------------------------------------------------------------
  # ● 装備品付加効果の描画
  #--------------------------------------------------------------------------
  def draw_equip_enchants(x, y)
    rect = Rect.new(0, 0, 234, line_height)
    change_color(normal_color)
    equip_enchant_names[
      @branch_index * NWConst::Status::EQUIP_ENCHANT_MAX,
      NWConst::Status::EQUIP_ENCHANT_MAX
    ].each_with_index{|name, i|
      rect.x = x + (i / equip_enchant_column * rect.width)
      rect.y = y + (i % equip_enchant_column * rect.height)
      draw_text_plus(rect, name)
    }
  end   
  #--------------------------------------------------------------------------
  # ● 水平線の描画
  #--------------------------------------------------------------------------
  def draw_horz_line(y)
    line_y = y + line_height / 2 - 1
    contents.fill_rect(0, line_y, contents_width, 2, line_color)
  end
  #--------------------------------------------------------------------------
  # ● 水平線の色を取得
  #--------------------------------------------------------------------------
  def line_color
    color = normal_color
    color.alpha = 48
    color
  end
  #--------------------------------------------------------------------------
  # ● 基本能力の描画
  #--------------------------------------------------------------------------
  def basic_param_refresh(x, y)
    param_symbols = [:mhp, :mmp, :atk, :def, :mat, :mdf, :agi, :luk,
                     :hit, :cri,:magical_critical,:booster_critical, :eva, :mev,:certain_evasion, :cnt, :magical_counter,:certain_counter]
    rect = Rect.new(0, 0, 220, line_height)
    param_symbols.each_with_index do |sym, i|
      change_color(system_color)
      rect.x = x + (235 * (i % 2))
      rect.y = y + (line_height * (i / 2))
      draw_text(rect, NWConst::Status::BASIC_PARAM_VOCAB[i], 0)
      change_color(normal_color)
      param = @actor.method(sym).call
      if i > 7
        param = "#{Integer(param * 100)}%"
      else
        param = param.give_unit_floor(12) if param >= 10_000_000
      end
      draw_text(rect, param, 2)
    end
  end
  #--------------------------------------------------------------------------
  # ● 特殊能力の描画
  #--------------------------------------------------------------------------
  def special_param_refresh(x, y)
    param_symbols = [
      :hrg, :mrg, :trg, :tcr, :mcr, :tp_cost_rate,
      :rec, :pha, :steal_success, :physical_reflection_rate, :mrf, :certain_reflection_rate,
      :exr, :cexr, :get_gold_rate, :get_item_rate, :encounter_rate_value
    ]
    rect = Rect.new(0, 0, 220, line_height)
    param_symbols.each_with_index do |sym, i|
      change_color(system_color)
      rect.x = x + (235 * (i % 2))
      rect.y = y + (line_height * (i / 2))
      draw_text(rect, NWConst::Status::SPECIAL_PARAM_VOCAB[i], 0)
      change_color(normal_color)
      param = @actor.method(sym).call
      param = "#{Integer(param * 100)}%"
      draw_text(rect, param, 2)
    end
  end
  #--------------------------------------------------------------------------
  # ● 属性耐性の描画
  #--------------------------------------------------------------------------
  def element_resist_refresh(x, y)
    rect = Rect.new(0, 0, 196, line_height)
    elements = $game_switches[NWConst::Sw::ADD_ELEMENT_RESIST] ? NWConst::Status::ADD_ELEMENT_RESIST : NWConst::Status::ELEMENT_RESIST
    icons = $game_switches[NWConst::Sw::ADD_ELEMENT_RESIST] ? NWConst::Status::ADD_ELEMENT_ICONS : NWConst::Status::ELEMENT_ICONS
    elements.each_with_index do |element_id, i|
      rect.x = x + 24 + (235 * (i % 2))
      rect.y = y + (line_height * (i / 2))
      draw_icon(icons[i], rect.x-24, rect.y)
      change_color(system_color)
      draw_text(rect, $data_system.elements[element_id])
      resist = Integer(@actor.element_rate(element_id) * 100)
      if @actor.element_reflection(element_id)
        color = good_color
        text = "REFLECT"
      elsif @actor.element_drain?(element_id)
        color = crisis_color
        text = "ABSORB"
      else
        color = [good_color, normal_color, bad_color][(resist <=> 100) + 1]
        color = special_color if resist == 0
        text = resist == 0 ? "NULL" : "#{resist}%"
      end
      change_color(color)
      draw_text(rect, text, 2)
    end
  end
  #--------------------------------------------------------------------------
  # ● 状態異常耐性の描画
  #--------------------------------------------------------------------------
  def state_resist_refresh(x, y)
    rect = Rect.new(0, 0, 196, line_height)
    NWConst::Status::STATE_RESIST.each_with_index{|state_id, i|
      state = $data_states[state_id]
      rect.x = x + 24 + (235 * (i % 2))
      rect.y = y + (line_height * (i / 2))
      draw_icon(state.icon_index, rect.x-24, rect.y)
      change_color(system_color)
      draw_text(rect, state.name)      
      resist = Integer(@actor.state_rate(state_id) * 100)
      color = [good_color, normal_color, bad_color][(resist <=> 100) + 1]
      color = special_color if resist == 0
      text = resist == 0 ? "NULL" : "#{resist}%"
      change_color(color)
      draw_text(rect, text, 2)
    }    
  end
  #--------------------------------------------------------------------------
  # ● 職業/種族一覧の表示
  #--------------------------------------------------------------------------
  def class_history_refresh(x, y)
    rect = Rect.new(0, 0, 220, line_height)    
    min = @branch_index * NWConst::Status::HISTORY_MAX
    max = min + NWConst::Status::HISTORY_MAX
    range = history_all_id[min...max]
    history_all_id[min...max].each_with_index{|id, i|
      change_color(normal_color)
      rect.x = x + (235 * (i % 2))
      rect.y = y + (line_height * (i / 2))
      lr = Rect.new(rect.x, rect.y, rect.width * 0.8, line_height)
      rr = Rect.new(lr.x + lr.width, rect.y, rect.width * 0.2, line_height)
      draw_text(lr, $data_classes[id].name, 0)
      draw_actor_class_level(@actor, rr.x, rr.y, id, normal_color)
    }
    change_color(normal_color)
    rect = Rect.new(0, contents.height - line_height, contents.width, line_height)
    text = "#{@branch_index + 1} / #{history_page_max}"
    
    draw_text(rect, text, 1)
  end
  #--------------------------------------------------------------------------
  # ● 固有アビリティの表示
  #--------------------------------------------------------------------------
  def fix_ability_refresh(x, y)
    return unless NWConst::Library::ACTOR_FIX_ABILITY.key?(@actor.id)

    fa = NWConst::Library::ACTOR_FIX_ABILITY[@actor.id]
    change_color(special_color)
    draw_text(x,y,contents_width, line_height,fa[0] )
    draw_text_ex(x, y + line_height, fa[1..-1].join("\n"), contents_width)
  end
end







