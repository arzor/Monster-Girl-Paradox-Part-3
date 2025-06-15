class Game_Action
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_reader :symbol
  attr_accessor :chain_action
  attr_accessor :stypes
  attr_accessor :combo_history

  #--------------------------------------------------------------------------
  # ○ シンボルをセット　死亡時スキルの判定に使用
  #--------------------------------------------------------------------------
  def set_symbol(symbol)
    @symbol = symbol
    self
  end

  #--------------------------------------------------------------------------
  # ● もがくを設定
  #--------------------------------------------------------------------------
  def set_bind_resist
    set_skill(subject.bind_resist_skill_id)
    self
  end

  #--------------------------------------------------------------------------
  # ● なすがままを設定
  #--------------------------------------------------------------------------
  def set_mercy
    set_skill(subject.mercy_skill_id)
    self
  end

  #--------------------------------------------------------------------------
  # ● 誘惑時行動スキルを設定
  #--------------------------------------------------------------------------
  def set_temptation
    set_skill(subject.temptation_skill_id)
    self
  end

  #--------------------------------------------------------------------------
  # ○ 行動準備
  #--------------------------------------------------------------------------
  def prepare
    if subject.temptation? && !forcing && !subject.skill_unstoppable?(item)
      set_temptation
    elsif subject.confusion? && !forcing && !subject.skill_unstoppable?(item)
      set_confusion
    end
    decide_random_target if @target_index == -1 && item
  end

  #--------------------------------------------------------------------------
  # ○ ターゲットの配列作成
  #--------------------------------------------------------------------------
  def make_targets
    targets = _make_targets
    targets = limit_targets(targets, item.overlap_limit) if item.overlap_limit > 0
    targets
  end

  def _make_targets
    if !forcing && subject.temptation? && !subject.skill_unstoppable?(item)
      temptation_targets
    elsif !forcing && subject.confusion? && !subject.skill_unstoppable?(item)
      [confusion_target]
    elsif !forcing && item.exp_target?
      make_exp_targets
    elsif item.for_opponent?
      targets_for_opponents
    elsif item.for_friend?
      targets_for_friends
    else
      []
    end
  end

  #--------------------------------------------------------------------------
  # ● 誘惑時のターゲット
  #--------------------------------------------------------------------------
  def temptation_targets
    if item.scope == 0
      []
    else
      [$game_actors[NWConst::Actor::LUCA]]
    end
  end

  #--------------------------------------------------------------------------
  # ○ ランダムターゲット
  #--------------------------------------------------------------------------
  def decide_random_target
    target = make_random_target
    if target
      @target_index = target.index
    else
      return if @symbol == :dead_skill
      return if @symbol == :final_invoke
      return if !forcing && subject.temptation?

      clear
    end
  end

  def action?
    true
  end

  def object=(obj)
    @item.object = obj
  end

  def <=>(other)
    return other.speed <=> speed if force_move == other.force_move

    if force_move == :fast_move || other.force_move == :slow_move
      -1
    else
      1
    end
  end

  def speed
    @speed ||= make_speed
  end

  def force_move
    @force_move ||= make_force_move
  end

  def make_force_move
    if subject.slow_move?(item)
      :slow_move
    elsif subject.fast_move?(item)
      :fast_move
    else
      :normal_move
    end
  end

  def make_speed
    speed = subject.speed
    speed += item.speed if item
    speed += subject.atk_speed if attack?
    speed += subject.add_speed(object)
    speed
  end

  def valid?
    (forcing && item) || (subject.enable_action? && subject.usable?(item))
  end

  def use_items(can_failure)
    result =
      case item.use_items_mode
      when :multi
        item.multi_invoke.map { |id| $data_skills[id] }
      when :normal
        [item]
      else
        SceneManager.scene.process_use_items(item.use_items_mode, self, item, can_failure)
      end
    result.map { |item| item.change(subject) }
  end

  def object
    @item.object
  end

  def item
    i = @item.object
    return unless i

    i.change(subject)
  end

  def set_stypes(stypes)
    @stypes = stypes
    self
  end

  #--------------------------------------------------------------------------
  # ○ ランダムターゲット
  #--------------------------------------------------------------------------
  def make_random_target
    if item.for_dead_friend?
      friends_unit.random_dead_target(item)
    elsif item.for_friend?
      friends_unit.random_target(item)
    else
      opponents_unit.random_target(item)
    end
  end

  def confusion_target
    case subject.confusion_level
    when 1
      opponents_unit.random_target(item)
    when 2
      if rand(2) == 0
        opponents_unit.random_target(item)
      else
        friends_unit.random_target(item)
      end
    else
      friends_unit.random_target(item)
    end
  end

  def targets_for_opponents
    if item.for_random?
      Array.new(item.number_of_targets) { opponents_unit.random_target(item) }
    elsif item.for_one?
      num = 1 + (attack? ? subject.atk_times_add.to_i : 0)
      if @target_index < 0
        [opponents_unit.random_target(item)] * num
      else
        [opponents_unit.smooth_target(@target_index)] * num
      end
    else
      num = 1 + (attack? ? subject.atk_times_add.to_i : 0)
      opponents_unit.target_members(item).select(&:alive?) * num
    end
  end

  #--------------------------------------------------------------------------
  # ○ 味方に対するターゲット
  #--------------------------------------------------------------------------
  def targets_for_friends
    if item.for_user?
      subject.game_master? ? [subject.observer] : [subject] # GM込み仕様に対応
    elsif item.for_dead_friend?
      if item.for_one?
        [friends_unit.smooth_dead_target(@target_index)]
      else
        friends_unit.target_members(item).select(&:dead?)
      end
    elsif item.for_friend?
      if item.for_one?
        [friends_unit.smooth_target(@target_index)]
      else
        friends_unit.target_members(item).select(&:alive?)
      end
    end
  end

  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの使用対象候補を取得
  #--------------------------------------------------------------------------
  def item_target_candidates
    if item.for_opponent?
      opponents_unit.target_members(item).select(&:alive?)
    elsif item.for_user?
      [subject]
    elsif item.for_dead_friend?
      friends_unit.target_members(item).select(&:dead?)
    else
      friends_unit.target_members(item).select(&:alive?)
    end
  end

  def combo_setting(base_action)
    @combo_history = base_action.combo_history
    @combo_history << object.id

    scope = item.scope
    return unless scope == base_action.item.scope
    return unless [1, 7].include?(scope)

    @target_index = base_action.target_index
  end

  def skill_combo_enable?(action)
    return false if @subject.game_master?
    return true if @symbol != :skill_combo

    !@combo_history.include?(action.item.id)
  end

  def check_chain_action(data = nil)
    return if @chain_action.nil? || @chain_action.object.nil? || @subject.nil? || object.nil?

    data ||= @subject.skill_chain(object)
    data = data[@chain_action.object.stype_id]
    if data
      @chain_action.check_chain_action(data)
    else
      @chain_action = nil
    end
  end

  def clear_speed
    @speed = nil
    @force_move = nil
  end

  def guard?
    object == $data_skills[subject.guard_skill_id]
  end
end

class Game_ActionHistory
  def initialize(action)
    @using_item = Game_BaseItem.new
    @using_item.object = action.object
    @target_index = action.target_index
    @chain_action_history = Game_ActionHistory.new(action.chain_action) if action.chain_action
  end

  def create(subject, symbol = :count)
    result = _create(subject, symbol)
    result.check_chain_action
    result
  end

  def _create(subject, symbol = :count)
    result = Game_Action.new(subject)
    result.set_symbol(symbol)
    result.object = @using_item.object
    result.target_index = @target_index
    result.chain_action = @chain_action_history._create(subject, :chain_action) if @chain_action_history
    result
  end
end

#==============================================================================
# ■ Game_ActionResult
#==============================================================================
class Game_ActionResult
  MAX_DAMAGE = "究極"
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :unusable
  attr_accessor :predation
  attr_accessor :pleasure
  attr_accessor :hp_restore
  attr_accessor :mp_restore
  attr_accessor :stealed
  attr_accessor :stealed_item_empty
  attr_accessor :auto_stand
  attr_accessor :invalidate_wall
  attr_accessor :defense_wall
  attr_accessor :over_drive
  attr_accessor :binding_start
  attr_accessor :bind_resist
  attr_accessor :nightmare
  attr_accessor :ex_category_boost
  attr_accessor :state_boost
  attr_accessor :elements
  attr_accessor :element_rate
  attr_accessor :damage_rate
  attr_accessor :blocked
  attr_reader :stealed_items
  attr_accessor :hit_count

  #--------------------------------------------------------------------------
  # ○ クリア
  #--------------------------------------------------------------------------
  def clear
    clear_hit_flags
    clear_damage_values
    clear_status_effects
    clear_nwapeg_extends
    clear_stealed_information
    clear_battler_ability
    clear_binded_information
    clear_damage_display
  end

  def clear_hit_flags
    @used = false
    @missed = false
    @evaded = false
    @critical = false
    @success = false
    @blocked = false
    @ignore_add_state_flag = false
  end

  def clear_damage_display
    @nightmare = false
    @state_boost = []
    @ex_category_boost = []
    @elements = []
    @damage_rate = 1.0
    @weak_elements = []
    @hit_count = 0
  end

  def clear_stealed_information
    @stealed = false
    @stealed_item_empty = false
    @stealed_items = []
  end

  #--------------------------------------------------------------------------
  # ● 前任が拡張した機能情報のクリア
  # 要整理
  #--------------------------------------------------------------------------
  def clear_nwapeg_extends
    @unusable     = -1
    @predation    = false
    @pleasure     = false
    @hp_restore   = 0
    @mp_restore   = 0
  end

  #--------------------------------------------------------------------------
  # ● バトラーアビリティフラグのクリア
  #--------------------------------------------------------------------------
  def clear_battler_ability
    @auto_stand      = false
    @invalidate_wall = false
    @defense_wall    = false
    @over_drive      = false
  end

  #--------------------------------------------------------------------------
  # ● 拘束結果情報のクリア
  #--------------------------------------------------------------------------
  def clear_binded_information
    @binding_start   = -1
    @bind_resist     = false
  end

  #--------------------------------------------------------------------------
  # ○ 最終的に命中したか否かを判定
  #--------------------------------------------------------------------------
  def hit?
    @used && !@missed && !@evaded && !@blocked && @unusable == -1
  end

  #--------------------------------------------------------------------------
  # ● 還元される？
  #--------------------------------------------------------------------------
  def restoration?
    (0 < @hp_restore) || (0 < @mp_restore)
  end

  #--------------------------------------------------------------------------
  # ● 失敗時の文章を取得
  #--------------------------------------------------------------------------
  def unusable_text
    if (0...5).include?(@unusable)
      values = ["HP", "MP", "SP", "Gold", "of that item."]
      return format(Vocab::Shortage, values[@unusable])
    elsif @unusable == 5
      return Vocab::SkillSealedFailure
    elsif @unusable == 6
      return Vocab::TemptationActionFailure
    end
    ""
  end

  #--------------------------------------------------------------------------
  # ● ダメージ還元の文章を取得
  #--------------------------------------------------------------------------
  def restoration_text(subject)
    ary = []
    ary.push("#{@hp_restore.give_unit_floor(12)} HP") if 0 < @hp_restore
    ary.push("#{@mp_restore.give_unit_floor(12)} MP") if 0 < @mp_restore
    format(Vocab::ReStoration, subject.name, ary.join(",")) #NOTE: Healing text format change for translation
  end

  #--------------------------------------------------------------------------
  # ● 死亡したか
  #--------------------------------------------------------------------------
  def death_state_added?
    added_state_objects.any? { |state| state.death? }
  end

  #--------------------------------------------------------------------------
  # ● 快楽死亡したか
  #--------------------------------------------------------------------------
  def death_pleasure_state_added?
    added_state_objects.any? { |state| state.death_pleasure? }
  end

  def hp_damage_text
    prefix = @hit_count > 0 ? " #{@hit_count} hits totalling" : ""
    if @hp_drain > 0
      fmt = @battler.actor? ? Vocab::ActorDrain : Vocab::EnemyDrain
      value = @hp_drain >= NWConst::Damage::GIVE_UNIT ? @hp_drain.give_unit_floor(15) : @hp_drain
      value = MAX_DAMAGE if @hp_drain.unit_over?
      format(fmt, @battler.name, value, Vocab.hp) #NOTE: Damage display rearranged for translation
    elsif @hp_damage > 0
      fmt = @battler.actor? ? Vocab::ACTOR_DAMAGE : Vocab::ENEMY_DAMAGE
      value = @hp_damage >= NWConst::Damage::GIVE_UNIT ? @hp_damage.give_unit_floor(15) : @hp_damage
      value = MAX_DAMAGE if @hp_damage.unit_over?
      format(fmt, @battler.name, "#{prefix} \\c[#{damage_color}]#{value}\\c[0]", element_text)
    elsif @hp_damage < 0
      fmt = @battler.actor? ? Vocab::ActorRecovery : Vocab::EnemyRecovery
      value = -@hp_damage >= NWConst::Damage::GIVE_UNIT ? (-@hp_damage).give_unit_floor(15) : -@hp_damage
      value = MAX_DAMAGE if (-@hp_damage).unit_over?
      format(fmt, @battler.name, value, Vocab.hp) #NOTE: Damage display rearranged for translation
    else
      fmt = @battler.actor? ? Vocab::ActorNoDamage : Vocab::EnemyNoDamage
      format(fmt, @battler.name)
    end
  end

  def element_text
    @elements.delete(1)
    return "" if @elements.empty?

    elements =
      if @nightmare
        [NWConst::Elem::NIGHTMARE]
      elsif @pleasure
        [NWConst::Elem::PLEASURE]
      else
        @elements
      end
    texts = elements.sort.map { |id| $data_system.elements[id].gsub(/属性$/, "") || "" }.reject(&:empty?)
    return "" if texts.empty?

    t = if texts.size > 3
          "#{texts[0..2].join('・')} elements"
        else
          "#{texts.join('・')} element"
        end
  end

  def damage_color
    return 0 if @damage_rate == 1.0
    return 18 if @damage_rate >= 2.0
    return 29 if @damage_rate < 1.0

    17
  end

  def make_damage(value, item)
    @critical = false if value == 0
    @hp_damage = value if item.damage.to_hp?
    @mp_damage = value if item.damage.to_mp?
    @mp_damage = [@battler.mp, @mp_damage].min
    @hp_drain = @hp_damage if item.damage.drain?
    @mp_drain = @mp_damage if item.damage.drain?
    @hp_drain = [@battler.hp, @hp_drain].min
    @success = true if item.damage.to_hp? || @mp_damage != 0
    @ignore_add_state_flag = !item.damage.recover? && value <= 0
  end

  def add_state?
    !@ignore_add_state_flag
  end
end

