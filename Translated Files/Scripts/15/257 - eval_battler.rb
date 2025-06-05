class DamageEvalBattler < BasicObject
  def initialize(battler, item)
    setup(battler, item)
  end

  def setup(battler, item)
    @battler = battler
    @item = item
    @param = []
    @battler_param = []
  end

  def param(param_id)
    @param[param_id] ||= __make_param(param_id)
  end

  def method_missing(name, *args)
    @battler.send(name, *args)
  end

  def respond_to_missing?(sym, include_private)
    @battler.respond_to?(sym)
  end

  def hp_cost
    $game_temp.skill_cost.hp(@battler)
  end

  def mp_cost
    $game_temp.skill_cost.mp(@battler)
  end

  def tp_cost
    $game_temp.skill_cost.tp(@battler)
  end

  private

  def __battler_param(param_id)
    @battler_param[param_id] ||= @battler.send(::DamageEvalBattler.param_symbols[param_id])
  end

  def __make_param(param_id)
    __battler_param(param_id)
  end

  class << self
    def param_symbols
      [:mhp, :mmp, :atk, :def, :mat, :mdf, :agi, :luk]
    end
  end

  param_symbols.each_with_index do |meth, i|
    define_method(meth) do
      param(i)
    end
  end
end

class SkillTargetBattler < DamageEvalBattler
  def setup(battler, item)
    super
    @def_penetration_flag = item.def_penetration?
  end

  def param(param_id)
    return 0 if @def_penetration_flag && [3, 5].include?(param_id)

    super
  end
end

class SkillSubjectBattler < DamageEvalBattler
  def setup(battler, item)
    super
    @convert_param = []
    @convert_param_data = battler.category_convert_param_data(item.stype_id)
    @add_param_data = battler.skill_add_param_data(item)
    @enemy_calc = battler.temptation? && battler.temptation_skill_id == item.id
  end

  def enemy_calculation?
    @battler.enemy_calculation? || @enemy_calc
  end

  private

  def __make_param(param_id)
    __convert_param(param_id) + __param_add(param_id)
  end

  def __setup_skill
    return unless @item.is_a?(::RPG::Skill)
  end

  def __convert_param(param_id)
    @convert_param[param_id] ||= [__battler_param(param_id),
                                  __battler_param(@convert_param_data[param_id] || param_id)].max
  end

  def __param_add(param_id)
    return 0 if @add_param_data[param_id].nil?

    @add_param_data[param_id].inject(0) do |v, (add_param, rate)|
      v + (__battler_param(add_param) * rate)
    end
  end
end
