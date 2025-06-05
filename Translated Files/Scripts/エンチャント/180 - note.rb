# 特徴計算式クラス
class Enchant_Value
  attr_reader :type
  attr_reader :variance_id
  attr_reader :calc_id

  def initialize(type, id)
    @type = type
    sid = id.split("-")
    @calc_id = sid[0].to_i
    @variance_id = sid.size >= 2 ? sid[1].to_i : 0
  end

  def calculation(r = 0, v = 0)
    r *= v
    data = NWConst::Enchantment::FEATURE_CALCULATION[calc_id]
    result = eval(data[:value])
    result = [result, data[:max_value]].min if data.key?(:max_value)
    result = [result, data[:min_value]].max if data.key?(:min_value)
    type == :rate ? result.to_f * 0.01 : result.to_i
  end
end

#==============================================================================
# ■ RPG::BaseItem
#==============================================================================
class RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● メモ欄解析処理
  #--------------------------------------------------------------------------
  def nw_line_analyze(line)
    case line
    when NWRegexp::BaseItem::FEATURE_XPARAM_EX
      data_id = NWRegexp::FEATURE_XPARAM_EX_ARRAY.index(Regexp.last_match(1))
      add_feature(FEATURE_XPARAM, data_id, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::XPARAM_FIX
      data_id = NWRegexp::FEATURE_XPARAM_EX_ARRAY.index(Regexp.last_match(1))
      add_feature(FEATURE_XPARAM_FIX, data_id, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::PARTY_ABILITY
      kind_id = NWRegexp::PARTY_ABILITY_ARRAY.index(Regexp.last_match(1))
      add_feature(FEATURE_PARTY_EX_ABILITY, kind_id, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::SLOT_CHANCE
      add_feature(FEATURE_PARTY_EX_ABILITY, SLOT_CHANCE, get_value(Regexp.last_match(1), :int))
    when NWRegexp::BaseItem::UNLOCK_LEVEL
      add_feature(FEATURE_PARTY_EX_ABILITY, UNLOCK_LEVEL, get_value(Regexp.last_match(1), :int))
    when NWRegexp::BaseItem::STEAL_SUCCESS
      add_feature(FEATURE_BATTLER_ABILITY, STEAL_SUCCESS, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::GET_EXP_RATE
      add_feature(FEATURE_BATTLER_ABILITY, GET_EXP_RATE, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::GET_CLASSEXP_RATE
      add_feature(FEATURE_BATTLER_ABILITY, GET_CLASSEXP_RATE, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::AUTO_STAND
      add_feature(FEATURE_BATTLER_ABILITY, AUTO_STAND, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::HEEL_REVERSE
      add_feature(FEATURE_BATTLER_ABILITY, HEEL_REVERSE, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::AUTO_STATE
      array = []
      Regexp.last_match(1).split(/,\s?/).each { |id| array.push(get_value(id, :int)) }
      add_feature(FEATURE_BATTLER_ABILITY, AUTO_STATE, array)
    when NWRegexp::BaseItem::AUTO_STATE_WITH_SWITCH
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        i = a.to_i
        hash[i] ||= []
        hash[i].push(b.to_i)
      end
      add_feature(FEATURE_BATTLER_ABILITY, AUTO_STATE_WITH_SWITCH, hash)
    when NWRegexp::BaseItem::TRIGGER_STATE
      hash = { :point => Regexp.last_match(1).to_sym, :trigger => Regexp.last_match(2).to_i,
               :per => get_value(Regexp.last_match(3), :rate), :state_id => Regexp.last_match(4).to_i }
      add_feature(FEATURE_BATTLER_ABILITY, TRIGGER_STATE, hash)
    when NWRegexp::BaseItem::METAL_BODY
      v = if Regexp.last_match(2).empty?
            get_value(Regexp.last_match(1), :int)
          else
            get_value(Regexp.last_match(1), :rate)
          end
      add_feature(FEATURE_BATTLER_ABILITY, METAL_BODY, v)
    when NWRegexp::BaseItem::DEFENSE_WALL
      add_feature(FEATURE_BATTLER_ABILITY, DEFENSE_WALL, get_value(Regexp.last_match(1), :int))
    when NWRegexp::BaseItem::INVALIDATE_WALL
      v = if Regexp.last_match(2).empty?
            get_value(Regexp.last_match(1), :int)
          else
            get_value(Regexp.last_match(1), :rate)
          end
      add_feature(FEATURE_BATTLER_ABILITY, INVALIDATE_WALL, v)
    when NWRegexp::BaseItem::DAMAGE_MP_CONVERT
      add_feature(FEATURE_BATTLER_ABILITY, DAMAGE_MP_CONVERT, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::DAMAGE_GOLD_CONVERT
      add_feature(FEATURE_BATTLER_ABILITY, DAMAGE_GOLD_CONVERT, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::DAMAGE_MP_DRAIN
      add_feature(FEATURE_BATTLER_ABILITY, DAMAGE_MP_DRAIN, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::DAMAGE_GOLD_DRAIN
      add_feature(FEATURE_BATTLER_ABILITY, DAMAGE_GOLD_DRAIN, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::DEAD_SKILL
      add_feature(FEATURE_BATTLER_ABILITY, DEAD_SKILL, get_value(Regexp.last_match(1), :int))
    when NWRegexp::BaseItem::BATTLE_START_SKILL
      result = { :id => Regexp.last_match(2).to_i, :per => get_value(Regexp.last_match(3), :rate) }
      result[:priority] = Regexp.last_match(1).to_i if Regexp.last_match(1)
      result[:priority] ||= 99
      add_feature(FEATURE_BATTLER_ABILITY, BATTLE_START_SKILL, result)
    when NWRegexp::BaseItem::AUTO_SKILL_TURN
      data_id = [TURN_START_SKILL, TURN_END_SKILL].at(["開始", "終了"].index(Regexp.last_match(1)))
      result = {
        :id => Regexp.last_match(3).to_i,
        :per => get_value(Regexp.last_match(4), :rate)
      }
      result[:priority] = Regexp.last_match(2).to_i if Regexp.last_match(2)
      result[:priority] ||= 99
      if Regexp.last_match(5)
        result[:condition_type] = Regexp.last_match(5).to_i
        result[:condition_ids] = Regexp.last_match(6).split(",").map(&:to_i)
      end
      add_feature(FEATURE_BATTLER_ABILITY, data_id, result)
    when NWRegexp::BaseItem::CHANGE_ACTION
      array = []
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        array.push(:id => a.to_i, :per => get_value(b, :rate))
      end
      add_feature(FEATURE_BATTLER_ABILITY, CHANGE_ACTION, array)
    when NWRegexp::BaseItem::STYPE_COST_RATE
      value = {
        :type => Regexp.last_match(1).to_sym,
        :id => Regexp.last_match(2).to_i,
        :rate => get_value(Regexp.last_match(3), :rate)
      }
      add_feature(FEATURE_BATTLER_ABILITY, STYPE_COST_RATE, value)
    when NWRegexp::BaseItem::SKILL_COST_RATE
      value = {
        :type => Regexp.last_match(1).to_sym,
        :id => Regexp.last_match(2).to_i,
        :rate => get_value(Regexp.last_match(3), :rate)
      }
      add_feature(FEATURE_BATTLER_ABILITY, SKILL_COST_RATE, value)
    when NWRegexp::BaseItem::SCOST_RATE_M
      type = Regexp.last_match(1).to_sym
      data_id = Regexp.last_match(2) == "タイプ" ? STYPE_COST_RATE : SKILL_COST_RATE
      Regexp.last_match(3).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        value = {
          :type => type,
          :id => a.to_i,
          :rate => get_value(b, :rate)
        }
        add_feature(FEATURE_BATTLER_ABILITY, data_id, value)
      end
    when NWRegexp::BaseItem::TP_COST_RATE
      add_feature(FEATURE_BATTLER_ABILITY, TP_COST_RATE, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::HP_COST_RATE
      add_feature(FEATURE_BATTLER_ABILITY, HP_COST_RATE, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::GOLD_COST_RATE
      add_feature(FEATURE_BATTLER_ABILITY, GOLD_COST_RATE, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::INCREASE_TP
      value = {
        :plus => Regexp.last_match(1).to_s == "増加",
        :num => get_value(Regexp.last_match(2), :int),
        :per => !Regexp.last_match(3).empty? ? true : false
      }
      add_feature(FEATURE_BATTLER_ABILITY, INCREASE_TP, value)
    when NWRegexp::BaseItem::START_TP_RATE
      add_feature(FEATURE_BATTLER_ABILITY, START_TP_RATE, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::BATTLE_END_HEEL_HP
      add_feature(FEATURE_BATTLER_ABILITY, BATTLE_END_HEEL_HP, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::BATTLE_END_HEEL_MP
      add_feature(FEATURE_BATTLER_ABILITY, BATTLE_END_HEEL_MP, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::NORMAL_ATTACK
      add_feature(FEATURE_BATTLER_ABILITY, Battler::NORMAL_ATTACK, get_value(Regexp.last_match(1), :int))
    when NWRegexp::BaseItem::COUNTER_SKILL
      cdata = [MAGICAL_COUNTER_SKILL, CERTAIN_COUNTER_SKILL, COUNTER_SKILL]
      data_id = cdata.at(NWRegexp::COUNTER_ARRAY.index(Regexp.last_match(1)))
      hash = {
        :id => Regexp.last_match(2).to_i,
        :per => get_value(Regexp.last_match(3), :rate)
      }
      add_feature(FEATURE_BATTLER_ABILITY, data_id, hash)
    when NWRegexp::BaseItem::COUNTER_EX_SKILL
      cdata = [MAGICAL_COUNTER_EX_SKILL, CERTAIN_COUNTER_EX_SKILL, COUNTER_EX_SKILL]
      data_id = cdata.at(NWRegexp::COUNTER_ARRAY.index(Regexp.last_match(1)))
      hash = {
        :id => Regexp.last_match(2).to_i,
        :per => get_value(Regexp.last_match(3), :rate)
      }
      add_feature(FEATURE_BATTLER_ABILITY, data_id, hash)
    when NWRegexp::BaseItem::FINAL_INVOKE
      array = []
      Regexp.last_match(1).split(/,\s?/).each { |id| array.push(get_value(id, :int)) }
      add_feature(FEATURE_BATTLER_ABILITY, FINAL_INVOKE, array)
    when NWRegexp::BaseItem::CERTAIN_COUNTER
      add_feature(FEATURE_BATTLER_ABILITY, CERTAIN_COUNTER, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::MAGICAL_COUNTER
      add_feature(FEATURE_BATTLER_ABILITY, MAGICAL_COUNTER, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::CERTAIN_COUNTER_EX
      add_feature(FEATURE_BATTLER_ABILITY, CERTAIN_COUNTER_EX, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::PHYSICAL_COUNTER_EX
      add_feature(FEATURE_BATTLER_ABILITY, PHYSICAL_COUNTER_EX, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::MAGICAL_COUNTER_EX
      add_feature(FEATURE_BATTLER_ABILITY, MAGICAL_COUNTER_EX, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::CONSIDERATE
      add_feature(FEATURE_BATTLER_ABILITY, CONSIDERATE, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::INVOKE_REPEATS_TYPE
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :int) }
      add_feature(FEATURE_BATTLER_ABILITY, INVOKE_REPEATS_TYPE, hash)
    when NWRegexp::BaseItem::INVOKE_REPEATS_SKILL
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :int) }
      add_feature(FEATURE_BATTLER_ABILITY, INVOKE_REPEATS_SKILL, hash)
    when NWRegexp::BaseItem::OWN_CRUSH_RESIST
      add_feature(FEATURE_BATTLER_ABILITY, OWN_CRUSH_RESIST, true)
    when NWRegexp::BaseItem::ELEMENT_DRAIN
      Regexp.last_match(1).split(/,\s?/).each do |id|
        add_feature(FEATURE_ELEMENT_DRAIN, get_value(id, :int), true)
      end
    when NWRegexp::BaseItem::IGNORE_OVER_DRIVE
      add_feature(FEATURE_BATTLER_ABILITY, IGNORE_OVER_DRIVE, true)
    when NWRegexp::BaseItem::INSTANT_DEAD_REVERSE
      add_feature(FEATURE_BATTLER_ABILITY, INSTANT_DEAD_REVERSE, true)
    when NWRegexp::BaseItem::CHANGE_SKILL
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :int) }
      add_feature(FEATURE_BATTLER_ABILITY, CHANGE_SKILL, hash)
    when NWRegexp::BaseItem::ITEM_COST_SCRIMP
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :rate) }
      add_feature(FEATURE_BATTLER_ABILITY, ITEM_COST_SCRIMP, hash)
    when NWRegexp::BaseItem::NEED_ITEM_IGNORE
      array = []
      Regexp.last_match(1).split(/,\s?/).each { |id| array.push(get_value(id, :int)) }
      add_feature(FEATURE_BATTLER_ABILITY, NEED_ITEM_IGNORE, array)
    when NWRegexp::BaseItem::MULTI_BOOSTER
      data_id = NWRegexp::MULTI_BOOSTER_ARRAY.index(Regexp.last_match(1))
      hash = {}
      Regexp.last_match(2).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :rate) }
      add_feature(FEATURE_MULTI_BOOSTER, data_id, hash)
    when NWRegexp::BaseItem::WTYPE_SKILL_BOOST
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(\d+)-(#{NWRegexp::VALUE})/) do |a, b, c|
        hash[[a.to_i, b.to_i]] = get_value(c, :rate)
      end
      add_feature(FEATURE_MULTI_BOOSTER, WTYPE_SKILL, hash)
    when NWRegexp::BaseItem::COUNTER_BOOST
      add_feature(FEATURE_MULTI_BOOSTER, COUNTER, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::FALL_HP_BOOST
      hash = { :per => Regexp.last_match(1).to_f * 0.01, :boost => get_value(Regexp.last_match(2), :rate) }
      add_feature(FEATURE_MULTI_BOOSTER, FALL_HP, hash)
    when NWRegexp::BaseItem::FULL_HP_BOOST
      add_feature(FEATURE_FULL_HP_BOOST, Regexp.last_match(1).to_f * 0.01, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::OVER_SOUL
      add_feature(FEATURE_MULTI_BOOSTER, OVER_SOUL, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::DUMMY_ENCHANT
      add_feature(FEATURE_DUMMY_ENCHANT, nil, Regexp.last_match(1).to_s)
    when NWRegexp::BaseItem::TERRAIN_BOOSTER
      add_feature(FEATURE_TERRAIN_BOOSTER, Regexp.last_match(1).to_sym, Regexp.last_match(2).nil? ? 0.2 : 0.4)
    when NWRegexp::BaseItem::SKILL_CONVERT_PARAM
      @data_ex[:skill_convert_param_data] ||= {}
      @data_ex[:skill_convert_param_data][Regexp.last_match(1).to_i] ||= []
      @data_ex[:skill_convert_param_data][Regexp.last_match(1).to_i].push([Regexp.last_match(2).to_i + 1,
                                                                           Regexp.last_match(3).to_i + 1])
    when NWRegexp::BaseItem::SKILL_CONVERT_PARAM_MULTI
      b = Regexp.last_match(2).to_i + 1
      a = Regexp.last_match(3).to_i + 1
      Regexp.last_match(1).scan(/\d+/).map(&:to_i).each do |i|
        @data_ex[:skill_convert_param_data] ||= {}
        @data_ex[:skill_convert_param_data][i] ||= []
        @data_ex[:skill_convert_param_data][i].push([b, a])
      end
    when NWRegexp::BaseItem::PHYSICAL_REFLECTION
      add_feature(FEATURE_BATTLER_ABILITY, PHYSICAL_REFLECTION, get_value(Regexp.last_match(3), :rate))
    when NWRegexp::BaseItem::SELLD_DRAW
      @data_ex[:selld_draw] = Regexp.last_match(1).to_s
    when NWRegexp::BaseItem::EXCLUDE
      @data_ex[:lib_exclude?] = true
    when NWRegexp::BaseItem::EQUIP_MASTERY
      category = [:武器, :防具].index(Regexp.last_match(1).to_sym)
      Regexp.last_match(2).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_EQUIP_MASTERY, [category, a.to_i], get_value(b, :rate))
      end

    when NWRegexp::BaseItem::FEATURE_PARAM
      data_id = NWRegexp::FEATURE_PARAM_ARRAY.index(Regexp.last_match(1))
      add_feature(FEATURE_PARAM, data_id, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::FEATURE_ELEMENT_RATE
      Regexp.last_match(2).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_ELEMENT_RATE, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::FEATURE_DEBUFF_RATE
      Regexp.last_match(2).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_DEBUFF_RATE, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::FEATURE_STATE_RATE
      Regexp.last_match(2).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_STATE_RATE, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::FEATURE_SPARAM
      data_id = NWRegexp::FEATURE_SPARAM_ARRAY.index(Regexp.last_match(1))
      add_feature(FEATURE_SPARAM, data_id, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::ITEM_COST_SCRIMP_TYPE
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :rate) }
      add_feature(FEATURE_BATTLER_ABILITY, ITEM_COST_SCRIMP_TYPE, hash)
    when NWRegexp::BaseItem::ELEMENT_REFLECTION
      Regexp.last_match(1).split(/,\s?/).each do |id|
        add_feature(FEATURE_BATTLER_ABILITY, ELEMENT_REFLECTION, get_value(id, :int))
      end
    when NWRegexp::BaseItem::REFLECTION_BOOST
      add_feature(FEATURE_MULTI_BOOSTER, REFLECTION, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::CERTAIN_DAMAGE_RATE
      add_feature(FEATURE_BATTLER_ABILITY, CERTAIN_DAMAGE_RATE, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::CRITICAL_BOOST
      add_feature(FEATURE_MULTI_BOOSTER, CRITICAL, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::ACTOR_PARAM_BOOST
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :rate) }
      add_feature(FEATURE_MULTI_BOOSTER, ACTOR_PARAM, hash)
    when NWRegexp::BaseItem::ACTOR_EXIST_PARAM_BOOST
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :rate) }
      add_feature(FEATURE_MULTI_BOOSTER, ACTOR_EXIST_PARAM, hash)
    when NWRegexp::BaseItem::CLASS_BOOST
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :rate) }
      add_feature(FEATURE_MULTI_BOOSTER, CLASS, hash)
    when NWRegexp::BaseItem::STATE_EXTEND
      data = [SELF_STATE, TARGET_STATE]
      id = [:自己, :相手].index(Regexp.last_match(1).to_sym)
      hash = {}
      Regexp.last_match(2).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :int) }
      add_feature(FEATURE_MULTI_BOOSTER, data[id], hash)
    when NWRegexp::BaseItem::STATE_ETERNAL
      data_id = [SELF_STATE_ETERNAL, TARGET_STATE_ETERNAL]
      data_id = data_id[[:自己, :相手].index(Regexp.last_match(1).to_sym)]
      array = []
      Regexp.last_match(2).split(/,\s?/).each { |id| array.push(get_value(id, :int)) }
      add_feature(FEATURE_BATTLER_ABILITY, data_id, array)
    when NWRegexp::BaseItem::HP_REGEN_INVALID
      add_feature(FEATURE_BATTLER_ABILITY, HP_REGEN_INVALID, true)
    when NWRegexp::BaseItem::CANT_MOVE
      add_feature(FEATURE_BATTLER_ABILITY, CANT_MOVE, true)
    when NWRegexp::BaseItem::BATTLE_START_HP
      add_feature(FEATURE_BATTLER_ABILITY, BATTLE_START_HP, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::SKILL_STATE_ADD

      index = [:自己, :""].index(Regexp.last_match(1).to_sym)
      Regexp.last_match(2).scan(/(\d+)-(\d+)-(#{NWRegexp::VALUE})/) do |a, b, c|
        hash = { :self => {}, :target => {} }
        hash[[:self, :target][index]][b.to_i] = get_value(c, :rate)
        add_feature(FEATURE_SKILL_STATE_ADD, a.to_i, hash)
      end
    when NWRegexp::BaseItem::SKILL_TYPE_STATE_ADD
      hash = { :opponents => {}, :friends => {}, :self => {} }
      index = [:敵, :味方, :自己].index(Regexp.last_match(1).to_sym)
      Regexp.last_match(2).scan(/(\d+)-(\d+)-(#{NWRegexp::VALUE})/) do |a, b, c|
        hash[[:opponents, :friends, :self][index]][b.to_i] = get_value(c, :rate)
        add_feature(FEATURE_SKILL_TYPE_STATE_ADD, a.to_i, hash)
      end
    when NWRegexp::BaseItem::EQUIP_ABILITY_BOOST
      add_feature(FEATURE_BATTLER_ABILITY, EQUIP_ABILITY_BOOST, Regexp.last_match(1).to_i)
    when NWRegexp::BaseItem::FAST_MOVE_TYPE
      code = Regexp.last_match(1) == "タイプ" ? FEATURE_FAST_MOVE_STYPE : FEATURE_FAST_MOVE_SID
      Regexp.last_match(2).split(/,\s?/).each { |id| add_feature(code, id.to_i, true) }
    when NWRegexp::BaseItem::SLOW_MOVE_TYPE
      code = Regexp.last_match(1) == "タイプ" ? FEATURE_SLOW_MOVE_STYPE : FEATURE_SLOW_MOVE_SID
      Regexp.last_match(2).split(/,\s?/).each { |id| add_feature(code, id.to_i, true) }
    when NWRegexp::BaseItem::FEATURE_ATK_STATE
      Regexp.last_match(2).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_ATK_STATE, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::STATE_SKILL_BOOST
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(\d+)-(#{NWRegexp::VALUE})/) do |a, b, c|
        hash[[a.to_i, b.to_i]] = get_value(c, :rate)
      end
      add_feature(FEATURE_MULTI_BOOSTER, STATE_SKILL, hash)
    when NWRegexp::BaseItem::STATE_SKILL_TYPE_BOOST
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(\d+)-(#{NWRegexp::VALUE})/) do |a, b, c|
        hash[[a.to_i, b.to_i]] = get_value(c, :rate)
      end
      add_feature(FEATURE_MULTI_BOOSTER, STATE_SKILL_TYPE, hash)
    when NWRegexp::BaseItem::STATE_NORMAL_ATACK_BOOST
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :rate) }
      add_feature(FEATURE_MULTI_BOOSTER, STATE_NORMAL_ATACK, hash)
    when NWRegexp::BaseItem::PINCHI_SKILL_BOOST
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :rate) }
      add_feature(FEATURE_MULTI_BOOSTER, PINCHI_SKILL, hash)
    when NWRegexp::BaseItem::PINCHI_SKILL_TYPE_BOOST
      hash = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) { |a, b| hash[a.to_i] = get_value(b, :rate) }
      add_feature(FEATURE_MULTI_BOOSTER, PINCHI_SKILL_TYPE, hash)
    when NWRegexp::BaseItem::FULL_HP_SKILL_BOOST
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_FULL_HP_SKILL_BOOST, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::FULL_HP_SKILL_TYPE_BOOST
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_FULL_HP_SKILL_TYPE_BOOST, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::NORMAL_ATTACK_FORCE_ELEMENT
      add_feature(FEATURE_BATTLER_ABILITY, NORMAL_ATTACK_FORCE_ELEMENT, true)
    when NWRegexp::BaseItem::SUCCUBUS
      add_feature(FEATURE_SUCCUBUS)
    when NWRegexp::BaseItem::PENETRATION_ELEMENT
      Regexp.last_match(1).split(/,\s?/).each do |id|
        add_feature(FEATURE_PENETRATION_ELEMENT, id.to_i, true)
      end
    when NWRegexp::BaseItem::ALL_ADD_ELEMENT
      Regexp.last_match(1).split(/,\s?/).each do |id|
        add_feature(FEATURE_ALL_ADD_ELEMENT, id.to_i, true)
      end
    when NWRegexp::BaseItem::EX_CATEGORY_BOOSTER
      index = [:与, :被]
      id = FEATURE_EX_CATEGORY_ATTACK + index.index((Regexp.last_match(1)[0]).to_sym)
      Regexp.last_match(2).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(id, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::WEAPON_RATE_BONUS
      @data_ex[:weapon_rate_bonus] ||= []
      Regexp.last_match(1).split(/,\s?/).each do |id|
        @data_ex[:weapon_rate_bonus].push(id.to_i)
      end
    when NWRegexp::BaseItem::SKILL_ADD_PARAM
      stype = Regexp.last_match(1).to_i
      param = Regexp.last_match(2).to_i + 1
      add_param = Regexp.last_match(3).to_i + 1
      rate = get_value(Regexp.last_match(4), :rate)
      add_feature(FEATURE_STYPE_ADD_PARAM, stype, [param, add_param, rate])
    when NWRegexp::BaseItem::SKILL_COMBO
      code = Regexp.last_match(1) == "タイプ" ? FEATURE_SKILL_TYPE_COMBO : FEATURE_SKILL_COMBO
      Regexp.last_match(2).scan(/(\d+)-(\d+)/) do |a, b|
        add_feature(code, a.to_i, b.to_i)
      end
    when NWRegexp::BaseItem::SKILL_UNSTOPPABLE
      code = Regexp.last_match(1) == "タイプ" ? FEATURE_SKILL_TYPE_UNSTOPPABLE : FEATURE_SKILL_UNSTOPPABLE
      Regexp.last_match(2).split(/,\s?/).each do |id|
        add_feature(code, id.to_i, true)
      end
    when NWRegexp::BaseItem::EX_CATEGORY_BOOSTER_BONUS
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_EX_CATEGORY_ATTACK_BONUS, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::SKILL_PLUS_ATTACK
      data_id = Regexp.last_match(1) == "タイプ" ? FEATURE_SKILL_TYPE_PLUS_ATTACK : FEATURE_SKILL_PLUS_ATTACK
      Regexp.last_match(2).scan(/(\d+)-(\d+)/) do |a, b|
        add_feature(data_id, a.to_i, b.to_i)
      end
    when NWRegexp::BaseItem::ADD_ELEMENT
      add_feature(FEATURE_ADD_ELEMENT, Regexp.last_match(1).to_i, Regexp.last_match(2).to_i)
    when NWRegexp::BaseItem::STATE_RATE_FIX
      data = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_STATE_RATE_FIX, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::ELEMENT_RATE_FIX
      data = {}
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_ELEMENT_RATE_FIX, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::AUTO_SKILL_INVALID
      index = NWRegexp::INVALID_ID_ARRAY.at(NWRegexp::INVALID_ARRAY.index(Regexp.last_match(1)))
      code = if Regexp.last_match(2) == "優先度"
               FEATURE_AUTO_SKILL_PRIORITY_INVALID
             elsif Regexp.last_match(2) == "条件"
               FEATURE_AUTO_SKILL_CONDITION_INVALID
             else
               FEATURE_AUTO_SKILL_INVALID
             end
      Regexp.last_match(3).split(/,\s?/).each do |s|
        add_feature(code, index, s.to_i)
      end
    when NWRegexp::BaseItem::SKILL_PLUS_ATTACK_ONE
      data_id = Regexp.last_match(1) == "タイプ" ? FEATURE_SKILL_TYPE_PLUS_ATTACK_ONE : FEATURE_SKILL_PLUS_ATTACK_ONE
      Regexp.last_match(2).scan(/(\d+)-(\d+)/) do |a, b|
        add_feature(data_id, a.to_i, b.to_i)
      end
    when NWRegexp::BaseItem::SKILL_PLUS_ATTACK_ONE_RANDOM
      data_id = Regexp.last_match(1) == "タイプ" ? FEATURE_SKILL_TYPE_PLUS_ATTACK_ONE_RANDOM : FEATURE_SKILL_PLUS_ATTACK_ONE_RANDOM
      Regexp.last_match(2).scan(/(\d+)-(\d+)/) do |a, b|
        add_feature(data_id, a.to_i, b.to_i)
      end
    when NWRegexp::BaseItem::SKILL_SCOPE_ALL
      fid = Regexp.last_match(1) == "タイプ" ? FEATURE_SKILL_TYPE_SCOPE_ALL : FEATURE_SKILL_SCOPE_ALL
      Regexp.last_match(2).split(/,\s?/).each do |id|
        add_feature(fid, id.to_i, true)
      end
    when NWRegexp::BaseItem::SKILL_SCOPE_ONE
      fid = Regexp.last_match(1) == "タイプ" ? FEATURE_SKILL_TYPE_SCOPE_ONE : FEATURE_SKILL_SCOPE_ONE
      Regexp.last_match(2).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(fid, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::EX_CATEGORY
      Regexp.last_match(1).split(/,\s?/).map do |item|
        add_feature(FEATURE_EX_CATEGORY, item.to_i, true)
      end
    when NWRegexp::BaseItem::SKILL_TYPE_COST_ZERO
      type = Regexp.last_match(1).to_sym
      Regexp.last_match(2).split(/,\s?/).each do |id|
        add_feature(FEATURE_SKILL_TYPE_COST_ZERO, [type, id.to_i], true)
      end
    when NWRegexp::BaseItem::SKILL_COST_ZERO
      type = Regexp.last_match(1).to_sym
      Regexp.last_match(2).split(/,\s?/).each do |id|
        add_feature(FEATURE_SKILL_COST_ZERO, [type, id.to_i], true)
      end
    when NWRegexp::BaseItem::COST_ZERO
      type = Regexp.last_match(1).to_sym
      add_feature(FEATURE_COST_ZERO, type, true)
    when NWRegexp::BaseItem::EX_VALUE_BOOSTER
      id = Booster::BATTLE_COUNT + NWRegexp::EX_VALUES.index(Regexp.last_match(1))
      add_feature(FEATURE_MULTI_BOOSTER, id, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::ENEMY_NUMBER_BOOSTER
      index = [:複数, :単体]
      id = Booster::ENEMY_MULTI + index.index(Regexp.last_match(1).to_sym)
      add_feature(FEATURE_MULTI_BOOSTER, id, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::ENEMY_NUMBER_SKILL_BOOSTER
      index = [:複数, :単体]
      data_id = FEATURE_ENEMY_MULTI_SKILL_BOOST + index.index(Regexp.last_match(1).to_sym) * 2
      data_id += 1 if Regexp.last_match(2) == "タイプ"
      Regexp.last_match(3).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(data_id, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::WTYPE_ATTACK_BOOSTER
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_WEAPON_TYPE_ATTACK_BOOST, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::ATYPE_DEFENCE_BOOSTER
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_ARMOR_TYPE_DEFENCE_BOOST, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::ITEM_DAMAGE_BOOSTER
      add_feature(FEATURE_MULTI_BOOSTER, Booster::ITEM_DAMAGE, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::STATE_EFFECT_BOOSTER
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_STATE_EFFECT_BOOST, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::STATE_DAMAGE_BOOSTER
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_STATE_DAMAGE_BOOST, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::WIELD_BOOSTER
      index = [:一, :二, :三]
      data_id = index.index(Regexp.last_match(1).to_sym) + 1
      add_feature(FEATURE_WIELD_BOOST, data_id,
                  [get_value(Regexp.last_match(2), :rate), get_value(Regexp.last_match(3), :rate)])
    when NWRegexp::BaseItem::BATTLE_START_STATE
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_BATTLE_START_STATE, 0, [a.to_i, get_value(b, :int)])
      end
    when NWRegexp::BaseItem::MULTI_ELEMENT
      array = []
      Regexp.last_match(1).split(/,\s?/).each do |id|
        array.push(id.to_i)
      end
      add_feature(FEATURE_MULTI_ELEMENT, 0, array)
    when NWRegexp::BaseItem::DISPLAY_ID
      @data_ex[:sort_id] = Regexp.last_match(1).to_f
    when NWRegexp::BaseItem::PARAM_NEUTRALIZE
      Regexp.last_match(1).split(/,\s?/).each do |id|
        add_feature(FEATURE_PARAM_NEUTRALIZE, id.to_i + 1, true)
      end
    when NWRegexp::BaseItem::SAME_ELEMENT_DAMAGE_BONUS
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_SAME_ELEMENT_DAMAGE_BOOST, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::STATE_BOOST_PLUS
      add_feature(FEATURE_STATE_BOOST_PLUS, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::LEARNING
      add_feature(FEATURE_LEARNING, 0, true)
    when NWRegexp::BaseItem::SLOW_MOVE_ALL
      add_feature(FEATURE_SLOW_MOVE_ALL, 0, true)
    when NWRegexp::BaseItem::FAST_MOVE_ALL
      add_feature(FEATURE_FAST_MOVE_ALL, 0, true)
    when NWRegexp::BaseItem::SKILL_TYPE_DEFENCE_PENETRATION
      Regexp.last_match(1).split(/,\s?/).each do |id|
        add_feature(FEATURE_SKILL_TYPE_DEFENCE_PENETRATION, id.to_i, true)
      end
    when NWRegexp::BaseItem::DUAL_SHIELD
      add_feature(FEATURE_SLOT_TYPE, 2, true)
    when NWRegexp::BaseItem::TRIPLE_WIELD
      add_feature(FEATURE_SLOT_TYPE, 3, true)
    when NWRegexp::BaseItem::DUAL_SHIELD_ADD_ABILITY
      add_feature(FEATURE_DUAL_SHIELD_ADD_ABILITY, Regexp.last_match(1).to_i, true)
    when NWRegexp::BaseItem::STATE_CHAIN
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        add_feature(FEATURE_STATE_CHAIN, a.to_i, b.to_i)
      end
    when NWRegexp::BaseItem::CERTAIN_REFLECTION
      add_feature(FEATURE_BATTLER_ABILITY, CERTAIN_REFLECTION, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::MAX_AP_BONUS
      code, type = Regexp.last_match(1) == "固定値" ? [FEATURE_MAX_AP_BONUS, :int] : [FEATURE_MAX_AP_RATE, :rate]
      Regexp.last_match(2).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(code, a.to_i, get_value(b, type))
      end
    when NWRegexp::BaseItem::MAGICAL_CRITICAL
      add_feature(FEATURE_MAGICAL_CRITICAL, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::SKILL_TIMING_BOOST
      data_id = NWRegexp::SKILL_TIMING_ARRAY.index(Regexp.last_match(1))
      add_feature(FEATURE_SKILL_TIMING_BOOST, data_id, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::SKILL_TIMING_REPEAT
      data_id = NWRegexp::SKILL_TIMING_ARRAY.index(Regexp.last_match(1))
      add_feature(FEATURE_SKILL_TIMING_REPEAT, data_id, 1)
    when NWRegexp::BaseItem::EVASION_SKILL
      hash = {
        :id => Regexp.last_match(1).to_i,
        :per => get_value(Regexp.last_match(2), :rate)
      }
      add_feature(FEATURE_BATTLER_ABILITY, EVASION_SKILL, hash)
    when NWRegexp::BaseItem::FULL_SP_BOOST
      add_feature(FEATURE_FULL_SP_BOOST, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::FULL_MP_BOOST
      add_feature(FEATURE_FULL_MP_BOOST, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::ITEM_COST_RATE
      add_feature(FEATURE_ITEM_COST_RATE, 0, get_value(Regexp.last_match(1), :int))
    when NWRegexp::BaseItem::ITEM_GET_RATE
      add_feature(FEATURE_ITEM_GET_RATE, 0, get_value(Regexp.last_match(1), :int))
    when NWRegexp::BaseItem::SKILL_COUNTER_EX
      s = Regexp.last_match(1).to_s
      data_id = s == "タイプ" ? FEATURE_STYPE_COUNTER_EX : FEATURE_SKILL_COUNTER_EX
      v = Regexp.last_match(2).to_i
      a = Regexp.last_match(3).split(/,\s?/)
      a.each { |id| add_feature(data_id, id.to_i, v) }
    when NWRegexp::BaseItem::TURN_END_REVIVE
      add_feature(FEATURE_TURN_END_REVIVE, 0, true)
    when NWRegexp::BaseItem::UNDEAD
      add_feature(FEATURE_UNDEAD, 0, true)
      add_feature(FEATURE_STATE_RESIST, 1, true)
    when NWRegexp::BaseItem::SKILL_CHAIN
      a = Regexp.last_match(1).split(/,\s?/)
      add_feature(FEATURE_SKILL_CHAIN, a.first.to_i, a[1..-1].map(&:to_i))
    when NWRegexp::BaseItem::SKILL_CHAIN_BOOST
      add_feature(FEATURE_SKILL_CHAIN_BOOST, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::SKILL_CHAIN_COST_RATE
      add_feature(FEATURE_SKILL_CHAIN_COST_RATE, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::FULL_MP_STYPE_BOOST
      add_feature(FEATURE_FULL_MP_STYPE_BOOST, Regexp.last_match(1).to_i, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::FULL_SP_STYPE_BOOST
      add_feature(FEATURE_FULL_SP_STYPE_BOOST, Regexp.last_match(1).to_i, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::ADD_STEAL_SKILL
      code = Regexp.last_match(1) == "タイプ" ? FEATURE_ADD_STEAL_STYPE : FEATURE_ADD_STEAL_SID
      Regexp.last_match(2).scan(/(\d+)-(\d+)/) do |a, b|
        add_feature(code, a.to_i, b.to_i)
      end
    when NWRegexp::BaseItem::ADD_RESTORATION
      add_feature(FEATURE_ADD_RESTORATION, Regexp.last_match(1).to_sym, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::ADD_RESTORATION_STYPE
      h = { "HP" => FEATURE_ADD_RESTORATION_STYPE_HP, "MP" => FEATURE_ADD_RESTORATION_STYPE_MP }
      code = h[Regexp.last_match(1)]
      add_feature(code, Regexp.last_match(2).to_i, get_value(Regexp.last_match(3), :rate))
    when NWRegexp::BaseItem::ADD_SPEED_STYPE
      code = FEATURE_ADD_SPEED_PARAM_RATE
      type = :rate
      if Regexp.last_match(1).empty?
        code = FEATURE_ADD_SPEED
        type = :int
      end
      Regexp.last_match(2).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(code, a.to_i, get_value(b, type))
      end
    when NWRegexp::BaseItem::AUTO_REVIVE
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_AUTO_REVIVE, AutoRevive::COUNT, get_value(a, :int))
        add_feature(FEATURE_AUTO_REVIVE, AutoRevive::RATE, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::ADD_DUMMY_ENCHANT
      add_feature(FEATURE_ADD_DUMMY_ENCHANT, 0, Regexp.last_match(1).to_s)
    when NWRegexp::BaseItem::BLOCK_RATE
      data_id = [:必中, :物理, :魔法].index(Regexp.last_match(1).to_sym)
      add_feature(FEATURE_BLOCK_RATE, data_id, get_value(Regexp.last_match(2), :rate), 100)
    when NWRegexp::BaseItem::ID_ITEM_DAMAGE_BOOST
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_ID_ITEM_BOOST, a.to_i, get_value(b, :rate))
      end
    when NWRegexp::BaseItem::STYPE_ITEM_COST_RATE
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_STYPE_ITEM_COST_RATE, a.to_i, get_value(b, :int))
      end
    when NWRegexp::BaseItem::STYPE_ITEM_GET_RATE
      Regexp.last_match(1).scan(/(\d+)-(#{NWRegexp::VALUE})/) do |a, b|
        add_feature(FEATURE_STYPE_ITEM_GET_RATE, a.to_i, get_value(b, :int))
      end
    when NWRegexp::BaseItem::ONCE_TURN_END_STATE
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        add_feature(FEATURE_ONCE_TURN_END_STATE, a.to_i, b.to_i)
      end
    when NWRegexp::BaseItem::DAMAGE_BOOST
      add_feature(FEATURE_DAMAGE_BOOST, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::SINGLE_SKILL_BOOST
      add_feature(FEATURE_SINGLE_SKILL_BOOST, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::ADD_ELEMENT_SKILL
      code = Regexp.last_match(1) == "タイプ" ? FEATURE_ADD_ELEMENT_STYPE : FEATURE_ADD_ELEMENT_SID
      Regexp.last_match(2).scan(/(\d+)-(\d+)/) do |a, b|
        add_feature(code, a.to_i, b.to_i)
      end
    when NWRegexp::BaseItem::HIT_DAMAGE_BOOST
      data_id = Regexp.last_match(1) == "アップ" ? 0 : 1
      add_feature(FEATURE_HIT_DAMAGE_BOOST, data_id, get_value(Regexp.last_match(2), :rate))
    when NWRegexp::BaseItem::TURN_HIT_DAMAGE_RATE
      add_feature(FEATURE_TURN_HIT_DAMAGE_RATE, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::EX_CATEGORY_BOOSTER_SKILL_TYPE
      Regexp.last_match(1).scan(/(\d+)-(\d+)-(#{NWRegexp::VALUE})/) do |a, b, c|
        add_feature(FEATURE_EX_CATEGORY_STYPE, [a.to_i, b.to_i], get_value(c, :rate))
      end
    when NWRegexp::BaseItem::REDUCE_BOOST_DAMAGE
      add_feature(FEATURE_REDUCE_BOOST_DAMAGE, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::ALTERNATE_TP_TO_MP
      add_feature(FEATURE_ALTERNATE_TP_TO_MP, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::PARTY_MEMBER_PARAM_BOOST
      add_feature(FEATURE_PARTY_PARAM_BOOST, 0, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::PARTY_MEMBER_HPMP_BOOST
      add_feature(FEATURE_PARTY_PARAM_BOOST, 1, get_value(Regexp.last_match(1), :rate))
    when NWRegexp::BaseItem::VARIABLE_HP_DAMAGE
      add_feature(FEATURE_VARIABLE_HP_DAMAGE, 0, Regexp.last_match(1).to_i)
    when NWRegexp::BaseItem::ACTION_MINUS
      add_feature(FEATURE_AUTO_REVIVE, AutoRevive::COUNT, -get_value(Regexp.last_match(1).to_i, :int))
    end
  end
end

class RPG::Enemy < RPG::BaseItem
  def nw_line_analyze(line)
    case line
    when NWRegexp::Enemy::ESCAPE_LEVEL
      @data_ex[:escape_level] = Regexp.last_match(1).to_i
    when NWRegexp::Enemy::CLASSEXP
      @data_ex[:class_exp] = Regexp.last_match(1).to_i
    when NWRegexp::Enemy::FRIEND_VARIABLE
      @data_ex[:friend_variable] = Regexp.last_match(1).to_i
    when NWRegexp::Enemy::STEAL_LIST
      @data_ex[:steal_list] ||= { 1 => [], 2 => [], 3 => [], 4 => [] }
      @data_ex[:steal_list][Regexp.last_match(1).to_i].push({
                                                              :kind => { :I => 1, :W => 2,
                                                                         :A => 3 }[Regexp.last_match(2).to_sym],
                                                              :data_id => Regexp.last_match(3).to_i,
                                                              :denominator => Regexp.last_match(4).to_i
                                                            })
    when NWRegexp::Enemy::WEAPON_TYPE
      @data_ex[:wtype_id] = Regexp.last_match(1).to_i
    when NWRegexp::Enemy::CATEGORY
      @data_ex[:lib_category] = Regexp.last_match(1).to_sym
    when NWRegexp::Enemy::LIB_NAME
      @data_ex[:lib_name] = Regexp.last_match(1).to_s
    when NWRegexp::Battler::TEMPTATION_SKILL
      @data_ex[:temptation_skill] = Regexp.last_match(1).to_i
    when NWRegexp::Enemy::JOIN_SWITCH
      @data_ex[:join_switch] = Regexp.last_match(1).to_i
    when NWRegexp::Enemy::NO_DIFFICULTY
      @data_ex[:no_difficulty] = true
    when NWRegexp::Enemy::NO_PREDATION
      @data_ex[:no_predation] = true
    when NWRegexp::Enemy::NO_LOSE_SKIP
      @data_ex[:no_lose_skip] = true
    when NWRegexp::Enemy::HP_INFINITE
      @data_ex[:hp_infinite] = true
    when NWRegexp::Enemy::MP_INFINITE
      @data_ex[:mp_infinite] = true
    when NWRegexp::Enemy::DEFEAT_MESSAGE
      @data_ex[:defeat_message] = Regexp.last_match(1)
    when NWRegexp::Enemy::ESCAPE_NOT_COUNT
      @data_ex[:escape_not_count?] = true
    when NWRegexp::BaseItem::PARAM_OVERRIDE
      param_id = NWRegexp::FEATURE_PARAM_ARRAY.index(Regexp.last_match(1))
      @params[param_id] = Regexp.last_match(2).to_i
    when NWRegexp::Enemy::SKILL_WORD_ACTOR
      @data_ex[:word_id] = Regexp.last_match(1).to_i
    when NWRegexp::Enemy::PARAM_REF
      @data_ex[:param_ref] = Regexp.last_match(1).to_i
    when NWRegexp::Enemy::REPLACE_MEMBER
      @data_ex[:replace_member] = [Regexp.last_match(1).to_i, Regexp.last_match(2).to_i]
    else
      super
    end
  end
end

#==============================================================================
# ■ RPG::UsableItem
#==============================================================================
class RPG::UsableItem < RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● メモ欄解析処理
  #--------------------------------------------------------------------------
  def nw_line_analyze(line)
    case line
    when NWRegexp::UsableItem::HEEL_REVERSE_IGNORE
      @data_ex[:heel_reverse_ignore] = true
    when NWRegexp::UsableItem::CONSIDERATE_REVISE
      @data_ex[:considerate_revise] = Regexp.last_match(1).to_f * 0.01
    when NWRegexp::UsableItem::PAY_LIFE
      @data_ex[:pay_life?] = true
    when NWRegexp::UsableItem::RANDOM_INVOKE
      @data_ex[:random_invoke] ||= []
      Regexp.last_match(1).split(/,\s?/).each { |id| @data_ex[:random_invoke].push(id.to_i) }
    when NWRegexp::UsableItem::MULTI_INVOKE
      @data_ex[:multi_invoke] ||= []
      Regexp.last_match(1).split(/,\s?/).each { |id| @data_ex[:multi_invoke].push(id.to_i) }
    when NWRegexp::UsableItem::ADD_ANIME
      @data_ex[:add_anime] ||= []
      Regexp.last_match(1).split(/,\s?/).each { |id| @data_ex[:add_anime].push(id.to_i) }
    when NWRegexp::UsableItem::ELEMENT_EX
      @data_ex[:element_ex] ||= []
      Regexp.last_match(1).split(/,\s?/).each { |id| @data_ex[:element_ex].push(id.to_i) }
    when NWRegexp::UsableItem::WEAPON_RATE
      @data_ex[:weapon_rate] ||= {}
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        @data_ex[:weapon_rate][a.to_i] = b.to_f * 0.01
      end
    when NWRegexp::UsableItem::APPLY_PHARMACOLOGY
      @data_ex[:apply_pharmacology?] = true
    when NWRegexp::UsableItem::WARP_ITEM
      @data_ex[:warp_item?] = true
    when NWRegexp::UsableItem::PENETRATE
      @data_ex[:penetrate] ||= 0
      @data_ex[:penetrate] |= 0x1 unless Regexp.last_match(1).to_s.empty?
      @data_ex[:penetrate] |= 0x2 unless Regexp.last_match(2).to_s.empty?
    when NWRegexp::UsableItem::SLOT
      @data_ex[:use_slot?] = true
    when NWRegexp::UsableItem::POKER
      @data_ex[:use_poker?] = true
    when NWRegexp::UsableItem::THROW
      @data_ex[:throw?] = true
    when NWRegexp::UsableItem::ADD_STEAL
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_STEAL, Regexp.last_match(1).to_i))
    when NWRegexp::UsableItem::ITEM_GET
      id = []
      num = []
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        id.push(a.to_i)
        num.push(b.to_i)
      end
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_GET_ITEM, id.size, id, num))
    when NWRegexp::UsableItem::ADD_DEFENSE_WALL
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_DEFENSE_WALL, Regexp.last_match(1).to_i))
    when NWRegexp::UsableItem::OVER_DRIVE
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_OVER_DRIVE, Regexp.last_match(1).to_i))
    when NWRegexp::UsableItem::GAIN_EXP
      data_id = %w[基本 職業 種族].index(Regexp.last_match(1).to_s)
      value1  = Regexp.last_match(3).to_i
      value2  = (Regexp.last_match(2).to_s != "非表示")
      @data_ex[:gain_exp] ||= [0, 0, 0]
      @data_ex[:gain_exp][data_id] += value1
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_GAIN_EXP, data_id, value1, value2))
    when NWRegexp::UsableItem::DEATH_ELEMENT
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_DEATH_ELEMENT, 1, 1.0, :id => Regexp.last_match(1).to_i,
                                                                                 :opt => Regexp.last_match(2).to_i == 1))
    when NWRegexp::UsableItem::DEATH_STATE
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_DEATH_STATE, Regexp.last_match(2).to_i,
                                                   Regexp.last_match(3).nil? ? 1.0 : Regexp.last_match(3).to_f / 100.0, :id => Regexp.last_match(1).to_i, :opt => Regexp.last_match(4).to_i == 1))
    when NWRegexp::UsableItem::PREDATION
      bit = 0
      bit |= 0x1 unless Regexp.last_match(2).to_s.empty?
      bit |= 0x2 unless Regexp.last_match(3).to_s.empty?
      bit |= 0x4 unless Regexp.last_match(4).to_s.empty?
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_PREDATION, 0, Regexp.last_match(1).split(",").collect do |id|
                                                                          id.to_i
                                                                        end, bit))
    when NWRegexp::UsableItem::SELF_ENCHANT
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_SELF_ENCHANT, Regexp.last_match(1).to_i,
                                                   Regexp.last_match(2).nil? ? 1.0 : Regexp.last_match(2).to_f / 100.0, Regexp.last_match(3).to_i == 1))
    when NWRegexp::UsableItem::RESTORATION
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_RESTORATION, Regexp.last_match(1).to_sym,
                                                   Regexp.last_match(2).to_i * 0.01))
    when NWRegexp::UsableItem::BINDING_START
      @data_ex[:binding_start?] = true
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_BINDING_START, Regexp.last_match(1).to_i,
                                                   NWConst::State::UBIND, NWConst::State::TBIND))
    when NWRegexp::UsableItem::EBINDING_START
      @data_ex[:binding_start?] = true
      # 使用効果は通常版と共通
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_BINDING_START, -1, NWConst::State::EUBIND,
                                                   NWConst::State::ETBIND))
    when NWRegexp::UsableItem::BIND_RESIST
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_BIND_RESIST, 1))
    when NWRegexp::UsableItem::REPEATS_EX
      @data_ex[:repeat_ex] = Regexp.last_match(1).to_i
    when NWRegexp::UsableItem::TARGET_REJECT_USER
      @data_ex[:target_reject_user?] = true
    when NWRegexp::UsableItem::ERASE_DEFENSE_WALL
      @data_ex[:erase_defense_wall?] = true
    when NWRegexp::UsableItem::INCLUDE_BENCH
      @data_ex[:include_bench?] = true
    when NWRegexp::UsableItem::PERSONA_CHANGE
      @data_ex[:persona_change] = Regexp.last_match(1).to_i
    when NWRegexp::UsableItem::FAST_MOVE
      @data_ex[:fast_move?] = true
    when NWRegexp::UsableItem::SLOW_MOVE
      @data_ex[:slow_move?] = true
    when NWRegexp::UsableItem::ALLOWANCE
      @data_ex[:allowance?] = true
    when NWRegexp::UsableItem::SELF_ENCHANT_REGEN
      @effects_ex.push(RPG::UsableItem::Effect.new(EFFECT_SELF_ENCHANT_REGEN, Regexp.last_match(1).to_i,
                                                   Regexp.last_match(2).nil? ? 1.0 : Regexp.last_match(2).to_f / 100.0, Regexp.last_match(3).nil? ? false : true))
    when NWRegexp::UsableItem::STATE_BOOST
      @data_ex[:state_boost] = {}
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        @data_ex[:state_boost][a.to_i] = b.to_f * 0.01
      end
    when NWRegexp::UsableItem::PINCHI_BOOST
      @data_ex[:pinchi_boost] = Regexp.last_match(1).to_f * 0.01
    when NWRegexp::UsableItem::FULL_HP_BOOST
      @data_ex[:full_hp_boost] = Regexp.last_match(1).to_i
    when NWRegexp::UsableItem::EXT_SCOPE_SETTING
      scope = Regexp.last_match(1).split(/,\s?/).map { |id| id.to_i }
      @data_ex[:ext_scope] ||= 0x0
      NWRegexp::SEX_ARRAY.each.with_index do |id, index|
        @data_ex[:ext_scope] |= id if scope.include?(index)
      end
    when NWRegexp::UsableItem::DISPLAY_NAME
      @data_ex[:display_skill_name] = Regexp.last_match(1)
    when NWRegexp::UsableItem::LEARNING_SKILL
      @data_ex[:learning_skill] = Regexp.last_match(1).to_i
    when NWRegexp::UsableItem::BENCH_ONLY
      @data_ex[:bench_only] = true
    when NWRegexp::UsableItem::MIMIC
      @data_ex[:mimic?] = true
    when NWRegexp::UsableItem::SUPER_MIMIC
      @data_ex[:super_mimic?] = true
    when NWRegexp::UsableItem::ACCUMULATE_GET_RATE_UP
      add_effect(EFFECT_ACCUMULATE_GET_RATE_UP)
      @data_ex[:no_display_action_result?] = true
      @data_ex[:include_bench?] = true
      @scope = 8
    when NWRegexp::UsableItem::ACCUMULATE_GET_RATE_RESET
      add_effect(EFFECT_ACCUMULATE_GET_RATE_RESET)
      @data_ex[:no_display_action_result?] = true
      @data_ex[:include_bench?] = true
      @scope = 8
    when NWRegexp::UsableItem::WEAPON_EQUIP_SIZE_BOOST
      i = ["二", "三"].index(Regexp.last_match(1)) + 2
      @data_ex[:weapon_equip_size_boost] ||= {}
      @data_ex[:weapon_equip_size_boost][i] = (Regexp.last_match(2).to_i * 0.01)
    when NWRegexp::UsableItem::ENEMY_FORMULA
      damage.enemy_formula = Regexp.last_match(1)
    when NWRegexp::UsableItem::IGNORE_NO_EFFECT
      @data_ex[:ignore_no_effect] = true
    else
      super
    end
  end
end

#==============================================================================
# ■ RPG::Class
#==============================================================================
class RPG::Class < RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● メモ欄解析処理
  #--------------------------------------------------------------------------
  def nw_line_analyze(line)
    case line
    when NWRegexp::Class::CLASS_LANK
      @data_ex[:class_lank] = Regexp.last_match(1).to_i
    when NWRegexp::Class::NEED_JOBCHANGE_CLASS
      @data_ex[:need_jobchange_class] ||= []
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        @data_ex[:need_jobchange_class].push(:id => a.to_i, :lv => b.to_i)
      end
    when NWRegexp::Class::SELECT_JOBCHANGE_CLASS
      @data_ex[:select_jobchange_class] ||= []
      result = []
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        result.push(:id => a.to_i, :lv => b.to_i)
      end
      @data_ex[:select_jobchange_class].push result
    when NWRegexp::Class::NEED_JOBCHANGE_ITEM
      @data_ex[:need_jobchange_item] ||= []
      Regexp.last_match(1).split(/,\s?/).each do |id|
        @data_ex[:need_jobchange_item].push(id.to_i)
      end
    when NWRegexp::Class::MEMORIZE_CAPACITY_REVISE
      @data_ex[:memorize_capacity_revise] ||= {}
      Regexp.last_match(1).split(/,\s?/).each_with_index do |capacity, i|
        @data_ex[:memorize_capacity_revise][i + 1] = capacity.to_i
      end
    when NWRegexp::Class::PREFIX
      @data_ex[:prefix] ||= []
      @data_ex[:prefix] << Regexp.last_match(1)
    when NWRegexp::Class::RARE_PREFIX
      @data_ex[:rare_prefix] ||= []
      @data_ex[:rare_prefix] << Regexp.last_match(1)
    when NWRegexp::Class::PARAM_BONUS
      @data_ex[:bonus_params] ||= [0] * 8
      data_id = NWRegexp::FEATURE_PARAM_ARRAY.index(Regexp.last_match(1))
      @data_ex[:bonus_params][data_id] = get_value(Regexp.last_match(2), :int)
    when NWRegexp::Class::MAX_SP_BONUS
      @data_ex[:bonus_max_sp] = get_value(Regexp.last_match(1), :int)
    when NWRegexp::EquipItem::FINAL_BONUS
      @data_ex[:final_bonus] = get_value(Regexp.last_match(1), :rate)
    when NWRegexp::Class::BOTH_DISABLE
      @data_ex[:both_disable] ||= []
      Regexp.last_match(1).split(/,\s?/).each do |id|
        @data_ex[:both_disable].push(id.to_i)
      end
    when NWRegexp::Class::DUMMY_ENCHANT_COLOR
      @data_ex[:dummy_enchant_color] = Regexp.last_match(1).to_i
    when NWRegexp::Class::SET_EFFECT
      effects = Regexp.last_match(1).split(/,\s?/).map do |id|
        id.to_i
      end
      @data_ex[:set_effect] = RPG::SetEffect.new(id, name, effects)
    when NWRegexp::Class::EXP_RATE
      @data_ex[:exp_rate] = Regexp.last_match(1).to_i
    when NWRegexp::Class::MAX_LV
      @data_ex[:max_lv] = Regexp.last_match(1).to_i
    else
      super
    end
  end
end

#==============================================================================
# ■ RPG::State
#==============================================================================
class RPG::State < RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● メモ欄解析
  #--------------------------------------------------------------------------
  def nw_line_analyze(line)
    case line
    when NWRegexp::State::TMP_EQUIP
      @data_ex[:tmp_equip] = Regexp.last_match(1).to_i
    when NWRegexp::State::DEATH
      @data_ex[:death?] = true
    when NWRegexp::State::DEATH_PLEASURE
      @data_ex[:death_pleasure?] = true
    when NWRegexp::State::ALL_DEAD
      @data_ex[:all_dead] = true
    when NWRegexp::State::DISPLAY_NAME
      if Regexp.last_match(1) == "なし"
        @data_ex[:display?] = false
      else
        @data_ex[:display_stete_name] = Regexp.last_match(1)
      end
    when NWRegexp::State::SEAL_ACTION
      @data_ex[:seal_action] ||= []
      Regexp.last_match(1).split(/,\s?/).each { |id| @data_ex[:seal_action].push(id.to_i) }
    when NWRegexp::State::ADD_ACTION
      @data_ex[:add_action] ||= []
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        action = RPG::Enemy::Action.new
        action.skill_id = a.to_i
        action.rating = b.to_i
        @data_ex[:add_action].push(action)
      end
    when NWRegexp::State::FORCE_ITEM_DROP
      @data_ex[:force_item_drop] = true
    when NWRegexp::BaseItem::ONCE_TURN_END_STATE
      @data_ex[:once_turn_end_state] ||= []
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        @data_ex[:once_turn_end_state].push([a.to_i, b.to_i])
      end
    when NWRegexp::State::POPUP_BOOST_NAME
      @data_ex[:popup_boost_name] = Regexp.last_match(1)
    when NWRegexp::State::REMOVE_STATE
      @data_ex[:remove_state] = Regexp.last_match(1).split(",").map(&:to_i)
    else
      super
    end
  end
end

#==============================================================================
# ■ RPG::Skill
#==============================================================================
class RPG::Skill < RPG::UsableItem
  #--------------------------------------------------------------------------
  # ● メモ欄解析処理
  #--------------------------------------------------------------------------
  def nw_line_analyze(line)
    case line
    when NWRegexp::Skill::HP_COST_EX
      @data_ex[:hp_cost_ex] = {}
      @data_ex[:hp_cost_ex][:data] = Regexp.last_match(3).to_i
      @data_ex[:hp_cost_ex][:abs?] = Regexp.last_match(1) ? true : false
      @data_ex[:hp_cost_ex][:max?] = Regexp.last_match(2) == "MAXHP"
      @data_ex[:hp_cost_ex][:per?] = Regexp.last_match(4).nil? ? false : true
    when NWRegexp::Skill::MP_COST_EX
      @data_ex[:mp_cost_ex] = {}
      @data_ex[:mp_cost_ex][:data] = Regexp.last_match(3).to_i
      @data_ex[:mp_cost_ex][:abs?] = Regexp.last_match(1) ? true : false
      @data_ex[:mp_cost_ex][:max?] = Regexp.last_match(2) == "MAXMP"
      @data_ex[:mp_cost_ex][:per?] = Regexp.last_match(4).nil? ? false : true
    when NWRegexp::Skill::TP_COST_EX
      @data_ex[:tp_cost_ex] = {}
      @data_ex[:tp_cost_ex][:data] = Regexp.last_match(3).to_i
      @data_ex[:tp_cost_ex][:abs?] = Regexp.last_match(1) ? true : false
      @data_ex[:tp_cost_ex][:max?] = Regexp.last_match(2) == "MAXTP"
      @data_ex[:tp_cost_ex][:per?] = Regexp.last_match(4).nil? ? false : true
    when NWRegexp::Skill::GOLD_COST
      @data_ex[:gold_cost] = Regexp.last_match(1).to_i
    when NWRegexp::Skill::ITEM_COST
      @data_ex[:item_cost] ||= []
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) { |a, b| @data_ex[:item_cost].push(:id => a.to_i, :num => b.to_i) }
    when NWRegexp::Skill::NEED_ITEM
      @data_ex[:need_item] ||= []
      Regexp.last_match(1).split(/,\s?/).each { |id| @data_ex[:need_item].push(id.to_i) }
    when NWRegexp::Skill::NEED_DUAL_WIELD
      @data_ex[:need_dual_wield?] = true
    when NWRegexp::Skill::NEED_DUAL_SHIELD
      @data_ex[:need_dual_shield?] = true
    when NWRegexp::Skill::FRIEND_DRAW
      @data_ex[:friend_draw?] = true
    when NWRegexp::Skill::STYPE_EX
      @data_ex[:stype_ex] ||= []
      Regexp.last_match(1).split(/,\s?/).each { |id| @data_ex[:stype_ex].push(id.to_i) }
    when NWRegexp::Skill::SKILL_HIT
      @data_ex[:skill_hit] = Regexp.last_match(1).to_f * 0.01
    when NWRegexp::Skill::SKILL_HIT_FACTOR
      @data_ex[:skill_hit_factor] = Regexp.last_match(1).to_f * 0.01
    when NWRegexp::Skill::NOT_LEARN_ACTORS
      @data_ex[:not_learn_actors] = true
    when NWRegexp::Skill::NOT_LEARN_ACTORS_SET
      @data_ex[:not_learn_actors] = true
    when NWRegexp::Skill::MEMORIZE_COST
      @data_ex[:memorize_cost] = Regexp.last_match(1).to_i
    when NWRegexp::Skill::PASSIVE_ARMORS
      @data_ex[:passive_armors] ||= []
      Regexp.last_match(1).split(/,\s?/).each { |id| @data_ex[:passive_armors].push(id.to_i) }
    when NWRegexp::Skill::NOT_JUMBLE_MEMORIZE
      @data_ex[:not_jumble_memorize] ||= []
      Regexp.last_match(1).split(/,\s?/).each do |id|
        i = id.to_i
        @data_ex[:not_jumble_memorize].push(i) if i != self.id
      end
    when NWRegexp::Enemy::LIB_NAME
      @data_ex[:lib_name] = Regexp.last_match(1).to_s
    when NWRegexp::Skill::INVISIBLE
      @data_ex[:visible?] = true
    when NWRegexp::Skill::RECHARGE
      @data_ex[:recharge] = Regexp.last_match(1).to_i
    when NWRegexp::Skill::CYCLE
      @data_ex[:cycle] = "($game_troop.turn_count - #{Regexp.last_match(1)}) % #{Regexp.last_match(2)} == 0"
    when NWRegexp::Skill::LONELY_UNUSED
      @data_ex[:lonely_unused?] = true
    when NWRegexp::Skill::CRITICAL_EX
      @data_ex[:critical_ex] = Regexp.last_match(1).to_i
    when NWRegexp::Skill::AUTO_BATTLE_NORMAL_USEBLE
      @data_ex[:use_normal] = true
    when NWRegexp::Skill::SUCCUBUS_UNAVAILABLE
      @data_ex[:succubus_unavailable] = true
    when NWRegexp::Skill::EX_CATEGORY_BOOSTER
      @data_ex[:booster_ex_category_attack] ||= {}
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        @data_ex[:booster_ex_category_attack][a.to_i] = b.to_f * 0.01
      end
    when NWRegexp::Skill::NO_INVOKE_REPEATS
      @data_ex[:no_invoke_repeats] = true
    when NWRegexp::Skill::INVALID_BOOST
      @data_ex[:invalid_boost] = true
    when NWRegexp::Skill::AUTO_BATTLE_SETTING
      auto_battle = Regexp.last_match(1).split(/,\s?/).map { |id| id.to_i }
      @data_ex[:no_auto_battle] ||= [:auto, :normal, :not_mp_skill]
      result = [:auto, :normal, :not_mp_skill].select.with_index do |_, index|
        auto_battle.include?(index)
      end
      @data_ex[:no_auto_battle] -= result
    when NWRegexp::Skill::ADD_FORCE_STEAL
      add_effect(EFFECT_FORCE_STEAL, Regexp.last_match(1).to_i)
    when NWRegexp::Skill::NEED_STATES
      @data_ex[:need_states] ||= []
      result = Regexp.last_match(1).split(/,\s?/).map(&:to_i)
      @data_ex[:need_states].push(result) unless result.empty?
    when NWRegexp::Skill::CLASS_CONDITIONS
      @data_ex[:class_conditions] ||= []
      Regexp.last_match(1).split(/,\s?/).each do |s|
        @data_ex[:class_conditions].push(s.to_i)
      end
    when NWRegexp::Skill::CRITICAL_TYPE
      @data_ex[:critical_type] = Regexp.last_match(1).to_i
    when NWRegexp::Skill::MASTER_ABILIRY
      @data_ex[:master_ability?] = true
      @stype_id = NWConst::Ability::MASTER_ABILITY_STYPE
    else
      super
    end
  end
end

#==============================================================================
# ■ RPG::Item
#==============================================================================
class RPG::Item < RPG::UsableItem
  #--------------------------------------------------------------------------
  # ● メモ欄解析処理
  #--------------------------------------------------------------------------
  def nw_line_analyze(line)
    case line
    when NWRegexp::Item::ENCHANT_STONE_CATEGORY
      @data_ex[:enchant_stone_category] = Regexp.last_match(1).to_i
    when NWRegexp::Item::ENCHANT_STONE_ID
      array = []
      Regexp.last_match(1).split(/,\s?/).each do |id|
        array.push(id.to_i)
      end
      @data_ex[:enchant_stone_id] = array
    when NWRegexp::EquipItem::SELECTABLE
      @data_ex[:equip_selectable_id] = -1
    when NWRegexp::EquipItem::SELECTABLE_ID
      @data_ex[:equip_selectable_id] = Regexp.last_match(1).to_i
    when NWRegexp::BaseItem::REPLACE_GAIN
      @data_ex[:replace_gain] = [Regexp.last_match(1).to_i, Regexp.last_match(2).to_i]
    else
      super
    end
  end
end

#==============================================================================
# ■ RPG::EquipItem
#==============================================================================
class RPG::EquipItem < RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● メモ欄解析処理
  #--------------------------------------------------------------------------
  def nw_line_analyze(line)
    case line
    when NWRegexp::EquipItem::EXCLUSIVE_ACTORS
      @data_ex[:exclusive_actors] ||= []
      Regexp.last_match(1).split(/,\s?/).each do |id|
        @data_ex[:exclusive_actors].push(id.to_i)
      end
    when NWRegexp::EquipItem::NOT_ENCHANT_ID
      @data_ex[:not_enchant_id] ||= []
      Regexp.last_match(1).split(/,\s?/).each do |id|
        @data_ex[:not_enchant_id].push(id.to_i)
      end
    when NWRegexp::EquipItem::FINAL_BONUS
      @data_ex[:final_bonus] = get_value(Regexp.last_match(1), :rate)
    when NWRegexp::BaseItem::PARAM_OVERRIDE
      param_id = NWRegexp::FEATURE_PARAM_ARRAY.index(Regexp.last_match(1))
      @params[param_id] = Regexp.last_match(2).to_i
    when NWRegexp::EquipItem::SELECTABLE
      @data_ex[:equip_selectable_id] = -1
    when NWRegexp::EquipItem::SELECTABLE_ID
      @data_ex[:equip_selectable_id] = Regexp.last_match(1).to_i
    when NWRegexp::EquipItem::SOCKET_NUM
      @data_ex[:socket_number] = Regexp.last_match(1).to_i
    when NWRegexp::BaseItem::REPLACE_GAIN
      @data_ex[:replace_gain] = [Regexp.last_match(1).to_i, Regexp.last_match(2).to_i]
    else
      super
    end
  end
end

class RPG::Weapon < RPG::EquipItem
  #--------------------------------------------------------------------------
  # ● メモ欄解析処理
  #--------------------------------------------------------------------------
  def nw_line_analyze(line)
    if NWRegexp::Weapon::NOT_DUAL_WIELD.match(line)
      @data_ex[:not_dual_wield?] = true
    else
      super
    end
  end
end

class RPG::Armor < RPG::EquipItem
  def nw_line_analyze(line)
    if NWRegexp::Armor::ACCESSORY_SLOT.match(line)
      @data_ex[:accessory_slot] = Regexp.last_match(1).to_i.clamp(1, 2)
    else
      super
    end
  end
end

class RPG::Map
  def nw_line_analyze(line)
    case line
    when NWRegexp::Map::BATTLEBACK_REGION
      @data_ex[:battleback_region] ||= {}
      value = [Regexp.last_match(2), Regexp.last_match(3)].map { |l| l.empty? ? nil : l }
      @data_ex[:battleback_region][Regexp.last_match(1).to_i] = value
    end
  end
end

class RPG::Actor
  def nw_line_analyze(line)
    case line
    when NWRegexp::Actor::TP_LEVEL100_REVISE
      @data_ex[:tp_level100_revise] = Regexp.last_match(1).to_f * 0.01
    when NWRegexp::Actor::SEX
      return if NWRegexp::SEX_ARRAY[Regexp.last_match(1).to_i].nil?

      @data_ex[:sex] = NWRegexp::SEX_ARRAY[Regexp.last_match(1).to_i]
    when NWRegexp::Actor::INITIAL_TRIBE_ID
      @data_ex[:initial_tribe_id] = Regexp.last_match(1).to_i
    when NWRegexp::Actor::USE_EXP_CURVE
      @data_ex[:use_exp_curve] = Regexp.last_match(1).to_i
    when NWRegexp::Actor::HUMAN_ADD_FEATURES
      @data_ex[:human_add_features] = Regexp.last_match(1).to_i
    when NWRegexp::Actor::PECULIAR_SKILL
      @data_ex[:peculiar_skill] ||= []
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        @data_ex[:peculiar_skill].push({ :lv => a.to_i, :id => b.to_i })
      end
    when NWRegexp::Actor::INIT_CLASS_LEVEL
      @data_ex[:init_class_level] ||= []
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        @data_ex[:init_class_level].push({ :id => a.to_i, :lv => b.to_i })
      end
    when NWRegexp::Actor::INIT_EQUIPS
      @data_ex[:init_equips] ||= [nil, nil, nil, nil, nil]
      if (0..5).include?(Regexp.last_match(1).to_i)
        values_after_colon = Regexp.last_match(4) ? Regexp.last_match(4).split(",").map(&:to_i) : []
        @data_ex[:init_equips][Regexp.last_match(1).to_i] =
          [Regexp.last_match(2).to_i, Regexp.last_match(3) ? Regexp.last_match(3).to_i : nil, values_after_colon]
      end
    when NWRegexp::Actor::INIT_ABILITIES
      @data_ex[:init_abilities] ||= []
      Regexp.last_match(1).split(/,\s?/).each do |id|
        @data_ex[:init_abilities].push(id.to_i)
      end
    when NWRegexp::Actor::BASE_TP
      @data_ex[:base_tp] = Regexp.last_match(1).to_i
    when NWRegexp::Actor::TP_LEVEL_REVISE
      @data_ex[:tp_level_revise] = Regexp.last_match(1).to_f * 0.01
    when NWRegexp::Actor::CATEGORY
      @data_ex[:actor_category] ||= []
      @data_ex[:actor_category].push(Regexp.last_match(1).to_sym)
    when NWRegexp::Actor::BEST_PLACE
      @data_ex[:best_place] =
        { :map_id => Regexp.last_match(1).to_i, :x => Regexp.last_match(2).to_i, :y => Regexp.last_match(3).to_i }
    when NWRegexp::Actor::PERSONA
      if Regexp.last_match(1).to_s == "主人格"
        @data_ex[:persona_kind] = :original
      else
        @data_ex[:persona_kind] = :sub
        @data_ex[:original_persona_id] = Regexp.last_match(2).to_i
      end
    when NWRegexp::Battler::TEMPTATION_SKILL
      @data_ex[:temptation_skill] = Regexp.last_match(1).to_i
    when NWRegexp::Actor::ILLUSTRATOR_NAME
      @data_ex[:illustrator_name] = Regexp.last_match(1).to_s
    when NWRegexp::Actor::INIT_BASE_LEVEL
      @initial_level = Regexp.last_match(1).to_i
    else
      super
    end
  end
end