#==============================================================================
# ■ Game_Actor
#==============================================================================
class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :last_select_command # カーソル記憶用 : アクターコマンド
  attr_accessor :last_select_stype # カーソル記憶用 : スキルタイプ
  attr_writer :equip_fix_flag
  attr_reader :chain_actions
  attr_reader :chain_action
  attr_reader :chain_action_input_index
  attr_reader :actor_id
  attr_accessor :favorite_edit_flag

  #--------------------------------------------------------------------------
  # ● 性別
  #--------------------------------------------------------------------------
  def sex
    actor.sex
  end

  def luca?
    actor.luca?
  end

  #--------------------------------------------------------------------------
  # ○ 主人格のRPG::Actorオブジェクト取得
  #--------------------------------------------------------------------------
  def original_persona_data_actor
    $data_actors[actor.original_persona_id]
  end

  #--------------------------------------------------------------------------
  # ● 使用効果のテスト
  #--------------------------------------------------------------------------
  def item_effect_test(user, item, effect)
    return @param_plus[effect.data_id] <= max_param_plus(effect.data_id) if effect.code == EFFECT_GROW
    return !max_level?([:base, :class, :tribe].at(effect.data_id)) if effect.code == EFFECT_GAIN_EXP

    super
  end

  #--------------------------------------------------------------------------
  # ● 能力値増加の最大値取得
  #--------------------------------------------------------------------------
  def max_param_plus(param_id)
    return NWConst::Actor::MAX_MHP_PLUS if param_id == 0 # MHP

    NWConst::Actor::MAX_PARAM_PLUS
  end

  #--------------------------------------------------------------------------
  # ● 攻撃力
  #--------------------------------------------------------------------------
  def atk
    giveup? || bind_target? ? super * 0.5 : super
  end

  #--------------------------------------------------------------------------
  # ● 防御力
  #--------------------------------------------------------------------------
  def def
    giveup? ? 0.0 : super
  end

  #--------------------------------------------------------------------------
  # ● 精神力
  #--------------------------------------------------------------------------
  def mdf
    giveup? ? 0.0 : super
  end

  #--------------------------------------------------------------------------
  # ● 素早さ
  #--------------------------------------------------------------------------
  def agi
    giveup? || bind_target? ? super * 0.5 : super
  end

  #--------------------------------------------------------------------------
  # ● 器用さ
  #--------------------------------------------------------------------------
  def luk
    giveup? || bind_target? ? super * 0.5 : super
  end

  #--------------------------------------------------------------------------
  # ● 床ダメージ率
  #--------------------------------------------------------------------------
  def fdr
    features_min(FEATURE_SPARAM, 8)
  end

  #--------------------------------------------------------------------------
  # ● 強化／弱体の全解除
  #--------------------------------------------------------------------------
  def remove_all_buffs
    clear_buffs
  end

  #--------------------------------------------------------------------------
  # ○ 武器オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def weapons
    equips.compact.select(&:weapon?)
  end

  #--------------------------------------------------------------------------
  # ○ 装備品オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def equips
    e = base_equips
    return e unless $game_party.in_battle

    states.select { |state| state.tmp_equip > 0 }.each do |state|
      e[0] = $data_weapons[state.tmp_equip]
    end
    e
  end

  def base_equips
    @equips.map(&:object)
  end

  #--------------------------------------------------------------------------
  # ● 誘惑時行動スキルIDの取得
  #--------------------------------------------------------------------------
  def temptation_skill_id
    return NWConst::Skill::NO_LUCA_TEMPTATION unless $game_party.in_member_luca?

    actor.temptation_skill || NWConst::Skill::DEFAULT_TEMPTATION
  end

  #--------------------------------------------------------------------------
  # ○ 通常能力値の最大値取得
  #--------------------------------------------------------------------------
  def param_max(param_id)
    return NWConst::Actor::MAX_MHP if param_id == 0 # MHP

    NWConst::Actor::MAX_PARAM
  end

  #--------------------------------------------------------------------------
  # ○ スキルオブジェクトの配列取得
  #--------------------------------------------------------------------------
  def skills
    (@skills | added_skills).sort.collect { |id| $data_skills[id] }
  end

  #--------------------------------------------------------------------------
  # ○ 床ダメージの基本値を取得
  #--------------------------------------------------------------------------
  def basic_floor_damage
    NWConst::Map::DAMAGE_FLOOR[$game_player.terrain_tag]
  end

  #--------------------------------------------------------------------------
  # ● 全回復
  #--------------------------------------------------------------------------
  def recover_all
    super
    init_tp
  end

  #--------------------------------------------------------------------------
  # ● 最大TP の最大値を取得【オーバーライド】
  #--------------------------------------------------------------------------
  def mtp_max
    NWConst::Actor::MAX_MSP
  end

  #--------------------------------------------------------------------------
  # ○ 最終的な経験獲得率の計算
  #--------------------------------------------------------------------------
  def final_exp_rate
    exr * (battle_member? ? 1 : reserve_members_exp_rate) * (death_state? ? 0 : 1) * accumulate_get_rate
  end

  #--------------------------------------------------------------------------
  # ● 最終的な職業経験獲得率の計算
  #--------------------------------------------------------------------------
  def final_cexp_rate
    cexr * (battle_member? ? 1 : reserve_members_exp_rate) * (death_state? ? 0 : 1) * accumulate_get_rate
  end

  def get_gold_rate
    super * accumulate_get_rate
  end

  def accumulate_get_rate
    return 1 unless $game_party.in_battle

    @cnt[:accumulate_get_rate] || 1
  end

  #--------------------------------------------------------------------------
  # ● スキル／アイテムの使用
  #    行動側に対して呼び出され、使用対象以外に対する効果を適用する。
  #--------------------------------------------------------------------------
  def use_item(item)
    super(item)
    item_effect_persona_change(item.persona_change)
  end

  #--------------------------------------------------------------------------
  # ● スキル／アイテムによる人格切替
  #--------------------------------------------------------------------------
  def item_effect_persona_change(persona_id)
    return if persona_id.nil?
    return if $game_actors[id] != $game_actors[persona_id]

    $game_party.persona_change(persona_id)
  end

  def item_effect_accumulate_get_rate_up(user, item, effect)
    return unless $game_party.in_battle
    return if @cnt[:accumulate_get_rate] >= 256

    @cnt[:accumulate_get_rate] *= 2
  end

  def item_effect_accumulate_get_rate_reset(user, item, effect)
    return unless $game_party.in_battle

    @cnt[:accumulate_get_rate] = 1
  end

  #--------------------------------------------------------------------------
  # ○ スキルタイプ配列に並べ替えを適用
  #--------------------------------------------------------------------------
  def sorted_stypes(stypes)
    @stype_sort ||= {}
    a = stypes
    b = stypes.sort_by { |stype| @stype_sort[stype] || stype }
    stypes.sort_by { |stype| @stype_sort[stype] || stype }
  end

  #--------------------------------------------------------------------------
  # ○ スキルタイプ並べ替えを実行
  #--------------------------------------------------------------------------
  def swap_stype_sort(a, b)
    @stype_sort ||= {}
    @stype_sort[a] ||= a
    @stype_sort[b] ||= b
    @stype_sort[a], @stype_sort[b] = @stype_sort[b], @stype_sort[a]
  end

  #--------------------------------------------------------------------------
  # ○ スキルタイプ並べ替えをリセット
  #--------------------------------------------------------------------------
  def clear_stype_sort
    @stype_sort = {}
  end

  #--------------------------------------------------------------------------
  # ● スキルタイプ非表示の判定
  #--------------------------------------------------------------------------
  def skill_type_disabled?(stype_id)
    @skill_types_disabled[stype_id]
  end

  #--------------------------------------------------------------------------
  # ● スキルタイプ非表示フラグの反転
  #--------------------------------------------------------------------------
  def flip_skill_type_disabled(stype_id)
    @skill_types_disabled[stype_id] = !@skill_types_disabled[stype_id]
  end

  #--------------------------------------------------------------------------
  # ● 床ダメージの処理
  #--------------------------------------------------------------------------
  def execute_floor_damage
    damage = (basic_floor_damage * $game_party.floor_damage_rate).to_i
    self.hp -= [damage, max_floor_damage].min
    perform_map_damage_effect if damage > 0
  end

  #--------------------------------------------------------------------------
  # ○ 自身が「指定カテゴリーを1つ以上持っている」かどうか
  #--------------------------------------------------------------------------
  def is_include_categories?(*categories)
    categories.each do |category|
      return true if actor.actor_categories.include?(category)
    end
    false
  end

  def skill_learnable?(skill)
    return false unless skill.is_a?(RPG::Skill)

    !skill.not_learn_actors.include?(actor.original_persona_id)
  end

  #--------------------------------------------------------------------------
  # ● 職業（種族）を忘れる
  #--------------------------------------------------------------------------
  def erase_class(class_id)
    return unless @level_list.key?(class_id)

    kind = NWConst::Class::JOB_RANGE.include?(class_id) ? :class : :tribe
    @exp[class_id] = 0
    @level_list.delete(class_id)
    current_class_id = kind == :class ? @class_id : @tribe_id
    @level_list[class_id] = 1 if current_class_id == class_id
  end

  def clear
    @class_id = actor.class_id
    @tribe_id = actor.initial_tribe_id
    @level_list = {}
    @exp = {}
    init_level
    init_exp
    init_skills
    clear_param_plus
    recover_all
  end

  #--------------------------------------------------------------------------
  # ● 通常能力値の基本値取得
  #--------------------------------------------------------------------------
  def param_base(param_id)
    base.param(param_id, base_level)
  end

  def refresh_ability(stype_id)
    f = false
    ab = abilities(stype_id)
    @equip_abilities[stype_id].select! do |ability|
      ab.include?(ability) && $data_skills[ability].class_conditions_met?(self)
    end
    while ap(stype_id) > max_ap(stype_id)
      eq = @equip_abilities[stype_id]
      if $data_skills[eq.last].memorize_cost == 0
        rid = eq.rindex { |e| $data_skills[e].memorize_cost > 0 }
        eq.swap!(-1, rid) if rid
      end
      eq.pop
    end
    f
  end

  def refresh_ability_all
    loop do
      f = equip_abilities.each_key.map { |key| refresh_ability(key) }.any?
      return unless f

      release_unequippable_items
    end
  end

  def make_auto_battle_actions(type = :auto)
    @actions = auto_battle_actions(@actions.size, type).each { |act| act.set_symbol(:count) }
  end

  def auto_battle_actions(size, type = :auto)
    return repeat_action if type == :repeat

    skill_list = skills
    secondary_skill_list = []
    usable_skilltypes = added_skill_types
    skill_list.select! do |skill|
      next if skill.ability?
      next if skill.stypes.all? { |type| !usable_skilltypes.include?(type) }
      next true unless $game_system.conf[:bt_stype]

      skill.stypes.none? { |type| skill_type_disabled?(type) }
    end
    result = []
    size.times do |_i|
      result << make_auto_battle_action(skill_list, secondary_skill_list, type)
    end
    result
  end

  def make_auto_battle_action(skill_list, secondary_skill_list, type = :auto)
    member = opponents_unit.alive_members.size
    return Game_Action.new(self).set_bind_resist if bind?
    return Game_Action.new(self).set_attack if type == :attack_only

    until skill_list.empty?
      base_skill = skill_list.sample
      skill = base_skill.change(self)
      next skill_list.delete(base_skill) if skill.no_auto_battle?(type)
      next skill_list.delete(base_skill) if type == :not_mp_skill && skill_mp_cost(skill) != 0

      if [:auto, :normal].include?(type) && ((member == 1 && skill.for_all?) || (member > 1 && !skill.for_all?))
        secondary_skill_list.push(skill)
        next skill_list.delete(base_skill)
      end
      next skill_list.delete(base_skill) unless usable?(skill)

      return Game_Action.new(self).set_skill(skill.id)
    end
    until secondary_skill_list.empty?
      skill = secondary_skill_list.sample
      next secondary_skill_list.delete(skill) unless usable?(skill)

      return Game_Action.new(self).set_skill(skill.id)
    end
    Game_Action.new(self).set_attack
  end

  def enchant_unequip
    @equips.each do |item|
      if item.object && item.object.enchant_item?
        trade_item_with_party(nil, item.object)
        item.object = nil
      end
    end
    refresh
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    release_unequippable_items
    refresh_ability_all
    $game_actors[id].refresh_socket_items if $game_actors && $game_actors.exist?(id)
    super
  end

  def abilities(stype_id = nil)
    return @abilities unless stype_id

    @abilities[stype_id] + added_abilities(stype_id)
  end

  def added_abilities(stype_id)
    added_skills.select { |id| $data_skills[id].stype_id == stype_id }
  end

  def booster_actor_exist_param(param_id)
    return 1.0 unless (2..7).include?(param_id)

    $game_party.members.inject(1.0) do |rate, member|
      rate + features_sum_booster(ACTOR_EXIST_PARAM, member.id)
    end
  end

  def last_select_skill_in_battle(stype)
    @last_select_skill_in_battle ||= []
    @last_select_skill_in_battle[stype] ||= Game_BaseItem.new
  end

  def last_select_skill(stype)
    return last_select_skill_in_battle(stype) if $game_party.in_battle

    @last_select_skill ||= []
    @last_select_skill[stype] ||= Game_BaseItem.new
  end

  def get_last_skill(stype_id)
    last_select_skill(stype_id).object
  end

  def set_last_skill(stype_id, skill)
    last_select_skill(stype_id).object = skill
  end

  def get_last_stype
    return @last_select_stype unless $game_party.in_battle

    if @chain_action_input_index >= 0
      @last_select_stype_in_chain ||= []
      return @last_select_stype_in_chain[@chain_action_input_index]
    end
    @last_select_stype_in_battle
  end

  def set_last_stype(stype_id)
    if !$game_party.in_battle
      @last_select_stype = stype_id
    elsif @chain_action_input_index >= 0
      @last_select_stype_in_chain ||= []
      @last_select_stype_in_chain[@chain_action_input_index] = stype_id
    else
      @last_select_stype_in_battle = stype_id
    end
  end

  def init_level
    actor.init_class_level.each do |obj|
      @level_list[obj[:id]] = [[obj[:lv], 1].max, $data_classes[obj[:id]].max_lv].min
    end
    @level_list[@class_id] = 1 unless @level_list.key?(@class_id)
    @level_list[@tribe_id] = 1 unless @level_list.key?(@tribe_id)
    @level = { :base => actor.initial_level, :class => @level_list[@class_id], :tribe => @level_list[@tribe_id] }
  end

  def bugfix_class_lv
    return if $game_temp.bugfixed?([:class_lv, id])

    @level_list.each do |cid, clv|
      next if cid == BASE_CLASS_ID

      @level_list[cid] = clv.clamp(1, $data_classes[cid].max_lv)
    end
  end

  def reset(persona_id)
    oid = actor.original_persona_id
    clear_equipments
    setup(oid)
    persona_change(persona_id)
  end

  def bugfix_empty_data
    return if $game_temp.bugfixed?([:empty_data, id])

    return unless name == "" && actor.name != ""

    reset(@actor_id)
  end

  def version_update
    @state_turn_counts ||= {}
    @states.each { |state_id| @state_turn_counts[state_id] ||= -1 }
    action_history.map! { |act| act.is_a?(Game_Action) ? Game_ActionHistory.new(act) : act }
    change_slot
  end

  def version_update_class_lv
    tclass_id = class_id
    ttribe_id = tribe_id
    changed = false
    tab = nil
    f = false
    @exp.each do |cid, cexp|
      next if cid == BASE_CLASS_ID

      klass = $data_classes[cid]
      next unless klass.kind
      next if klass.max_lv == 10 || @level_list[cid] == klass.level_for_exp(cexp)

      unless changed
        changed = true
        tab = @equip_abilities.dup
        f = equip_fixed?
        @equip_fix_flag = true
      end

      change_class(cid, klass.kind)
      change_exp(cexp, false, klass.kind)
    end
    return unless changed

    change_class(tclass_id, :class)
    change_class(ttribe_id, :tribe)
    @equip_abilities = tab
    @equip_fix_flag = f
  end

  def actor
    $data_actors[@actor_id]
  end

  def weapon_mastery_bonus
    weapons.map { |weapon| weapon.weapon_rate_bonus }.flatten
  end

  def repeat_action
    s = skills
    @actions.map.with_index do |_, i|
      action = action_history[i] ? action_history[i].create(self) : nil
      if action.nil? || (!action.attack? && !action.guard? && !s.include?(action.object)) || !action.valid? || bind?
        auto ||= auto_battle_actions(actions.size, :normal)
        next auto[i]
      end
      action
    end
  end

  def action_history
    @action_history ||= []
  end

  def set_action_history
    return unless inputable?

    result = @actions.select(&:object).map { |act| Game_ActionHistory.new(act) }
    @action_history = result unless result.empty?
  end

  def awakening?
    actor.awakening?
  end

  def awaken_add_features
    awakening? ? [$data_classes[actor.awaken_feature_id]] : []
  end

  def booster_weapon_equip_size(item)
    return 1.0 if equip_shield? && weapons.size >= 2

    item.weapon_equip_size_boost(weapons.size)
  end

  def booster_considerate(item)
    (1.0 + friends_unit.dead_members.size * considerate) * (1.0 + friends_unit.dead_members.size * item.considerate_revise)
  end

  def booster_ex_count
    value = 1.0
    value *= booster_battle_count
    value *= booster_actor_carry
    value *= booster_actor_down
    value *= booster_actor_orgasm
    value *= booster_actor_defeat
    value *= booster_actor_steal
    value *= booster_actor_love
    value
  end

  def booster_battle_count
    ex_count_boost(Booster::BATTLE_COUNT, $game_system.battle_count)
  end

  def booster_actor_carry
    ex_count_boost(Booster::ACTOR_CARRY, $game_library.actor_carry(id))
  end

  def booster_actor_defeat
    ex_count_boost(Booster::ACTOR_DEFEAT, $game_library.actor_defeat(id))
  end

  def booster_actor_down
    ex_count_boost(Booster::ACTOR_DOWN, $game_library.actor_down(id))
  end

  def booster_actor_orgasm
    ex_count_boost(Booster::ACTOR_ORGASM, $game_library.actor_orgasm(id))
  end

  def booster_actor_steal
    ex_count_boost(Booster::ACTOR_STEAL, $game_library.actor_steal(id))
  end

  def booster_actor_love
    ex_count_boost(Booster::ACTOR_LOVE, love)
  end

  def ex_count_boost(id, count)
    fts = features_with_id(FEATURE_MULTI_BOOSTER, id)
    return 1.0 if fts.empty?

    rate = fts.map(&:value).min
    1.0 + count / (rate * 10_000.0)
  end

  def item_wield_boost(item)
    return 1.0 if item.nil? || !item.weapon?

    w = weapons
    return 1.0 if w.empty? || w.size >= 2 && equip_shield?

    booster_wield(w.size)
  end

  def booster_wield(weapon_size)
    features_with_id(FEATURE_WIELD_BOOST, weapon_size).inject(1.0) do |r, ft|
      r + ft.value[0]
    end
  end

  def init_name
    @name = $game_system.change_history[:name].fetch(id, nil) || actor.name
  end

  def init_nickname
    @nickname = $game_system.change_history[:nickname].fetch(id, nil) || actor.nickname
  end

  def init_graphics
    graphic_data = $game_system.change_history[:graphic].fetch(id, nil)
    return set_graphic(*graphic_data) if graphic_data

    @character_name = actor.character_name
    @character_index = actor.character_index
    @face_name = actor.face_name
    @face_index = actor.face_index
  end

  def learning?
    !features(FEATURE_LEARNING).empty?
  end

  def learning_valid?
    Array(NWConst::State::LEARNING_INVALID).all? { |id| !state?(id) }
  end

  def use_item_learning_skill(item)
    unless item && item.learning_skill && learning? && !skill_learn?($data_skills[item.learning_skill]) && skill_learnable?(item)
      return false
    end

    learn_skill(item.learning_skill)
    true
  end

  def pay_skill_cost_h(skill, values)
    super
    $game_party.lose_gold(values.fetch(:GOLD, 0))
    return unless rand >= item_cost_scrimp_type(skill)

    values.fetch(:ITEM, []).each do |cost|
      next if rand < item_cost_scrimp(cost[:id])

      $game_party.lose_item($data_items[cost[:id]], cost[:num])
    end
  end

  def make_cost_value(skill)
    result = super
    result[:HP] = skill_hp_cost(skill)
    result[:GOLD] = skill_gold_cost(skill)
    result[:ITEM] = skill_cost_item(skill)
    result
  end

  def skill_cost_payable_h?(values)
    super &&
      $game_party.gold >= values.fetch(:GOLD, 0) &&
      values.fetch(:ITEM, []).all? { |cost| cost[:num] <= $game_party.item_number($data_items[cost[:id]]) }
  end

  def init_tp
    self.tp = init_tp_value
  end

  def init_tp_value
    (max_tp * start_tp_rate).ceil
  end

  def on_battle_start
    @temp_max_tp = init_tp_value if max_tp < init_tp_value
    super
  end

  def on_battle_end
    super
    @temp_max_tp = nil
    self.tp = tp
  end

  #--------------------------------------------------------------------------
  # ○ 特徴を保持する全オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def feature_objects
    obj = super + [actor] + [self.class] + [tribe] + equips.compact + stones_armor_data + ability_feature_objects + human_add_features + awaken_add_features + set_effect
    obj += obj.dual_shield_ability if equip_dual_shield?
    boost = obj.equip_booster
    obj += equips.compact.map { |equip| [equip] * boost[equip.base_etype_id] }.flatten.compact
    obj.filter = Hima::FeatureObjects::Filter::GIVEUP if giveup?
    obj
  end

  def plus_max_tp
    equips.compact.select(&:enchant_item?).inject(0) { |i, equip| i + equip.max_sp }
  end

  def stones_armor_data
    equips.compact.map { |equip| equip.stones_armor_data }.flatten
  end

  def max_tp
    return @temp_max_tp if @temp_max_tp

    base_max_tp
  end

  def base_max_tp
    result = actor.base_tp + plus_max_tp + increase_tp_fix
    result += actor.tp_level_revise * [base_level, 98].min + actor.tp_level100_revise * [base_level - 99, 0].max
    result = (result * increase_tp_per).ceil
    result.clamp(1, mtp_max)
  end

  def refresh_tp
    if @temp_max_tp
      next_max_tp = [@tp, @temp_max_tp].min
      @temp_max_tp = nil
      @temp_max_tp = next_max_tp if next_max_tp > max_tp
    end
    super
  end

  def set_effect_count
    equips.compact.map(&:set_effects).flatten.group_by(&:itself).transform_values(&:count)
  end

  def set_effect
    set_effect_count.map { |effect, count| effect.effects(count) }.flatten.compact
  end

  def copy_all(actor_id)
    copy_skills(actor_id)
    copy_level(actor_id)
  end

  def copy_skills(actor_id)
    (@skills + @abilities.values.flatten).each do |id|
      $game_actors[actor_id].learn_skill(id)
    end
  end

  def copy_level(actor_id)
    $game_actors[actor_id].change_level(base_level, false, :base) if $game_actors[actor_id].base_level < base_level
    @level_list.each do |id, lv|
      $game_actors[actor_id].level_list[id] = lv if $game_actors[actor_id].level_list.fetch(id, 0) < lv
    end
  end

  def equip_fixed?
    @equip_fix_flag
  end

  def equip_type_fixed?(etype_id)
    equip_fixed? || super
  end

  def skill_conditions_met?(skill)
    return false if skill.id == bind_resist_skill_id && !bind?

    super && skill_need_dual_wield?(skill) && skill_need_dual_shield?(skill) && skill.need_item.all? do |item_id|
      $game_party.has_item?($data_items[item_id]) || need_item_ignore?(item_id)
    end
  end

  def atk_animation_ids
    result = []
    result.push(NWConst::Actor::DUAL_SHIELD_ANIMATION_ID) if equip_shield_with_weapon_slot?
    result += weapons.map(&:animation_id)
    result.push(1) if result.empty?
    result
  end

  def equip_dual_shield?
    armors.compact.select(&:shield?).size == 2
  end

  def equip_shield?
    armors.compact.any?(&:shield?)
  end

  def equip_shield_with_weapon_slot?
    return false unless equip_dual_shield?

    e = equips[0]
    e && e.shield?
  end

  def wtypes
    result = []
    result.push(99) if equip_shield_with_weapon_slot?
    result += weapons.map(&:wtype_id)
    return [0] if result.empty?

    result.uniq
  end

  def atypes
    armors.map(&:atype_id).uniq
  end

  def wtype_equipped?(wtype_id)
    wtypes.include?(wtype_id)
  end

  def skill_need_dual_shield?(skill)
    return true unless skill.need_dual_shield?
    return true if equip_dual_shield?

    false
  end

  def param_plus(param_id)
    base = [@param_plus[param_id], max_param_plus(param_id)].min
    base + equip_params[param_id]
  end

  def equip_params
    params = equips.map.with_index do |item, index|
      next Array.new(8, 0) if item.nil?

      rate = item_mastery_rate(item, index)
      rate2 = item_wield_boost(item)
      item.params.map { |param| param * rate * rate2 }
    end

    params.transpose.map { |p| p.inject(:+) }
  end

  def item_mastery_rate(item, index = nil)
    ft_ids = case item
             when RPG::Weapon
               [[0, item.wtype_id]] + weapon_mastery_bonus.map { |wmb| [0, wmb] }.uniq
             when RPG::Armor
               [[1, item.atype_id]] + shield_mastery_bonus(item, index)
             else
               return 1.0
             end
    masteries = ft_ids.map { |ft_id| features_with_id(NWFeature::FEATURE_EQUIP_MASTERY, ft_id) }.flatten
    return 1.0 if masteries.empty?

    masteries.map(&:value).max
  end

  def shield_mastery_bonus(item, index)
    return [] if index.nil? || !item.shield? || index != 0 || !equip_dual_shield?

    [[0, 99]]
  end

  #--------------------------------------------------------------------------
  # ● スキルの二刀流要求判定
  #--------------------------------------------------------------------------
  def skill_need_dual_wield?(skill)
    return true unless skill.need_dual_wield?
    return true if weapons.size >= 2 && !equip_shield?

    false
  end

  def skill_cost_item(skill)
    skill.item_cost.map do |cost|
      { :id => cost[:id], :num => cost[:num] * item_cost_rate(skill) }
    end
  end

  def skill_need_item?(skill)
    skill_cost_item(skill).all? { |cost| cost[:num] <= $game_party.item_number($data_items[cost[:id]]) } &&
      skill.need_item.all? do |item_id|
        $game_party.has_item?($data_items[item_id]) || need_item_ignore?(item_id)
      end
  end

  def max_ap(stype_id)
    return 0 unless self.class.memorize_capacity_revise[stype_id]

    [((self.class.memorize_capacity_revise[stype_id] + max_ap_bonus(stype_id)) * (1.0 + max_ap_rate(stype_id))).to_i,
     0].max
  end

  def max_ap_rate(stype_id)
    features_sum(FEATURE_MAX_AP_RATE, stype_id)
  end

  def max_ap_bonus(stype_id)
    features_sum(FEATURE_MAX_AP_BONUS, stype_id).to_i
  end

  def change_ability(index, ability_id)
    stype_id = $data_skills[ability_id].stype_id
    @equip_abilities[stype_id][index] = ability_id
    delete_not_jumble(ability_id)
    refresh
  end

  def add_ability(*ability_ids)
    ability_ids.each do |ability_id|
      stype_id = $data_skills[ability_id].stype_id
      @equip_abilities[stype_id].push(ability_id)
      delete_not_jumble(ability_id)
    end
    refresh
  end

  def remine_input
    @actions.size - @action_input_index
  end

  def skill_chain(skill)
    ar = skill_type_chain(skill)
    return {} if ar.empty?

    ar.inject({}) do |hash, data|
      hash.deep_merge(data.to_nested_hash)
    end
  end

  def action_tree
    r = []
    act = @actions[@action_input_index]
    while act && act.item
      r << act
      act = act.chain_action
    end
    r
  end

  def setup_chain_action
    return if chain_input? || input.nil?

    @actions[@action_input_index].chain_action = nil
    current = input
    return unless current.item

    d = skill_type_chain(current.item)
    return if d.empty?

    @chain_actions = Array.new(d.max_by(&:size).size) do
      Game_Action.new(self).set_symbol(:chain_action)
    end
    @skill_chain_data = skill_chain(current.item)
    ([current] + @chain_actions).each_cons(2) do |parent, child|
      parent.chain_action = child
    end

    @chain_action_input_index = -1
  end

  def setup_chain_action_stypes
    return unless chain_input?
    return unless input

    stypes = next_chain_action_stypes
    return end_chain_action if stypes.empty?

    input.set_stypes(stypes)
  end

  def next_chain_action_stypes(next_stype = nil)
    stype_history = (action_tree[1..-1] || []).map { |act| act.object.stypes }
    stype_history << [next_stype] if next_stype
    result = stype_history.inject(@skill_chain_data) do |h, chain_data|
      chain_data.map { |stype| h[stype] || {} }.inject({}) { |hh, hash| hh.deep_merge(hash) }
    end

    return [] unless result

    result.keys
  end

  def end_chain_action
    action_tree.last.chain_action = nil
    @chain_action_input_index = @chain_actions.size
  end

  def chain_input?
    !@chain_actions.empty?
  end

  def next_chain_action?
    chain_input? && @chain_actions[@chain_action_input_index + 1]
  end

  def input
    return @chain_actions[@chain_action_input_index] if chain_input?

    @actions[@action_input_index]
  end

  def next_command
    setup_chain_action
    @chain_action_input_index += 1
    setup_chain_action_stypes
    if !chain_input? || @chain_action_input_index >= @chain_actions.size
      clear_chain_actions
      return false if @action_input_index >= @actions.size - 1

      @action_input_index += 1
      return true
    end

    true
  end

  def prior_command
    unless chain_input?
      return false if @action_input_index <= 0

      @action_input_index -= 1
      return true
    end

    if @chain_action_input_index <= 0
      clear_chain_actions
      @actions[@action_input_index].chain_action = nil
    else
      @chain_action_input_index -= 1
      input.clear
    end
    true
  end

  #--------------------------------------------------------------------------
  # ● 戦闘行動のクリア
  #--------------------------------------------------------------------------
  def clear_actions
    super
    @action_input_index = 0
    clear_chain_actions
  end

  def clear_chain_actions
    @chain_actions ||= []
    @chain_actions.clear
    @chain_action_input_index = -1
  end

  def trade_item_with_party(new_item, old_item)
    $game_party.trade_item(new_item, old_item)
  end

  def basic_equip_slots
    return extra_basic_equip_slots if extra_accessory_slot?

    [0, 1, 2, 3, 4]
  end

  def extra_basic_equip_slots
    [0, 1, 2, 3, 5, 6]
  end

  def change_slot
    if extra_accessory_slot?
      return unless @equips.size == 5

      @equips[5] = Game_BaseItem.new
      e = @equips[4].object
      return if e.nil? || equippable_slot?(4, e)

      @equips[5].object = e
      @equips[4].object = nil
    else
      return unless @equips.size == 6

      r = false
      e = @equips[4].object
      ee = @equips[5].object
      if e.nil? && ee
        @equips[4].object = ee
      elsif ee
        change_equip(5, nil)
      end
      @equips.pop
    end
  end

  def slot_name(index)
    Vocab.etype(basic_equip_slots[index])
  end

  def default_equip_slots
    basic_equip_slots.map { |i| NWConst::Slot::CHANGE_MAP[i] }
  end

  def extra_accessory_slot?
    $game_switches[NWConst::Sw::EXTRA_ACCESSORY_SLOT]
  end

  def equip_slots
    slot = default_equip_slots
    slot[0] |= NWConst::Slot::SHIELD if dual_shield?
    slot[1] |= NWConst::Slot::WEAPON if dual_wield?
    slot[4] |= NWConst::Slot::WEAPON if triple_wield?
    slot[5] |= NWConst::Slot::WEAPON if triple_wield? && extra_accessory_slot?
    slot
  end

  def slot_list(etype_id)
    etype_id = NWConst::Slot::CHANGE_MAP[etype_id]
    result = []
    equip_slots.each_with_index { |e, i| result.push(i) if (e & etype_id) == etype_id }
    result
  end

  def equip_change_ok?(slot_id)
    return false if equip_type_fixed?(basic_equip_slots[slot_id])
    return false if equip_type_sealed?(basic_equip_slots[slot_id])

    true
  end

  def change_equip(slot_id, item)
    return unless trade_item_with_party(item, equips[slot_id])

    b = @equips[slot_id].object
    @equips[slot_id].object = item
    refresh_socket_item(slot_id)
    b.trade_stone(@equips[slot_id].object) if b
    $game_party.restore_socket_item(b)
    refresh
  end

  def change_equip_empty_slot(item)
    return unless item

    change_equip(empty_slot(item.etype_id), item)
  end

  def change_equip_by_id(slot_id, item_id)
    if default_equip_slots[slot_id] == NWConst::Slot::WEAPON
      change_equip(slot_id, $data_weapons[item_id])
    else
      change_equip(slot_id, $data_armors[item_id])
    end
  end

  def vxace_sp1_release_unequippable_items(item_gain = true)
    CacheActorFeatures.init_actor(self)
    @equips.each_with_index do |item, i|
      next if equip_type_fixed?(basic_equip_slots[i]) || item.object.nil? || (equippable?(item.object) && equippable_slot?(
        i, item.object
      ))

      i = item.object
      item.object = nil
      next unless item_gain

      trade_item_with_party(nil, i)
      $game_party.restore_socket_item(i)
    end
  end

  def optimize_equipments
    accessory = equips[4]
    accessory2 = equips[5] if extra_accessory_slot?
    clear_equipments
    4.times do |i|
      next unless equip_change_ok?(i)

      items = $game_party.equip_items.select do |item|
        equippable?(item) && equippable_slot?(i, item) && item.performance >= 0
      end
      change_equip(i, items.max_by { |item| item.performance })
    end
    change_equip(4, accessory)
    change_equip(5, accessory2) if extra_accessory_slot?
  end

  def equippable_slot?(slot_id, item)
    return false unless equip_slots[slot_id].anybits?(NWConst::Slot::CHANGE_MAP[item.etype_id])

    if item.not_dual_wield?
      e = equips
      e.delete_at(slot_id)
      return false if e.compact.any?(&:weapon?)
    end

    return true if !extra_accessory_slot? || !item.weapon? || slot_id < 4

    other_slot_id = slot_id == 4 ? 5 : 4
    equip = equips[other_slot_id]
    equip.nil? || !equip.weapon?
  end

  def sort_obj
    actor.sort_obj
  end

  def relearn_skills
    original_persona_data_actor.peculiar_skill.each do |obj|
      learn_skill(obj[:id]) if obj[:lv] <= base_level
    end
    @level_list.each do |id, level|
      $data_classes[id].learnings.each do |learning|
        learn_skill(learning.skill_id) if learning.level <= level
      end
    end
    actor.init_abilities.each do |id|
      skill = $data_skills[id]
      next unless skill

      learn_skill(id)
    end
    @skill_types_disabled = $data_system.skill_types.collect { |_stype| false }
  end

  def learn_skills
    @skills.map { |skill_id| $data_skills[skill_id] }
  end

  def chain_boost?
    return false unless $game_party.in_battle

    @chain_action_input_index >= 0 || current_action && current_action.symbol == :chain_action
  end

  def skill_change(id)
    $data_skills[id].change(self)
  end

  def remove_equip(item)
    slot_id = base_equips.index(item)
    return false unless slot_id

    change_equip(slot_id, nil)
    true
  end

  def index_to_etype_id(index)
    case index
    when 0
      return 1 if dual_shield?
    when 1
      return 0 if dual_wield?
    when 4
      return 0 if triple_wield?
    end
    index
  end

  def refresh_ability_update
    loop do
      next if @equip_abilities.values.any? { |v| v.any? { |id| delete_not_jumble(id) } }

      break
    end
    refresh_ability_all
  end

  def delete_not_jumble(ability_id)
    skill = $data_skills[ability_id]
    @equip_abilities[skill.stype_id].reject! do |equip_id|
      skill.not_jumble_memorize.include?(equip_id)
    end
  end

  def change_actor_skill_id(args)
    all_learn_skills = (all_abilities + @skills).uniq
    all_equip_abilities = self.all_equip_abilities
    @abilities = {}
    @equip_abilities = {}
    NWConst::Ability::INIT_ABILITY_SKILL_TYPE.each do |stype_id|
      @abilities[stype_id] = []
      @equip_abilities[stype_id] = []
    end
    bef = args.map { |a| a[0] }
    @skills = []
    b = proc do |id|
      i = bef.index(id)
      next id unless i

      args[i][1]
    end
    all_learn_skills.map!(&b)
    all_equip_abilities.map!(&b)
    all_learn_skills.each do |skill_id|
      learn_skill(skill_id)
    end

    all_equip_abilities.group_by { |id| $data_skills[id].stype_id }.each do |k, v|
      v.each_with_index { |ability_id, index| @equip_abilities[k][index] = ability_id }
    end
  end

  def refresh_socket_items
    equip_slots.size.times do |i|
      refresh_socket_item(i)
    end
  end

  def refresh_socket_item(slot_id)
    equip = base_equips[slot_id]
    return unless equip

    if equip.need_socket?
      equip = equip.create_socket_item
      @equips[slot_id].object = equip
    end
    $game_party.add_item_data(equip, 0) if equip.uniq_item?
  end

  def word_id
    id
  end

  def init_equips(equips)
    @equips = Array.new(basic_equip_slots.size) { Game_BaseItem.new }
    equips.each_with_index do |item_data, i|
      next unless item_data
      next if @equips[i].nil?

      etype_id = item_data[1] || index_to_etype_id(i)
      if i == 4 && etype_id != NWConst::Etype::WEAPON && extra_accessory_slot? && $data_armors[item_data[0]].etype_id == NWConst::Etype::ACCESSORY2 && equips[5].nil?
        i = 5
      end
      @equips[i].set_equip(etype_id == NWConst::Etype::WEAPON, item_data[0])
      refresh_socket_item(i)
      next unless item_data[2]

      item_data[2].each_with_index do |stone_id, slot_index|
        stone = $data_items[stone_id]
        $game_party.gain_item(stone, 1)
        @equips[i].object.change_stone(slot_index, stone) if @equips[i]
      end
    end
    refresh
  end

  def discard_equip_include_uniq(item)
    item = item.base_data
    slot_ids = equips.each_with_object([]).with_index do |(equip, obj), index|
      obj << index if equip && equip.base_data == item
    end
    return false if slot_ids.empty?

    slot_id = slot_ids.sort_by { |i| [@equips[i].object.stones.compact.size, i] }.first
    obj = @equips[slot_id].object
    @equips[slot_id].object = nil if slot_id
    $game_party.delete_item_data(obj) if obj && obj.socket_item?
    true
  end

  def word_conditions_met?(word)
    if temptation?
      word.condition == :temptation?
    else
      super || word.condition == :actor?
    end
  end

  def item_effect_gain_tp(user, item, effect)
    return super unless $game_party.in_battle

    value = (base_max_tp * effect.value1.to_f * 0.01).ceil
    @temp_max_tp = value if value > max_tp
    @result.tp_damage -= value
    @result.success = true if value != 0
    self.tp += value
  end

  def learn_master_ability?
    a = @abilities[NWConst::Ability::MASTER_ABILITY_STYPE]
    a && !a.empty?
  end

  def favorite_edit?
    @favorite_edit_flag
  end

  def ability_form
    @ability_form ||= AbilityForm.new
  end

  def save_abilities(index)
    ability_form.save(index, @equip_abilities)
  end

  def load_abilities(index)
    @equip_abilities.merge!(ability_form.load(index))
  end
end

class Game_Actors
  include Enumerable

  attr_accessor :bugfix_ignore_flag
  def initialize
    @data = []
    @update = { :class_lv => true }
    NWConst::Skill::REPLACE_ID.each_key { |key| @update[key] = true }
  end

  #--------------------------------------------------------------------------
  # ● 主人格のIDへ変換
  #--------------------------------------------------------------------------
  def original_id(actor_id)
    return nil unless $data_actors[actor_id]

    actor = $data_actors[actor_id]
    actor.persona_kind == :sub ? actor.original_persona_id : actor_id
  end

  #--------------------------------------------------------------------------
  # ● 存在する？
  #--------------------------------------------------------------------------
  def exist?(actor_id)
    id = original_id(actor_id)
    id && !@data[id].nil?
  end

  def each(&block)
    @data.each_with_index do |e, index|
      next unless e

      bugfix(index)
      block.call(e)
    end
  end

  alias nw_persona_array []
  def [](actor_id)
    return nil unless $data_actors[actor_id]

    actor = $data_actors[actor_id]
    id = actor.original_persona_id
    return nil unless $data_actors[id]

    unless @data[id] 
      @data[id] = Game_Actor.new(id)
      @data[id].recover_all
    end
    bugfix(id)
    @data[id]
  end

  def version_update
    each(&:version_update)
    refresh_skill_update
    each(&:version_update_class_lv) unless version_update?(:class_lv)
  end

  def version_update?(key)
    @update ||= {}
    if @update[key]
      true
    else
      @update[key] = true
      false
    end
  end

  def refresh_skill_update
    results = NWConst::Skill::REPLACE_ID.keys.map do |key|
      r = NWConst::Skill::REPLACE_ID.fetch(key, nil)
      next unless r
      next if version_update?(key)

      @data.compact.each do |e|
        e.change_actor_skill_id(r)
      end
    end
    return unless results.any?

    each do |actor|
      actor.refresh_ability_update
    end
  end

  def bugfix(actor_id)
    return if bugfix_ignore_flag

    @data[actor_id].bugfix_empty_data
    @data[actor_id].bugfix_learned_ability_type
    @data[actor_id].bugfix_skills
    @data[actor_id].bugfix_class_lv
  end
end

class Game_BaseItem
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    @class = nil
    @item_id = 0
    @object = nil
  end

  #--------------------------------------------------------------------------
  # ● クラス判定
  #--------------------------------------------------------------------------
  def is_skill?
    @class <=> RPG::Skill
  end

  def is_item?
    @class <=> RPG::Item
  end

  def is_weapon?
    @class <=> RPG::Weapon
  end

  def is_armor?
    @class <=> RPG::Armor
  end

  #--------------------------------------------------------------------------
  # ● アイテムオブジェクトの取得
  #--------------------------------------------------------------------------
  def object
    result = @object || (container ? container[@item_id] : nil)
  end

  def container
    return $data_skills if is_skill?
    return $data_items if is_item?
    return $data_weapons if is_weapon?
    return $data_armors if is_armor?

    nil
  end

  #--------------------------------------------------------------------------
  # ● アイテムオブジェクトの設定
  #--------------------------------------------------------------------------
  def object=(item)
    @object = nil
    if item
      @object = item if item.uniq_item?
      @item_id = item.id
      @class = item.class
    else
      @item_id = 0
      @class = nil
    end
  end
end

#==============================================================================
# ■ Game_Battler
#==============================================================================
class Game_Battler < Game_BattlerBase
  attr_reader :speed
  attr_reader :state_turns
  attr_accessor :action_count
  attr_reader :current_action_index
  attr_accessor :turn_hit_damage_count
  attr_accessor :result

  #--------------------------------------------------------------------------
  # ● Mix-In（使用効果）
  #--------------------------------------------------------------------------
  include NWUsableEffect

  #--------------------------------------------------------------------------
  # ○ オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    @battler_name = ""
    @battler_hue = 0
    @actions = []
    @speed = 0
    @result = Game_ActionResult.new(self)
    @last_target_index = 0
    @guarding = false
    clear_sprite_effects
    clear_counter
    super
  end

  #--------------------------------------------------------------------------
  # ● 性別
  #--------------------------------------------------------------------------
  def sex
    NWSex::FEMALE
  end

  #--------------------------------------------------------------------------
  # ● ルカ？
  #--------------------------------------------------------------------------
  def luca?
    false
  end

  #--------------------------------------------------------------------------
  # ● 行動回数の決定
  #--------------------------------------------------------------------------
  def make_action_times
    times = action_plus_set.inject(1) do |r, p|
      par = p
      if par > 1.0
        r += par / 1.0
        par %= 1.0
      end
      rand < par ? r + 1 : r
    end
    times -= action_minus
    [times, 0].max
  end

  #--------------------------------------------------------------------------
  # ● 捕食されているか
  #--------------------------------------------------------------------------
  def predationed?
    @predationed
  end

  def revive
    revive_change
    @hp = 1 if @hp == 0
  end

  #--------------------------------------------------------------------------
  # ○ ステートの解除
  #--------------------------------------------------------------------------
  def remove_state(state_id)
    return unless state?(state_id)

    revive if state_id == death_state_id
    erase_state(state_id)
    refresh
    @result.removed_states.push(state_id).uniq!
    BattleManager.bind_refresh if $game_party.in_battle
  end

  #--------------------------------------------------------------------------
  # ○ 使用効果［HP 回復］
  #--------------------------------------------------------------------------
  def item_effect_recover_hp(user, item, effect)
    value = (mhp * effect.value1 + effect.value2) * rec
    value *= user.pha if item.is_a?(RPG::Item)
    value *= -heel_reverse if $game_party.in_battle && 0.0 < heel_reverse && !item.heel_reverse_ignore?
    value = value.to_i
    @result.hp_damage -= value
    @result.success = true
    self.hp += value
  end

  #--------------------------------------------------------------------------
  # ○ 使用効果［TP 増加］
  #--------------------------------------------------------------------------
  def item_effect_gain_tp(user, item, effect)
    value = (max_tp * effect.value1.to_f * 0.01).ceil
    @result.tp_damage -= value
    @result.success = true if value != 0
    self.tp += value
  end

  #--------------------------------------------------------------------------
  # ○ 使用効果［特殊効果］
  #--------------------------------------------------------------------------
  def item_effect_special(user, item, effect)
    case effect.data_id
    when SPECIAL_EFFECT_ESCAPE
      if actor? # 味方の強制逃走
        BattleManager.process_forced_escape
        @result.success = true
      elsif BattleManager.can_forced_escape? # 敵の強制逃走
        escape
        @result.success = true
      else
        @result.success = false
      end
    end
  end

  #--------------------------------------------------------------------------
  # ○ 使用効果［コモンイベント］
  #--------------------------------------------------------------------------
  def item_effect_common_event(user, item, effect)
    @result.success = true
  end

  #--------------------------------------------------------------------------
  # ● 使用効果［防御壁追加]
  #--------------------------------------------------------------------------
  def item_effect_defense_wall(user, item, effect)
    @cnt[:defense_wall] += [true] * effect.data_id
    remove_defense_wall_over
    @result.success = true
  end

  #--------------------------------------------------------------------------
  # ● 使用効果［経験値上昇]
  #--------------------------------------------------------------------------
  def item_effect_gain_exp(user, item, effect)
    case effect.data_id
    when 0
      current_exp = base_exp
      kind = :base
    when 1
      current_exp = class_exp
      kind = :class
    when 2
      current_exp = tribe_exp
      kind = :tribe
    end
    exp  = current_exp + effect.value1
    show = effect.value2
    change_exp(exp, show, kind)
    @result.success = true
  end

  #--------------------------------------------------------------------------
  # ● 使用効果［属性即死]
  #--------------------------------------------------------------------------
  def item_effect_death_element(user, item, effect)
    return unless rand < elements_max_rate([effect.value2[:id]])

    chance = effect.value1
    chance *= state_rate(effect.data_id) unless effect.value2[:opt]
    if rand < chance
      add_state(effect.data_id)
      @result.success = true
    end
  end

  #--------------------------------------------------------------------------
  # ● 使用効果［ステート限定付与］
  #--------------------------------------------------------------------------
  def item_effect_death_state(user, item, effect)
    return unless state?(effect.value2[:id])

    chance = effect.value1
    chance *= state_rate(effect.data_id) unless effect.value2[:opt]
    if rand < chance
      add_state(effect.data_id)
      @result.success = true
    end
  end

  #--------------------------------------------------------------------------
  # ● 使用効果［捕食］
  #--------------------------------------------------------------------------
  def item_effect_predation(user, item, effect)
    return unless effect.value1.any? { |state_id| state?(state_id) }

    if effect.value2 & 0x1 == 0x1
      user.hp += self.hp
      self.hp = 0
    end
    if effect.value2 & 0x2 == 0x2
      user.mp += mp
      self.mp = 0
    end
    if effect.value2 & 0x4 == 0x4
      user.tp += self.tp
      self.tp = 0
    end
    add_state(death_state_id)
    hide unless luca?
    @result.predation = true
    @result.success = true
    @predationed = true
  end

  #--------------------------------------------------------------------------
  # ● 使用効果［ダメージ還元］
  #--------------------------------------------------------------------------
  def item_effect_restoration(user, item, effect)
    value = 0
    case item.damage.type
    when 1, 5
      value = @result.hp_damage
    when 2, 6
      value = @result.mp_damage
    end
    value = (value * effect.value1).to_i

    return unless 0 < value

    case effect.data_id
    when :HP
      user.hp += value
      @result.hp_restore = value
    when :MP
      user.mp += value
      @result.mp_restore = value
    end
    @result.success = true
  end

  #--------------------------------------------------------------------------
  # ● 使用効果［拘束開始技］
  #--------------------------------------------------------------------------
  def item_effect_binding_start(user, item, effect)
    return unless user.enemy?
    return unless luca?
    return unless rand < state_rate(effect.value2)
    return unless state_addable?(effect.value2)

    if BattleManager.bind? && (BattleManager.bind_user_index != user.index)
      @result.binding_start = 3
    else
      @result.binding_start = if user.bind_user?
                                2
                              else
                                effect.value1 == NWConst::State::UBIND ? 0 : 1
                              end
      BattleManager.bind_set(effect.data_id)
      user.add_state(effect.value1)
      add_state(effect.value2)
    end
    clear_actions
    @result.success = true
  end

  #--------------------------------------------------------------------------
  # ● 使用効果［もがく］
  #--------------------------------------------------------------------------
  def item_effect_bind_resist(user, item, effect)
    BattleManager.bind_count_down
    @result.bind_resist = true
    @result.success     = true
  end

  #--------------------------------------------------------------------------
  # ● スキル／アイテムの「使用成功時に対象数に関わらず１度適用するもの」適用
  #--------------------------------------------------------------------------
  def item_one_use_apply(item, targets, called_scene = nil)
    item_use_tp_gain(item, "なし") if targets.empty? and called_scene.is_a?(Scene_Battle)

    item.effects.each { |effect| item_one_use_effect_apply(self, item, effect, called_scene) }
  end

  #--------------------------------------------------------------------------
  # ● 「使用成功時に対象数に関わらず１度適用する使用効果」の適用
  #--------------------------------------------------------------------------
  def item_one_use_effect_apply(user, item, effect, called_scene)
    user = user.master_observer
    method_table = {
      NWUsableEffect::EFFECT_GET_ITEM => :item_one_use_effect_get_item,
      NWUsableEffect::EFFECT_SELF_ENCHANT => :item_one_use_effect_self_enchant,
      NWUsableEffect::EFFECT_SELF_ENCHANT_REGEN => :item_one_use_effect_self_enchant_regen,
      NWUsableEffect::EFFECT_OVER_DRIVE => :item_one_use_effect_over_drive
    }
    method_name = method_table[effect.code]
    send(method_name, user, item, effect, called_scene) if method_name
  end

  #--------------------------------------------------------------------------
  # ● 使用効果［自己ステート付与］
  #--------------------------------------------------------------------------
  def item_one_use_effect_self_enchant(user, item, effect, called_scene)
    chance = effect.value1
    chance *= user.state_rate(effect.data_id) unless effect.value2
    return unless rand < chance

    user.add_state(effect.data_id)
    if user.state_addable?(effect.data_id) && called_scene.is_a?(Scene_Battle)
      called_scene.refresh_status
      log_window = called_scene.instance_variable_get(:@log_window)
      log_window.display_added_state(user, $data_states[effect.data_id])
    end
  end

  #--------------------------------------------------------------------------
  # ● スキル使用不可能？
  #--------------------------------------------------------------------------
  def skill_unusable?(item)
    return false unless item.is_skill?
    return false if skill_unstoppable?(item)
    return false if skill_conditions_met?(item)

    @result.clear
    @result.used = true
    if hp < skill_hp_cost(item)
      @result.unusable = 0
    elsif mp < skill_mp_cost(item)
      @result.unusable = 1
    elsif tp < skill_tp_cost(item)
      @result.unusable = 2
    elsif $game_party.gold < skill_gold_cost(item)
      @result.unusable = 3
    elsif !skill_need_item?(item)
      @result.unusable = 4
    elsif skill_type_sealed?(item.stype_id) || skill_sealed?(item.id)
      @result.unusable = 5
    elsif temptation? && !$game_actors[NWConst::Actor::LUCA].alive?
      @result.unusable = 6
    end
    true
  end

  #--------------------------------------------------------------------------
  # ● 永久拘束中に攻撃をした？
  #--------------------------------------------------------------------------
  def eternal_bind_resist?(item)
    return false unless item.is_skill?
    return false unless state?(NWConst::State::ETBIND)
    return false unless item.id != bind_resist_skill_id
    return false unless item.id != mercy_skill_id

    true
  end

  #--------------------------------------------------------------------------
  # ○ 運による有効度変化率の取得
  #--------------------------------------------------------------------------
  def luk_effect_rate(user)
    1.0
  end

  #--------------------------------------------------------------------------
  # ○ 被ダメージによる TP チャージ
  #--------------------------------------------------------------------------
  def charge_tp_by_damage(damage_rate); end

  #--------------------------------------------------------------------------
  # ○ TPチャージ率の取得
  #--------------------------------------------------------------------------
  def tcr
    [1.0, features_max(FEATURE_SPARAM, 5)].max
  end

  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの対象への効果適用時の、使用者側への効果
  #--------------------------------------------------------------------------
  def item_user_effect(user, item)
    user.item_use_tp_gain(item, name)
  end

  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの対象への効果適用時の、得TPの増加を行うか
  #--------------------------------------------------------------------------
  def enable_apply_tp_gain?(item)
    return true unless $game_party.in_battle                # 戦闘中ではない
    return true unless item.for_all?                        # 全体攻撃ではない
    return true unless $game_temp.normal_invoke_count       # 通常/反射ではない
    return true unless $game_temp.normal_invoke_count >= 1  # ２回目以降ではない

    # 「戦闘中、通常/反射、全体攻撃、２回目以降」を全て満たす場合、TP増加しない
    false
  end

  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの対象への効果適用時の、得TPの増加
  #--------------------------------------------------------------------------
  def item_use_tp_gain(item, target_name)
    print "＜#{name}　#{item.name}　対象者:#{target_name}"
    if enable_apply_tp_gain?(item)
      gain_value = (max_tp * item.tp_gain * 0.01).ceil
      self.tp += (gain_value * tcr).ceil
      $game_temp.normal_invoke_plus_count
      print "　得TP:#{item.tp_gain}　増加値:#{(gain_value * tcr).ceil}＞\n"
    else
      print "　得TPは無効\n"
    end
  end

  #--------------------------------------------------------------------------
  # ○ 戦闘開始処理
  #--------------------------------------------------------------------------
  def on_battle_start
    clear_actions
    init_tp unless preserve_tp?
    set_start_hp
    set_counter
    set_trigger_state
    auto_state.each { |state_id| add_state(state_id) }
    auto_state_with_switch.each do |key, value|
      value.each { |state_id| add_state(state_id) } if $game_switches[key]
    end
    auto_state_set_turn.each do |state_id, turn|
      add_state(state_id)
      set_state_turn(state_id, turn)
    end
  end

  #--------------------------------------------------------------------------
  # ● 戦闘用カウンターのクリア
  #--------------------------------------------------------------------------
  def clear_counter
    @cnt = {}
    @cnt[:dead_skill_flag] = false
    @cnt[:defense_wall] = []
    @cnt[:auto_stand] = false
    @cnt[:revive_count] = Float::INFINITY
    @cnt[:revive_rate] = 0
    @cnt[:accumulate_get_rate] = 0
    clear_evasion_action
  end

  def revive_rate
    @cnt[:revive_rate]
  end

  def defence_wall
    @cnt[:defense_wall].count
  end

  #--------------------------------------------------------------------------
  # ● 戦闘用カウンターのセット
  #--------------------------------------------------------------------------
  def set_counter
    @cnt[:revive_count] = 0
    @cnt[:revive_rate] = 1.0
    @cnt[:dead_skill_flag] = true
    @cnt[:defense_wall] = defense_wall ? [true] * defense_wall : []
    remove_defense_wall_over
    @cnt[:auto_stand] = true
    @cnt[:accumulate_get_rate] = 1
    @turn_hit_damage_count = 0
  end

  #--------------------------------------------------------------------------
  # ● 防御壁の枚数制限を適用
  #--------------------------------------------------------------------------
  def remove_defense_wall_over
    @cnt[:defense_wall].pop while @cnt[:defense_wall].size > 2 # 最大2枚
  end

  #--------------------------------------------------------------------------
  # ● トリガーステートのセット
  #--------------------------------------------------------------------------
  def set_trigger_state
    trigger_state.each do |obj|
      rate  = { :H => hp_rate, :M => mp_rate, :T => tp_rate }[obj[:point]]
      check = [rate < obj[:per], obj[:per] <= rate]
      exec = [:force_add_state, :remove_state]
      next unless check[obj[:trigger] % 2]

      method(exec[obj[:trigger] / 2]).call(obj[:state_id])
    end
  end

  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの反撃率計算
  #--------------------------------------------------------------------------
  def item_cnt(user, item)
    return 0.0 unless enable_counter?(user, item)
    return certain_counter if item.certain?
    return cnt             if item.physical?
    return magical_counter if item.magical?
  end

  #--------------------------------------------------------------------------
  # ● スキル／アイテムの拡張反撃率計算
  #--------------------------------------------------------------------------
  def item_cnt_ex(user, item)
    return 0.0 unless enable_counter?(user, item)
    return certain_counter_ex  if item.certain?
    return physical_counter_ex if item.physical?
    return magical_counter_ex  if item.magical?
  end

  def battle_member?
    true
  end

  def giveup?
    BattleManager.giveup? && luca?
  end

  def enable_counter?(user, item)
    !bind_target? && enable_action? && opposite?(user) && battle_member?
  end

  def item_counter_skill(user, item)
    return nil unless enable_counter?(user, item)

    skill_data =
      if item.certain?
        auto_skill_parcent(CERTAIN_COUNTER_SKILL)
      elsif item.physical?
        auto_skill_parcent(COUNTER_SKILL)
      else
        auto_skill_parcent(MAGICAL_COUNTER_SKILL)
      end
    result = BattleManager.auto_skill_per(skill_data, self)
    return result if result

    attack_skill_id if rand < item_cnt(user, item)
  end

  def item_counter_ex_skill(user, item)
    return nil unless enable_counter?(user, item)

    skill_data =
      if item.certain?
        auto_skill_parcent(CERTAIN_COUNTER_EX_SKILL)
      elsif item.physical?
        auto_skill_parcent(COUNTER_EX_SKILL)
      else
        auto_skill_parcent(MAGICAL_COUNTER_EX_SKILL)
      end
    result = BattleManager.auto_skill_per(skill_data, self)
    return result if result

    attack_skill_id if rand < item_cnt_ex(user, item)
  end

  #--------------------------------------------------------------------------
  # ○ パラメータ置換データを取得
  #--------------------------------------------------------------------------
  def category_convert_param_data(stype_id)
    result = {}
    feature_objects.each do |object|
      object.category_convert_param_data(stype_id).each do |convert|
        result[convert[0]] = convert[1]
      end
    end
    result
  end

  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの属性修正値を取得
  #--------------------------------------------------------------------------
  def item_element_rate(user, item)
    return -1.0 if item_drain?(user, item)

    rate = elements_max_rate(user.item_final_elements(item))
    user.item_element_penetrate?(item) ? [rate, 1.0].max : rate
  end

  #--------------------------------------------------------------------------
  # ○ 属性の最大修正値の取得
  #     elements : 属性 ID の配列
  #    与えられた属性の中で最も有効な修正値を返す
  #--------------------------------------------------------------------------
  def elements_max_rate(elements)
    return 1.0 if elements.empty?

    elements.map { |id| element_rate(id) }.max
  end

  #--------------------------------------------------------------------------
  # ● 回復反転率の取得
  #--------------------------------------------------------------------------
  def heel_reverse_rate(item)
    return 1.0 unless $game_party.in_battle
    return 1.0 unless item.damage.recover?
    return 1.0 unless 0.0 < heel_reverse
    return 1.0 if item.heel_reverse_ignore?

    -heel_reverse
  end

  #--------------------------------------------------------------------------
  # ○ クリティカルの適用
  #--------------------------------------------------------------------------
  def apply_critical(damage, user)
    damage * (1.0 + user.booster_critical).tap do |r|
      @result.damage_rate *= r
    end
  end

  #--------------------------------------------------------------------------
  # ● 拘束ターン補正の適用
  #--------------------------------------------------------------------------
  def apply_damage_bind_turn(damage, item, user)
    return damage unless BattleManager.bind?
    return damage unless user.bind_user?
    return damage unless bind_target?
    return damage unless item.is_a?(RPG::Skill) and (item.bind? or item.eternal_bind?)

    turn = BattleManager.binding_turn
    rate = [1.0 + (turn - 1) * 0.5, 1.0].max
    s = state?(NWConst::State::ETBIND) ? "永久拘束" : "拘束"
    print "拘束ターン補正　攻撃者:#{user.name}　#{s}ターン数:#{turn}"
    print "　補正結果:#{(rate * 100).to_i}%\n"
    damage * rate
  end

  #--------------------------------------------------------------------------
  # ● 無効化障壁の適用
  #--------------------------------------------------------------------------
  def apply_invalidate_wall(damage, item)
    return damage unless invalidate_wall
    return damage if invalidate_wall < damage
    return damage if item.damage.recover?

    @result.invalidate_wall = true
    0
  end

  #--------------------------------------------------------------------------
  # ● 防御壁展開の適用
  #--------------------------------------------------------------------------
  def apply_defense_wall(damage, item)
    return damage if @cnt[:defense_wall].empty?
    return damage if @result.invalidate_wall
    return damage if item.damage.recover?

    @cnt[:defense_wall].pop
    @result.defense_wall = true
    0
  end

  #--------------------------------------------------------------------------
  # ● メタルボディの適用
  #--------------------------------------------------------------------------
  def apply_metal_body(damage, item)
    return damage unless metal_body
    return damage unless metal_body < damage
    return damage if item.damage.recover?

    metal_body
  end

  #--------------------------------------------------------------------------
  # ● 踏みとどまりの適用
  #--------------------------------------------------------------------------
  def apply_stand(damage, item)
    return damage unless auto_stand?
    return damage if hp == 1
    return damage unless hp <= damage
    return damage unless mhp * auto_stand < hp
    return damage if item.damage.recover?
    return damage unless @cnt[:auto_stand]

    @cnt[:auto_stand] = false
    @result.auto_stand = true
    hp - 1
  end

  #--------------------------------------------------------------------------
  # ● ダメージMP変換の適用
  #--------------------------------------------------------------------------
  def apply_damage_mp_convert(damage, item)
    return damage unless damage_mp_convert
    return damage if item.damage.recover?
    return 0 if damage_mp_convert == 0.0

    mp_damage = damage * damage_mp_convert
    rest      = 0.0 < (mp_damage - mp) ? mp_damage - mp : 0.0
    self.mp  -= mp_damage.ceil
    (rest / damage_mp_convert).ceil
  end

  #--------------------------------------------------------------------------
  # ● ダメージゴールド変換の適用
  #--------------------------------------------------------------------------
  def apply_damage_gold_convert(damage, item)
    return damage unless damage_gold_convert
    return damage if item.damage.recover?
    return 0 if damage_gold_convert == 0.0

    gold_damage = damage * damage_gold_convert
    rest        = 0.0 < (gold_damage - $game_party.gold) ? gold_damage - $game_party.gold : 0.0
    $game_party.lose_gold(gold_damage.ceil)
    (rest / damage_gold_convert).ceil
  end

  #--------------------------------------------------------------------------
  # ● ダメージMP吸収の適用
  #--------------------------------------------------------------------------
  def apply_damage_mp_drain(damage, item)
    return damage unless damage_mp_drain
    return damage if item.damage.recover?

    self.mp += (damage * damage_mp_drain).ceil
    damage
  end

  #--------------------------------------------------------------------------
  # ● ダメージゴールド回収の適用
  #--------------------------------------------------------------------------
  def apply_damage_gold_drain(damage, item)
    return damage unless damage_gold_drain
    return damage if damage < 0

    $game_party.gain_gold((damage * damage_gold_drain).ceil)
    damage
  end

  #--------------------------------------------------------------------------
  # ○ TP の再生
  #--------------------------------------------------------------------------
  def regenerate_tp
    @result.tp_damage = -(max_tp * trg).ceil
    self.tp -= @result.tp_damage
  end

  #--------------------------------------------------------------------------
  # ○ 全ての再生
  #--------------------------------------------------------------------------
  def regenerate_all
    if $game_party.in_battle && alive? && !giveup?
      regenerate_hp
      regenerate_mp
      regenerate_tp
    end
  end

  #--------------------------------------------------------------------------
  # ○ 戦闘行動終了時の処理
  #--------------------------------------------------------------------------
  def on_action_end
    @result.clear
    regenerate_all
    remove_states_auto(1)
    remove_buffs_auto
  end

  #--------------------------------------------------------------------------
  # ○ ターン終了処理
  #--------------------------------------------------------------------------
  def on_turn_end
    @result.clear
    update_state_turns
    update_buff_turns
    remove_states_auto(2)
    return unless $game_party.in_battle

    set_trigger_state
    setup_once_turn_state
  end

  #--------------------------------------------------------------------------
  # ○ 戦闘終了処理
  #--------------------------------------------------------------------------
  def on_battle_end
    remove_battle_states
    remove_all_buffs
    clear_actions
    init_tp unless preserve_tp?
    appear
    self.hp += Integer(mhp * battle_end_heel_hp)
    self.mp += Integer(mmp * battle_end_heel_mp)
    @predationed = false
    @result.clear
    @current_action_index = nil
  end

  #--------------------------------------------------------------------------
  # ● 武器種別攻撃力算出
  #--------------------------------------------------------------------------
  def wp_atk
    # 計算値が高い方を優先する
    a = self
    warray = wtypes.empty? ? [0] : wtypes
    warray.collect { |w| eval(NWConst::Parameter::WEAPON_TYPE_DAMAGE[w]) }.max
  end

  #--------------------------------------------------------------------------
  # ● 拘束技使用者？
  #--------------------------------------------------------------------------
  def bind_user?
    state?(NWConst::State::UBIND) || state?(NWConst::State::EUBIND)
  end

  #--------------------------------------------------------------------------
  # ● 拘束技対象者？
  #--------------------------------------------------------------------------
  def bind_target?
    state?(NWConst::State::TBIND) || state?(NWConst::State::ETBIND)
  end

  def item_element_penetrate?(item)
    item.element_penetrate? ||
      item_final_elements(item).any? do |id|
        element_penetrate?(id)
      end
  end

  def item_reflection?(user, item)
    return false unless alive?
    return false if user.item_element_penetrate?(item)

    return true if rand < item_mrf(user, item)

    elements = user.item_final_elements(item)
    ignore_elements = elements.select do |element|
      special_element?(element)
    end

    return elements.any? { |element| element_reflection(element) } if ignore_elements.empty?

    ignore_elements.all? do |element|
      element_reflection(element)
    end
  end

  def item_drain?(user, item)
    return false if user.item_element_penetrate?(item)

    elements = user.item_final_elements(item)
    ignore_elements = elements.select do |element|
      special_element?(element)
    end
    return elements.any? { |element| element_drain?(element) } if ignore_elements.empty?

    ignore_elements.all? do |element|
      element_drain?(element)
    end
  end

  def enable_action?
    !giveup? && alive? && movable? && od_movable?
  end

  def all_dead_state?
    states.any? { |state| state.all_dead? }
  end

  def item_elements(item, include_atk_elements = true)
    if item == $data_skills[attack_skill_id] && normal_attack_force_element
      [1]
    else
      (item.elements.map do |id|
         if id < 0
           include_atk_elements ? atk_elements : []
         else
           id
         end
       end.flatten + item_add_elements(item)).uniq
    end
  end

  def item_add_elements(item)
    return [] unless item.is_skill?
    return [] if item.invalid_boost?

    result = item.stypes.map { |stype_id| features_with_id(FEATURE_ADD_ELEMENT_STYPE, stype_id) }.flatten
    result += features_with_id(FEATURE_ADD_ELEMENT_SID, item.id)
    result.map(&:value).uniq
  end

  #--------------------------------------------------------------------------
  # ○ 戦闘不能になる
  #--------------------------------------------------------------------------
  def die
    if $game_party.in_battle
      if @cnt[:revive_count] < feature_revive_count
        @cnt[:revive_rate] = feature_revive_rate
        BattleManager.skill_interrupt(self, REVIVE_SKILL.id, :dead_skill)
        @cnt[:revive_count] += 1
      else
        if @cnt[:dead_skill_flag] && !dead_skill.empty?
          BattleManager.set_dead_skill(self)
          @cnt[:dead_skill_flag] = false
        end
        BattleManager.set_final_invoke(self)
      end
      BattleManager.bind_refresh
    end
    @hp = 0
    clear_states
    clear_buffs
  end

  def use_item(item)
    $game_temp.skill_cost.set(self, item)
    pay_skill_cost(item) if item.is_a?(RPG::Skill)
    consume_item(item)   if item.is_a?(RPG::Item)
    item_global_apply(item) unless $game_party.in_battle
  end

  def item_global_apply(item)
    item.effects.each do |effect|
      item_global_effect_apply(effect)
    end
  end

  def elements_max_display(user, elements)
    return [1.0, []] if elements.empty?

    rate_id = elements.map do |id|
      if user.element_penetrate?(id)
        [[element_rate(id), 1.0].max, id]
      else
        [element_rate(id), id]
      end
    end
    max_rate = rate_id.max_by { |rate, _| rate }[0]
    elements = rate_id.select { |rate, _| rate == max_rate }.map { |_, id| id }
    [max_rate, elements]
  end

  def booster_state_rate(target, item)
    rs = target.states.map do |state|
      v = item.state_boost(state)
      v *= booster_state_skill(state, item)
      v *= booster_state_skill_type(state, item)
      v *= booster_state_normal_attack(state) if item == $data_skills[attack_skill_id]
      v *= (v + state_boost_plus) if v != 1.0
      v = target.reduce_boost_damage_rate(v)
      [state, v]
    end.max_by { |_state, v| v }
    rate = rs ? rs[1] : 1.0

    target.result.state_boost.push(rs[0].id) if rs && (rate > 1.0)
    target.result.damage_rate *= rate
    rate
  end

  def skill_add_param_data(skill)
    skill.stypes.inject({}) do |h, stype|
      features_with_id(FEATURE_STYPE_ADD_PARAM, stype).map(&:value).each do |param, add_param, rate|
        h[param] ||= {}
        h[param][add_param] ||= rate
        h[param][add_param] = [rate, h[param][add_param]].max
      end
      h
    end
  end

  def on_restrict
    clear_stoppable_actions
    states.each do |state|
      remove_state(state.id) if state.remove_by_restriction
    end
  end

  def clear_stoppable_actions
    @actions.select! { |action| skill_unstoppable?(action.item) }
  end

  def make_speed
    @speed = agi + rand(5 + agi / 4)
  end

  def current_action_index=(value)
    @current_action_index = value.is_a?(Game_Action) ? @actions.index(value) : value
  end

  def current_action
    return unless current_action_index

    @actions[current_action_index]
  end

  def remove_current_action
    return unless current_action_index

    @actions.delete_at(current_action_index)
    @current_action_index = nil
  end

  def booster_skill_chain
    skill_chain_boost
  end

  def action_end?
    @actions.empty?
  end

  #--------------------------------------------------------------------------
  # ● スキル割り込み
  #--------------------------------------------------------------------------
  def skill_interrupt(skill_id, symbol = :interrupt)
    return unless skill_race_ok?($data_skills[skill_id])

    action = Game_Action.new(self)
    action.set_skill(skill_id)
    action.set_symbol(symbol)
    @actions << action
    self.current_action_index = action
    action
  end

  def multi_elements(item)
    skill_elements_raw = item_final_elements_raw(item)
    skill_elements = skill_elements_raw.flatten.uniq
    skill_elements_raw + (item.features_with_code(FEATURE_MULTI_ELEMENT) + features(FEATURE_MULTI_ELEMENT)).map(&:value).select do |elements|
      c = 0
      elements.any? do |element_id|
        c += 1 if skill_elements.include?(element_id)
        c == 2
      end
    end.uniq
  end

  def item_booster_element(item)
    index = {}
    multi = multi_elements(item)
    multi.inject(1.0) do |max, elements|
      rate = elements.inject(1.0) do |r, element_id|
        index[element_id] ||= booster_element(element_id)
        r * index[element_id]
      end
      [rate, max].max
    end
  end

  def learning?
    false
  end

  def use_item_learning_skill(item)
    false
  end

  def item_final_elements(item, include_atk_elements = true)
    item_final_elements_raw(item, include_atk_elements).flatten.uniq
  end

  def item_final_elements_raw(item, include_atk_elements = true)
    return item.elements.map { |id| [id] } if item.invalid_boost?

    (all_add_elements(item) + item_elements(item, include_atk_elements)).uniq.map do |element_id|
      [element_id, add_elements(element_id)].flatten.uniq
    end
  end

  def booster_same_element_damage(item)
    item_same_elements(item).inject(1.0) do |rate, element|
      rate *= same_element_damage_rate(element)
      rate
    end
  end

  def item_same_elements(item)
    (item_final_elements(item, false) & atk_elements).reject do |element|
      NWConst::Elem::IGNORE_SAME_ELEMENT_DAMAGE_BONUS.include?(element)
    end
  end

  def same_element_damage_rate(element_id)
    1.0 + (NWConst::Elem::SAME_ELEMENT_DAMAGE_BONUS_VALUE / 100.0) + same_element_damage_rate_bonus(element_id)
  end

  def booster_skill_timing(skill)
    return 1.0 unless skill.is_a?(RPG::Skill)
    return 1.0 unless $game_party.in_battle

    action = current_action
    return 1.0 if action.nil? || (action.symbol != :count && action.symbol != :chain_action)

    rate = 1.0
    rate *= skill_fastest_boost if BattleManager.fastest_action?(action)
    rate *= skill_latest_boost if BattleManager.latest?
    rate
  end

  def skill_timing_repeat(skill)
    return 0 unless skill.is_skill?

    action = current_action
    return 0 if action.nil? || (action.symbol != :count && action.symbol != :chain_action)

    r = 0
    r += skill_fastest_repeat if BattleManager.fastest_action?(action)
    r += skill_latest_repeat if BattleManager.latest?
    r
  end

  def item_effect_add_state_normal(user, item, effect)
    chance = add_state_chance(user, item, effect.data_id, effect.value1)
    return unless rand < chance

    if effect.data_id == NWConst::State::INSTANT_DEAD && (hp > 0) && instant_dead_reverse?
      @result.hp_damage = -(mhp - hp)
      self.hp = mhp
    else
      add_state(effect.data_id, user)
    end
    @result.success = true
  end

  #--------------------------------------------------------------------------
  # ○ 使用効果［ステート付加］
  #--------------------------------------------------------------------------
  def item_effect_add_state(user, item, effect)
    return unless @result.add_state?

    if effect.data_id == 0
      item_effect_add_state_attack(user, item, effect)
    else
      item_effect_add_state_normal(user, item, effect)
    end
  end

  #--------------------------------------------------------------------------
  # ○ 使用効果［ステート付加］：通常攻撃
  #--------------------------------------------------------------------------
  def item_effect_add_state_attack(user, item, effect)
    user.atk_states.each do |state_id|
      ef = RPG::UsableItem::Effect.new(0, state_id, effect.value1 * user.atk_states_rate(state_id))
      item_effect_add_state_normal(user, item, ef)
    end
  end

  def add_state_chance(user, item, state_id, chance)
    return 0.0 if state_resist?(state_id)

    if item.is_skill?
      c = chance
      chance *= user.booster_state_ratio_type(item)
      chance *= user.booster_state_ratio_skill(item)
      chance += user.booster_state_fix_type(item)
      chance = c.clamp(chance, 1.0)
    end

    chance *= state_rate(state_id) unless item.state_penetrate?
    chance = [chance, 0.0].max
    print "#{$data_states[state_id].name}付与最終成功率#{(chance * 100).to_i}%\n" if $TEST
    chance
  end

  #--------------------------------------------------------------------------
  # ● スキル／アイテムの反射率計算
  #--------------------------------------------------------------------------
  def item_mrf(user, item)
    return physical_reflection_rate if item.physical? # 物理攻撃なら物理反射率
    return mrf if item.magical? # 魔法攻撃なら魔法反射率を返す
    return certain_reflection_rate if item.certain? && opposite?(user)

    0
  end

  def skill_def_penetration?(skill)
    return false unless skill && skill.is_a?(RPG::Skill)

    skill.stypes.any? do |stype|
      !features_with_id(FEATURE_SKILL_TYPE_DEFENCE_PENETRATION, stype).empty?
    end
  end

  def evasion_action
    @cnt[:evasion_action]
  end

  def clear_evasion_action
    @cnt[:evasion_action] = nil
  end

  def evasion(user, item)
    return unless $game_party.in_battle
    return if @cnt[:evasion_action]

    skill = BattleManager.evasion_skill(self)

    return unless skill

    act = Game_Action.new(self)
    act.set_symbol(:evasion)
    @cnt[:evasion_action] = act
    act.set_skill(skill)
    act.target_index = user.index
    act
  end

  def item_apply(user, item, opt = {})
    $game_temp.action_target = self unless opt[:cnt]
    @result.clear
    @result.used = item_test(user, item)
    user = user.master_observer
    item_apply_hit(user, item, opt)
    elements = user.item_final_elements(item)
    @result.pleasure = NWConst::Elem.pleasure?(elements)
    @result.nightmare = NWConst::Elem.nightmare?(elements)
    md = elements_max_display(user, elements)
    @result.elements = md[1]
    @result.element_rate = md[0]
    @result.damage_rate *= md[0]

    if @result.hit?
      @cnt[:defense_wall] = [] if item.erase_defense_wall?
      unless item.damage.none?
        @result.critical = (rand < item_cri(user, item))
        @turn_hit_damage_count += 1 if $game_party.in_battle
        make_damage_value(user, item, opt)
        execute_damage(user, item)
      end
      item.effects.each { |effect| item_effect_apply(user, item, effect) }
    elsif @result.evaded && !opt[:cnt] && !opt[:evasion]
      evasion(user, item)
    end
    @result.pleasure ||= @result.death_pleasure_state_added?
    item_user_effect(user, item)
    $game_temp.action_hit = @result.hit?
  end

  def item_apply_hit(user, item, opt)
    return if opt[:ref] || !@result.used || item.ignore_no_effect || item.for_friend?

    hit = item_hit(user, item)
    eva = [1.0 - item_eva(user, item), 0.0].max

    chance = 1.0

    unless hit >= 3.0
      if eva > 1.0
        chance = hit + eva - 1.0
        @result.missed = (rand >= chance)
      elsif hit > 1.0
        chance = hit * eva
        @result.evaded = (rand >= chance)
      else
        chance = hit * eva
        @result.missed = (rand >= hit)
        @result.evaded = (!@result.missed && rand >= eva)
      end
    end
    @result.blocked = (@result.hit? && rand < item_block_rate(user, item))
    if $TEST
      print "＜#{item.name} 命中率:#{(hit * 100.0).to_i}% 回避率:#{(eva * 100.0).to_i}% 最終命中率:#{(chance * 100.0).to_i}%＞\n"
    end
  end

  def item_hit(user, item)
    rate = item.success_rate * 0.01
    rate *= item.skill_hit || user.hit
    rate += item.skill_hit_factor
    rate
  end

  def item_block_rate(user, item)
    return 0.0 if item.certain? && item.for_friend?

    features_xparam_rate(FEATURE_BLOCK_RATE, item.hit_type)
  end

  def item_eva(user, item)
    return eva if item.physical?
    return mev if item.magical?
    return certain_evasion if item.certain? && item.for_opponent?

    0
  end

  def skill_need_item?(skill)
    true
  end

  def item_one_use_effect_get_item(user, item, effect, called_scene)
    return unless user.actor?

    effect.data_id.times do |i|
      $game_party.gain_item($data_items[effect.value1[i]], effect.value2[i] * user.item_get_rate(item))
    end
  end

  def mimic_usable?(item)
    return false if item.nil? || item.mimic? || item.super_mimic?

    true
  end

  def on_turn_start
    @action_count = 0
    @random_action_count = @actions.count - min_action_times
  end

  def max_action_times
    action_plus_set.map(&:ceil).inject(1, :+) - action_minus
  end

  def min_action_times
    action_plus_set.map(&:floor).inject(1, :+) - action_minus
  end

  def valid_select_action?
    return true unless current_action.symbol == :count
    return false if @action_count >= max_action_times

    @action_count < (min_action_times + @random_action_count)
  end

  def make_actions
    clear_actions
    return if !movable? || cant_move?

    @actions = Array.new(make_action_times) { Game_Action.new(self) }.each { |act| act.set_symbol(:count) }
  end

  #--------------------------------------------------------------------------
  # ○ ステートの付加
  #--------------------------------------------------------------------------
  def add_state(state_id, user = nil)
    display_state_id = state_id
    state_id = death_state_id if $data_states[state_id].death?
    return unless state_addable?(state_id)

    unless state?(state_id)
      add_new_state(state_id)
      state_chain(state_id)
    end
    reset_state_counts(state_id, user)
    @result.added_states.push(display_state_id).uniq!
    $data_states[state_id].remove_states.each do |state_id2|
      remove_state(state_id2)
    end
  end

  def state_chain(state_id)
    add_state_ids = features_with_id(FEATURE_STATE_CHAIN, state_id).map(&:value).uniq
    add_state_ids.each { |id| force_add_state(id) }
  end

  def force_add_state(state_id)
    display_state_id = state_id
    state_id = death_state_id if $data_states[state_id].death?
    result.removed_states.delete(state_id)
    add_state(display_state_id)
  end

  def item_effect_steal(user, item, effect); end

  def item_effect_force_steal(user, item, effect); end

  def item_effect_accumulate_get_rate_up(user, item, effect); end

  def item_effect_accumulate_get_rate_reset(user, item, effect); end

  def all_dead?
    !alive? || all_dead_state? || undead? || predationed?
  end

  def bind?
    luca? && BattleManager.bind?
  end

  #--------------------------------------------------------------------------
  # ● スキル／アイテムの会心率計算
  #--------------------------------------------------------------------------
  def item_cri(user, item)
    crit =
      if item.certain?
        case item.critical_type
        when HitType::CERTAIN
          (user.magical_critical + user.cri) / 2
        when HitType::PHYSICAL
          user.cri
        when HitType::MAGICAL
          user.magical_critical
        end
      elsif item.magical?
        user.magical_critical
      elsif item.physical?
        user.cri
      end
    crit += item.critical_ex if item.is_skill?
    item.damage.critical ? crit * (1 - cev) : 0
  end

  #--------------------------------------------------------------------------
  # ● HP の再生
  #--------------------------------------------------------------------------
  def regenerate_hp
    damage = -(mhp * hrg).to_i
    damage += -(mhp * hrg_variable).to_i
    damage = 0 if damage < 0 && hp_regen_invalid?
    perform_map_damage_effect if $game_party.in_battle && damage > 0
    @result.hp_damage = [damage, max_slip_damage].min
    self.hp -= @result.hp_damage
  end

  #--------------------------------------------------------------------------
  # ● 戦闘開始hpの設定
  #--------------------------------------------------------------------------
  def set_start_hp
    @hp = [(mhp * battle_start_hp).to_i, @hp].min.to_i
  end

  #--------------------------------------------------------------------------
  # ○ 使用効果の適用
  #--------------------------------------------------------------------------
  def item_effect_apply(user, item, effect)
    method_table = {
      EFFECT_RECOVER_HP => :item_effect_recover_hp,
      EFFECT_RECOVER_MP => :item_effect_recover_mp,
      EFFECT_GAIN_TP => :item_effect_gain_tp,
      EFFECT_ADD_STATE => :item_effect_add_state,
      EFFECT_REMOVE_STATE => :item_effect_remove_state,
      EFFECT_ADD_BUFF => :item_effect_add_buff,
      EFFECT_ADD_DEBUFF => :item_effect_add_debuff,
      EFFECT_REMOVE_BUFF => :item_effect_remove_buff,
      EFFECT_REMOVE_DEBUFF => :item_effect_remove_debuff,
      EFFECT_SPECIAL => :item_effect_special,
      EFFECT_GROW => :item_effect_grow,
      EFFECT_LEARN_SKILL => :item_effect_learn_skill,
      EFFECT_COMMON_EVENT => :item_effect_common_event,
      EFFECT_STEAL => :item_effect_steal,
      EFFECT_DEFENSE_WALL => :item_effect_defense_wall,
      EFFECT_OVER_DRIVE => :item_effect_over_drive,
      EFFECT_GAIN_EXP => :item_effect_gain_exp,
      EFFECT_DEATH_ELEMENT => :item_effect_death_element,
      EFFECT_DEATH_STATE => :item_effect_death_state,
      EFFECT_PREDATION => :item_effect_predation,
      EFFECT_RESTORATION => :item_effect_restoration,
      EFFECT_BINDING_START => :item_effect_binding_start,
      EFFECT_BIND_RESIST => :item_effect_bind_resist,
      EFFECT_FORCE_STEAL => :item_effect_force_steal,
      EFFECT_ACCUMULATE_GET_RATE_UP => :item_effect_accumulate_get_rate_up,
      EFFECT_ACCUMULATE_GET_RATE_RESET => :item_effect_accumulate_get_rate_reset
    }
    method_name = method_table[effect.code]
    send(method_name, user, item, effect) if method_name
  end

  #--------------------------------------------------------------------------
  # ● ブースター補正率の取得
  #--------------------------------------------------------------------------
  def boost_rate(user, item, opt)
    value  = 1.0
    value *= user.item_booster_element(item)
    value *= user.booster_considerate(item)
    if user.actor?
      wrate = (user.wtypes + user.weapon_rate_bonus).uniq.map { |id| item.weapon_rate(id) }.max
      value *= wrate if wrate
    end
    value *= user.pha if item.apply_pharmacology? || (!item.is_skill? && value < 0)
    value *= user.booster_counter if opt[:cnt] && item == $data_skills[user.attack_skill_id]
    value *= user.booster_skill_chain if user.chain_boost?
    value *= user.booster_reflection if opt[:ref]
    value *= user.boost_ex_category_rate(self, item)
    value *= user.boost_equip_type_damage_rate(self)
    value *= user.booster_ex_count
    value *= user.booster_weapon_equip_size(item)
    value *= user.booster_item_damage(item)
    value *= user.booster_all_damage
    value *= user.booster_states_damage(item)
    value *= user.booster_same_element_damage(item)
    user.wtypes.each do |wtype_id|
      case item.hit_type
      when 0 then value *= user.booster_weapon_certain(wtype_id)
      when 1 then value *= user.booster_weapon_physical(wtype_id)
      when 2 then value *= user.booster_weapon_magical(wtype_id)
      end
    end
    if item.is_skill?
      value *= user.boost_enemy_number_rate(item)
      value *= user.booster_pinchi(item)
      value *= user.booster_full_hp(item)
      value *= user.booster_full_mp(item)
      value *= user.booster_full_tp(item)
      value *= user.booster_single_skill_damage_boost(item)
      values = []
      (user.wtypes + user.weapon_rate_bonus).uniq.each do |wtype_id|
        t_value = value
        t_value *= user.booster_wtype_skill(wtype_id, item)
        t_value *= user.booster_normal_attack(wtype_id) if item == $data_skills[user.attack_skill_id] && !opt[:cnt]
        values << t_value
      end
      value = values.max
      value *= user.booster_state_rate(self, item)
      value *= user.booster_skill_type(item)
      value *= user.booster_skill(item)
      value *= user.booster_skill_timing(item)
      value *= item.one_rate
      value *= user.booster_hit(item, opt[:hit_count])
    end
    value
  end

  def booster_considerate(item)
    1.0
  end

  #--------------------------------------------------------------------------
  # ● ダメージの処理
  #    呼び出し前に @result.hp_damage @result.mp_damage @result.hp_drain
  #    @result.mp_drain が設定されていること。
  #--------------------------------------------------------------------------
  def execute_damage(user, item)
    on_damage(@result.hp_damage) if @result.hp_damage > 0
    hp_damage = [@result.hp_damage]
    hp_damage << hp - 1 if item.allowance?
    self.hp -= hp_damage.min
    self.mp -= @result.mp_damage

    user.hp += @result.hp_drain
    user.mp += @result.mp_drain
  end

  #--------------------------------------------------------------------------
  # ○ ダメージ計算
  #--------------------------------------------------------------------------
  def make_damage_value(user, item, opt = {})
    value = item.eval_damage(user, self)
    value *= item_element_rate(user, item)
    value *= pdr if item.physical?
    value *= mdr if item.magical?
    value *= certain_damage_rate if item.certain? && item.for_opponent?
    value *= rec if item.damage.recover?
    value *= heel_reverse_rate(item)
    value *= boost_rate(user, item, opt) unless item.invalid_boost?
    value *= turn_hit_damage_rate
    value = apply_critical(value, user) if @result.critical
    value = apply_variance(value, item.damage.variance)
    value = apply_guard(value)
    value = apply_damage_bind_turn(value, item, user)
    value = apply_invalidate_wall(value, item)
    value = apply_defense_wall(value, item)
    value = apply_metal_body(value, item)
    value = apply_stand(value, item)
    value = apply_damage_mp_convert(value, item)
    value = apply_damage_gold_convert(value, item)
    value = apply_damage_mp_drain(value, item)
    value = apply_damage_gold_drain(value, item)
    @result.make_damage(value.to_i, item)
  end

  #--------------------------------------------------------------------------
  # ● ステートのカウント（ターン数および歩数）をリセット
  #--------------------------------------------------------------------------
  def reset_state_counts(state_id, user = nil)
    state = $data_states[state_id]
    unless @state_turns[state_id] == -1
      variance = 1 + [state.max_turns - state.min_turns, 0].max
      turn = state.min_turns + rand(variance) + booster_self_state(state_id)
      turn += user.booster_target_state(state_id) if user
      turn = -1 if self_state_eternal?(state_id) || (user && user.target_state_eternal?(state_id))
      @state_turns[state_id] = turn
    end
    @state_turn_counts[state_id] = 0
    @state_steps[state_id] = state.steps_to_remove
  end

  def update_state_turns
    states.each do |state|
      @state_turns[state.id] -= 1 if @state_turns[state.id] > 0
      @state_turn_counts[state.id] += 1
    end
  end

  #--------------------------------------------------------------------------
  # ● 使用効果［自己ステート解除］
  #--------------------------------------------------------------------------
  def item_one_use_effect_self_enchant_regen(user, item, effect, called_scene)
    chance = effect.value1
    return unless rand < chance && state?(effect.data_id)

    user.remove_state(effect.data_id)
    if called_scene.is_a?(Scene_Battle)
      called_scene.refresh_status
      log_window = called_scene.instance_variable_get(:@log_window)
      log_window.display_removed_stete(user, $data_states[effect.data_id])
    end
  end

  def setup_once_turn_state
    features_with_id(FEATURE_ONCE_TURN_END_STATE, $game_troop.turn_count).each do |ft|
      force_add_state(ft.value)
    end
    states.each do |state|
      state.once_turn_end_state.each do |turn_id, state_id|
        force_add_state(state_id) if @state_turn_counts[state.id] == turn_id
      end
    end
  end

  def word_id
    nil
  end

  def turn_hit_damage_rate
    return 1.0 unless $game_party.in_battle
    return 1.0 if @turn_hit_damage_count <= 1

    feature_turn_hit_damage_rate**(@turn_hit_damage_count - 1)
  end
end

#==============================================================================
# ■ Game_BattlerBase
#==============================================================================
class Game_BattlerBase
  #--------------------------------------------------------------------------
  # ● 定数（能力強化／弱体アイコンの開始番号）
  #--------------------------------------------------------------------------
  ICON_BUFF_START       = 80              # 強化（16 個）
  ICON_DEBUFF_START     = 120             # 弱体（16 個）
  #--------------------------------------------------------------------------
  # ● Mix-In
  #--------------------------------------------------------------------------
  include Fts
  #--------------------------------------------------------------------------
  # ○ TP の割合を取得
  #--------------------------------------------------------------------------
  def tp_rate
    0 < max_tp ? tp / max_tp.to_f : 0.0
  end

  #--------------------------------------------------------------------------
  # ○ 通常能力値の最大値取得
  #--------------------------------------------------------------------------
  def param_max(param_id)
    return 999_999 if param_id == 0 # MHP

    9999
  end

  def clear_states
    @states = []
    @state_turns = {}
    @state_steps = {}
    @state_turn_counts = {}
  end

  def erase_state(state_id)
    @states.delete(state_id)
    @state_turns.delete(state_id)
    @state_steps.delete(state_id)
    @state_turn_counts.delete(state_id)
  end

  #--------------------------------------------------------------------------
  # ○ 通常能力値の取得
  #--------------------------------------------------------------------------
  def param(param_id)
    return 1 if param_neutralize?(param_id)

    value = param_base(param_id) + param_plus(param_id)
    value *= param_rate(param_id) * param_buff_rate(param_id)
    if $game_party.in_battle && (2..7).include?(param_id)
      value *= booster_fall_hp && hp_rate < booster_fall_hp[:per] ? 1.0 + booster_fall_hp[:boost] : 1.0
      value *= booster_full_hp_status_rate
      value *= 1.0 + (friends_unit.dead_members.size * over_soul)
      value *= terrain_revise
    end
    value *= booster_class
    value *= booster_actor_param
    value *= booster_party_member(param_id) if $game_party.in_battle
    value *= booster_actor_exist_param(param_id)
    Integer(value.clamp(param_min(param_id), param_max(param_id)))
  end

  #--------------------------------------------------------------------------
  # ● 誘惑状態判定
  #--------------------------------------------------------------------------
  def temptation?
    exist? && state?(NWConst::State::TEMPTATION)
  end

  def booster_party_member(param_id)
    members = friends_unit.all_members
    return 1.0 unless members.include?(self)

    members.reject { |m| m == self }.inject(1.0) do |result, member|
      result + member.party_member_boost(param_id)
    end
  end

  def party_member_boost(param_id)
    data_id = [0, 1].include?(param_id) ? 1 : 0
    features_sum(FEATURE_PARTY_PARAM_BOOST, data_id)
  end

  #--------------------------------------------------------------------------
  # ○ スキルの消費 MP 計算
  #--------------------------------------------------------------------------
  def skill_mp_cost(skill)
    cost = skill.mp_cost
    if skill.mp_cost_ex
      cost = skill.mp_cost_ex[:data]
      cost = (skill.mp_cost_ex[:max?] ? mmp : mp) * cost / 100 if skill.mp_cost_ex[:per?]
      return cost.ceil if skill.mp_cost_ex[:abs?]
    end
    return 0 if skill_combo?
    return 0 if skill_cost_zero?(skill, :MP)

    cost *= skill_chain_cost_rate if chain_boost?
    (cost * mcr * stype_cost_rate_mp(skill) * skill_cost_rate_mp(skill)).ceil
  end

  def skill_combo?
    return false unless $game_party.in_battle

    current_action && current_action.symbol == :skill_combo
  end

  #--------------------------------------------------------------------------
  # ○ スキルの消費 TP 計算
  #--------------------------------------------------------------------------
  def skill_tp_cost(skill)
    cost = skill.tp_cost
    if skill.tp_cost_ex
      cost = skill.tp_cost_ex[:data]
      cost = (skill.tp_cost_ex[:max?] ? max_tp : tp) * cost / 100 if skill.tp_cost_ex[:per?]
      return cost.ceil if skill.tp_cost_ex[:abs?]
    end
    return 0 if skill_combo?
    return 0 if skill_cost_zero?(skill, :TP)

    cost *= skill_chain_cost_rate if chain_boost?
    (cost * tp_cost_rate * stype_cost_rate_tp(skill) * skill_cost_rate_tp(skill)).ceil
  end

  #--------------------------------------------------------------------------
  # ● スキルの消費 HP 計算
  #--------------------------------------------------------------------------
  def skill_hp_cost(skill)
    cost = 0
    if skill.hp_cost_ex
      cost = skill.hp_cost_ex[:data]
      cost = (skill.hp_cost_ex[:max?] ? mhp : hp) * cost / 100 if skill.hp_cost_ex[:per?]
      return cost.ceil if skill.hp_cost_ex[:abs?]
    end
    return 0 if skill_combo?
    return 0 if skill_cost_zero?(skill, :HP)

    (cost * hp_cost_rate * stype_cost_rate_hp(skill) * skill_cost_rate_hp(skill)).ceil
  end

  #--------------------------------------------------------------------------
  # ● スキルの消費 金額 計算
  #--------------------------------------------------------------------------
  def skill_gold_cost(skill)
    (skill.gold_cost * gold_cost_rate).ceil
  end

  #--------------------------------------------------------------------------
  # ○ スキルの使用可能条件チェック
  #--------------------------------------------------------------------------
  def skill_conditions_met?(skill)
    usable_item_conditions_met?(skill) &&
      skill_state_ok?(skill) &&
      skill_wtype_ok?(skill) &&
      skill_race_ok?(skill) &&
      skill_cost_payable?(skill) &&
      !skill_sealed?(skill.id) &&
      !skill.stypes.all? { |stype_id| skill_type_sealed?(stype_id) } &&
      !(temptation? && !$game_actors[NWConst::Actor::LUCA].alive?)
  end

  def skill_state_ok?(skill)
    return true if skill.need_states.empty?

    skill.need_states.any? { |states| states.all? { |state_id| state?(state_id) } }
  end

  #--------------------------------------------------------------------------
  # ○ 装備可能判定
  #--------------------------------------------------------------------------
  def equippable?(item)
    return false unless item.is_a?(RPG::EquipItem)
    return false if item.enchant_item? && $game_switches[NWConst::Sw::ENCHANT_OFF]
    return false if equip_type_sealed?(item.etype_id)
    return false if item.exclusive_actors && !item.exclusive_actors.include?(id)

    if item.is_a?(RPG::Weapon)
      return equip_wtype_ok?(item.wtype_id)
    elsif item.is_a?(RPG::Armor)
      return equip_atype_ok?(item.atype_id)
    end

    false
  end

  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの使用可能判定
  #--------------------------------------------------------------------------
  def usable?(item)
    result = false
    result = skill_conditions_met?(item) if item.is_a?(RPG::Skill)
    result = item_conditions_met?(item) if item.is_a?(RPG::Item)
    result && usable_item_sex_ok?(item)
  end

  #--------------------------------------------------------------------------
  # ● もがくのスキル ID を取得
  #--------------------------------------------------------------------------
  def bind_resist_skill_id
    NWConst::Skill::BIND_RESIST
  end

  #--------------------------------------------------------------------------
  # ● なすがままのスキル ID を取得
  #--------------------------------------------------------------------------
  def mercy_skill_id
    NWConst::Skill::MERCY
  end

  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの使用可能時チェック
  #--------------------------------------------------------------------------
  def occasion_ok?(item)
    ($game_party.in_battle ? item.battle_ok? : item.menu_ok?) && throw_ok?(item)
  end

  #--------------------------------------------------------------------------
  # ● 投擲専用アイテムの使用可能チェック
  # 「忍術」持ちのみ使用可能
  #--------------------------------------------------------------------------
  def throw_ok?(item)
    return true unless item.throw?
    return true if added_skill_types.include?(31)

    false
  end

  def slot_types
    features_set(FEATURE_SLOT_TYPE)
  end

  #--------------------------------------------------------------------------
  # ● 二刀流の判定
  #--------------------------------------------------------------------------
  def dual_wield?
    return false if slot_cannot_dual_wield?

    slot_types.include?(1) || triple_wield?
  end

  def dual_shield?
    slot_types.include?(2)
  end

  def triple_wield?
    slot_types.include?(3)
  end

  def weapon_rate_bonus
    feature_objects.map { |obj| obj.weapon_rate_bonus }.flatten
  end

  #--------------------------------------------------------------------------
  # ● HPスキル消費率を取得
  #--------------------------------------------------------------------------
  def skill_cost_rate_hp(skill)
    skill_cost_rate(skill.id, :HP)
  end

  def skill_cost_rate_mp(skill)
    skill_cost_rate(skill.id, :MP)
  end

  def skill_cost_rate_tp(skill)
    skill_cost_rate(skill.id, :TP)
  end

  #--------------------------------------------------------------------------
  # ● HPタイプ消費率を取得
  #--------------------------------------------------------------------------
  def stype_cost_rate_hp(skill)
    skill.stypes.inject(1.0) { |r, stype_id| r *= stype_cost_rate(stype_id, :HP) }
  end

  #--------------------------------------------------------------------------
  # ● MPタイプ消費率を取得
  #--------------------------------------------------------------------------
  def stype_cost_rate_mp(skill)
    skill.stypes.inject(1.0) { |r, stype_id| r *= stype_cost_rate(stype_id, :MP) }
  end

  #--------------------------------------------------------------------------
  # ● TPタイプ消費率を取得
  #--------------------------------------------------------------------------
  def stype_cost_rate_tp(skill)
    skill.stypes.inject(1.0) { |r, stype_id| r *= stype_cost_rate(stype_id, :TP) }
  end

  def hp=(hp)
    @hp = hp
    refresh_hp
  end

  def refresh_hp
    @hp = @hp.clamp(0, mhp)
    @hp == 0 ? add_state(death_state_id) : remove_state(death_state_id)
  end

  def mp=(mp)
    @mp = mp
    refresh_mp
  end

  def refresh_mp
    @mp = @mp.clamp(0, mmp)
  end

  def tp=(tp)
    @tp = tp
    refresh_tp
  end

  def refresh_tp
    @tp = @tp.clamp(0, max_tp)
  end

  def refresh
    state_resist_set.each { |state_id| erase_state(state_id) }
    refresh_hp
    refresh_mp
    refresh_tp
  end

  def skill_race_ok?(skill)
    return false if succubus? && skill.succubus_unavailable?
    return false unless skill_learnable?(skill)

    true
  end

  def skill_learnable?(skill)
    true
  end

  def element_rate(element_id)
    fix_rate = element_rate_fix(element_id)
    return fix_rate if fix_rate

    features_pi(FEATURE_ELEMENT_RATE, element_id)
  end

  def special_element?(id)
    NWConst::Elem::RATE_FIX_ID.include?(id)
  end

  def booster_actor_exist_param(param_id)
    1.0
  end

  def dead_skill
    auto_skill(DEAD_SKILL)
  end

  def final_invoke
    auto_skill(FINAL_INVOKE)
  end

  def battle_start_skill
    auto_skill_parcent(BATTLE_START_SKILL)
  end

  def turn_start_skill
    auto_skill_parcent(TURN_START_SKILL)
  end

  def turn_end_skill
    auto_skill_parcent(TURN_END_SKILL)
  end

  def boost_ex_category_rate(target, item)
    return 1.0 if item.damage.recover?

    rate = target.ex_category.inject(1.0) do |result, id|
      r = ex_category_attack_rate(id, item)
      target.result.ex_category_boost.push(id) if r > 1.0
      r = target.reduce_boost_damage_rate(r, id)
      target.result.damage_rate += r - 1.0
      result + r - 1.0
    end
    rate *= ex_category.inject(1.0) { |r, id| r * target.booster_ex_category_defence(id) }
    rate
  end

  def invoke_repeats(item)
    return 1 if !item.is_skill? || item.no_invoke_repeats?

    stype_count = item.stypes.inject(1) do |count, stype_id|
      features_with_id(FEATURE_BATTLER_ABILITY, INVOKE_REPEATS_TYPE).each do |ft|
        count += ft.value[stype_id] - 1 if ft.value.key?(stype_id)
      end
      count
    end
    skill_count = features_with_id(FEATURE_BATTLER_ABILITY, INVOKE_REPEATS_SKILL).inject(1) do |count, ft|
      ft.value.key?(item.id) ? (count + ft.value[item.id] - 1) : count
    end
    [stype_count, skill_count].max + skill_timing_repeat(item)
  end

  def skill_plus_attack(skill)
    return 0 unless skill.is_a?(RPG::Skill)

    skill_id_plus_attack(skill.id) + skill.stypes.inject(0) { |i, stype| i + skill_type_plus_attack(stype) }
  end

  def skill_plus_attack_one_count(skill)
    skill_plus_attack_one(skill) + skill_plus_attack_one_random(skill)
  end

  def weapon_mastery_bonus
    []
  end

  def action?
    false
  end

  def set_state_turn(state_id, turn)
    return unless state?(state_id)

    @state_turns[state_id] = turn
  end

  def boost_enemy_number_rate(item)
    return 1.0 unless item.is_a?(RPG::Skill)

    size = opponents_unit.alive_members.size
    if size == 1
      booster_enemy_single_rate(item)
    elsif size > 1
      booster_enemy_multi_rate(item)
    else
      1.0
    end
  end

  def atypes
    []
  end

  def boost_equip_type_damage_rate(target)
    rate = 1.0
    rate *= wtypes.inject(1.0) { |r, id| r * booster_weapon_type_attack(id) }
    rate *= target.atypes.inject(1.0) { |r, id| r * target.booster_armor_type_defence(id) }
    rate
  end

  def booster_ex_count
    1.0
  end

  def booster_weapon_equip_size(item)
    1.0
  end

  def booster_single_skill_damage_boost(item)
    return 1.0 if ![1, 2].include?(item.scope) || item.repeats != 1 || item.exp_target?

    1.0 + features_sum(FEATURE_SINGLE_SKILL_BOOST, 0)
  end

  def skill_cost_zero?(skill, type)
    return unless skill.is_a?(RPG::Skill)

    cost_zero?(type) || skill_id_cost_zero?(skill, type) || skill_type_cost_zero?(skill, type)
  end

  def booster_states_damage(item)
    states.inject(1.0) do |rate, state|
      rate *= booster_state_damage(state.id, item)
      rate
    end
  end

  def od_movable?
    !($game_party.in_over_drive? && $game_party.od_user.master_observer != master_observer && !ignore_over_drive?)
  end

  #--------------------------------------------------------------------------
  # ○ スキル使用コストの支払い
  #--------------------------------------------------------------------------
  def pay_skill_cost(skill)
    pay_skill_cost_h(skill, make_cost_value(skill))
  end

  def pay_skill_cost_h(skill, values)
    self.hp -= values.fetch(:HP, 0)
    self.mp -= values.fetch(:MP, 0)
    self.tp -= values.fetch(:TP, 0)
  end

  def make_cost_value(skill)
    result = {}
    if tp < skill_tp_cost(skill) && alternate_tp_to_mp?
      result[:MP] = skill_mp_cost(skill) + (skill_tp_cost(skill) * alternate_tp_to_mp_rate).to_i
      return result
    end
    result[:MP] = skill_mp_cost(skill)
    result[:TP] = skill_tp_cost(skill)
    result
  end

  #--------------------------------------------------------------------------
  # ○ スキル使用コストの支払い可能判定
  #--------------------------------------------------------------------------
  def skill_cost_payable?(skill)
    skill_cost_payable_h?(make_cost_value(skill))
  end

  def skill_cost_payable_h?(values)
    tp >= values.fetch(:TP, 0) && mp >= values.fetch(:MP, 0) && (hp > values.fetch(:HP, 0) || undead?)
  end

  #--------------------------------------------------------------------------
  # ● スキル／アイテムの性別使用可能条件チェック
  #--------------------------------------------------------------------------
  def usable_item_sex_ok?(item)
    return true if item.ext_scope == NWSex::ALL

    case item.scope
      # 敵の中に、拡張スコープに合致するものがいれば使用可能
    when 1..6
      return true unless opponents_unit.target_members(item).select(&:alive?).empty?
      # 味方の中に、〃
    when 7..8
      return true unless friends_unit.target_members(item).select(&:alive?).empty?
      # 味方死者の中に、〃
    when 9..10
      return true unless friends_unit.target_members(item).select(&:dead?).empty?
      # 自分に、〃
    when 11
      return true unless (sex & item.ext_scope) != 0
    end
    false
  end

  def escape_not_count?
    false
  end

  def booster_full_hp(skill)
    powor = [booster_full_hp_skill(skill), booster_full_hp_skill_type(skill), skill.full_hp_boost].max
    1.0 + hp_rate * powor
  end

  def skill_chain(skill)
    []
  end

  def skill_chain_cost_rate
    features_min(FEATURE_SKILL_CHAIN_COST_RATE, 0)
  end

  def chain_actions
    []
  end

  #--------------------------------------------------------------------------
  # ● 正常判定
  #--------------------------------------------------------------------------
  def normal?
    exist? && restriction == 0 && !cant_move?
  end

  def feature_objects
    Hima::FeatureObjects.new(states)
  end

  def all_features
    feature_objects.all_features
  end

  def features(code)
    feature_objects.features(code)
  end

  def features_with_id(code, id)
    feature_objects.features_with_id(code, id)
  end

  #--------------------------------------------------------------------------
  # ● スキル／アイテムの共通使用可能条件チェック
  #--------------------------------------------------------------------------
  def usable_item_conditions_met?(item)
    movable? && occasion_ok?(item) && !cant_move?
  end

  def succubus?
    !features(FEATURE_SUCCUBUS).empty?
  end

  #--------------------------------------------------------------------------
  # ○ 攻撃追加回数の取得
  #--------------------------------------------------------------------------
  def atk_times_add
    features(FEATURE_ATK_TIMES).inject(0.0) { |r, ft| r < ft.value ? ft.value : r }
  end

  #--------------------------------------------------------------------------
  # ○ 防御効果率の取得
  #--------------------------------------------------------------------------
  def grd
    [1.0, features_max(FEATURE_SPARAM, 1)].max
  end

  #--------------------------------------------------------------------------
  # ○ 回復効果率の取得
  #--------------------------------------------------------------------------
  def rec
    [1.0, features_max(FEATURE_SPARAM, 2)].max
  end

  #--------------------------------------------------------------------------
  # ○ 薬の知識の取得
  #--------------------------------------------------------------------------
  def pha
    [1.0, features_max(FEATURE_SPARAM, 3)].max
  end

  #--------------------------------------------------------------------------
  # ○ TPチャージ率の取得
  #--------------------------------------------------------------------------
  def tcr
    [1.0, features_max(FEATURE_SPARAM, 5)].max
  end

  #--------------------------------------------------------------------------
  # ● 獲得金額倍率
  #--------------------------------------------------------------------------
  def get_gold_rate
    [1.0, features_max(FEATURE_PARTY_EX_ABILITY, GET_GOLD_RATE)].max +
      features_sum(FEATURE_PARTY_EX_ABILITY, GET_GOLD_RATE_STATE)
  end

  #--------------------------------------------------------------------------
  # ● 獲得アイテム倍率
  #--------------------------------------------------------------------------
  def get_item_rate
    [1.0, features_max(FEATURE_PARTY_EX_ABILITY, GET_ITEM_RATE)].max +
      features_sum(FEATURE_PARTY_EX_ABILITY, GET_ITEM_RATE_STATE)
  end

  #--------------------------------------------------------------------------
  # ● エンカウント倍率
  #--------------------------------------------------------------------------
  def encounter_rate
    features_with_id(FEATURE_PARTY_EX_ABILITY, ENCOUNTER_RATE).collect { |ft| ft.value }
  end

  def encounter_rate_value
    encounter_rate.inject(1.0, :*)
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入倍率
  #--------------------------------------------------------------------------
  def collect_rate
    [1.0, features_max(FEATURE_PARTY_EX_ABILITY, COLLECT_RATE)].max +
      features_sum(FEATURE_PARTY_EX_ABILITY, COLLECT_RATE_STATE)
  end

  #--------------------------------------------------------------------------
  # ● スロットチャンス
  #--------------------------------------------------------------------------
  def slot_chance
    features_max(FEATURE_PARTY_EX_ABILITY, SLOT_CHANCE).to_i
  end

  #--------------------------------------------------------------------------
  # ● 解錠レベル
  #--------------------------------------------------------------------------
  def unlock_level
    features_max(FEATURE_PARTY_EX_ABILITY, UNLOCK_LEVEL).to_i
  end

  #--------------------------------------------------------------------------
  # ● 盗み成功率を取得
  #--------------------------------------------------------------------------
  def steal_success
    [1.0, features_max(FEATURE_BATTLER_ABILITY, STEAL_SUCCESS)].max
  end

  #--------------------------------------------------------------------------
  # ● 踏みとどまり値を取得
  #--------------------------------------------------------------------------
  def auto_stand
    features_min(FEATURE_BATTLER_ABILITY, AUTO_STAND)
  end

  def auto_stand?
    !features_with_id(FEATURE_BATTLER_ABILITY, AUTO_STAND).empty?
  end

  #--------------------------------------------------------------------------
  # ● 回復反転値を取得
  #--------------------------------------------------------------------------
  def heel_reverse
    features_max(FEATURE_BATTLER_ABILITY, HEEL_REVERSE)
  end

  #--------------------------------------------------------------------------
  # ● オートステートID配列を取得
  #--------------------------------------------------------------------------
  def auto_state
    features_with_id(FEATURE_BATTLER_ABILITY, AUTO_STATE).inject([]) { |r, ft| r | ft.value }
  end

  def auto_state_with_switch
    features_with_id(FEATURE_BATTLER_ABILITY, AUTO_STATE_WITH_SWITCH).inject({}) do |r, ft|
      r.merge(ft.value) do |_key, oldval, newval|
        oldval + newval
      end
    end
  end

  #--------------------------------------------------------------------------
  # ● トリガーステートを取得
  #--------------------------------------------------------------------------
  def trigger_state
    features_with_id(FEATURE_BATTLER_ABILITY, TRIGGER_STATE).collect { |ft| ft.value }
  end

  #--------------------------------------------------------------------------
  # ● メタルボディ上限値を取得
  #--------------------------------------------------------------------------
  def metal_body
    values = features_with_id(FEATURE_BATTLER_ABILITY, METAL_BODY).map do |ft|
      case ft.value
      when Float
        [(ft.value * mhp).floor, 1].max
      when Integer
        ft.value
      end
    end
    values.min
  end

  #--------------------------------------------------------------------------
  # ● 防御壁展開を取得
  #--------------------------------------------------------------------------
  def defense_wall
    features_with_id(FEATURE_BATTLER_ABILITY, DEFENSE_WALL).inject([]) { |r, ft| r | [ft.value] }.max
  end

  #--------------------------------------------------------------------------
  # ● 無効化障壁を取得
  #--------------------------------------------------------------------------
  def invalidate_wall
    values = features_with_id(FEATURE_BATTLER_ABILITY, INVALIDATE_WALL).map do |ft|
      case ft.value
      when Float
        [(ft.value * mhp).floor, 1].max
      when Integer
        ft.value
      end
    end
    values.max
  end

  #--------------------------------------------------------------------------
  # ● ダメージMP変換を取得
  #--------------------------------------------------------------------------
  def damage_mp_convert
    features_with_id(FEATURE_BATTLER_ABILITY, DAMAGE_MP_CONVERT).inject([]) { |r, ft| r | [ft.value] }.min
  end

  #--------------------------------------------------------------------------
  # ● ダメージゴールド変換を取得
  #--------------------------------------------------------------------------
  def damage_gold_convert
    features_with_id(FEATURE_BATTLER_ABILITY, DAMAGE_GOLD_CONVERT).inject([]) { |r, ft| r | [ft.value] }.min
  end

  #--------------------------------------------------------------------------
  # ● ダメージMP吸収を取得
  #--------------------------------------------------------------------------
  def damage_mp_drain
    features_with_id(FEATURE_BATTLER_ABILITY, DAMAGE_MP_DRAIN).inject([]) { |r, ft| r | [ft.value] }.max
  end

  #--------------------------------------------------------------------------
  # ● ダメージゴールド回収を取得
  #--------------------------------------------------------------------------
  def damage_gold_drain
    features_with_id(FEATURE_BATTLER_ABILITY, DAMAGE_GOLD_DRAIN).inject([]) { |r, ft| r | [ft.value] }.max
  end

  #--------------------------------------------------------------------------
  # ● 行動変化を取得
  #--------------------------------------------------------------------------
  def change_action
    features_with_id(FEATURE_BATTLER_ABILITY, CHANGE_ACTION).inject([]) { |r, ft| r += [ft.value] }.flatten.shuffle
  end

  #--------------------------------------------------------------------------
  # ○ 獲得経験値倍率を取得
  #--------------------------------------------------------------------------
  def exr
    max = features_max(FEATURE_BATTLER_ABILITY, GET_EXP_RATE)
    min = features_min(FEATURE_BATTLER_ABILITY, GET_EXP_RATE)
    state = features_sum(FEATURE_BATTLER_ABILITY, GET_EXP_RATE_STATE)
    return 0.0 if min <= 0.0

    [max, 1.0].max - (1.0 - min) + state
  end

  #--------------------------------------------------------------------------
  # ● 獲得職業経験値倍率を取得
  #--------------------------------------------------------------------------
  def cexr
    max = features_max(FEATURE_BATTLER_ABILITY, GET_CLASSEXP_RATE)
    min = features_min(FEATURE_BATTLER_ABILITY, GET_CLASSEXP_RATE)
    state = features_sum(FEATURE_BATTLER_ABILITY, GET_CLASSEXP_RATE_STATE)
    return 0.0 if min <= 0.0

    [max, 1.0].max - (1.0 - min) + state
  end

  #--------------------------------------------------------------------------
  # ● スキル変化を取得
  #--------------------------------------------------------------------------
  def change_skill(src_skill_id)
    features_with_id(FEATURE_BATTLER_ABILITY, CHANGE_SKILL).inject({}) do |sum, ft|
      sum.merge(ft.value)
    end[src_skill_id]
  end

  #--------------------------------------------------------------------------
  # ● スキルタイプ消費率を取得
  #--------------------------------------------------------------------------
  def stype_cost_rate(stype_id, type)
    features_with_id(FEATURE_BATTLER_ABILITY, STYPE_COST_RATE).select do |ft|
      ft.value[:type] == type
    end.inject(1.0) do |r, ft|
      ft.value[:id] == stype_id ? [r * ft.value[:rate], 0.01].max : r
    end
  end

  #--------------------------------------------------------------------------
  # ● スキル消費率を取得
  #--------------------------------------------------------------------------
  def skill_cost_rate(skill_id, type)
    features_with_id(FEATURE_BATTLER_ABILITY, SKILL_COST_RATE).select do |ft|
      ft.value[:type] == type
    end.inject(1.0) do |r, ft|
      ft.value[:id] == skill_id ? [r * ft.value[:rate], 0.01].max : r
    end
  end

  #--------------------------------------------------------------------------
  # ● TP消費率を取得
  #--------------------------------------------------------------------------
  def tp_cost_rate
    features_pi(FEATURE_BATTLER_ABILITY, TP_COST_RATE)
  end

  #--------------------------------------------------------------------------
  # ● HP消費率を取得
  #--------------------------------------------------------------------------
  def hp_cost_rate
    features_pi(FEATURE_BATTLER_ABILITY, HP_COST_RATE)
  end

  #--------------------------------------------------------------------------
  # ● ゴールド消費率を取得
  #--------------------------------------------------------------------------
  def gold_cost_rate
    features_pi(FEATURE_BATTLER_ABILITY, GOLD_COST_RATE)
  end

  #--------------------------------------------------------------------------
  # ● 消費アイテム節約率を取得
  #--------------------------------------------------------------------------
  def item_cost_scrimp(item_id)
    list = [0]
    features_with_id(FEATURE_BATTLER_ABILITY, ITEM_COST_SCRIMP).each do |ft|
      list.push(ft.value[item_id]) if ft.value[item_id]
    end
    list.max
  end

  #--------------------------------------------------------------------------
  # ● 必要アイテム無視を取得
  #--------------------------------------------------------------------------
  def need_item_ignore?(item_id)
    features_with_id(FEATURE_BATTLER_ABILITY, NEED_ITEM_IGNORE).any? { |ft| ft.value.include?(item_id) }
  end

  #--------------------------------------------------------------------------
  # ● 固定TP増加値を取得
  #--------------------------------------------------------------------------
  def increase_tp_fix
    features_with_id(FEATURE_BATTLER_ABILITY, INCREASE_TP).select do |ft|
      !ft.value[:per]
    end.inject(0)  do |sum, ft|
      sum += ft.value[:plus] ? ft.value[:num] : -ft.value[:num]
    end
  end

  #--------------------------------------------------------------------------
  # ● 割合TP増加値を取得
  #--------------------------------------------------------------------------
  def increase_tp_per
    hoge = features_with_id(FEATURE_BATTLER_ABILITY, INCREASE_TP).select do |ft|
      ft.value[:per]
    end.inject(1.0) do |sum, ft|
      sum += ft.value[:plus] ? ft.value[:num] * 0.01 : -ft.value[:num] * 0.01
    end
  end

  #--------------------------------------------------------------------------
  # ● 開始時TPを取得
  #--------------------------------------------------------------------------
  def start_tp_rate
    features_max(FEATURE_BATTLER_ABILITY, START_TP_RATE)
  end

  #--------------------------------------------------------------------------
  # ● 戦闘後HP回復を取得
  #--------------------------------------------------------------------------
  def battle_end_heel_hp
    features_max(FEATURE_BATTLER_ABILITY, BATTLE_END_HEEL_HP)
  end

  #--------------------------------------------------------------------------
  # ● 戦闘後MP回復を取得
  #--------------------------------------------------------------------------
  def battle_end_heel_mp
    features_max(FEATURE_BATTLER_ABILITY, BATTLE_END_HEEL_MP)
  end

  #--------------------------------------------------------------------------
  # ○ 通常攻撃用スキルIDを取得
  #--------------------------------------------------------------------------
  def attack_skill_id
    features_with_id(FEATURE_BATTLER_ABILITY, Battler::NORMAL_ATTACK).inject([1]) { |r, ft| r | [ft.value] }.max
  end

  #--------------------------------------------------------------------------
  # ● 必中反撃率を取得
  #--------------------------------------------------------------------------
  def certain_counter
    features_xparam_rate(FEATURE_BATTLER_ABILITY, CERTAIN_COUNTER)
  end

  #--------------------------------------------------------------------------
  # ● 魔法反撃率を取得
  #--------------------------------------------------------------------------
  def magical_counter
    features_xparam_rate(FEATURE_BATTLER_ABILITY, MAGICAL_COUNTER)
  end

  #--------------------------------------------------------------------------
  # ● 拡張必中反撃率を取得
  #--------------------------------------------------------------------------
  def certain_counter_ex
    features_with_id(FEATURE_BATTLER_ABILITY, CERTAIN_COUNTER_EX).inject(0.0) { |sum, ft| sum + ft.value }
  end

  #--------------------------------------------------------------------------
  # ● 拡張反撃率を取得
  #--------------------------------------------------------------------------
  def physical_counter_ex
    features_with_id(FEATURE_BATTLER_ABILITY, PHYSICAL_COUNTER_EX).inject(0.0) { |sum, ft| sum + ft.value }
  end

  #--------------------------------------------------------------------------
  # ● 拡張魔法反撃率を取得
  #--------------------------------------------------------------------------
  def magical_counter_ex
    features_with_id(FEATURE_BATTLER_ABILITY, MAGICAL_COUNTER_EX).inject(0.0) { |sum, ft| sum + ft.value }
  end

  #--------------------------------------------------------------------------
  # ● 仲間想い補正を取得
  #--------------------------------------------------------------------------
  def considerate
    features_max(FEATURE_BATTLER_ABILITY, CONSIDERATE)
  end

  #--------------------------------------------------------------------------
  # ● 自爆耐性判定を取得
  #--------------------------------------------------------------------------
  def own_crush_resist?
    !features_with_id(FEATURE_BATTLER_ABILITY, OWN_CRUSH_RESIST).empty?
  end

  #--------------------------------------------------------------------------
  # ● 時間停止無視を取得
  #--------------------------------------------------------------------------
  def ignore_over_drive?
    !features_with_id(FEATURE_BATTLER_ABILITY, IGNORE_OVER_DRIVE).empty?
  end

  #--------------------------------------------------------------------------
  # ● 即死反転を取得
  #--------------------------------------------------------------------------
  def instant_dead_reverse?
    !features_with_id(FEATURE_BATTLER_ABILITY, INSTANT_DEAD_REVERSE).empty?
  end

  #--------------------------------------------------------------------------
  # ● 二刀流スロット不可を取得
  #--------------------------------------------------------------------------
  def slot_cannot_dual_wield?
    !features_with_id(FEATURE_BATTLER_ABILITY, SLOT_CANNOT_DUAL_WIELD).empty?
  end

  #--------------------------------------------------------------------------
  # ● 属性ブースター倍率を取得
  #--------------------------------------------------------------------------
  def booster_element(element_id)
    1.0 + features_sum_booster(ELEMENT, element_id)
  end

  #--------------------------------------------------------------------------
  # ● 武器強化物理倍率を取得
  #--------------------------------------------------------------------------
  def booster_weapon_physical(wtype_id)
    1.0 + features_sum_booster(WEAPON_PHYSICAL, wtype_id)
  end

  #--------------------------------------------------------------------------
  # ● 武器強化魔法倍率を取得
  #--------------------------------------------------------------------------
  def booster_weapon_magical(wtype_id)
    1.0 + features_sum_booster(WEAPON_MAGICAL, wtype_id)
  end

  #--------------------------------------------------------------------------
  # ● 武器強化必中倍率を取得
  #--------------------------------------------------------------------------
  def booster_weapon_certain(wtype_id)
    1.0 + features_sum_booster(WEAPON_CERTAIN, wtype_id)
  end

  #--------------------------------------------------------------------------
  # ● 通常攻撃強化倍率を取得
  #--------------------------------------------------------------------------
  def booster_normal_attack(wtype_id)
    1.0 + features_with_id(FEATURE_MULTI_BOOSTER, Booster::NORMAL_ATTACK).inject(0.0) do |r, ft|
      next r unless ft.value.key?(wtype_id)

      r < ft.value[wtype_id] ? ft.value[wtype_id] : r
    end
  end

  #--------------------------------------------------------------------------
  # ● ステート割合強化タイプ倍率を取得
  #--------------------------------------------------------------------------
  def booster_state_ratio_type(skill)
    1.0 + skill.stypes.inject(0.0) do |sum, id|
      sum + features_sum_booster(STATE_RATIO_TYPE, id)
    end
  end

  #--------------------------------------------------------------------------
  # ● ステート固定強化タイプを取得
  #--------------------------------------------------------------------------
  def booster_state_fix_type(skill)
    skill.stypes.inject(0.0) do |sum, id|
      sum + features_sum_booster(STATE_FIX_TYPE, id)
    end
  end

  #--------------------------------------------------------------------------
  # ● スキルタイプ強化倍率を取得
  #--------------------------------------------------------------------------
  def booster_skill_type(skill)
    1.0 + skill.stypes.inject(0.0) do |sum, id|
      sum + features_sum_booster(SKILL_TYPE, id)
    end
  end

  #--------------------------------------------------------------------------
  # ● ステート割合強化スキル倍率を取得
  #--------------------------------------------------------------------------
  def booster_state_ratio_skill(skill)
    1.0 + features_sum_booster(STATE_RATIO_SKILL, skill.id)
  end

  #--------------------------------------------------------------------------
  # ● スキル強化倍率を取得
  #--------------------------------------------------------------------------
  def booster_skill(skill)
    1.0 + features_sum_booster(SKILL, skill.id)
  end

  #--------------------------------------------------------------------------
  # ● 武器スキル強化倍率を取得
  #--------------------------------------------------------------------------
  def booster_wtype_skill(wtype_id, skill)
    1.0 + skill.stypes.inject(0.0) do |sum, stype_id|
      sum + features_sum_booster(WTYPE_SKILL, [wtype_id, stype_id])
    end
  end

  #--------------------------------------------------------------------------
  # ● カウンター強化倍率を取得
  #--------------------------------------------------------------------------
  def booster_counter
    1.0 + features_max(FEATURE_MULTI_BOOSTER, COUNTER)
  end

  #--------------------------------------------------------------------------
  # ● HP減少時強化を取得
  #--------------------------------------------------------------------------
  def booster_fall_hp
    features_with_id(FEATURE_MULTI_BOOSTER, FALL_HP).collect do |ft|
      ft.value
    end.min { |a, b| b[:boost] <=> a[:boost] }
  end

  #--------------------------------------------------------------------------
  # ● オーバーソウルを取得
  #--------------------------------------------------------------------------
  def over_soul
    features_max(FEATURE_MULTI_BOOSTER, OVER_SOUL)
  end

  #--------------------------------------------------------------------------
  # ● 地形補正を取得
  #--------------------------------------------------------------------------
  def terrain_revise
    1.0 + features_max(FEATURE_TERRAIN_BOOSTER, BattleManager.terrain)
  end

  def booster_ex_category_defence(id)
    features_pi(FEATURE_EX_CATEGORY_DEFENCE, id)
  end

  def features_xparam_rate(code, id)
    1.0 - features_with_id(code, id).inject(1.0) { |r, ft| r * (1.0 - ft.value) }
  end

  #--------------------------------------------------------------------------
  # ○ 追加能力値の取得
  #--------------------------------------------------------------------------
  def xparam(xparam_id)
    return features_sum(FEATURE_XPARAM_FIX, xparam_id) unless features_with_id(FEATURE_XPARAM_FIX, xparam_id).empty?

    case xparam_id
    when 0
      hit_base(xparam_id) + features_sum(FEATURE_XPARAM, xparam_id)
    when 3
      features_sum(FEATURE_XPARAM, xparam_id)
    else
      features_xparam_rate(FEATURE_XPARAM, xparam_id)
    end
  end

  def physical_reflection_rate
    features_xparam_rate(FEATURE_BATTLER_ABILITY, PHYSICAL_REFLECTION)
  end

  def hit_base(xparam_id)
    values = features_with_id(FEATURE_XPARAM_EX, xparam_id).map(&:value)
    return 0.8 if values.empty?

    values.inject(:+) / values.size * 1.0
  end

  def add_elements(element)
    features_with_id(FEATURE_ADD_ELEMENT, element).map(&:value)
  end

  def auto_skill_parcent(type_id)
    invalid = auto_skill_invalid(type_id)
    invalid_priority = auto_skill_priority_invalid(type_id)
    invalid_condition = auto_skill_condition_invalid(type_id)
    features_with_id(FEATURE_BATTLER_ABILITY, type_id).map(&:value).reject do |v|
      invalid.include?(v[:id]) || invalid_priority.include?(v[:priority]) || invalid_condition.include?(v[:condition_type])
    end
  end

  def auto_skill(type_id)
    features_with_id(FEATURE_BATTLER_ABILITY, type_id).map(&:value).flatten - auto_skill_invalid(type_id)
  end

  def auto_skill_invalid(type_id)
    features_with_id(FEATURE_AUTO_SKILL_INVALID, type_id).map(&:value)
  end

  def auto_skill_priority_invalid(type_id)
    features_with_id(FEATURE_AUTO_SKILL_PRIORITY_INVALID, type_id).map(&:value)
  end

  def auto_skill_condition_invalid(type_id)
    features_with_id(FEATURE_AUTO_SKILL_CONDITION_INVALID, type_id).map(&:value)
  end

  def booster_ex_category_attack_bonus(id)
    1.0 + features_sum(FEATURE_EX_CATEGORY_ATTACK_BONUS, id)
  end

  def ex_category_attack_rate(id, item)
    r = 1.0 + features_sum(FEATURE_EX_CATEGORY_ATTACK, id) + item.booster_ex_category_attack(id)
    r += item.stypes.map { |stype_id| features_sum(FEATURE_EX_CATEGORY_STYPE, [stype_id, id]) }.inject(0, :+)
    r *= booster_ex_category_attack_bonus(id) if r > 1.0
    r
  end

  def reduce_boost_damage_rate(rate, id = nil)
    return rate if ExCategory::INVALID_REDUCE_BOOST_DAMAGE_ID.include?(id)

    reduce = rate - 1
    return rate if reduce <= 0

    1.0 + reduce * features_pi(FEATURE_REDUCE_BOOST_DAMAGE, 0)
  end

  def skill_id_plus_attack(skill_id)
    features_sum(FEATURE_SKILL_PLUS_ATTACK, skill_id).to_i
  end

  def skill_type_plus_attack(skill_type)
    features_sum(FEATURE_SKILL_TYPE_PLUS_ATTACK, skill_type).to_i
  end

  def element_rate_fix(element_id)
    fts = features_with_id(FEATURE_ELEMENT_RATE_FIX, element_id)
    return nil if fts.empty?

    fts.map(&:value).inject(1.0, :*)
  end

  def state_rate_fix(state_id)
    fts = features_with_id(FEATURE_STATE_RATE_FIX, state_id)
    return nil if fts.empty?

    fts.map(&:value).inject(1.0, :*)
  end

  def state_rate(state_id)
    fix_rate = state_rate_fix(state_id)
    return fix_rate if fix_rate

    features_pi(FEATURE_STATE_RATE, state_id)
  end

  def element_reflection(element_id)
    return false if element_rate_fix(element_id)

    features_with_id(FEATURE_BATTLER_ABILITY, ELEMENT_REFLECTION).inject([]) do |a, ft|
      a << ft.value
    end.include?(element_id)
  end

  def element_drain?(element_id)
    return false if element_rate_fix(element_id)

    !features_with_id(FEATURE_ELEMENT_DRAIN, element_id).empty?
  end

  def ex_category
    features_set(FEATURE_EX_CATEGORY)
  end

  def skill_combo(skill)
    return [] unless skill.is_a?(RPG::Skill)

    id = features_with_id(FEATURE_SKILL_COMBO, skill.id).map(&:value)
    type = skill.stypes.map do |stype|
      features_with_id(FEATURE_SKILL_TYPE_COMBO, stype).map(&:value)
    end.flatten
    id + type
  end

  def skill_unstoppable?(skill)
    return unless skill.is_a?(RPG::Skill)

    return true unless features_with_id(FEATURE_SKILL_UNSTOPPABLE, skill.id).empty?

    skill.stypes.any? do |stype|
      !features_with_id(FEATURE_SKILL_TYPE_UNSTOPPABLE, stype).empty?
    end
  end

  def skill_scope_one?(skill)
    return true unless features_with_id(FEATURE_SKILL_SCOPE_ONE, skill.id).empty?

    skill.stypes.any? do |stype|
      !features_with_id(FEATURE_SKILL_TYPE_SCOPE_ONE, stype).empty?
    end
  end

  def skill_scope_one_rate(skill)
    id = features_sum(FEATURE_SKILL_SCOPE_ONE, skill.id)
    type = skill.stypes.inject(0.0) do |r, stype|
      r + features_sum(FEATURE_SKILL_TYPE_SCOPE_ONE, stype)
    end
    1.0 + id + type
  end

  def skill_plus_attack_one(skill)
    return 0 unless skill.is_a?(RPG::Skill)

    id = features_sum(FEATURE_SKILL_PLUS_ATTACK_ONE, skill.id).to_i
    skill.stypes.inject(id) do |i, stype|
      i + features_sum(FEATURE_SKILL_TYPE_PLUS_ATTACK_ONE, stype).to_i
    end
  end

  def skill_plus_attack_one_random(skill)
    return 0 unless skill.is_a?(RPG::Skill)

    id = features_sum(FEATURE_SKILL_PLUS_ATTACK_ONE_RANDOM, skill.id).to_i
    skill.stypes.inject(id) do |i, stype|
      i + features_sum(FEATURE_SKILL_TYPE_PLUS_ATTACK_ONE_RANDOM, stype).to_i
    end
  end

  def skill_plus_attack_one_random?(skill)
    return false unless skill.is_a?(RPG::Skill)
    return true unless features_with_id(FEATURE_SKILL_PLUS_ATTACK_ONE_RANDOM, skill.id).empty?

    skill.stypes.any? do |stype|
      !features_with_id(FEATURE_SKILL_TYPE_PLUS_ATTACK_ONE_RANDOM, stype).empty?
    end
  end

  def skill_scope_all?(skill)
    return false unless skill.is_a?(RPG::Skill)
    return true unless features_with_id(FEATURE_SKILL_SCOPE_ALL, skill.id).empty?

    skill.stypes.any? do |stype|
      !features_with_id(FEATURE_SKILL_TYPE_SCOPE_ALL, stype).empty?
    end
  end

  def auto_state_set_turn
    features(FEATURE_BATTLE_START_STATE).map(&:value)
  end

  def booster_enemy_single_rate(skill)
    rate = 1.0 + features_sum(FEATURE_MULTI_BOOSTER, Booster::ENEMY_SIGNLE)
    rate *= 1.0 + features_sum(FEATURE_ENEMY_SINGLE_SKILL_BOOST, skill.id)
    skill.stypes.inject(rate) do |r, stype|
      r * (1.0 + features_sum(FEATURE_ENEMY_SINGLE_SKILL_TYPE_BOOST, stype))
    end
  end

  def booster_enemy_multi_rate(skill)
    rate = 1.0 + features_sum(FEATURE_MULTI_BOOSTER, Booster::ENEMY_MULTI)
    rate *= 1.0 + features_sum(FEATURE_ENEMY_MULTI_SKILL_BOOST, skill.id)
    skill.stypes.inject(rate) do |r, stype|
      r * (1.0 + features_sum(FEATURE_ENEMY_MULTI_SKILL_TYPE_BOOST, stype))
    end
  end

  def booster_weapon_type_attack(wtype_id)
    1.0 + features_sum(FEATURE_WEAPON_TYPE_ATTACK_BOOST, wtype_id)
  end

  def booster_armor_type_defence(atype_id)
    features_pi(FEATURE_ARMOR_TYPE_DEFENCE_BOOST, atype_id)
  end

  def cost_zero?(type)
    !features_with_id(FEATURE_COST_ZERO, type).empty?
  end

  def skill_id_cost_zero?(skill, type)
    !features_with_id(FEATURE_SKILL_COST_ZERO, [type, skill.id]).empty?
  end

  def skill_type_cost_zero?(skill, type)
    skill.stypes.any? do |stype|
      !features_with_id(FEATURE_SKILL_TYPE_COST_ZERO, [type, stype]).empty?
    end
  end

  def booster_item_damage(item)
    return 1.0 unless item.is_a?(RPG::Item)

    rate = 1.0
    rate *= 1.0 + features_sum(FEATURE_MULTI_BOOSTER, Booster::ITEM_DAMAGE)
    rate *= 1.0 + features_sum(FEATURE_ID_ITEM_BOOST, item.id)
    rate
  end

  def param_neutralize?(param_id)
    !features_with_id(FEATURE_PARAM_NEUTRALIZE, param_id).empty?
  end

  def booster_state_damage(state_id, item)
    a = [FEATURE_STATE_DAMAGE_BOOST, state_id]
    1.0 + features_sum(*a) + item.features_with_id(*a).map(&:value).inject(0.0, &:+)
  end

  def booster_state_effect(state_id)
    1.0 + features_sum(FEATURE_STATE_EFFECT_BOOST, state_id)
  end

  def param_rate(param_id)
    features_pi(FEATURE_PARAM, param_id) * features_with_id(FEATURE_PARAM_STATE, param_id).inject(1.0) do |i, feature|
      state_rate = booster_state_effect(feature.obj_id)
      i * (feature.value * state_rate)
    end
  end

  def skill_fastest_boost
    1.0 + features_sum(FEATURE_SKILL_TIMING_BOOST, SkillTiming::FAST)
  end

  def skill_latest_boost
    1.0 + features_sum(FEATURE_SKILL_TIMING_BOOST, SkillTiming::LATE)
  end

  def skill_fastest_repeat
    features_with_id(FEATURE_SKILL_TIMING_REPEAT, SkillTiming::FAST).empty? ? 0 : 1
  end

  def skill_latest_repeat
    features_with_id(FEATURE_SKILL_TIMING_REPEAT, SkillTiming::LATE).empty? ? 0 : 1
  end

  def booster_full_hp_skill(skill)
    features_max(FEATURE_FULL_HP_SKILL_BOOST, skill.id)
  end

  def booster_full_hp_skill_type(skill)
    skill.stypes.map { |stype| features_max(FEATURE_FULL_HP_SKILL_TYPE_BOOST, stype) }.max
  end

  def booster_full_hp_status_rate
    features(FEATURE_FULL_HP_BOOST).select { |ft| ft.data_id <= hp_rate }.map(&:value).max || 1.0
  end

  def booster_full_mp(skill)
    v = skill.stypes.map do |stype_id|
      full_mp_stype_boost(stype_id)
    end
    rate = full_mp_boost + v.inject(0, :+)
    1.0 + rate * mp_rate
  end

  def full_mp_boost
    features_sum(FEATURE_FULL_MP_BOOST, 0)
  end

  def full_mp_stype_boost(stype_id)
    features_sum(FEATURE_FULL_MP_STYPE_BOOST, stype_id)
  end

  def booster_full_tp(skill)
    v = skill.stypes.map do |stype_id|
      full_tp_stype_boost(stype_id)
    end
    rate = full_tp_boost + v.inject(:+)
    1.0 + rate * tp_rate
  end

  def full_tp_boost
    features_sum(FEATURE_FULL_SP_BOOST, 0)
  end

  def full_tp_stype_boost(stype_id)
    features_sum(FEATURE_FULL_SP_STYPE_BOOST, stype_id)
  end

  def chain_boost?
    false
  end

  def skill_chain_boost
    1.0 + features_sum(FEATURE_SKILL_CHAIN_BOOST, 0)
  end

  def skill_counter_ex(skill)
    return nil unless skill.is_a?(RPG::Skill)

    result = features_with_id(FEATURE_SKILL_COUNTER_EX, skill.id).map(&:value)
    skill.stypes.each do |stype_id|
      result += features_with_id(FEATURE_STYPE_COUNTER_EX, stype_id).map(&:value)
    end
    result.select! { |id| skill_race_ok?($data_skills[id]) }
    result.sample
  end

  def fast_move_all?
    !features(FEATURE_FAST_MOVE_ALL).empty?
  end

  def slow_move_all?
    !features(FEATURE_SLOW_MOVE_ALL).empty?
  end

  def slow_move?(skill)
    return false if skill.nil? || !skill.is_skill?
    return true if skill.slow_move? || slow_move_all?

    result_stype = skill.stypes.any? { |stype_id| !features_with_id(FEATURE_SLOW_MOVE_STYPE, stype_id).empty? }
    !features_with_id(FEATURE_SLOW_MOVE_SID, skill.id).empty? || result_stype
  end

  def fast_move?(skill)
    return false if skill.nil? || !skill.is_skill?
    return true if skill.fast_move? || fast_move_all?

    result_stype = skill.stypes.any? { |stype_id| !features_with_id(FEATURE_FAST_MOVE_STYPE, stype_id).empty? }
    !features_with_id(FEATURE_FAST_MOVE_SID, skill.id).empty? || result_stype
  end

  def turn_end_revive?
    !features(FEATURE_TURN_END_REVIVE).empty?
  end

  def undead?
    !features(FEATURE_UNDEAD).empty?
  end

  def add_speed(item)
    return 0 unless item

    item.stypes.inject(0) do |i, stype|
      i += features_sum(FEATURE_ADD_SPEED, stype)
      i + features_sum(FEATURE_ADD_SPEED_PARAM_RATE, stype) * agi
    end.to_i
  end

  #--------------------------------------------------------------------------
  # ● タイプ別消費アイテム節約率を取得
  #--------------------------------------------------------------------------
  def item_cost_scrimp_type(skill)
    list = [0]
    skill.stypes.each do |id|
      features_with_id(FEATURE_BATTLER_ABILITY, ITEM_COST_SCRIMP_TYPE).each do |ft|
        list.push(ft.value[id]) if ft.value[id]
      end
    end
    list.max
  end

  #--------------------------------------------------------------------------
  # ● 攻撃時属性の取得
  #--------------------------------------------------------------------------
  def atk_elements
    normal_attack_force_element ? [1] : features_set(FEATURE_ATK_ELEMENT)
  end

  def normal_attack_force_element
    !features_with_id(FEATURE_BATTLER_ABILITY, NORMAL_ATTACK_FORCE_ELEMENT).empty?
  end

  #--------------------------------------------------------------------------
  # ● ステート特攻スキルの取得
  #--------------------------------------------------------------------------
  def booster_state_skill(state, skill)
    1.0 + features_sum_booster(STATE_SKILL, [skill.id, state.id])
  end

  #--------------------------------------------------------------------------
  # ● ステート特攻スキルタイプの取得
  #--------------------------------------------------------------------------
  def booster_state_skill_type(state, skill)
    1.0 + skill.stypes.inject(0.0) do |_sum, stype_id|
      features_sum_booster(STATE_SKILL_TYPE, [stype_id, state.id])
    end
  end

  #--------------------------------------------------------------------------
  # ● ステート特攻通常攻撃の取得
  #--------------------------------------------------------------------------
  def booster_state_normal_attack(state)
    1.0 + features_sum_booster(STATE_NORMAL_ATACK, state.id)
  end

  #--------------------------------------------------------------------------
  # ● 必中回避率を取得
  #--------------------------------------------------------------------------
  def certain_evasion
    xparam(10)
  end

  #--------------------------------------------------------------------------
  # ● 反射ダメージ増加率を取得
  #--------------------------------------------------------------------------
  def booster_reflection
    1.0 + features_max(FEATURE_MULTI_BOOSTER, REFLECTION)
  end

  #--------------------------------------------------------------------------
  # ● 必中ダメージ率を取得
  #--------------------------------------------------------------------------
  def certain_damage_rate
    features_pi(FEATURE_BATTLER_ABILITY, CERTAIN_DAMAGE_RATE)
  end

  #--------------------------------------------------------------------------
  # ● 会心ダメージ増加率を取得
  #--------------------------------------------------------------------------
  def booster_critical
    1.0 + features_sum(FEATURE_MULTI_BOOSTER, CRITICAL)
  end

  #--------------------------------------------------------------------------
  # ● 特定アクター能力増加率を取得
  #--------------------------------------------------------------------------
  def booster_actor_param
    actor? ? 1.0 + features_sum_booster(ACTOR_PARAM, actor.original_persona_id) : 1.0
  end

  #--------------------------------------------------------------------------
  # ● 職業能力増加率を取得
  #--------------------------------------------------------------------------
  def booster_class
    actor? ? 1.0 + features_sum_booster(CLASS, class_id) + features_sum_booster(CLASS, tribe_id) : 1.0
  end

  #--------------------------------------------------------------------------
  # ● 自己ステート延長取得
  #--------------------------------------------------------------------------
  def booster_self_state(state_id)
    features_sum_booster(SELF_STATE, state_id).to_i
  end

  #--------------------------------------------------------------------------
  # ● 相手ステート延長取得
  #--------------------------------------------------------------------------
  def booster_target_state(state_id)
    features_sum_booster(TARGET_STATE, state_id).to_i
  end

  #--------------------------------------------------------------------------
  # ● 自己ステート永久取得
  #--------------------------------------------------------------------------
  def self_state_eternal?(state_id)
    features_with_id(FEATURE_BATTLER_ABILITY, SELF_STATE_ETERNAL).any? { |ft| ft.value.include?(state_id) }
  end

  #--------------------------------------------------------------------------
  # ● 相手ステート永久取得
  #--------------------------------------------------------------------------
  def target_state_eternal?(state_id)
    features_with_id(FEATURE_BATTLER_ABILITY, TARGET_STATE_ETERNAL).any? { |ft| ft.value.include?(state_id) }
  end

  #--------------------------------------------------------------------------
  # ● HPターン回復無効取得
  #--------------------------------------------------------------------------
  def hp_regen_invalid?
    features_with_id(FEATURE_BATTLER_ABILITY, HP_REGEN_INVALID).any? { |ft| ft.value }
  end

  #--------------------------------------------------------------------------
  # ● 行動不能取得
  #--------------------------------------------------------------------------
  def cant_move?
    features_with_id(FEATURE_BATTLER_ABILITY, CANT_MOVE).any? { |ft| ft.value }
  end

  #--------------------------------------------------------------------------
  # ● 戦闘開始時HP
  #--------------------------------------------------------------------------
  def battle_start_hp
    features_min(FEATURE_BATTLER_ABILITY, BATTLE_START_HP)
  end

  def booster_pinchi_skill(skill)
    features_with_id(FEATURE_MULTI_BOOSTER, PINCHI_SKILL).map do |ft|
      ft.value.key?(skill.id) ? ft.value[skill.id] : 0
    end.max || 0
  end

  def booster_pinchi_skill_type(skill)
    features_with_id(FEATURE_MULTI_BOOSTER, PINCHI_SKILL_TYPE).map do |ft|
      skill.stypes.map do |stype|
        ft.value.key?(stype) ? ft.value[stype] : 0
      end.max || 0
    end.max || 0
  end

  def booster_pinchi(skill)
    powor = [booster_pinchi_skill(skill), booster_pinchi_skill_type(skill), skill.pinchi_boost].max
    1.0 + (1.0 - (hp.to_f / mhp)) * powor
  end

  def all_add_elements(item)
    return [] if item.damage.recover? || item.damage.none?

    features_set(FEATURE_ALL_ADD_ELEMENT)
  end

  def element_penetrate?(id)
    !features_with_id(FEATURE_PENETRATION_ELEMENT, id).empty?
  end

  def same_element_damage_rate_bonus(element_id)
    features_sum(FEATURE_SAME_ELEMENT_DAMAGE_BOOST, element_id)
  end

  def state_boost_plus
    features_sum_all(FEATURE_STATE_BOOST_PLUS)
  end

  def certain_reflection_rate
    features_sum(FEATURE_BATTLER_ABILITY, CERTAIN_REFLECTION)
  end

  def evasion_skill
    auto_skill_parcent(EVASION_SKILL)
  end

  def item_cost_rate(item)
    rate = item.stypes.inject(1) do |r, stype|
      r * [1, features_sum(FEATURE_STYPE_ITEM_COST_RATE, stype).to_i].max
    end
    rate *= [1, features_sum(FEATURE_ITEM_COST_RATE, 0).to_i].max
    rate
  end

  def item_get_rate(item)
    rate = item.stypes.inject(1) do |r, stype|
      r * [1, features_sum(FEATURE_STYPE_ITEM_GET_RATE, stype).to_i].max
    end
    rate *= [1, features_sum(FEATURE_ITEM_GET_RATE, 0).to_i].max
    rate
  end

  def skill_type_chain(skill)
    skill.stypes.inject([]) do |a, stype|
      a + skill_type_id_chain(stype)
    end
  end

  def hit_damage_boost
    [features_max(FEATURE_HIT_DAMAGE_BOOST, 0), 1.0].max * features_min(FEATURE_HIT_DAMAGE_BOOST, 1)
  end

  def booster_hit(item, count_data)
    return 1.0 if count_data.nil? || !item.hit_boost?

    count = item.exp_target[0][0] == 3 ? count_data.values.inject(0, :+) : (count_data.values.max || 0)
    return 1.0 if count <= 1

    hit_damage_boost**(count - 1)
  end

  def skill_type_id_chain(stype_id)
    features_with_id(FEATURE_SKILL_CHAIN, stype_id).map(&:value)
  end

  def magical_critical
    features_xparam_rate(FEATURE_MAGICAL_CRITICAL, 0)
  end

  def feature_revive_rate
    features_max(FEATURE_AUTO_REVIVE, AutoRevive::RATE)
  end

  def feature_revive_count
    features_sum(FEATURE_AUTO_REVIVE, AutoRevive::COUNT).to_i
  end

  def action_minus
    features_sum(FEATURE_ACTION_MINUS, 0).to_i
  end

  def booster_all_damage
    1.0 + features_sum(FEATURE_DAMAGE_BOOST, 0)
  end

  def feature_turn_hit_damage_rate
    [0, 1.0 - features_sum(FEATURE_TURN_HIT_DAMAGE_RATE, 0)].max
  end

  def enemy_calculation?
    enemy?
  end

  def icon_index
    0
  end

  def display_color
    0
  end

  def alternate_tp_to_mp?
    !features_with_id(FEATURE_ALTERNATE_TP_TO_MP, 0).empty?
  end

  def alternate_tp_to_mp_rate
    features_with_id(FEATURE_ALTERNATE_TP_TO_MP, 0).map(&:value).min || 1.0
  end
end

#==============================================================================
# ■ Game_Enemy
#==============================================================================
class Game_Enemy < Game_Battler
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_reader :steal_list

  #--------------------------------------------------------------------------
  # ○ オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(index, enemy_id)
    super()
    @index = index
    @enemy_id = enemy_id
    enemy = $data_enemies[@enemy_id]
    @original_name = enemy.name
    @letter = ""
    @plural = false
    @screen_x = 0
    @screen_y = 0
    @battler_name = enemy.battler_name
    @battler_hue = enemy.battler_hue
    @hp = mhp
    @mp = mmp
    @steal_list = Marshal.load(Marshal.dump(enemy.steal_list))
    @recharge_skills = {}
  end

  #--------------------------------------------------------------------------
  # ● エネミーIDの取得
  #--------------------------------------------------------------------------
  def id
    @enemy_id
  end

  def mmp
    return super if enemy.no_difficulty?

    param_calc_variable(super, NWConst::Var::MMP, NWConst::Var::MMP_ADD)
  end

  def param_calc_variable(value, rate_var_id, plus_var_id)
    [((value + param_plus_variable(plus_var_id)) * param_rate_variable(rate_var_id)).to_i, 1].max
  end

  def param_rate_variable(var_id)
    result = $game_variables[var_id]

    result * 0.01
  end

  def param_plus_variable(var_id)
    $game_variables[var_id]
  end

  #--------------------------------------------------------------------------
  # ● 最大HP
  #--------------------------------------------------------------------------
  def mhp
    return super if enemy.no_difficulty?

    param_calc_variable(super, NWConst::Var::PARAM1, NWConst::Var::MHP_ADD)
  end

  #--------------------------------------------------------------------------
  # ● 攻撃力
  #--------------------------------------------------------------------------
  def atk
    return super if enemy.no_difficulty?

    param_calc_variable(super, NWConst::Var::PARAM2, NWConst::Var::ATK_ADD)
  end

  #--------------------------------------------------------------------------
  # ● 防御力
  #--------------------------------------------------------------------------
  def def
    return super if enemy.no_difficulty?

    param_calc_variable(super, NWConst::Var::PARAM3, NWConst::Var::DEF_ADD)
  end

  #--------------------------------------------------------------------------
  # ● 魔力
  #--------------------------------------------------------------------------
  def mat
    return super if enemy.no_difficulty?

    param_calc_variable(super, NWConst::Var::PARAM2, NWConst::Var::MAT_ADD)
  end

  #--------------------------------------------------------------------------
  # ● 精神
  #--------------------------------------------------------------------------
  def mdf
    return super if enemy.no_difficulty?

    param_calc_variable(super, NWConst::Var::PARAM3, NWConst::Var::MDF_ADD)
  end

  #--------------------------------------------------------------------------
  # ● 素早
  #--------------------------------------------------------------------------
  def agi
    return super if enemy.no_difficulty?

    param_calc_variable(super, NWConst::Var::PARAM4, NWConst::Var::AGI_ADD)
  end

  #--------------------------------------------------------------------------
  # ● 器用
  #--------------------------------------------------------------------------
  def luk
    return super if enemy.no_difficulty?

    param_calc_variable(super, NWConst::Var::PARAM2, NWConst::Var::LUK_ADD)
  end

  #--------------------------------------------------------------------------
  # ● ステート有効度の取得
  #--------------------------------------------------------------------------
  def state_rate(state_id)
    rate = super(state_id)
    var_id = NWConst::Var::PARAM_STATE_RATE[state_id]
    if var_id
      value = $game_variables[var_id]
      if value > 0
        rate *= value * 0.01
      elsif value < 0
        rate *= 0
      end
    end
    rate
  end

  #--------------------------------------------------------------------------
  # ● TP の最大値を取得【オーバーライド】
  #--------------------------------------------------------------------------
  def max_tp
    [((NWConst::Actor::MAX_MSP + increase_tp_fix) * increase_tp_per).ceil, 1].max
  end

  #--------------------------------------------------------------------------
  # ● TP の初期化【オーバーライド】
  #--------------------------------------------------------------------------
  def init_tp
    self.tp = max_tp
  end

  #--------------------------------------------------------------------------
  # ○ TP の再生
  #--------------------------------------------------------------------------
  def regenerate_tp
    init_tp
  end

  #--------------------------------------------------------------------------
  # ○ ドロップアイテム取得率の倍率を取得
  #--------------------------------------------------------------------------
  def drop_item_rate
    [$game_party.get_item_rate, ($game_party.drop_item_double? ? 2.0 : 1.0)].max
  end

  #--------------------------------------------------------------------------
  # ● 逃走レベルの取得
  #--------------------------------------------------------------------------
  def escape_level
    enemy.escape_level
  end

  #--------------------------------------------------------------------------
  # ● 武器タイプ配列の取得
  #--------------------------------------------------------------------------
  def wtypes
    [enemy.wtype_id]
  end

  #--------------------------------------------------------------------------
  # ● 誘惑時行動スキルIDの取得
  #--------------------------------------------------------------------------
  def temptation_skill_id
    return NWConst::Skill::NO_LUCA_TEMPTATION unless $game_party.in_member_luca?

    enemy.temptation_skill || NWConst::Skill::DEFAULT_TEMPTATION
  end

  #--------------------------------------------------------------------------
  # ○ 戦闘行動の作成
  #--------------------------------------------------------------------------
  def make_actions
    super
    return if @actions.empty?

    action_list = if state?(NWConst::State::UBIND)
                    make_bind_actions
                  elsif state?(NWConst::State::EUBIND)
                    make_eternal_bind_actions
                  else
                    make_normal_actions
                  end
    action_list.select! { |a| conditions_met?(a) }
    action_list.reject! { |a| @recharge_skills.keys.include?(a.skill_id) }
    action_list.reject! { |a| $game_party.lonely? && $data_skills[a.skill_id].lonely_unused? }
    cycle_success = []
    cycle_failure = []
    action_list.select { |a| $data_skills[a.skill_id].cycle_skill? }.each do |a|
      if $data_skills[a.skill_id].cycle_eval
        cycle_success.push(a)
      else
        cycle_failure.push(a)
      end
    end
    cycle_failure.each { |a| action_list.delete(a) }
    action_list = cycle_success unless cycle_success.empty?
    rating_sum  = action_list.inject(0) { |sum, a| sum += a.rating }
    @actions.map! do |action|
      next nil if action_list.empty?

      action.set_enemy_action(select_enemy_action(action_list, rating_sum))
      if action.item.recharge > 0
        action_list.reject! { |a| a.skill_id == action.item.id }
        rating_sum = action_list.inject(0) { |sum, a| sum += a.rating }
      end
      action
    end.compact!
  end

  #--------------------------------------------------------------------------
  # ○ 有効な行動がない場合の使用スキル
  #--------------------------------------------------------------------------
  def no_valid_action_skill_id
    NWConst::Skill::NO_VALID_ACTION
  end

  #--------------------------------------------------------------------------
  # ○ 戦闘行動をランダムに選択
  #--------------------------------------------------------------------------
  def select_enemy_action(action_list, rating_sum)
    value = rand(rating_sum)
    action_list.each do |action|
      value -= action.rating
      return action if value < 0
    end
  end

  #--------------------------------------------------------------------------
  # ● スキル使用コストの支払い
  #--------------------------------------------------------------------------
  def pay_skill_cost(skill)
    super
    @recharge_skills[skill.id] = skill.recharge
  end

  #--------------------------------------------------------------------------
  # ● 使用効果［捕食］
  #--------------------------------------------------------------------------
  def item_effect_predation(user, item, effect)
    return if enemy.no_predation?

    super(user, item, effect)
  end

  #--------------------------------------------------------------------------
  # ● ターン終了処理
  #--------------------------------------------------------------------------
  def on_turn_end
    super
    count_recharge_skills
  end

  #--------------------------------------------------------------------------
  # ● スキルのリチャージカウントを進める
  #--------------------------------------------------------------------------
  def count_recharge_skills
    @recharge_skills.each do |key, value|
      @recharge_skills[key] = value - 1
    end
    @recharge_skills.delete_if { |_key, value| value <= 0 }
  end

  #--------------------------------------------------------------------------
  # ● アニメと崩壊エフェクトのスキップ
  #--------------------------------------------------------------------------
  def battle_show_skip?
    Input.press?(:X)
  end

  #--------------------------------------------------------------------------
  # ● コラプス効果の実行
  #--------------------------------------------------------------------------
  def perform_collapse_effect
    case collapse_type
    when 0
      if battle_show_skip?
        @sprite_effect_type = :instant_collapse
        Sound.play_enemy_collapse
      else
        @sprite_effect_type = :collapse
        Sound.play_enemy_collapse
      end
    when 1
      if battle_show_skip?
        @sprite_effect_type = :instant_collapse
        Sound.play_enemy_collapse
      else
        @sprite_effect_type = :boss_collapse
        Sound.play_boss_collapse1
      end
    when 2
      @sprite_effect_type = :instant_collapse
    end
  end

  #--------------------------------------------------------------------------
  # ● 経験値の取得
  #--------------------------------------------------------------------------
  def exp
    return enemy.exp unless $game_variables[NWConst::Var::EXP] > 0

    (enemy.exp * $game_variables[NWConst::Var::EXP] * 0.01).to_i
  end

  #--------------------------------------------------------------------------
  # ● お金の取得
  #--------------------------------------------------------------------------
  def gold
    return enemy.gold unless $game_variables[NWConst::Var::MONEY] > 0

    (enemy.gold * $game_variables[NWConst::Var::MONEY] * 0.01).to_i
  end

  #--------------------------------------------------------------------------
  # ● 職業経験値の取得
  #--------------------------------------------------------------------------
  def class_exp
    return enemy.class_exp unless $game_variables[NWConst::Var::CLASS_EXP] > 0
    
    (enemy.class_exp * $game_variables[NWConst::Var::CLASS_EXP] * 0.01).to_i
  end

  def refresh
    @hp = mhp if hp_infinite?
    @mp = mmp if mp_infinite?
    super
  end

  def hp_infinite?
    enemy.hp_infinite?
  end

  def mp_infinite?
    enemy.mp_infinite?
  end

  #--------------------------------------------------------------------------
  # ● 拘束中行動の作成
  #--------------------------------------------------------------------------
  def make_bind_actions
    all_actions.select do |action|
      skill = action.skill
      result = skill.bind?
      result &&= !(skill.binding_start? && BattleManager.bind? && (BattleManager.bind_user_index != index))
      result
    end
  end

  #--------------------------------------------------------------------------
  # ● 永久拘束中行動の作成
  #--------------------------------------------------------------------------
  def make_eternal_bind_actions
    all_actions.select do |action|
      action.skill.eternal_bind?
    end
  end

  #--------------------------------------------------------------------------
  # ● 通常行動の作成
  #--------------------------------------------------------------------------
  def make_normal_actions
    all_actions.select do |action|
      skill    = action.skill
      result   = !skill.bind?
      result &&= !skill.eternal_bind?
      result &&= !(skill.binding_start? && BattleManager.bind? && (BattleManager.bind_user_index != index))
      result &&= usable_item_sex_ok?(skill)
      result
    end
  end

  def all_actions
    sa = seal_actions
    (enemy.actions + add_actions).reject do |action|
      sa.include?(action.skill_id)
    end
  end

  def add_actions
    states.map(&:add_action).inject([], :+)
  end

  def seal_actions
    states.map(&:seal_action).inject([], :+)
  end

  def escape_not_count?
    enemy.escape_not_count?
  end

  def sort_obj
    enemy.sort_obj
  end

  def item_effect_steal(user, item, effect)
    return unless user.actor?

    @result.stealed = true
    @result.success = true
    list = steal_list[effect.data_id]
    @result.stealed_item_empty = list.empty? ? true : false
    return if $game_switches[NWConst::Sw::STEAL_FAIL]

    list.sort { |a, b| b[:denominator] <=> a[:denominator] }.each do |steal|
      next unless rand * steal[:denominator] < user.steal_success

      $game_library.count_up_actor_steal(user.id)
      item_steal(user, effect.data_id, steal)
      list.clear
      break
    end
  end

  def add_new_state(state_id)
    @force_item_drop = true if $data_states[state_id].force_item_drop?
    super
  end

  def item_effect_force_steal(user, item, effect)
    return unless user.actor?

    @result.stealed = true
    @result.success = true
    list = steal_list[effect.data_id]
    @result.stealed_item_empty = list.empty? ? true : false
    return if $game_switches[NWConst::Sw::STEAL_FAIL]

    $game_library.count_up_actor_steal(user.id)
    list.each do |steal|
      item_steal(user, effect.data_id, steal)
    end
    list.clear
  end

  def item_steal(user, data_id, steal)
    $game_library.count_up_steal_item(id, data_id, steal)
    case steal[:kind]
    when 1 then item = $data_items[steal[:data_id]]
    when 2 then item = $data_weapons[steal[:data_id]]
    when 3 then item = $data_armors[steal[:data_id]]
    end
    $game_party.gain_item(item, 1)
    i = Game_BaseItem.new
    i.object = item
    @result.stealed_items << i
  end

  def make_drop_items
    result = if @force_item_drop
               enemy.drop_items
             else
               enemy.drop_items.select do |di|
                 di.kind > 0 && rand * di.denominator < drop_item_rate
               end
             end
    result.each do |di|
      $game_library.count_up_drop_item(id, di)
    end
    result.map(&:object)
  end

  def param_max(param_id)
    Float::INFINITY
  end

  def booster_pinchi(item)
    1.0
  end

  def word_id
    enemy.word_id
  end

  def skill_word(skill_id)
    create_skill_words(super)
  end

  def create_skill_words(word)
    return unless word

    w = Marshal.load(Marshal.dump(word))
    w.replace_name($data_actors[word_id].name, name)
    w.face_hue = enemy.battler_hue
    w
  end

  def create_down_word(word_data)
    w = super
    return unless w

    if enemy.ex_enemy?
      w.replace_name(enemy.base_enemy.name, name)
      w.face_hue = battler_hue
    end
    w
  end

  def exist_cutin?(skill_id)
    false
  end

  def conditions_met_turns?(param1, param2)
    n = $game_troop.turn_count + 1
    if param2 == 0
      n == param1
    else
      n > 0 && n >= param1 && n % param2 == param1 % param2
    end
  end

  def word_conditions_met?(word)
    super || word.condition == :enemy?
  end

  def lose_event_id
    enemy.lose_event_id
  end
end

#==============================================================================
# ■ Game_Event
#==============================================================================
class Game_Event < Game_Character
  attr_reader :button_flag

  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #     event : RPG::Event
  #--------------------------------------------------------------------------
  def initialize(map_id, event)
    super()
    @map_id = map_id
    @event = event
    @button_flag = event.name == "ボタンイベント"
    @id = @event.id
    moveto(@event.x, @event.y)
    refresh
  end

  #--------------------------------------------------------------------------
  # ○ 通行可能判定
  #     d : 方向（2,4,6,8）
  #--------------------------------------------------------------------------
  def passable?(x, y, d)
    return false unless @through || region_passable?(x, y, d)

    super
  end

  #--------------------------------------------------------------------------
  # ● リージョン通行可能判定
  #     d : 方向（2,4,6,8）
  #--------------------------------------------------------------------------
  def region_passable?(x, y, d)
    x2 = $game_map.round_x_with_direction(x, d)
    y2 = $game_map.round_y_with_direction(y, d)
    region_id == $game_map.region_id(x2, y2)
  end

  #--------------------------------------------------------------------------
  # ○ イベントページの条件合致判定
  #--------------------------------------------------------------------------
  def conditions_met?(page)
    c = page.condition
    return false if c.switch1_valid && !($game_switches[c.switch1_id])
    return false if c.switch2_valid && !($game_switches[c.switch2_id])
    return false if c.variable_valid && ($game_variables[c.variable_id] < c.variable_value)

    if c.self_switch_valid
      key = [@map_id, @event.id, c.self_switch_ch]
      return false if $game_self_switches[key] != true
    end
    if c.item_valid
      item = $data_items[c.item_id]
      return false unless $game_party.has_item?(item)
    end
    return false if c.actor_valid && !$game_party.members.any? { |member| member.id == c.actor_id }

    true
  end
end

class Game_Interpreter
  attr_accessor :return_flag
  attr_accessor :map_id

  #--------------------------------------------------------------------------
  # ○ 呼び出し予約されたコモンイベントを検出／セットアップ
  #--------------------------------------------------------------------------
  def setup_reserved_common_event
    if $game_temp.common_event_reserved?
      setup($game_temp.reserved_common_event.list)
      $game_temp.shift_common_event
      true
    else
      false
    end
  end

  def setup(list, event_id = 0)
    clear
    @map_id = $game_map.map_id
    @event_id = event_id
    @list = list
    create_fiber
  end

  def run
    wait_for_message
    while @list[@index]
      execute_command
      @index += 1
    end
    Fiber.yield
    @fiber = nil
    return_map
  end

  #--------------------------------------------------------------------------
  # ● 敵キャラ用イテレータ（インデックス）
  #--------------------------------------------------------------------------
  def convert_enemy_id(param)
    var_param = $game_variables[NWConst::Var::EVENT_ENEMY_ID] - 1
    var_param >= 0 ? var_param : param
  end

  #--------------------------------------------------------------------------
  # ● 敵キャラ用イテレータ（インデックス）
  #     param : 0 以上ならインデックス、-1 なら全体
  #--------------------------------------------------------------------------
  def iterate_enemy_index(param, &block)
    param = convert_enemy_id(param)
    if param < 0
      $game_troop.members.each(&block)
    else
      enemy = $game_troop.members[param]
      yield enemy if enemy
    end
  end

  #--------------------------------------------------------------------------
  # ● 変数オペランド用ゲームデータの取得
  #--------------------------------------------------------------------------
  def game_data_operand(type, param1, param2)
    case type
    when 0  # アイテム
      return $game_party.item_number($data_items[param1])
    when 1  # 武器
      return $game_party.item_number($data_weapons[param1])
    when 2  # 防具
      return $game_party.item_number($data_armors[param1])
    when 3  # アクター
      actor = $game_actors[param1]
      if actor
        case param2
        when 0      # レベル
          return actor.level
        when 1      # 経験値
          return actor.exp
        when 2      # HP
          return actor.hp
        when 3      # MP
          return actor.mp
        when 4..11  # 通常能力値
          return actor.param(param2 - 4)
        end
      end
    when 4 # 敵キャラ
      enemy = $game_troop.members[convert_enemy_id(param1)]
      if enemy
        case param2
        when 0      # HP
          return enemy.hp
        when 1      # MP
          return enemy.mp
        when 2..9   # 通常能力値
          return enemy.param(param2 - 2)
        end
      end
    when 5 # キャラクター
      character = get_character(param1)
      if character
        case param2
        when 0  # X 座標
          return character.x
        when 1  # Y 座標
          return character.y
        when 2  # 向き
          return character.direction
        when 3  # 画面 X 座標
          return character.screen_x
        when 4  # 画面 Y 座標
          return character.screen_y
        end
      end
    when 6  # パーティ
      actor = $game_party.members[param1]
      return actor ? actor.id : 0
    when 7  # その他
      case param1
      when 0  # マップ ID
        return $game_map.map_id
      when 1  # パーティ人数
        return $game_party.members.size
      when 2  # ゴールド
        return $game_party.gold
      when 3  # 歩数
        return $game_party.steps
      when 4  # プレイ時間
        return Graphics.frame_count / Graphics.frame_rate
      when 5  # タイマー
        return $game_timer.sec
      when 6  # セーブ回数
        return $game_system.save_count
      when 7  # 戦闘回数
        return $game_system.battle_count
      end
    end
    0
  end

  #--------------------------------------------------------------------------
  # ○ 条件分岐
  #--------------------------------------------------------------------------
  def command_111
    result = false
    case @params[0]
    when 0  # スイッチ
      result = ($game_switches[@params[1]] == (@params[2] == 0))
    when 1  # 変数
      value1 = $game_variables[@params[1]]
      value2 = if @params[2] == 0
                 @params[3]
               else
                 $game_variables[@params[3]]
               end
      case @params[4]
      when 0  # と同値
        result = (value1 == value2)
      when 1  # 以上
        result = (value1 >= value2)
      when 2  # 以下
        result = (value1 <= value2)
      when 3  # 超
        result = (value1 > value2)
      when 4  # 未満
        result = (value1 < value2)
      when 5  # 以外
        result = (value1 != value2)
      end
    when 2  # セルフスイッチ
      if @event_id > 0
        key = [@map_id, @event_id, @params[1]]
        result = ($game_self_switches[key] == (@params[2] == 0))
      end
    when 3  # タイマー
      if $game_timer.working?
        result = if @params[2] == 0
                   ($game_timer.sec >= @params[1])
                 else
                   ($game_timer.sec <= @params[1])
                 end
      end
    when 4  # アクター
      actor = $game_actors[@params[1]]
      if actor
        case @params[2]
        when 0  # パーティにいる
          result = $game_party.exist_party_persona_id?(@params[1])
        when 1  # 名前
          result = (actor.name == @params[3])
        when 2  # 職業
          result = (actor.class_id == @params[3])
        when 3  # スキル
          result = actor.skill_learn?($data_skills[@params[3]])
        when 4  # 武器
          result = actor.weapons.include?($data_weapons[@params[3]])
        when 5  # 防具
          result = actor.armors.include?($data_armors[@params[3]])
        when 6  # ステート
          result = actor.state?(@params[3])
        end
      end
    when 5 # 敵キャラ
      enemy = $game_troop.members[convert_enemy_id(@params[1])]
      if enemy
        case @params[2]
        when 0  # 出現している
          result = enemy.alive?
        when 1  # ステート
          result = enemy.state?(@params[3])
        end
      end
    when 6  # キャラクター
      character = get_character(@params[1])
      result = (character.direction == @params[2]) if character
    when 7  # ゴールド
      case @params[2]
      when 0  # 以上
        result = ($game_party.gold >= @params[1])
      when 1  # 以下
        result = ($game_party.gold <= @params[1])
      when 2  # 未満
        result = ($game_party.gold < @params[1])
      end
    when 8  # アイテム
      result = $game_party.has_item?($data_items[@params[1]])
    when 9  # 武器
      result = $game_party.has_item_include_uniq?($data_weapons[@params[1]], @params[2])
    when 10  # 防具
      result = $game_party.has_item_include_uniq?($data_armors[@params[1]], @params[2])
    when 11  # ボタン
      result = Input.press?(@params[1])
    when 12  # スクリプト
      result = eval(@params[1])
    when 13  # 乗り物
      result = ($game_player.vehicle == $game_map.vehicles[@params[1]])
    end
    @branch[@indent] = result
    command_skip unless @branch[@indent]
  end

  #--------------------------------------------------------------------------
  # ○ メンバーの入れ替え
  #--------------------------------------------------------------------------
  def command_129
    actor = $game_actors[@params[0]]
    return unless actor

    if @params[1] == 0 # 加える
      $game_actors[@params[0]].setup(@params[0]) if @params[2] == 1 # 初期化
      add_actor_ex(@params[0])
    else # 外す
      remove_actor(@params[0])
    end
  end

  def item_command_popup_message
    $game_temp.get_item_data.each do |item, value|
      if $game_switches[NWConst::Sw::AUTO_MESSAGE] && !$game_party.in_battle
        $game_message.add(Vocab.item_get_message(item, value, true))
      end
      target = $game_variables[NWConst::Var::ICON_POPUP_TARGET]
      pop_icon(target, item.icon_index) if value > 0 && target != -2
    end
  end

  # アイテムの増減
  alias h_command_126 command_126
  def _replace_gain(item)
    return unless item

    @params[0] = item.replace_data.id
  end

  def command_126
    $game_temp.clear_get_item
    _replace_gain($data_items[@params[0]])
    h_command_126
    item_command_popup_message
  end

  # 武器の増減
  def command_127
    $game_temp.clear_get_item
    _replace_gain($data_weapons[@params[0]])
    value = operate_value(@params[1], @params[2], @params[3])
    $game_party.gain_item_include_uniq($data_weapons[@params[0]], value, @params[4])
    item_command_popup_message if value >= 0
  end

  # 防具の増減
  def command_128
    $game_temp.clear_get_item
    _replace_gain($data_armors[@params[0]])
    value = operate_value(@params[1], @params[2], @params[3])
    $game_party.gain_item_include_uniq($data_armors[@params[0]], value, @params[4])
    item_command_popup_message if value >= 0
  end

  # 場所移動
  def command_201
    return if $game_party.in_battle

    Fiber.yield while $game_player.transfer? || $game_message.visible
    if @params[0] == 0                      # 直接指定
      if $game_variables[NWConst::Var::MAP_TRANSFER] > 0
        map_id = $game_variables[NWConst::Var::MAP_TRANSFER]
        $game_variables[NWConst::Var::MAP_TRANSFER] = 0
      else
        map_id = @params[1]
        map_id += @map_id / 1000 * 1000 if @map_id >= 1000 && @event_id > 0
      end
      x = @params[2]
      y = @params[3]
    else                                    # 変数で指定
      map_id = $game_variables[@params[1]]
      x = $game_variables[@params[2]]
      y = $game_variables[@params[3]]
    end
    $game_player.reserve_transfer(map_id, x, y, @params[4])
    $game_temp.fade_type = @params[5]
    Fiber.yield while $game_player.transfer?
  end

  def command_202
    if @params[1] == 0                      # 直接指定
      map_id = @params[2]
      map_id += @map_id / 1000 * 1000 if @map_id >= 1000 && @event_id > 0
      x = @params[3]
      y = @params[4]
    else                                    # 変数で指定
      map_id = $game_variables[@params[2]]
      x = $game_variables[@params[3]]
      y = $game_variables[@params[4]]
    end
    vehicle = $game_map.vehicles[@params[0]]
    vehicle.set_location(map_id, x, y) if vehicle
  end

  # 隊列歩行の変更
  def command_216
    unless @params[0] == 0
      luca_index = 0
      $game_party.all_members.each_with_index  do |actor, i|
        luca_index = (actor.luca? ? i : luca_index)
      end
      $game_party.swap_order(0, luca_index)
    end
    $game_player.followers.visible = (@params[0] == 0)
    $game_player.refresh
  end

  def command_241
    Audio.force_bgm(@params[0])
    @params[0].play
  end

  def command_245
    Audio.force_bgs(@params[0])
    @params[0].play
  end

  def command_302
    return if $game_party.in_battle

    goods = [@params]
    while next_event_code == 605
      @index += 1
      goods.push(@list[@index].parameters)
    end
    SceneManager.call(Scene_Shop)
    SceneManager.scene.prepare(goods, @params[4])
    Fiber.yield
    $game_system.temp_add_shop_items.clear
  end

  # グラ変更
  def command_322
    actor_id = @params[0]
    actor = $game_actors[actor_id]
    return unless actor

    $game_system.change_history[:graphic][actor_id] = [@params[1], @params[2], @params[3], @params[4]]
    actor.init_graphics
    $game_player.refresh
  end

  # 二つ名変更
  def command_324
    actor_id = @params[0]
    actor = $game_actors[@params[0]]
    return unless actor

    $game_system.change_history[:nickname][actor_id] = @params[1]
    actor.init_nickname
  end

  # 名前変更
  def command_320
    actor_id = @params[0]
    actor = $game_actors[@params[0]]
    return unless actor

    $game_system.change_history[:name][actor_id] = @params[1]
    actor.init_name
  end

  # ● バトルの中断
  def command_340
    $game_temp.event_abort = true
    BattleManager.abort
    Fiber.yield
  end

  #--------------------------------------------------------------------------
  # ● セーブ画面を開く
  #--------------------------------------------------------------------------
  def command_352
    return if $game_party.in_battle
    return if $game_switches[NWConst::Sw::LIBRARY_H_MEMORY]

    SceneManager.call(Scene_Save)
    Fiber.yield
  end

  def replace_ex_enemy?
    @common_event_id == 12 || (1000..1999).include?(@common_event_id)
  end

  def replace_ex_enemy_text(text)
    enemy = case @common_event_id
            when 12
              $data_enemies[$game_variables[NWConst::Var::ACTION_TARGET]]
            when 1000..1999
              $data_enemies[$game_variables[51]]
            end
    return text unless enemy.ex_enemy?

    $game_message.face_hue = enemy.battler_hue
    text.gsub(enemy.base_enemy.name, enemy.name)
  end

  def command_999
    @common_event_id = @params[0]
  end

  def ename
    if @event_id > 0
      "Map:#{@map_id}, Ev:#{@event_id}, line:#{@index}"
    else
      "Common, #{@common_event_id} line:#{@index}"
    end
  end
  #--------------------------------------------------------------------------
  # ○ スクリプト
  #--------------------------------------------------------------------------

  def command_355
    script = @list[@index].parameters[0] + "\n"
    while next_event_code == 655
      @index += 1
      script += @list[@index].parameters[0] + "\n"
    end

    eval(script, binding, ename, 0)
  end

  def return_map
    return unless @return_flag

    RPG::BGM.stop
    $game_switches[NWConst::Sw::LIBRARY_H_MEMORY] = false
    SceneManager.scene.fadeout_all(500)
    SceneManager.goto(Scene_Library_H)
    @return_flag = false
  end

  def retry_battle
    return if $game_switches[NWConst::Sw::LIBRARY_H_MEMORY]

    @index = @list.size if BattleManager.retry_battle
  end

  def setup_num_input(params)
    $game_message.num_input_variable_id = params[0]
    digits_max = params[1]
    digits_max = $game_variables[NWConst::Var::NUM_INPUT_DIGIT] if $game_variables[NWConst::Var::NUM_INPUT_DIGIT] > 0
    $game_message.num_input_digits_max = digits_max
    $game_variables[NWConst::Var::NUM_INPUT_DIGIT] = 0
  end
end

#==============================================================================
# ■ Game_Map
#==============================================================================
class Game_Map
  attr_reader :map_level
  attr_accessor :screen
  attr_accessor :interpreter
  attr_accessor :need_refresh_autoplay_field
  attr_accessor :vehicles

  #--------------------------------------------------------------------------
  # ○ セットアップ
  #--------------------------------------------------------------------------
  def setup(map_id)
    return multiparty_setup(map_id) if $game_party.multi_party?

    _setup(map_id)
  end

  def encounter_list
    @map.encounter_list + $game_system.encount_region.encounter_airship(map_id)
  end

  def _setup(map_id)
    @map_id = map_id
    @map = load_data(DataManager.map_file_name(map_id))
    @map.nw_note_analyze
    @tileset_id = @map.tileset_id
    @display_x = 0
    @display_y = 0
    referesh_vehicles
    setup_map_level
    setup_events
    setup_scroll
    setup_parallax
    setup_battleback
    @need_refresh = false
  end

  def setup_events
    @events = {}
    @map.events.each do |i, event|
      @events[i] = Game_Event.new(@map_id, event)
    end
    @common_events = parallel_common_events.collect do |common_event|
      Game_CommonEvent.new(common_event.id)
    end
    @medal_event ||= Game_Interpreter.new

    refresh_tile_events
  end

  def scene_start
    @medal_event.setup($data_common_events[NWConst::Common::MEDAL_CHECK].list)
  end

  def battleback_region(region_id)
    @map.battleback_region(region_id)
  end

  #--------------------------------------------------------------------------
  # ● マップレベルのセットアップ
  #--------------------------------------------------------------------------
  def setup_map_level
    @map_level = if field? || encounter_list.empty?
                   1
                 else
                   encounter_list.inject(1) do |troop_max, troop|
                     max = $data_troops[troop.troop_id].members.inject(1) do |enemy_max, enemy|
                       max = $data_enemies[enemy.enemy_id].escape_level
                       enemy_max < max ? max : enemy_max
                     end
                     troop_max < max ? max : troop_max
                   end
                 end
  end

  #--------------------------------------------------------------------------
  # ○ 通行チェック
  #     bit : 調べる通行禁止ビット
  #--------------------------------------------------------------------------
  def check_passage(x, y, bit)
    all_tiles(x, y).each_with_index do |tile_id, i|
      flag = tileset.flags[tile_id]
      next if flag & 0x10 != 0              # [☆] : 通行に影響しない
      next if (i == 1) && (flag & bit == 0) # ２層目であり通行可なら判定を無視する
      return true  if flag & bit == 0       # [○] : 通行可
      return false if flag & bit == bit     # [×] : 通行不可
    end
    false # 通行不可
  end

  #--------------------------------------------------------------------------
  # ○ ダメージ床判定
  #--------------------------------------------------------------------------
  def damage_floor?(x, y)
    return false unless valid?(x, y)

    layered_tiles(x, y).each do |tile_id|
      next if tile_id == 0
      return true if tileset.flags[tile_id] & 0x100 != 0
    end
    false
  end

  #--------------------------------------------------------------------------
  # ● 表示名の取得
  #--------------------------------------------------------------------------
  def display_name
    @map.display_name.gsub(/\\V\[(\d+)\]/i) { $game_variables[Regexp.last_match(1).to_i] }
  end

  def multiparty_setup(map_id)
    map = $game_party.find_map(map_id)
    if map
      $game_map = map
      $game_party.multi_party.data.map = map
    else
      $game_party.multi_party.setup($game_party.multi_party.id, [map_id, 0, 0, 0])
      $game_map = $game_party.multi_party.data.map
    end
  end

  def bridge?(x, y)
    field? && NWConst::Map::FIELD_BRIDGES.include?(tile_id(x, y, 2))
  end

  def search_field_tile(fx, fy)
    return [[fx, fy]] unless bridge?(fx, fy)

    recursive_lambda = lambda do |x, y, visited|
      next [] if visited[[x, y]]

      visited[[x, y]] = true
      result = []

      [2, 4, 6, 8].each do |d|
        rx = round_x_with_direction(x, d)
        ry = round_y_with_direction(y, d)
        next unless valid?(rx, ry) && passable?(x, y, d) && passable?(rx, ry, 10 - d)

        if bridge?(rx, ry)
          result += recursive_lambda.call(rx, ry, visited)
        else
          result << [rx, ry]
        end
      end

      result
    end

    recursive_lambda.call(fx, fy, {})
  end

  #--------------------------------------------------------------------------
  # ● フィールド？
  #--------------------------------------------------------------------------
  def field?
    NWConst::Field::FIELD_MAP_ID.include?(@map_id)
  end

  #--------------------------------------------------------------------------
  # ● BGM自動切換マップ？
  #--------------------------------------------------------------------------
  def auto_bgm?
    region_auto_bgm? || sw_auto_bgm?
  end

  def region_auto_bgm?
    NWConst::Field::AUTO_BGM_MAP_ID.include?(@map_id)
  end

  def sw_auto_bgm?
    NWConst::Field::SW_BGM.keys.include?(@map_id)
  end
  #--------------------------------------------------------------------------
  # ○ BGM / BGS 自動切り替え
  #--------------------------------------------------------------------------
  alias nw_field_autoplay autoplay
  def autoplay
    auto_bgm? ? autoplay_field : nw_field_autoplay
  end

  #--------------------------------------------------------------------------
  # ● BGM / BGS 自動切り替え
  #--------------------------------------------------------------------------
  def autoplay_field
    return if $game_player.in_boat? || $game_player.in_ship?
    return sw_autoplay_field if sw_auto_bgm?

    bgm = NWConst::Field::BGM[map_id][$game_player.region_id]
    bgs = NWConst::Field::BGS[map_id][$game_player.region_id]
    bgm ||= RPG::BGM.new
    bgs ||= RPG::BGS.new
    bgm.reserve
    bgs.reserve
  end

  def sw_autoplay_field
    r = NWConst::Field::SW_BGM[map_id].find { |k, _v| $game_switches[k] }
    bgm = r ? r[1] : @map.bgm
    bgs = @map.bgs
    bgm.reserve if bgm
    bgs.reserve if bgs
  end

  #--------------------------------------------------------------------------
  # ● BGM / BGS 自動切り替え（着岸用）
  #--------------------------------------------------------------------------
  def autoplay_landing
    return sw_autoplay_field if sw_auto_bgm?

    x = round_x_with_direction($game_player.x, $game_player.direction)
    y = round_y_with_direction($game_player.y, $game_player.direction)
    id = region_id(x, y)
    bgm = NWConst::Field::BGM[map_id][id]
    bgs = NWConst::Field::BGS[map_id][id]
    bgm ||= RPG::BGM.new
    bgs ||= RPG::BGS.new
    bgm.reserve
    bgs.reserve
  end

  def refresh
    @events.each_value { |event| event.refresh }
    @common_events.each { |event| event.refresh }
    refresh_tile_events
    autoplay_field if @need_refresh_autoplay_field
    @need_refresh = false
    @need_refresh_autoplay_field = false
  end

  def update_events
    @events.each_value { |event| event.update }
    @common_events.each { |event| event.update }
    @medal_event.update if @medal_event
  end

  def busy?
    @medal_event && @medal_event.running?
  end

  def start_button_event
    event = @events.values.find { |ev| ev.button_flag }
    event.start if event
  end
end

class Game_Message
  attr_accessor :face_hue
end
#==============================================================================
# ■ Game_Party
#==============================================================================
class Game_Party < Game_Unit
  class Member
    include Enumerable
    def size
      @data.size
    end

    def initialize(data = nil)
      @data = []
      set(data || [])
    end

    def push(*args)
      set(@data + args)
    end

    def set(ary)
      @data = ary.map { |i| $game_actors.original_id(i) }.compact.uniq
    end

    def delete(*args)
      args.each do |i|
        @data.delete($game_actors.original_id(i))
      end
    end

    def delete_at(id)
      @data.delete_at(id)
    end

    def each(&block)
      @data.each(&block)
    end

    def clear
      @data.clear
    end

    def empty?
      @data.empty?
    end

    def [](*args)
      @data[*args]
    end

    def []=(id, other)
      d = @data.clone
      d[id] = other
      set(d)
    end

    def include?(id)
      @data.include?($game_actors.original_id(id))
    end
  end

  class BattleMember < Member
    def set(ary)
      bdata = @data.clone
      super
      refresh if bdata != @data
    end

    def delete(*args)
      bdata = @data.clone
      super
      refresh if bdata != @data
    end

    def swap(index1, index2)
      @data[index1], @data[index2] = @data[index2], @data[index1]
      refresh
    end

    def clear
      bdata = @data.clone
      super
      refresh if bdata != @data
    end

    def refresh
      @data = @data.slice(0, $game_party.party_member_max)
      $game_player.refresh
      $game_map.need_refresh = true
    end

    def sort_hidden_last
      @data = @data.sort_by.with_index do |id, index|
        ($game_actors[id].hidden? ? 100 : 0) + index
      end
      refresh
    end
  end
  attr_accessor :reserve_member
  attr_reader :display_stone_flag
  attr_accessor :multi_party_canceled

  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super
    @gold = 0
    @steps = 0
    @last_item = Game_BaseItem.new
    @menu_actor_id = 0
    @target_actor_id = 0
    @actors = BattleMember.new
    @temp_actors = BattleMember.new
    init_all_items
  end

  def setup_starting_members
    @actors.set($data_system.party_members)
  end

  #--------------------------------------------------------------------------
  # ○ 所持金の最大値を取得
  #--------------------------------------------------------------------------
  def max_gold
    NWConst::Party::MAX_MONEY
  end

  def all_members
    actors.collect { |id| $game_actors[id] }
  end

  #--------------------------------------------------------------------------
  # ● 一時メンバーの解放
  #--------------------------------------------------------------------------
  def release_temp_actors
    @temp_actors.clear
  end

  #--------------------------------------------------------------------------
  # ● 一時メンバーを使用中か
  #--------------------------------------------------------------------------
  def temp_actors_use?
    !@temp_actors.empty?
  end

  #--------------------------------------------------------------------------
  # ● 一人しかいない？
  #--------------------------------------------------------------------------
  def lonely?
    battle_members.size == 1
  end

  #--------------------------------------------------------------------------
  # ○ バトルメンバーの取得
  #--------------------------------------------------------------------------
  def battle_members
    all_members.select { |actor| actor.exist? }[0, max_battle_members]
  end

  #--------------------------------------------------------------------------
  # ○ 戦闘テスト用パーティのセットアップ
  #--------------------------------------------------------------------------
  def setup_battle_test_members
    $data_system.test_battlers.each do |battler|
      actor = $game_actors[battler.actor_id]
      actor.change_level(battler.level, false, :base)
      actor.init_equips(battler.equips.map { |i| [i, nil, []] })
      actor.recover_all
      add_actor(actor.id)
    end
  end

  #--------------------------------------------------------------------------
  # ● パーティ満員時の離脱アクターの選択
  #--------------------------------------------------------------------------
  def choice_stand_actor_on_member_full(actor_id, actor_name)
    battle_flag = !actor_name.nil?
    color_index  = 29 # tp_gauge_color2
    choice_index = 0
    actor_name   = $data_actors[actor_id].name unless battle_flag
    members = $game_party.all_members.reject { |actor| actor.luca? }
    choices = members.collect { |actor| actor.name }
    choices.push("\\C[#{color_index}]" + actor_name)
    choices.each { |name| $game_message.choices.push(name) }
    $game_message.choice_cancel_type = choices.size
    $game_message.choice_proc = proc { |n| choice_index = n }
    if battle_flag
      BattleManager.wait_for_message
    else
      Fiber.yield while $game_message.choice?
    end
    return members[choice_index] if choice_index < members.size

    false
  end

  #--------------------------------------------------------------------------
  # ● 行動変化判定
  #--------------------------------------------------------------------------
  def check_change_action
    members.each do |actor|
      actor.change_action.each do |action|
        next unless rand < action[:per]

        actor.clear_actions
        actor.skill_interrupt(action[:id], nil)
        break
      end
    end
    members.each do |actor|
      actor.actions.each do |action|
        next unless action.item
        next unless action.item.is_skill?
        next unless actor.change_skill(action.item.id)

        action.set_skill(actor.change_skill(action.item.id))
      end
    end
  end

  #--------------------------------------------------------------------------
  # ● 獲得金額倍率
  #--------------------------------------------------------------------------
  def get_gold_rate
    all_members.inject([1.0]) { |r, actor| r.push(actor.get_gold_rate) }.max
  end

  #--------------------------------------------------------------------------
  # ● 獲得アイテム倍率
  #--------------------------------------------------------------------------
  def get_item_rate
    all_members.inject([1.0]) { |r, actor| r.push(actor.get_item_rate) }.max
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入倍率
  #--------------------------------------------------------------------------
  def collect_rate
    all_members.inject([1.0]) { |r, actor| r.push(actor.collect_rate) }.max
  end

  def encounter_rate
    return 0.0 if $game_switches[NWConst::Sw::ENCOUNT_NONE]

    array = members.inject([]) { |ary, actor| ary + actor.encounter_rate }
    array.delete_if { |r| r < 1.0 } if $game_switches[NWConst::Sw::STRICT_ENCOUNT]
    if array.empty?
      1.0
    else
      array.inject(1.0) { |result, r| result * r }
    end
  end

  #--------------------------------------------------------------------------
  # ● スロットチャンス
  #--------------------------------------------------------------------------
  def slot_chance
    members.inject(0) { |r, actor| r < actor.slot_chance ? actor.slot_chance : r }
  end

  #--------------------------------------------------------------------------
  # ● 解錠レベル
  #--------------------------------------------------------------------------
  def unlock_level
    members.inject(0) { |r, actor| r < actor.unlock_level ? actor.unlock_level : r }
  end

  #--------------------------------------------------------------------------
  # ○ 先制攻撃の確率計算
  #--------------------------------------------------------------------------
  def rate_preemptive(troop_agi)
    raise_preemptive? ? 0.15 : 0.03
  end

  #--------------------------------------------------------------------------
  # ○ 不意打ちの確率計算
  #--------------------------------------------------------------------------
  def rate_surprise(troop_agi)
    cancel_surprise? ? 0.0 : 0.03
  end

  #--------------------------------------------------------------------------
  # ○ 捕食されているメンバーを最後尾に
  #--------------------------------------------------------------------------
  def sort_hidden_last
    actors.sort_hidden_last
  end

  #--------------------------------------------------------------------------
  # ○ メンバー入れ替えでの全滅防止
  #--------------------------------------------------------------------------
  def no_swap_all_dead?(index1, index2)
    return false if battle_members.reject(&:all_dead?).size != 1

    index1, index2 = [index1, index2].sort
    return false if index1 >= max_battle_members || index2 < max_battle_members

    a = all_members
    !a[index1].all_dead? && a[index2].all_dead?
  end

  #--------------------------------------------------------------------------
  # ○ 戦闘終了処理
  #--------------------------------------------------------------------------
  alias nw_predation_on_battle_end on_battle_end
  def on_battle_end
    # アクターの on_battle_end で predationed をオフにするので必ず事前に入れ替え
    sort_hidden_last if all_dead?
    nw_predation_on_battle_end
  end

  #--------------------------------------------------------------------------
  # ● 床ダメージ率
  #--------------------------------------------------------------------------
  def floor_damage_rate
    all_members.map(&:fdr).min
  end

  #--------------------------------------------------------------------------
  # ● 全メンバーのパーティ能力判定
  #--------------------------------------------------------------------------
  def all_party_ability(ability_id)
    all_members.any? { |actor| actor.party_ability(ability_id) }
  end

  #--------------------------------------------------------------------------
  # ● 不意打ち無効？
  #--------------------------------------------------------------------------
  def cancel_surprise?
    all_party_ability(ABILITY_CANCEL_SURPRISE)
  end

  #--------------------------------------------------------------------------
  # ● 先制攻撃率アップ？
  #--------------------------------------------------------------------------
  def raise_preemptive?
    all_party_ability(ABILITY_RAISE_PREEMPTIVE)
  end

  def enchant_unequip
    include_members.each do |member|
      member.enchant_unequip
    end
  end

  def pre_update
    @items = reset_item_list(@items) if @items.is_a?(Hash)
    @weapons = reset_item_list(@weapons) if @weapons.is_a?(Hash)
    @armors = reset_item_list(@armors) if @armors.is_a?(Hash)
    @enchant_weapons = Enchant_Item_List.new if @enchant_weapons.nil? || @enchant_weapons.class != Enchant_Item_List
    @enchant_armors = Enchant_Item_List.new if @enchant_armors.nil? || @enchant_armors.class != Enchant_Item_List
    @socket_weapons ||= Socket_Container.new
    @socket_armors ||= Socket_Container.new
    set_favorite_data unless @favorite_item.nil?
    all_items.map { |item| $game_library.get_item(item) }

    [@enchant_weapons, @enchant_armors].each(&:pre_update)
    [@socket_weapons, @socket_armors].each(&:refresh)

    unless @actors.is_a?(BattleMember)
      @actors = BattleMember.new(@actors)
      @temp_actors = BattleMember.new(@temp_actors)
      @include_actors = Member.new((1001..1900).select { |i| $game_switches.nw_array_get(i) }.map { |i| i - 1000 })
    end
    fix_members
  end

  def fix_members
    @include_actors.push(*@actors)
  end

  #--------------------------------------------------------------------------
  # ● セーブデータ互換
  #--------------------------------------------------------------------------
  def update
    restore_uniq_items
    ((NWConst::Sw::ADD_ACTOR_BASE + 901)..(NWConst::Sw::ADD_ACTOR_BASE + NWConst::Sw::ADD_ACTOR_BASE_NUMBER)).each do |id|
      $game_switches[id] = true if $game_switches.nw_array_get(id)
      $game_switches.nw_array_set(id, false)
    end
  end

  def restore_socket_items
    [@socket_weapons, @socket_armors].each do |e|
      e.items { true }.each { |item| restore_socket_item(item) }
    end
    $game_actors.each(&:refresh_socket_items)
  end

  def create_socket_item(item, &block)
    if item.need_socket?
      lose_item(item, 1)
      item = item.create_socket_item
      add_item_data(item, 1)
    end
    block.call(item)
    restore_socket_item(item)
  end

  def restore_socket_item(item)
    return item unless item && item.socket_item?
    return item unless item_number(item) + storehouse_item_number(item) > 0 && item.stones.compact.empty?

    base_item = item.base_data
    base_item_data = item_container(item.base_data)[base_item.index]
    item_data = item_container(item)[item.index]
    base_item_data.item_number += item_data.item_number
    base_item_data.storehouse_item_number += item_data.storehouse_item_number
    delete_item_data(item)
    item.base_data
  end

  def restore_uniq_items
    restore_socket_items
    [@enchant_weapons, @enchant_armors, @socket_weapons, @socket_armors].each do |c|
      c.item_data do |data|
        data.item_number = 1 if data.restore?
      end
    end
  end

  def reset_item_list(hash)
    hash.inject(Item_List.new) do |array, (key, value)|
      array[key].item_number = value
      array
    end
  end

  def set_favorite_data
    @favorite_item[:item].map.with_index do |data, index|
      data ? index : nil
    end.compact.each { |index| @items[index].favorite_flag = true } if @favorite_item[:item]
    @favorite_item[:weapon].map.with_index do |data, index|
      data ? index : nil
    end.compact.each { |index| @weapons[index].favorite_flag = true } if @favorite_item[:weapon]
    @favorite_item[:armor].map.with_index do |data, index|
      data ? index : nil
    end.compact.each { |index| @armors[index].favorite_flag = true } if @favorite_item[:armor]
    @favorite_item = nil
  end

  #--------------------------------------------------------------------------
  # ○ 全アイテムリストの初期化
  #--------------------------------------------------------------------------
  def init_all_items
    @items = Item_List.new
    @weapons = Item_List.new
    @armors = Item_List.new
    @enchant_weapons = Enchant_Item_List.new
    @enchant_armors = Enchant_Item_List.new
    @socket_weapons = Socket_Container.new
    @socket_armors = Socket_Container.new
  end

  #--------------------------------------------------------------------------
  # ○ アイテムオブジェクトの配列取得
  #--------------------------------------------------------------------------
  def items(&block)
    @items.items($data_items, &block)
  end

  #--------------------------------------------------------------------------
  # ○ 武器オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def weapons(&block)
    r = enchant_weapons(&block)
    r += @weapons.items($data_weapons, &block)
    r += socket_weapons(&block)
    r
  end

  #--------------------------------------------------------------------------
  # ○ 防具オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def armors(&block)
    r = enchant_armors(&block)
    r += @armors.items($data_armors, &block)
    r += socket_armors(&block)
    r
  end

  #--------------------------------------------------------------------------
  # ● 全ての装備品オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def equip_items(&block)
    weapons(&block) + armors(&block)
  end

  #--------------------------------------------------------------------------
  # ● 全てのアイテムオブジェクトの配列取得
  #--------------------------------------------------------------------------
  def all_items(&block)
    items(&block) + equip_items(&block)
  end

  #--------------------------------------------------------------------------
  # ● エンチャント武器オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def enchant_weapons(&block)
    @enchant_weapons.items(&block).reverse
  end

  def uniq_items(&block)
    enchant_weapons(&block) + enchant_armors(&block) + socket_weapons(&block) + socket_armors(&block)
  end

  #--------------------------------------------------------------------------
  # ● エンチャント防具オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def enchant_armors(&block)
    @enchant_armors.items(&block).reverse
  end

  #--------------------------------------------------------------------------
  # ○ アイテムのクラスに対応するコンテナオブジェクトを取得
  #--------------------------------------------------------------------------
  def item_container(item)
    case item
    when RPG::EnchantWeapon
      @enchant_weapons
    when RPG::EnchantArmor
      @enchant_armors
    when RPG::SocketWeapon
      @socket_weapons[item.base_data.id]
    when RPG::SocketArmor
      @socket_armors[item.base_data.id]
    else
      return @items   if item.is_a?(RPG::Item)
      return @weapons if item.is_a?(RPG::Weapon)
      return @armors  if item.is_a?(RPG::Armor)

      nil
    end
  end

  def max_item_number(item)
    return 99 unless item.uniq_item?

    return 0 if storehouse_item_number(item) > 0

    1
  end

  def uniq_item_number(item)
    uniq_item_container(item).select(&:count?).size
  end

  def uniq_item_container(item)
    if item.enchant_item? || item.need_enchant?
      case item
      when RPG::Weapon
        @enchant_weapons
      when RPG::Armor
        @enchant_armors
      end
    else
      item = item.socket_item? ? item.base_data : item
      case item
      when RPG::Weapon
        @socket_weapons[item.id]
      when RPG::Armor
        @socket_armors[item.id]
      end
    end
  end

  def uniq_max_item_number(item)
    return Float::INFINITY unless item.enchant_item? || item.need_enchant?

    case item
    when RPG::Weapon
      NWConst::Enchantment::WEAPON_MAX_ITEM_NUMBER
    when RPG::Armor
      NWConst::Enchantment::ARMOR_MAX_ITEM_NUMBER
    end
  end

  #--------------------------------------------------------------------------
  # ○ アイテムの所持数取得
  #--------------------------------------------------------------------------
  def item_number(item)
    container = item_container(item)
    container ? container[item.index].item_number : 0
  end

  def has_item_include_uniq?(item, include_equip = false)
    item_number_include_uniq(item, include_equip) > 0
  end

  def item_number_include_uniq(item, include_equip = false)
    c = uniq_item_container(item)
    n = c ? c.map(&:item_number).inject(0, :+) : 0
    n += item_number(item)
    return n unless include_equip

    n + all_members.inject(0) { |i, m| i + m.base_equips.compact.map(&:base_data).count(item) }
  end

  def all_dead?
    super && !$game_switches[NWConst::Sw::ALL_DEAD_DISABLE]
  end

  def battle_members_id
    actors[0, max_battle_members]
  end

  #--------------------------------------------------------------------------
  # ● 一時メンバーのセット
  #--------------------------------------------------------------------------
  def set_temp_actors(ary)
    load_persona(@temp_actors.to_a)
    @temp_actors.set(ary)
    save_persona(ary)
  end

  def load_persona(ary)
    return if multi_party?
    return unless @bpersona

    @bpersona.each do |k, v|
      next unless ary.include?(k)

      $game_party.persona_change(v)
    end
    ary.each { |i| @bpersona.delete(i) }
  end

  def save_persona(ary)
    return if multi_party?

    @bpersona ||= {}
    ary.select { |i| $game_actors[i].id != i }.each do |i|
      @bpersona[i] = $game_actors[i].id
      $game_party.persona_change(i)
    end
  end

  def add_temp_actors(ary)
    @temp_actors.push(*ary)
    save_persona(ary)
  end

  def remove_temp_actors(ary)
    ba = @temp_actors.to_a
    @temp_actors.delete(*ary)
    load_persona(ba - @temp_actors.to_a)
  end

  def actors
    if temp_actors_use?
      @temp_actors
    else
      @actors
    end
  end

  def exists
    !actors.empty?
  end

  def swap_order(index1, index2)
    actors.swap(index1, index2)
  end

  def in_member_luca?
    all_members.any?(&:luca?)
  end

  def set_action_history
    members.each(&:set_action_history)
  end

  def item_target_members(item)
    if item.include_bench?
      all_members
    elsif item.bench_only?
      bench_members
    else
      super
    end
  end

  def bench_members
    all_members.select(&:exist?)[max_battle_members..-1] || []
  end

  #--------------------------------------------------------------------------
  # ○ アイテムの減少
  #     keep_flag : enchant装備を残す？
  #--------------------------------------------------------------------------
  def lose_item(item, amount, include_equip = false, keep_flag = false)
    gain_item(item, -amount, include_equip, keep_flag)
  end

  def lose_items_include_uniq(item, amount)
    size = [item_number(item), amount].min
    result = Array.new(size, item)
    container = uniq_item_container(item)
    (amount - size).times do
      i = container.select { |obj| obj.item_number > 0 }.first
      result.push(i.item_object) if i
    end
    result
  end

  def add_item_data(item, number)
    return if !item.uniq_item? || uniq_item_max?(item)

    container = item_container(item)
    return if container.exist?(item)

    container.add_item(item)
    container[item.index].item_number = number
  end

  #--------------------------------------------------------------------------
  # ● エンチャントデータの削除
  #--------------------------------------------------------------------------
  def delete_item_data(item)
    return unless item.uniq_item?

    item.clear_stones
    container = item_container(item)
    container.delete_item(item)
  end

  #--------------------------------------------------------------------------
  # ● 倉庫アイテムの最大数取得
  #--------------------------------------------------------------------------
  def storehouse_max_item_number(item)
    NWConst::Storehouse::MAX_ITEM_NUMBER
  end

  #--------------------------------------------------------------------------
  # ● アイテムを最大まで所持しているか判定
  #--------------------------------------------------------------------------
  def storehouse_item_max?(item)
    storehouse_item_number(item) >= storehouse_max_item_number(item)
  end

  #--------------------------------------------------------------------------
  # ● 倉庫のアイテムオブジェクトの配列取得
  #--------------------------------------------------------------------------
  def storehouse_items
    @items.storehouse_items($data_items)
  end

  #--------------------------------------------------------------------------
  # ● 倉庫の武器オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def storehouse_weapons
    r = storehouse_enchant_weapons
    r += @weapons.storehouse_items($data_weapons)
    r += storehouse_socket_weapons
    r
  end

  #--------------------------------------------------------------------------
  # ● 倉庫の防具オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def storehouse_armors
    r = storehouse_enchant_armors
    r += @armors.storehouse_items($data_armors)
    r += storehouse_socket_armors
    r
  end

  def storehouse_enchant_weapons
    @enchant_weapons.storehouse_items
  end

  def storehouse_enchant_armors
    @enchant_armors.storehouse_items
  end

  def storehouse_socket_weapons
    @socket_weapons.storehouse_items
  end

  def storehouse_socket_armors
    @socket_armors.storehouse_items
  end

  #--------------------------------------------------------------------------
  # ● 倉庫の全ての装備品オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def storehouse_equip_items
    storehouse_weapons + storehouse_armors
  end

  #--------------------------------------------------------------------------
  # ● 倉庫の全てのアイテムオブジェクトの配列取得
  #--------------------------------------------------------------------------
  def storehouse_all_items
    storehouse_items + storehouse_equip_items
  end

  #--------------------------------------------------------------------------
  # ● 倉庫のアイテム数取得
  #--------------------------------------------------------------------------
  def storehouse_item_number(item)
    container = item_container(item)
    container ? container[item.index].storehouse_item_number : 0
  end

  def storehouse_has_item?(item)
    storehouse_item_number(item) > 0
  end

  #--------------------------------------------------------------------------
  # ● アイテムを倉庫に預ける
  #--------------------------------------------------------------------------
  def item_keep(item, amount)
    return unless item

    if amount >= 1
      amount = [amount, storehouse_max_item_number(item) - storehouse_item_number(item), item_number(item)].min
    elsif amount <= -1
      amount = [-amount, max_item_number(item) - item_number(item), storehouse_item_number(item)].min * -1
    end
    return false if amount == 0

    storehouse_gain_item(item, amount)
    lose_item(item, amount, false, true)
    $game_map.need_refresh = true
  end

  #--------------------------------------------------------------------------
  # ● 倉庫アイテムの増減
  #--------------------------------------------------------------------------
  def storehouse_gain_item(item, amount)
    container = item_container(item)
    return unless container

    last_number = storehouse_item_number(item)
    new_number = last_number + amount
    new_number = [[new_number, 0].max, storehouse_max_item_number(item)].min
    container[item.index].storehouse_item_number = new_number
  end

  def gain_item(item, amount, include_equip = false, keep_flag = false)
    return unless item

    if item.need_enchant? && amount > 0
      amount.clamp(1, [1, uniq_max_item_number(item) - uniq_item_number(item) + 1].max).times do
        i = item.create_enchant_item
        add_item_data(i, 0)
        gain_item(i, 1, include_equip, keep_flag)
      end
      return
    end

    container = item_container(item)
    return unless container

    last_number = item_number(item)
    new_number = last_number + amount
    new_number = new_number.clamp(0, max_item_number(item))
    container[item.index].item_number = new_number
    if !keep_flag && item.uniq_item?
      delete_item_data(item) if new_number <= 0
      new_number = 0 unless container.exist?(item)
    end

    if amount > 0
      i = item.socket_item? ? item.base_data : item
      $game_temp.get_item_data[i] ||= 0
      $game_temp.get_item_data[i] += new_number - last_number
    end
    $game_map.need_refresh = true

    @display_stone_flag = true if amount > 0 && item.is_a?(RPG::Item) && item.enchant_stone?
  end

  def gain_item_include_uniq(item, amount, include_equip = false)
    return unless item
    return gain_item(item, amount, include_equip) if amount >= 0 || !item.need_socket?

    amount = amount.abs
    items = lose_items_include_uniq(item, amount)
    items.each { |i| lose_item(i, 1) }
    return unless include_equip

    (amount - items.size).times do
      next if all_members.any? { |actor| actor.discard_equip_include_uniq(item) }

      break
    end
  end

  def uniq_item_max?(item)
    uniq_item_number(item) >= uniq_max_item_number(item)
  end

  def trade_item(new_item, old_item)
    return false if new_item && !has_item?(new_item)

    gain_item(old_item, 1, false, true)
    lose_item(new_item, 1, false, true)
    true
  end

  def socket_weapons(&block)
    @socket_weapons.items(&block)
  end

  def socket_armors(&block)
    @socket_armors.items(&block)
  end

  def socket_item_by_id(type, id)
    i = id.to_i
    f = id - i
    container = case type
                when :weapons
                  @socket_weapons[i]
                when :armors
                  @socket_armors[i]
                end
    container[(f * RPG::Socket::ID).to_i - 1].item_object
  end

  def enchant_item_by_id(type, id)
    container = case type
                when :weapons
                  @enchant_weapons
                when :armors
                  @enchant_armors
                end
    container[id].item_object
  end

  def level_round_down(level)
    (@include_actors.to_a + @temp_actors.to_a).uniq.each do |member_id|
      member = $game_actors[member_id]
      member.change_level(level, false, :base) if member.level[:base] >= level
    end
  end

  def shop_enchant_item(id, item)
    return nil unless item
    return item unless item.need_enchant?

    @shop_enchant_item_data ||= {}
    @shop_enchant_item_data[id] ||= {}
    k = [item.class, item.id]
    return @shop_enchant_item_data[id][k] if @shop_enchant_item_data[id].key?(k)

    i = item.create_enchant_item
    add_item_data(i, 0)
    i.shop_item_flag = true
    @shop_enchant_item_data[id][k] = i
    i
  end

  def delete_shop_enchant_item(id)
    @shop_enchant_item_data ||= {}
    @shop_enchant_item_data.fetch(id, {}).each do |_k, item|
      item.shop_item_flag = false
      container = item_container(item)
      delete_item_data(item) if container[item.index].restore?
    end

    @shop_enchant_item_data.delete(id)
  end
end

#==============================================================================
# ■ Game_Player
#==============================================================================
class Game_Player < Game_Character
  #--------------------------------------------------------------------------
  # ● エンカウント処理の実行
  #--------------------------------------------------------------------------
  def encounter
    return false if $game_system.no_enemy_maps_get.include?($game_map.map_id)
    return false if encount_region == Game_System::EncountRegion::NONE
    return false if $game_map.interpreter.running?
    return false if $game_system.encounter_disabled
    return false if @encounter_count > 0

    make_encounter_count
    troop_id = make_encounter_troop_id
    return false unless $data_troops[troop_id]

    BattleManager.setup(troop_id)
    BattleManager.on_encounter
    true
  end

  def get_on_vehicle
    front_x = $game_map.round_x_with_direction(@x, @direction)
    front_y = $game_map.round_y_with_direction(@y, @direction)
    @vehicle_type = :boat    if $game_map.boat.pos?(front_x, front_y)
    @vehicle_type = :ship    if $game_map.ship.pos?(front_x, front_y)
    @vehicle_type = :airship if $game_map.airship.pos?(@x, @y)
    if vehicle
      @vehicle_getting_on = true
      force_move_forward unless in_airship?
      make_encounter_count
      @followers.gather
    end
    @vehicle_getting_on
  end
  #--------------------------------------------------------------------------
  # ○ エンカウント カウント作成
  #--------------------------------------------------------------------------
  def make_encounter_count
    n = in_airship? && !@vehicle_getting_off ? $game_system.encount_region.encounter_step_airship($game_map.map_id) : $game_map.encounter_step
    m = rand(n) + rand(n) + 1
    @encounter_count = n + ((m - n) * 0.5)

    if $TEST
      step = 0.0 < $game_party.encounter_rate ? "#{(@encounter_count / $game_party.encounter_rate).ceil}歩" : "エンカウントなし"
      print "maplv:#{$game_map.map_level} encounter:#{$game_party.encounter_rate}/#{@encounter_count}(#{step})\n"
    end
  end

  #--------------------------------------------------------------------------
  # ○ エンカウントの更新
  #--------------------------------------------------------------------------
  def update_encounter
    return if $TEST && Input.press?(:CTRL)
    return if $game_map.encounter_list.empty?
    return if @move_route_forcing

    @encounter_count -= encounter_progress_value
  end

  #--------------------------------------------------------------------------
  # ○ エンカウント進行値の取得
  #--------------------------------------------------------------------------
  def encounter_progress_value
    value = $game_map.bush?(@x, @y) ? 2.0 : 1.0
    value *= in_ship? ? 0.5 : 1.0
    value *= $game_party.encounter_rate
    value
  end

  #--------------------------------------------------------------------------
  # ● 強制的に乗り物に乗る
  #--------------------------------------------------------------------------
  def forced_get_on_vehicle(type)
    return if vehicle

    $game_map.vehicle(type).set_location($game_map.map_id, x, y)
    @vehicle_type = type
    @followers.gather
    @direction = vehicle.direction
    @move_speed = vehicle.speed
    @transparent = true
    make_encounter_count
    @through     = true if in_airship?
    vehicle.get_on
  end

  #--------------------------------------------------------------------------
  # ● 強制的に乗り物から降りる
  #--------------------------------------------------------------------------
  def forced_get_off_vehicle
    return unless vehicle

    @direction = vehicle.direction
    @followers.synchronize(@x, @y, @direction)
    vehicle.get_off
    @followers.gather
    @move_speed  = 4
    @through     = false
    @vehicle_type = :walk
    make_encounter_count
    @transparent = false
    @vehicle_getting_on = false
    @vehicle_getting_off = false
  end

  #--------------------------------------------------------------------------
  # ○ 乗り物から降りる
  #--------------------------------------------------------------------------
  def get_off
    @driving = false
    @walk_anime = false
    @step_anime = false
    @direction = 4
    @walking_bgm.play if @walking_bgm
  end

  def encounter_ok?(encounter)
    return true if encounter.region_set.include?(encount_region)
    return true if any_region && encounter.region_set.include?(any_region)

    encounter.region_set.empty?
  end

  def any_region
    $game_system.encount_region.any_region[$game_map.map_id]
  end

  def encount_region
    rid = in_airship? ? Game_System::EncountRegion::AIRSHIP : region_id
    $game_system.encount_region[$game_map.map_id, rid]
  end
end

class Game_SelfSwitches
  def delete(map_ids)
    @data.reject! do |key, _|
      map_ids.include?(key[0])
    end
    on_change
  end
end
#==============================================================================
# ■ Game_System
#==============================================================================
class Game_System
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :party_lose_count # 全滅回数
  attr_writer :last_select_auto_battle_command
  attr_writer :last_select_battle_command
  attr_accessor :enchant_shop_id

  #--------------------------------------------------------------------------
  # ○ オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    @save_disabled = false
    @menu_disabled = false
    @encounter_disabled = false
    @formation_disabled = false
    @battle_count = 0
    @save_count = 0
    @version_id = 0
    @window_tone = nil
    @battle_bgm = nil
    @battle_end_me = nil
    @saved_bgm = nil
    @party_lose_count = 0
    no_enemy_map_prepare
    init_config
  end

  #--------------------------------------------------------------------------
  # ● リアル時間を文字列で取得
  #--------------------------------------------------------------------------
  def realtime_s
    Time.now.strftime("%Y/%m/%d %H:%M")
  end

  #--------------------------------------------------------------------------
  # ○ マップ指定エンカウント禁止
  #--------------------------------------------------------------------------
  def no_enemy_map_prepare
    @no_enemy_maps ||= []
  end

  def no_enemy_maps_get
    no_enemy_map_prepare
    @no_enemy_maps
  end

  def no_enemy_map_on(*map_ids)
    no_enemy_map_prepare
    @no_enemy_maps += map_ids
    @no_enemy_maps.uniq!
    @no_enemy_maps.sort!
  end

  def no_enemy_map_off(*map_ids)
    no_enemy_map_prepare
    last_include = @no_enemy_maps.include?($game_map.map_id)
    @no_enemy_maps -= map_ids
    now_include = @no_enemy_maps.include?($game_map.map_id)
    $game_player.make_encounter_count if last_include != now_include
  end

  def no_enemy_map_clear
    last_include = @no_enemy_maps.include?($game_map.map_id)
    @no_enemy_maps = []
    now_include = @no_enemy_maps.include?($game_map.map_id)
    $game_player.make_encounter_count if last_include != now_include
  end

  def no_enemy_map_show
    no_enemy_map_prepare
    p @no_enemy_maps
  end

  def on_after_load
    Graphics.frame_count = @frames_on_save
    @bgm_on_save.play
    @bgs_on_save.play
    Audio.load_sound(@bgm_on_save.clone, @bgs_on_save.clone)
  end

  def change_history
    @change_history ||= { :graphic => {}, :name => {}, :nickname => {} }
  end

  def party_form
    @party_form ||= PartyForm.new
  end

  def warp_history
    @warp_history ||= Foo::Warp::SelectHistory.new
  end

  def base_bgm
    @base_bgm ||= LibraryMusic::BaseBGM.new
  end

  def last_select_auto_battle_command
    @last_select_auto_battle_command ||= 0
  end

  def last_select_battle_command
    @last_select_battle_command ||= 0
  end

  def party_recover
    if $game_party.multi_party?
      return $game_party.multi_party.data.party_recover
    end
    @party_recover ||= RecoverSkill.new
  end

  def temp_add_shop_items
    @temp_add_shop_items ||= []
  end
  class RecoverSkill
    def initialize
      @user = 0
      @skill = 0
    end

    def multi_party_data
      @multi_party_data ||= {}
    end
    def setup(user, skill)
      return unless skill
      return unless user
      return unless skill.menu_ok?
      return unless skill.for_friend? && !skill.for_dead_friend?
      return unless skill.damage.recover? && skill.damage.to_hp?

      @user = user.id
      @skill = skill.id
    end

    def refresh
      return if $game_party.all_members.include?(user)

      @user = 0
      @skill = 0
    end

    def user
      $game_actors[@user]
    end

    def skill
      $data_skills[@skill]
    end
  end
end

#==============================================================================
# ■ Game_Temp
#==============================================================================
class Game_Temp
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :gain_medal_count
  attr_accessor :keys_stack
  attr_accessor :battler_graphic_hide
  attr_accessor :lib_class_type_id
  attr_accessor :event_abort
  attr_reader :normal_invoke_count
  attr_reader :get_item_data
  attr_accessor :title_bg
  attr_accessor :title_bgm
  attr_reader :skill_cost

  #--------------------------------------------------------------------------
  # ○ オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    @common_events = []
    @gain_medals = []
    @gain_medal_count = 0
    @fade_type = 0
    @keys_stack = []
    @get_item_data = {}
    @lib_enemy_index = -1
    @choice_present_id = 0
    @choice_present_index = 0
    battle_init
    @skill_cost = SkillCost.new
  end

  def clear_get_item
    @get_item_data = {}
  end

  #--------------------------------------------------------------------------
  # ○ コモンイベントの呼び出しを予約
  #--------------------------------------------------------------------------
  def reserve_common_event(common_event_id)
    @common_events.push(common_event_id)
  end

  #--------------------------------------------------------------------------
  # ○ コモンイベントの呼び出し予約をクリア
  #--------------------------------------------------------------------------
  def clear_common_event
    @common_events.clear
  end

  #--------------------------------------------------------------------------
  # ● コモンイベントの呼び出し予約の先頭を排除
  #--------------------------------------------------------------------------
  def shift_common_event
    @common_events.shift
  end

  #--------------------------------------------------------------------------
  # ○ コモンイベント呼び出しの予約判定
  #--------------------------------------------------------------------------
  def common_event_reserved?
    !@common_events.empty?
  end

  #--------------------------------------------------------------------------
  # ○ 予約されているコモンイベントを取得
  #--------------------------------------------------------------------------
  def reserved_common_event
    common_event_id = common_event_reserved? ? @common_events[0] : 0
    $data_common_events[common_event_id]
  end

  #--------------------------------------------------------------------------
  # ● 獲得メダルを予約
  #--------------------------------------------------------------------------
  def gain_medal_push(id)
    @gain_medals.push(id)
  end

  #--------------------------------------------------------------------------
  # ● 獲得メダルを取り出す
  #--------------------------------------------------------------------------
  def gain_medal_pop
    @gain_medals.shift
  end

  #--------------------------------------------------------------------------
  # ● 獲得メダルが存在する？
  #--------------------------------------------------------------------------
  def gain_medal_exist?
    !@gain_medals.empty?
  end

  #--------------------------------------------------------------------------
  # ○ 「反撃以外での効果適用」の開始
  #--------------------------------------------------------------------------
  def normal_invoke_start
    @normal_invoke_count = 0
  end

  #--------------------------------------------------------------------------
  # ○ 「反撃以外での効果適用」の得TPカウント加算
  #--------------------------------------------------------------------------
  def normal_invoke_plus_count
    @normal_invoke_count += 1 if @normal_invoke_count
  end

  #--------------------------------------------------------------------------
  # ○ 「反撃以外での効果適用」の終了
  #--------------------------------------------------------------------------
  def normal_invoke_end
    @normal_invoke_count = nil
  end

  class SkillCost
    def set(user, skill)
      @user = user
      @cost = user.make_cost_value(skill) if skill.is_a?(RPG::Skill)
    end

    def hp(user)
      get(user, :HP)
    end

    def mp(user)
      get(user, :MP)
    end

    def tp(user)
      get(user, :TP)
    end

    private

    def get(user, type)
      return 0 if @user != user || @cost.nil?

      @cost.fetch(type, 0)
    end
  end
end

class Game_Troop < Game_Unit
  #--------------------------------------------------------------------------
  # ○ 画面の色調を初期化
  #--------------------------------------------------------------------------
  def init_screen_tone
    #    @screen.start_tone_change($game_map.screen.tone, 0) if $game_map
  end

  #--------------------------------------------------------------------------
  # ● 逃走レベルの最大計算
  #--------------------------------------------------------------------------
  def escape_level_max
    members.inject(1) { |r, enemy| r = r > enemy.escape_level ? r : enemy.escape_level }
  end

  #--------------------------------------------------------------------------
  # ● 経験値の合計計算
  #--------------------------------------------------------------------------
  def exp_total
    defeated_members.inject(0) { |r, enemy| r += enemy.exp }
  end

  #--------------------------------------------------------------------------
  # ● ドロップアイテムの配列作成
  #--------------------------------------------------------------------------
  def make_drop_items
    defeated_members.inject([]) { |r, enemy| r += enemy.make_drop_items }
  end

  #--------------------------------------------------------------------------
  # ● 職業経験値の合計計算
  #--------------------------------------------------------------------------
  def class_exp_total
    Integer(defeated_members.inject(0) { |r, enemy| r += enemy.class_exp })
  end

  #--------------------------------------------------------------------------
  # ○ お金の合計計算
  #--------------------------------------------------------------------------
  def gold_total
    (defeated_members.inject(0) { |r, enemy| r += enemy.gold } * gold_rate).to_i
  end

  #--------------------------------------------------------------------------
  # ○ お金の倍率を取得
  #--------------------------------------------------------------------------
  def gold_rate
    [$game_party.get_gold_rate, ($game_party.gold_double? ? 2.0 : 1.0)].max
  end

  #--------------------------------------------------------------------------
  # ● 戦闘 BGM の取得
  #--------------------------------------------------------------------------
  def battle_bgm
    if troop.name =~ /<BGM(?::|：)(\S+)>/i
      RPG::BGM.new(Regexp.last_match(1).to_s)
    else
      $game_system.battle_bgm
    end
  end

  #--------------------------------------------------------------------------
  # ○ バトルイベント（ページ）の条件合致判定
  #--------------------------------------------------------------------------
  def conditions_met?(page, timing = nil)
    if timing
      return false if @event_flags[page]

      return page.list.first.code == 108 && page.list.first.parameters[0] == "<#{timing}>"
    end
    c = page.condition
    if !c.turn_ending && !c.turn_valid && !c.enemy_valid &&
       !c.actor_valid && !c.switch_valid
      return false      # 条件未設定…実行しない
    end
    if @event_flags[page]
      return false      # 実行済み
    end

    return false if c.turn_ending && !BattleManager.turn_end? # ターン終了時

    if c.turn_valid     # ターン数
      n = @turn_count
      a = c.turn_a
      b = c.turn_b
      return false if b == 0 && n != a
      return false if b > 0 && (n < 1 || n < a || n % b != a % b)
    end
    if c.enemy_valid    # 敵キャラ
      enemy = $game_troop.members[c.enemy_index]
      return false if enemy.nil?
      return false if enemy.hp_rate * 100 > c.enemy_hp
    end
    if c.actor_valid    # アクター
      return false unless $game_party.members.any? { |member| member.id == c.actor_id }
      return false if $game_actors[c.actor_id].hp_rate * 100 > c.actor_hp
    end
    return false if c.switch_valid && !$game_switches[c.switch_id] # スイッチ

    true         # 条件合致
  end

  def setup_vga(troop_id)
    clear
    @troop_id = troop_id
    @enemies = []
    troop.members.each do |member|
      enemy_data = $data_enemies[member.enemy_id]
      next unless enemy_data

      enemy_data = enemy_data.replace_data
      enemy = enemy_class.new(@enemies.size, enemy_data.id)
      enemy.hide if member.hidden
      enemy.screen_x = member.x
      enemy.screen_y = member.y
      @enemies.push(enemy)
    end
    init_screen_tone
    init_challenge_battle
    make_unique_names
    auto_correct_bitmap_xy
  end

  def enemy_class
    challenge_battle? ? Challenge_Battle::Enemy : Game_Enemy
  end

  def challenge_battle?
    Array(NWConst::Troop::CHALLENGE_BATTLE).include?(@troop_id)
  end

  def init_challenge_battle
    return unless challenge_battle?

    $game_variables[NWConst::Var::CHALLENGE_BATTLE_DAMAGE] = 0
  end

  def setup_battle_event(timing = nil)
    if challenge_battle? && BattleManager.turn_end? && @turn_count >= $game_variables[NWConst::Var::CHALLENGE_BATTLE_TURN]
      BattleManager.abort
    end

    return if @interpreter.running?
    return if @interpreter.setup_reserved_common_event

    troop.pages.each do |page|
      next unless conditions_met?(page, timing)

      @interpreter.setup(page.list)
      @event_flags[page] = true if page.span <= 1
    end
  end

  def all_members
    members
  end
end

#==============================================================================
# ■ Game_Unit
#==============================================================================
class Game_Unit
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :display_skill_name

  #--------------------------------------------------------------------------
  # ● 戦闘不能か捕食メンバーの配列取得
  #--------------------------------------------------------------------------
  def defeated_members
    members.select { |m| m.predationed? || m.exist? }.select(&:all_dead?)
  end

  def all_dead?
    members.all?(&:all_dead?)
  end

  def random_target(item = nil)
    use_members = target_members(item).select(&:alive?)
    tgr_rand = rand * use_members.inject(0) { |r, member| r + member.tgr }
    use_members.each do |member|
      tgr_rand -= member.tgr
      return member if tgr_rand < 0
    end
    use_members[0]
  end

  def random_dead_target(item = nil)
    use_members = target_members(item).reject(&:alive?)
    return if use_members.empty?

    use_members.sample
  end

  def target_members(item)
    return members unless item

    item_target_members(item).reject { |member| (member.sex & item.ext_scope) == 0 }
  end

  def item_target_members(item)
    members
  end

  #--------------------------------------------------------------------------
  # ● 行動可能なメンバーの配列取得
  #--------------------------------------------------------------------------
  def movable_members
    members.select { |member| member.movable? && !member.cant_move? }
  end
end

#==============================================================================
# ■ Game_Vehicle
#==============================================================================
class Game_Vehicle < Game_Character
  attr_writer :bgm
  #--------------------------------------------------------------------------
  # ● 存在している？
  #--------------------------------------------------------------------------
  def exist?
    0 < @map_id
  end

  def bgm
    @bgm || system_vehicle.bgm
  end

  def get_on
    @driving = true
    @walk_anime = true
    @step_anime = true
    @walking_bgm = RPG::BGM.last
    bgm.play
  end
end
