module RPG
  class Actor
    #--------------------------------------------------------------------------
    # ● 性別
    #--------------------------------------------------------------------------
    def sex
      data_ex.fetch(:sex, NWSex::FEMALE)
    end

    def luca?
      original_persona_id == NWConst::Actor::LUCA
    end
    #--------------------------------------------------------------------------
    # ● 初期種族ID
    #--------------------------------------------------------------------------
    def initial_tribe_id
      data_ex.fetch(:initial_tribe_id, 1)
    end

    #--------------------------------------------------------------------------
    # ● 使用経験値曲線
    #--------------------------------------------------------------------------
    def use_exp_curve
      data_ex.fetch(:use_exp_curve, 1)
    end

    #--------------------------------------------------------------------------
    # ● 人間時追加特徴
    #--------------------------------------------------------------------------
    def human_add_features
      data_ex.key?(:human_add_features) ? [$data_classes[data_ex[:human_add_features]]] : []
    end

    #--------------------------------------------------------------------------
    # ● アクター別習得スキル
    #--------------------------------------------------------------------------
    def peculiar_skill
      data_ex.fetch(:peculiar_skill, [])
    end

    #--------------------------------------------------------------------------
    # ● 初期職業レベル
    #--------------------------------------------------------------------------
    def init_class_level
      data_ex.fetch(:init_class_level, [])
    end

    #--------------------------------------------------------------------------
    # ○ 初期装備の取得
    #--------------------------------------------------------------------------
    def equips
      data_ex.fetch(:init_equips, [nil, nil, nil, nil, nil])
    end

    #--------------------------------------------------------------------------
    # ● 初期アビリティ
    #--------------------------------------------------------------------------
    def init_abilities
      data_ex.fetch(:init_abilities, [])
    end

    #--------------------------------------------------------------------------
    # ● ベースTP
    #--------------------------------------------------------------------------
    def base_tp
      data_ex.fetch(:base_tp, 0)
    end

    #--------------------------------------------------------------------------
    # ● TPレベル補正
    #--------------------------------------------------------------------------
    def tp_level_revise
      data_ex.fetch(:tp_level_revise, 0.0)
    end

    #--------------------------------------------------------------------------
    # ● カテゴリ
    #--------------------------------------------------------------------------
    def actor_categories
      data_ex.fetch(:actor_category, [])
    end

    #--------------------------------------------------------------------------
    # ● ナワバリ
    #--------------------------------------------------------------------------
    def best_place
      data_ex.fetch(:best_place, nil)
    end

    #--------------------------------------------------------------------------
    # ● 人格種別
    #--------------------------------------------------------------------------
    def persona_kind
      data_ex.fetch(:persona_kind, :none)
    end

    #--------------------------------------------------------------------------
    # ● 主人格ID
    #--------------------------------------------------------------------------
    def original_persona_id
      data_ex.fetch(:original_persona_id, id)
    end

    #--------------------------------------------------------------------------
    # ● 誘惑時使用スキル
    #--------------------------------------------------------------------------
    def temptation_skill
      data_ex.fetch(:temptation_skill, nil)
    end

    #--------------------------------------------------------------------------
    # ● イラストレーター名
    #--------------------------------------------------------------------------
    def illustrator_name
      data_ex.fetch(:illustrator_name, "")
    end

    def tp_level100_revise
      data_ex.fetch(:tp_level100_revise, 0.0)
    end

    def awakening?
      $game_switches[NWConst::Sw::AWAKEN_ID + id]
    end
  
    def ability_id
      awakening? ? awaken_id : id
    end

    def awaken_feature_id
      NWConst::Actor::AWAKEN_BASE_ID + id
    end
  end
end

module RPG
  class Armor
    def armor?
      true
    end

    def sort_type
      3
    end

    def accessory_slot
      data_ex.fetch(:accessory_slot, 2)
    end

    def etype_id
      return super + accessory_slot if super == 4
      super
    end

    #--------------------------------------------------------------------------
    # ● アクセサリ判定
    #--------------------------------------------------------------------------
    def is_accessory?
      atype_id == NWConst::Armor::ACCESSORY
    end

    def create_socket_item
      SocketArmor.new(self)
    end

    def need_enchant?
      NWConst::Enchantment::ARMOR_ID.include?(id)
    end

    def enchant_item
      RPG::EnchantArmor.new(self)
    end
  end
end

module RPG
  class BGM
    def initialize(name = '', volume = 100, pitch = 100, fullpath = false)
      @name = name
      @volume = volume
      @pitch = pitch
      @fullpath = fullpath
    end

    def play(pos = 0)
      if @name.empty?
        Audio.bgm_stop
        @@last = RPG::BGM.new
      else
        path = @fullpath ? @name : "Audio/BGM/#{@name}"
        Audio.bgm_play(path, @volume, @pitch, pos)
        @@last = self.clone
      end
    end

    def reserve
      Audio.next_bgm(self)
      @@last = self.clone
    end
  end
end
module RPG
  class BaseItem
    include Fts
    attr_reader :data_ex
    attr_reader :feature_data

    def equip_item?
      false
    end

    def ==(other)
      self.class == other.class && id == other.id
    end

    def setting_feature_data
      @feature_data = {}
      features.each do |ft|
        @feature_data[ft.code] ||= {}
        @feature_data[ft.code][ft.data_id] ||= []
        @feature_data[ft.code][ft.data_id].push(ft)
      end
    end

    def features_with_code(code = nil)
      feature_objects.features(code)
    end

    def feature_objects
      @fts ||= Hima::FeatureObjects.new([self])
    end

    def all_features
      feature_objects.all_features
    end

    def features_with_id(code, id)
      feature_objects.features_with_id(code, id)
    end

    def get_value(value, type)
      case type
      when :rate
        value.to_f * 0.01
      when :int
        value.to_i
      when :string
        value
      end
    end

    def add_effect(code = 0, data_id = 0, value1 = 0, value2 = 0)
      @effects_ex.push(RPG::UsableItem::Effect.new(code, data_id, value1, value2))
    end

    def add_feature(code = 0, data_id = 0, value = 0, priority = 0)
      ft = RPG::BaseItem::Feature.new(code, data_id, value)
      ft.priority = priority
      @add_features.push(ft)
    end

    def window_name
      "\eC[#{display_color}]\eI[#{icon_index}]#{display_name}\eCC"
    end

    def display_name
      name.empty? ? id.to_s : name
    end

    def category_convert_param_data(stype_id)
      data_ex.fetch(:skill_convert_param_data, {}).fetch(stype_id, [])
    end

    def change(battler)
      self
    end

    def set_effects
      []
    end

    def favorite?
      $game_party.favorite_item?(self)
    end

    def need_socket?
      false
    end

    def uniq_item?
      false
    end

    def socket_item?
      false
    end

    def socket?
      false
    end

    def need_enchant?
      false
    end

    def enchant_item?
      false
    end

    def socket_num
      0
    end

    def enchant?
      false
    end

    def equip_selectable_id
      data_ex.fetch(:equip_selectable_id, nil)
    end

    def note_analyze
      nw_note_analyze
      change_features
    end

    def sort_obj
      [sort_type, sort_id, id, append_sort_id]
    end

    def sort_id
      data_ex.fetch(:sort_id, id)
    end

    def append_sort_id
      0
    end

    def sort_type
      0
    end

    def lib_exclude?
      data_ex.key?(:lib_exclude?) || name.empty?
    end

    def change_features
      @features_override = _change_features
    end

    def features
      @features_override
    end

    def _change_features
      default_features
    end

    def default_features
      @features + @add_features
    end

    def weapon_rate_bonus
      data_ex.fetch(:weapon_rate_bonus, [])
    end

    def enchant_stone?
      data_ex.key?(:enchant_stone_id)
    end

    def index
      @id
    end

    def display_color
      0
    end

    def base_data
      self
    end

    def replace_gain
      data_ex.fetch(:replace_gain, nil)
    end

    def replace_data
      r = replace_gain
      return self unless r
      return self unless $game_switches[r[0]]

      i = case self
          when RPG::Weapon
            $data_weapons[r[1]]
          when RPG::Armor
            $data_armors[r[1]]
          when RPG::Item
            $data_items[r[1]]
          else
            self
          end
      i.replace_data
    end

    class Feature
      attr_writer :obj_id
      attr_writer :enchant_id
      attr_accessor :priority

      def obj_id
        @obj_id ||= 0
      end

      def enchant_id
        @enchant_id || -1
      end

      def display_color
        NWConst::Enchantment.display_color(!enchant_id || enchant_id < 0 ? 0 : $data_classes[enchant_id].dummy_enchant_color)
      end

      def priority
        @priority ||= 0
      end
    end
  end
end

module RPG
  class Class
    class << self
      attr_accessor :a
    end
    def param(param_id, level)
      return @params[param_id, level] if level < 100

      d = (@params[param_id, 99] - @params[param_id, 98])
      lv = level - 99
      Class.a ||= [NWConst::Parameter::LEVEL_100_MHP, NWConst::Parameter::LEVEL_100_MMP,
                   NWConst::Parameter::LEVEL_100_ATK, NWConst::Parameter::LEVEL_100_DEF,
                   NWConst::Parameter::LEVEL_100_MAT, NWConst::Parameter::LEVEL_100_MDF,
                   NWConst::Parameter::LEVEL_100_AGI, NWConst::Parameter::LEVEL_100_LUK]
      @params[param_id, 99] + eval(Class.a[param_id])
    end

    #--------------------------------------------------------------------------
    # ● 職業ランク
    #--------------------------------------------------------------------------
    def class_lank
      data_ex.fetch(:class_lank, 0)
    end

    #--------------------------------------------------------------------------
    # ● 必要転職クラス
    #--------------------------------------------------------------------------
    def need_jobchange_class
      data_ex.fetch(:need_jobchange_class, [])
    end

    #--------------------------------------------------------------------------
    # ● 選択転職クラス
    #--------------------------------------------------------------------------
    def select_jobchange_class
      data_ex.fetch(:select_jobchange_class, [])
    end

    #--------------------------------------------------------------------------
    # ● 必要転職アイテム
    #--------------------------------------------------------------------------
    def need_jobchange_item
      data_ex.fetch(:need_jobchange_item, [])
    end

    #--------------------------------------------------------------------------
    # ● メモライズキャパシティ
    #--------------------------------------------------------------------------
    def memorize_capacity_revise
      data_ex.fetch(:memorize_capacity_revise, {})
    end

    #--------------------------------------------------------------------------
    # ● 職業用クラス？
    #--------------------------------------------------------------------------
    def job?
      NWConst::Class::JOB_RANGE.include?(id)
    end

    #--------------------------------------------------------------------------
    # ● 種族用クラス？
    #--------------------------------------------------------------------------
    def tribe?
      NWConst::Class::TRIBE_RANGE.include?(id)
    end

    def max_lv
      data_ex.fetch(:max_lv, 10)
    end

    def set_effect
      data_ex.fetch(:set_effect, nil)
    end

    def _change_features
      super.each do |ft|
        ft.enchant_id = id
      end
      super
    end

    def kind
      if job?
        :class
      elsif tribe?
        :tribe
      end
    end

    def get_value(value, type)
      if NWRegexp::ENCHANT_VALUE.match(value)
        /\[(.*?)\]/i.match(value)
        return Enchant_Value.new(type, Regexp.last_match(1))
      end
      case type
      when :rate
        value.to_f * 0.01
      when :int
        value.to_i
      when :string
        value
      end
    end

    def dummy_enchant_color
      data_ex.fetch(:dummy_enchant_color, 0)
    end

    def bonus_params
      data_ex.fetch(:bonus_params, [0] * 8)
    end

    def bonus_max_sp
      data_ex.fetch(:bonus_max_sp, 0)
    end

    def prefix
      data_ex.fetch(:prefix, [])
    end

    def rare_prefix
      data_ex.fetch(:rare_prefix, [])
    end

    def both_disable
      data_ex.fetch(:both_disable, [])
    end

    def final_bonus
      data_ex.fetch(:final_bonus, 0.0) + 1.0
    end

    def enchant?
      @id >= 1500
    end

    alias pexp_for_level exp_for_level
    def exp_for_level(level)
      l = if level < 100
            pexp_for_level(level)
          elsif level > NWConst::Parameter::LEVEL_EXP_MAX
            dmax = exp_for_level(NWConst::Parameter::LEVEL_EXP_MAX)
            d = dmax - exp_for_level(NWConst::Parameter::LEVEL_EXP_MAX - 1)
            dmax + d * (level - NWConst::Parameter::LEVEL_EXP_MAX)
          else
            l99 = pexp_for_level(99)
            d = l99 - pexp_for_level(98)
            lv = level - 98
            l99 + eval(NWConst::Parameter::LEVEL_100_EXP)
          end
      l * exp_rate
    end

    def level_for_exp(exp, max_lv = nil)
      max_lv ||= self.max_lv
      (1..max_lv).each { |i| return i if exp_for_level(i + 1) > exp }
      max_lv
    end

    def exp_rate
      data_ex.fetch(:exp_rate, 1)
    end
  end
end

module RPG
  class UsableItem
    class Damage
      attr_accessor :enemy_formula

      def eval(a, b, v)
        f = (a.enemy_calculation? && @enemy_formula) ? @enemy_formula : @formula
        [Kernel.eval(f), 0].max * sign rescue 0
      end
    end
  end

end
module RPG
  class Enemy
    #--------------------------------------------------------------------------
    # ● 逃走レベル
    #--------------------------------------------------------------------------
    def escape_level
      data_ex.fetch(:escape_level, 1)
    end

    #--------------------------------------------------------------------------
    # ● 職業経験値
    #--------------------------------------------------------------------------
    def class_exp
      data_ex.fetch(:class_exp, exp)
    end

    #--------------------------------------------------------------------------
    # ● 盗み用持ち物リスト
    #--------------------------------------------------------------------------
    def steal_list
      data_ex.fetch(:steal_list, { 1 => [], 2 => [], 3 => [], 4 => [] })
    end

    #--------------------------------------------------------------------------
    # ● 武器タイプ属性
    #--------------------------------------------------------------------------
    def wtype_id
      data_ex.fetch(:wtype_id, NWConst::WType::DEFAULT_ENEMY)
    end

    #--------------------------------------------------------------------------
    # ● 図鑑種族名
    #--------------------------------------------------------------------------
    def lib_category
      data_ex.fetch(:lib_category, :EMPTY)
    end

    #--------------------------------------------------------------------------
    # ● 図鑑名称
    #--------------------------------------------------------------------------
    def lib_name
      data_ex.fetch(:lib_name, name)
    end

    #--------------------------------------------------------------------------
    # ● 誘惑時使用スキル
    #--------------------------------------------------------------------------
    def temptation_skill
      data_ex.fetch(:temptation_skill, nil)
    end

    #--------------------------------------------------------------------------
    # ● 仲間加入表記スイッチ
    #--------------------------------------------------------------------------
    def join_switch
      data_ex.fetch(:join_switch, nil)
    end

    #--------------------------------------------------------------------------
    # ● 難易度補正無視
    #--------------------------------------------------------------------------
    def no_difficulty?
      data_ex.key?(:no_difficulty)
    end

    #--------------------------------------------------------------------------
    # ● 捕食無効
    #--------------------------------------------------------------------------
    def no_predation?
      data_ex.key?(:no_predation)
    end

    #--------------------------------------------------------------------------
    # ● 敗北イベントスキップ不能
    #--------------------------------------------------------------------------
    def no_lose_skip?
      data_ex.key?(:no_lose_skip)
    end

    #--------------------------------------------------------------------------
    # ● 友好度の設定
    #--------------------------------------------------------------------------
    def friend=(value)
      $game_variables[NWConst::Var::ENEMY_REL_BASE + friend_id] = value
    end

    #--------------------------------------------------------------------------
    # ● 友好度の取得
    #--------------------------------------------------------------------------
    def friend
      $game_variables[NWConst::Var::ENEMY_REL_BASE + friend_id]
    end

    def friend_id
      data_ex.fetch(:friend_variable, base_enemy.id)
    end

    #--------------------------------------------------------------------------
    # ● 混沌の迷宮エネミーかどうか
    #--------------------------------------------------------------------------
    def ex_dungeon_enemy?
      (1001..2000).include?(id)
    end

    def ex_enemy?
      (2001..3000).include?(id)
    end

    def base_enemy
      return $data_enemies[id - 2000] if ex_enemy?
      return $data_enemies[id - 1000] if ex_dungeon_enemy?

      self
    end

    #--------------------------------------------------------------------------
    # ● 敗北後イベントID
    #--------------------------------------------------------------------------
    def lose_event_id
      return NWConst::Common::LOSE_EVENT_BASE if ex_dungeon_enemy?

      NWConst::Common::LOSE_EVENT_BASE + base_enemy.id
    end

    def escape_not_count?
      data_ex.key?(:escape_not_count?)
    end

    def defeat_message
      data_ex.fetch(:defeat_message, "")
    end

    def lib_exclude?
      return true if ex_dungeon_enemy?

      super
    end

    def hp_infinite?
      data_ex.key?(:hp_infinite)
    end

    def mp_infinite?
      data_ex.key?(:mp_infinite)
    end

    def word_id
      data_ex.fetch(:word_id, nil)
    end

    def _change_features
      hit_features, other_features = super.partition do |feature|
        feature.code == FEATURE_XPARAM && feature.data_id == 0
      end
      hit_value = hit_features.empty? ? 0.8 : hit_features.map(&:value).inject(:+)
      hit_feature = RPG::BaseItem::Feature.new(
        FEATURE_XPARAM_EX, 0, hit_value
      )
      [hit_feature] + other_features
    end

    def no_memory_battle?
      return true if @note =~ /<戦闘回想不可>/
      return true if ex_dungeon_enemy?

      false
    end

    def param_ref
      data_ex.fetch(:param_ref, nil)
    end

    def setting_feature_data
      super
      return unless param_ref

      e = $data_enemies[param_ref]
      return if e.nil? || e.name.empty?

      @params = e.params.dup
      @exp = e.exp
      @gold = e.gold
      @data_ex[:class_exp] = e.class_exp
    end

    def replace_member
      data_ex.fetch(:replace_member, nil)
    end

    def replace_data
      r = replace_member
      return self unless r
      return self unless $game_switches[r[0]]

      i = $data_enemies[r[1]]
      i.replace_data
    end

    class Action
      def skill
        $data_skills[skill_id]
      end
    end

    class DropItem
      def object
        return $data_items [data_id] if kind == 1
        return $data_weapons[data_id] if kind == 2
        return $data_armors [data_id] if kind == 3

        nil
      end
    end
  end
end

#==============================================================================
# ■ RPG::EquipItem
#==============================================================================
module RPG
  class EquipItem
    def equip_item?
      true
    end
    
    def armor?
      false
    end

    def weapon?
      false
    end

    def shield?
      etype_id == NWConst::Etype::SHIELD
    end

    def not_dual_wield?
      data_ex.key?(:not_dual_wield?)
    end

    def exclusive_actors
      data_ex.fetch(:exclusive_actors, nil)
    end

    def not_enchant_id
      data_ex.fetch(:not_enchant_id, [])
    end

    def param_names
      names = []
      params.each_with_index do |param, i|
        next if param == 0

        names.push(format("%s:%d", Vocab.param(i), param))
      end
      names
    end

    def final_bonus
      data_ex.fetch(:final_bonus, 0) + 1.0
    end

    def equip_actor
      nil
    end

    def change_ok?
      true
    end

    def lib_exclude?
      super || need_enchant? || uniq_item?
    end

    def create_enchant_item
      data = enchant_item
      data.set_data
      data
    end

    def get_value(value, type)
      if NWRegexp::ENCHANT_VALUE.match(value)
        /\[(.*?)\]/i.match(value)
        return Enchant_Value.new(type, Regexp.last_match(1))
      end
      case type
      when :rate
        value.to_f * 0.01
      when :int
        value.to_i
      when :string
        value
      end
    end

    def base_etype_id
      @etype_id
    end
  end
end

module RPG
  class Item
    #--------------------------------------------------------------------------
    # ● スキル判定
    #--------------------------------------------------------------------------
    def is_skill?
      false
    end

    def sort_type
      1
    end
    #--------------------------------------------------------------------------
    # ● プレゼント判定
    #--------------------------------------------------------------------------
    def is_present?
      NWConst::Item::PRESENT_RANGE.include?(id)
    end

    def enchant_stone_id
      data_ex.fetch(:enchant_stone_id, [])
    end

    def enchant_stone_category
      data_ex.fetch(:enchant_stone_category, nil)
    end
  end
end

module RPG
  class Map
    def battleback_region(region_id)
      @data_ex.fetch(:battleback_region, {}).fetch(region_id, nil)
    end
  end
end

class MapInfos
  def initialize
    @data = [load_data("Data/MapInfos.rvdata2")]
    i = 1
    while NWFileTest.file_exist?("#{DataManager.over_map_dir(i)}/Data/MapInfos.rvdata2", false)
      f = "#{DataManager.over_map_dir(i)}/Data/MapInfos.rvdata2"
      @data << load_data(f) if NWFileTest.file_exist?(f)
      i += 1
    end
  end

  def [](index)
    div, mod = index.divmod(1000)
    @data[div][mod]
  end
end

module RPG
  class Skill
    #--------------------------------------------------------------------------
    # ● 拡張消費HP
    #--------------------------------------------------------------------------
    def hp_cost_ex
      data_ex.fetch(:hp_cost_ex, nil)
    end

    #--------------------------------------------------------------------------
    # ● 拡張消費MP
    #--------------------------------------------------------------------------
    def mp_cost_ex
      data_ex.fetch(:mp_cost_ex, nil)
    end

    #--------------------------------------------------------------------------
    # ● 拡張消費TP
    #--------------------------------------------------------------------------
    def tp_cost_ex
      data_ex.fetch(:tp_cost_ex, nil)
    end

    #--------------------------------------------------------------------------
    # ● 消費金額
    #--------------------------------------------------------------------------
    def gold_cost
      data_ex.fetch(:gold_cost, 0)
    end

    #--------------------------------------------------------------------------
    # ● 消費アイテム
    #--------------------------------------------------------------------------
    def item_cost
      data_ex.fetch(:item_cost, [])
    end

    #--------------------------------------------------------------------------
    # ● 必要アイテム
    #--------------------------------------------------------------------------
    def need_item
      data_ex.fetch(:need_item, [])
    end

    #--------------------------------------------------------------------------
    # ● 二刀流要求
    #--------------------------------------------------------------------------
    def need_dual_wield?
      data_ex.key?(:need_dual_wield?)
    end

    #--------------------------------------------------------------------------
    # ● 友好度表示？
    #--------------------------------------------------------------------------
    def friend_draw?
      data_ex.key?(:friend_draw?)
    end

    #--------------------------------------------------------------------------
    # ● スキルタイプ配列
    #--------------------------------------------------------------------------
    def stypes
      data_ex.fetch(:stype_ex, []) + [stype_id]
    end

    #--------------------------------------------------------------------------
    # ● スキル命中率
    #--------------------------------------------------------------------------
    def skill_hit
      data_ex.fetch(:skill_hit, nil)
    end

    #--------------------------------------------------------------------------
    # ● スキル命中補正率
    #--------------------------------------------------------------------------
    def skill_hit_factor
      data_ex.fetch(:skill_hit_factor, 0.0)
    end

    #--------------------------------------------------------------------------
    # ● 習得不可アクターID配列
    #--------------------------------------------------------------------------
    def not_learn_actors
      data_ex.key?(:not_learn_actors) ? NWConst::Actor::NOT_LEARN_ACTORS : []
    end

    #--------------------------------------------------------------------------
    # ● メモライズコスト
    #--------------------------------------------------------------------------
    def memorize_cost
      data_ex.fetch(:memorize_cost, 0)
    end

    #--------------------------------------------------------------------------
    # ● パッシブ防具ID配列
    #--------------------------------------------------------------------------
    def passive_armors
      data_ex.fetch(:passive_armors, [])
    end

    #--------------------------------------------------------------------------
    # ● 共存不可メモライズ配列
    #--------------------------------------------------------------------------
    def not_jumble_memorize
      data_ex.fetch(:not_jumble_memorize, [])
    end

    #--------------------------------------------------------------------------
    # ● 図鑑名称
    #--------------------------------------------------------------------------
    def lib_name
      data_ex.fetch(:lib_name, name)
    end

    #--------------------------------------------------------------------------
    # ● 不可視フラグ取得
    #--------------------------------------------------------------------------
    def visible?
      data_ex.key?(:visible?) ? false : true
    end

    #--------------------------------------------------------------------------
    # ● 再使用ターン
    #--------------------------------------------------------------------------
    def recharge
      data_ex.fetch(:recharge, 0)
    end

    #--------------------------------------------------------------------------
    # ● 周期技判定
    #--------------------------------------------------------------------------
    def cycle_skill?
      data_ex.key?(:cycle)
    end

    #--------------------------------------------------------------------------
    # ● 周期条件の評価
    #--------------------------------------------------------------------------
    def cycle_eval
      cycle_skill? ? eval(data_ex[:cycle]) : false
    end

    #--------------------------------------------------------------------------
    # ● 一人旅未使用？
    #--------------------------------------------------------------------------
    def lonely_unused?
      data_ex.key?(:lonely_unused?)
    end

    def succubus_unavailable?
      data_ex.key?(:succubus_unavailable)
    end

    def need_dual_shield?
      data_ex.key?(:need_dual_shield?)
    end

    def no_auto_battle
      data_ex.fetch(:no_auto_battle, [])
    end

    def use_normal?
      data_ex.key?(:use_normal)
    end

    def critical_ex
      data_ex.fetch(:critical_ex, 0)
    end

    def class_conditions
      data_ex.fetch(:class_conditions, nil)
    end

    def class_conditions_met?(actor)
      return true unless class_conditions

      class_conditions.include?(actor.class_id) || class_conditions.include?(actor.tribe_id)
    end

    def no_auto_battle?(type)
      no_auto_battle.include?(type)
    end

    #--------------------------------------------------------------------------
    # ● スキル判定
    #--------------------------------------------------------------------------
    def is_skill?
      true
    end

    def ability?
      master_ability? || NWConst::Ability::ABILITY_SKILL_TYPE.include?(stype_id)
    end

    #--------------------------------------------------------------------------
    # ● 対象
    #--------------------------------------------------------------------------
    def ext_scope
      return NWSex::LUCA if bind? || eternal_bind? || binding_start?

      super
    end

    #--------------------------------------------------------------------------
    # ● 拘束時専用技？
    #--------------------------------------------------------------------------
    def bind?
      stype_id == NWConst::SType::BIND
    end

    #--------------------------------------------------------------------------
    # ● 永久拘束時専用技？
    #--------------------------------------------------------------------------
    def eternal_bind?
      stype_id == NWConst::SType::EBIND
    end

    def eval_damage(subject, target)
      damage.eval(SkillSubjectBattler.new(subject, self), SkillTargetBattler.new(target, self), $game_variables)
    end

    def nw_note_analyze
      super
      @data_ex[:ext_scope] |= NWSex::HERO if (@data_ex.fetch(:ext_scope, 0x0) & NWSex::LUCA) != 0
    end

    def master_ability?
      data_ex.key?(:master_ability?)
    end

    def one_rate
      @one_rate || 1.0
    end

    def changed?
      @change_flag
    end

    def changed(flag = true)
      @change_flag = flag
    end

    def change_penetrate(battler)
      return unless battler.skill_def_penetration?(self)

      @def_penetration_flag = true
    end

    def def_penetration?
      @def_penetration_flag
    end

    def change(battler)
      return self unless battler
      return self if changed?

      if CacheActorFeatures.cache? && battler.actor? && battler.respond_to?(:skill_change)
        return CacheActorFeatures.skill_change(battler,
                                               id)
      end

      skill = Marshal.load(Marshal.dump(self))
      skill.changed
      skill.change_penetrate(battler)
      skill.change_effect(battler)
      return skill.tap(&:change_scope_all) if skill.change_scope_all?(battler)

      skill.change_scope_one(battler)
      skill.change_plus_attack(battler)

      skill
    end

    def need_states
      data_ex.fetch(:need_states, [])
    end

    # @param battler [Game_Battler]
    def change_effect(battler)
      add_state_effect(battler)
      add_steal_effect(battler)
      add_restoration_effect(battler)
    end

    def add_steal_effect(battler)
      fts = stypes.map do |stype|
        battler.features_with_id(FEATURE_ADD_STEAL_STYPE, stype)
      end.flatten
      fts += battler.features_with_id(FEATURE_ADD_STEAL_SID, id)
      fts.map(&:value).each do |e|
        add_effect(EFFECT_STEAL, e)
      end
    end

    def add_restoration_effect(battler)
      stype_hp = stypes.map do |stype|
        battler.features_with_id(FEATURE_ADD_RESTORATION_STYPE_HP, stype)
      end.flatten
      stype_mp = stypes.map do |stype|
        battler.features_with_id(FEATURE_ADD_RESTORATION_STYPE_MP, stype)
      end.flatten

      hp = battler.features_with_id(FEATURE_ADD_RESTORATION, :HP) + stype_hp
      mp = battler.features_with_id(FEATURE_ADD_RESTORATION, :MP) + stype_mp
      add_effect(EFFECT_RESTORATION, :HP, hp.map(&:value).inject(:+)) unless hp.empty?
      add_effect(EFFECT_RESTORATION, :MP, mp.map(&:value).inject(:+)) unless mp.empty?
    end

    def add_state_effect(battler)
      battler.features_with_id(FEATURE_SKILL_STATE_ADD, id).map(&:value).map do |hash|
        hash.map do |k, v|
          code =
            case k
            when :target
              NWUsableEffect::EFFECT_ADD_STATE
            when :self
              NWUsableEffect::EFFECT_SELF_ENCHANT
            end
          v.map do |kk, vv|
            add_effect(code, kk, vv)
          end
        end
      end

      fts = stypes.map do |stype|
        battler.features_with_id(FEATURE_SKILL_TYPE_STATE_ADD, stype)
      end.flatten
      fts.map(&:value).each do |hash|
        hash.each do |k, v|
          code =
            case k
            when :self
              NWUsableEffect::EFFECT_SELF_ENCHANT
            when :friends
              next unless for_friend?

              NWUsableEffect::EFFECT_ADD_STATE
            when :opponents
              next unless for_opponent?

              NWUsableEffect::EFFECT_ADD_STATE
            end
          v.map do |kk, vv|
            add_effect(code, kk, vv)
          end
        end
      end
    end

    def change_scope_all?(battler)
      [1, 7, 9].include?(@scope) && battler.skill_scope_all?(self)
    end

    def change_plus_attack?
      [1, 3, 7].include?(@scope) && !exp_target?
    end

    def change_scope_one?(battler)
      for_all? && !exp_target? && battler.skill_scope_one?(self)
    end

    def change_scope_all
      @scope += 1
      @scope = 8 if @scope == 12
      return unless exp_target

      if [1, 4].include?(@exp_target[0][0])
        @exp_target[0][0] += 1
        return
      end

      @exp_target = false
    end

    def change_scope_one(battler)
      return unless change_scope_one?(battler)

      @scope -= 1
      @one_rate = battler.skill_scope_one_rate(self)
      @exp_target = false
    end

    def change_plus_attack(battler)
      return unless change_plus_attack?

      count = battler.skill_plus_attack_one_count(self)
      return if count == 0

      et = for_opponent? ? 1 : 4
      et += 2 if for_random?

      if battler.skill_plus_attack_one_random?(self)
        et += 2 unless for_random?
        @scope = for_opponent? ? 2 : 8
      end
      @exp_target = []
      @exp_target[2] = -1
      @exp_target[0] = [et, count + 1]
    end
  end
end

module RPG
  class State
    #--------------------------------------------------------------------------
    # ● 一時装備
    #--------------------------------------------------------------------------
    def tmp_equip
      data_ex.fetch(:tmp_equip, 0)
    end

    #--------------------------------------------------------------------------
    # ● 追加戦闘不能ステート？
    #--------------------------------------------------------------------------
    def death?
      id == 1 || data_ex.key?(:death?)
    end

    #--------------------------------------------------------------------------
    # ● 快楽死亡ステート？
    #--------------------------------------------------------------------------
    def death_pleasure?
      data_ex.key?(:death_pleasure?)
    end

    #--------------------------------------------------------------------------
    # ● 拘束使用状態？
    #--------------------------------------------------------------------------
    def user_bind?
      id == NWConst::State::UBIND
    end

    #--------------------------------------------------------------------------
    # ● 拘束対象状態？
    #--------------------------------------------------------------------------
    def target_bind?
      id == NWConst::State::TBIND
    end

    #--------------------------------------------------------------------------
    # ● 永久拘束使用状態？
    #--------------------------------------------------------------------------
    def eternal_user_bind?
      id == NWConst::State::EUBIND
    end

    #--------------------------------------------------------------------------
    # ● 永久拘束対象状態？
    #--------------------------------------------------------------------------
    def eternal_target_bind?
      id == NWConst::State::ETBIND
    end

    def add_action
      data_ex.fetch(:add_action, [])
    end

    def seal_action
      data_ex.fetch(:seal_action, [])
    end

    def force_item_drop?
      data_ex.key?(:force_item_drop)
    end

    def display_state_name
      data_ex.fetch(:display_state_name, name)
    end

    def display?
      data_ex.fetch(:display?, true)
    end

    def all_dead?
      data_ex.fetch(:all_dead, false)
    end

    def once_turn_end_state
      data_ex.fetch(:once_turn_end_state, [])
    end

    def popup_boost_name
      data_ex.fetch(:popup_boost_name, nil)
    end

    def remove_states
      data_ex.fetch(:remove_state, [])
    end

    def _change_features
      is_expr = ->(ft) { ft.code == FEATURE_BATTLER_ABILITY && ft.data_id == GET_EXP_RATE }
      is_cexpr = ->(ft) { ft.code == FEATURE_BATTLER_ABILITY && ft.data_id == GET_CLASSEXP_RATE }
      is_party_ex = lambda do |ft|
        ft.code == FEATURE_PARTY_EX_ABILITY && (ft.data_id == GET_GOLD_RATE || ft.data_id == GET_ITEM_RATE || ft.data_id == COLLECT_RATE)
      end

      is_state_boost = ->(ft) { ft.code == FEATURE_PARAM }
      super.map do |ft|
        case ft
        when is_expr
          RPG::BaseItem::Feature.new(FEATURE_BATTLER_ABILITY, GET_EXP_RATE_STATE, ft.value)
        when is_cexpr
          RPG::BaseItem::Feature.new(FEATURE_BATTLER_ABILITY, GET_CLASSEXP_RATE_STATE, ft.value)
        when is_party_ex
          RPG::BaseItem::Feature.new(FEATURE_PARTY_EX_ABILITY, ft.data_id + 10, ft.value)
        when is_state_boost
          ft = RPG::BaseItem::Feature.new(FEATURE_PARAM_STATE, ft.data_id, ft.value)
          ft.obj_id = id
          ft
        else
          ft
        end
      end
    end
  end
end

module RPG
  class UsableItem
    #--------------------------------------------------------------------------
    # ● Mix-In
    #--------------------------------------------------------------------------
    include NWUsableEffect

    #--------------------------------------------------------------------------
    # ● 対象
    #--------------------------------------------------------------------------
    def ext_scope
      data_ex.fetch(:ext_scope, NWSex::ALL)
    end

    #--------------------------------------------------------------------------
    # ● 回復反転無視フラグ
    #--------------------------------------------------------------------------
    def heel_reverse_ignore?
      data_ex.key?(:heel_reverse_ignore)
    end

    #--------------------------------------------------------------------------
    # ● 仲間想い（使用時）
    #--------------------------------------------------------------------------
    def considerate_revise
      data_ex.fetch(:considerate_revise, 0.0)
    end

    #--------------------------------------------------------------------------
    # ● 自爆属性？
    #--------------------------------------------------------------------------
    def pay_life?
      data_ex.key?(:pay_life?)
    end

    #--------------------------------------------------------------------------
    # ● ランダム発動
    #--------------------------------------------------------------------------
    def random_invoke
      data_ex.fetch(:random_invoke, nil)
    end

    #--------------------------------------------------------------------------
    # ● 順番発動
    #--------------------------------------------------------------------------
    def multi_invoke
      data_ex.fetch(:multi_invoke, nil)
    end

    #--------------------------------------------------------------------------
    # ● スロット使用？
    #--------------------------------------------------------------------------
    def use_slot?
      data_ex.key?(:use_slot?)
    end

    #--------------------------------------------------------------------------
    # ● ポーカー使用？
    #--------------------------------------------------------------------------
    def use_poker?
      data_ex.key?(:use_poker?)
    end

    #--------------------------------------------------------------------------
    # ● 追加アニメ
    #--------------------------------------------------------------------------
    def add_anime
      data_ex.fetch(:add_anime, [])
    end

    #--------------------------------------------------------------------------
    # ● 基本属性配列
    #--------------------------------------------------------------------------
    def default_elements
      damage.none? || (damage.element_id == 0) ? [] : [damage.element_id]
    end

    #--------------------------------------------------------------------------
    # ● 属性配列
    #--------------------------------------------------------------------------
    def elements
      data_ex.fetch(:element_ex, []) + default_elements
    end

    #--------------------------------------------------------------------------
    # ● 武器倍率
    #--------------------------------------------------------------------------
    def weapon_rate(wtype_id)
      return 1.0 unless data_ex.key?(:weapon_rate)
      return 1.0 unless data_ex[:weapon_rate].key?(wtype_id)

      1.0 + data_ex[:weapon_rate][wtype_id]
    end

    #--------------------------------------------------------------------------
    # ● 薬の知識適用？
    #--------------------------------------------------------------------------
    def apply_pharmacology?
      data_ex.key?(:apply_pharmacology?)
    end

    #--------------------------------------------------------------------------
    # ● ワープアイテム？
    #--------------------------------------------------------------------------
    def warp_item?
      data_ex.key?(:warp_item?)
    end

    #--------------------------------------------------------------------------
    # ● 属性耐性無視？
    #--------------------------------------------------------------------------
    def element_penetrate?
      data_ex.key?(:penetrate) ? data_ex[:penetrate] & 0x1 == 0x1 : false
    end

    #--------------------------------------------------------------------------
    # ● 投擲専用アイテム？
    #--------------------------------------------------------------------------
    def throw?
      data_ex.key?(:throw?)
    end

    #--------------------------------------------------------------------------
    # ● ステート耐性無視？
    #--------------------------------------------------------------------------
    def state_penetrate?
      data_ex.key?(:penetrate) ? data_ex[:penetrate] & 0x2 == 0x2 : false
    end

    #--------------------------------------------------------------------------
    # ● 拘束開始技？
    #--------------------------------------------------------------------------
    def binding_start?
      data_ex.key?(:binding_start?)
    end
    #--------------------------------------------------------------------------
    # ○ 使用効果
    #--------------------------------------------------------------------------
    alias nw_kure_usable_effects effects
    def effects
      nw_kure_usable_effects + @effects_ex
    end
    #--------------------------------------------------------------------------
    # ○ 連続回数
    #--------------------------------------------------------------------------
    alias nw_kure_usable_repeats repeats
    def repeats
      data_ex.fetch(:repeat_ex, nw_kure_usable_repeats)
    end

    #--------------------------------------------------------------------------
    # ○ 対象から使用者を除外する
    #--------------------------------------------------------------------------
    def target_reject_user?
      data_ex.key?(:target_reject_user?)
    end

    #--------------------------------------------------------------------------
    # ○ 防御壁を消す
    #--------------------------------------------------------------------------
    def erase_defense_wall?
      data_ex.key?(:erase_defense_wall?)
    end

    #--------------------------------------------------------------------------
    # ● 待機メンバー対象？
    #--------------------------------------------------------------------------
    def include_bench?
      data_ex.key?(:include_bench?)
    end

    #--------------------------------------------------------------------------
    # ● 人格切替
    #--------------------------------------------------------------------------
    def persona_change
      data_ex.fetch(:persona_change, nil)
    end

    def one_rate
      1.0
    end

    def display_skill_name
      data_ex.fetch(:display_skill_name, name)
    end

    def learning_skill
      data_ex.fetch(:learning_skill, nil)
    end

    def eval_damage(subject, target)
      damage.eval(DamageEvalBattler.new(subject, self), DamageEvalBattler.new(target, self), $game_variables)
    end

    def bench_only?
      data_ex.key?(:bench_only)
    end

    def skill_hit
      nil
    end

    def skill_hit_factor
      0.0
    end

    def full_hp_boost
      data_ex.fetch(:full_hp_boost, 0)
    end

    def invalid_boost?
      data_ex.key?(:invalid_boost)
    end

    def mimic?
      data_ex.key?(:mimic?)
    end

    def super_mimic?
      data_ex.key?(:super_mimic?)
    end

    def use_items_mode
      return :slot if use_slot?
      return :poker if use_poker?
      return :random if random_invoke
      return :multi if multi_invoke

      :normal
    end

    def booster_ex_category_attack(id)
      data_ex.fetch(:booster_ex_category_attack, {}).fetch(id, 0.0)
    end

    def no_invoke_repeats?
      data_ex.key?(:no_invoke_repeats)
    end

    def overlap_limit
      0
    end

    def stypes
      []
    end

    #--------------------------------------------------------------------------
    # ● 速攻発動？
    #--------------------------------------------------------------------------
    def fast_move?
      data_ex.key?(:fast_move?)
    end

    #--------------------------------------------------------------------------
    # ● 遅攻発動？
    #--------------------------------------------------------------------------
    def slow_move?
      data_ex.key?(:slow_move?)
    end

    #--------------------------------------------------------------------------
    # ● 手加減？
    #--------------------------------------------------------------------------
    def allowance?
      data_ex.key?(:allowance?)
    end

    #--------------------------------------------------------------------------
    # ● ステート特攻
    #--------------------------------------------------------------------------
    def state_boost(state)
      return 1.0 unless data_ex.key?(:state_boost)

      data_ex[:state_boost][state.id] ? 1.0 + data_ex[:state_boost][state.id] : 1.0
    end

    #--------------------------------------------------------------------------
    # ● ステート特攻
    #--------------------------------------------------------------------------
    def pinchi_boost
      data_ex.fetch(:pinchi_boost, 0)
    end

    def weapon_equip_size_boost(size)
      data_ex.fetch(:weapon_equip_size_boost, {}).fetch(size, 1.0)
    end

    def ignore_no_effect
      data_ex.key?(:ignore_no_effect)
    end

    def gain_exp
      data_ex.fetch(:gain_exp, [0, 0, 0])
    end

    def no_display_action_result?
      data_ex.key?(:no_display_action_result?)
    end

    def hit_boost?
      exp_target? && (1..3).include?(exp_target[0][0])
    end

    def critical_type
      data_ex.fetch(:critical_type, HitType::MAGICAL)
    end
  end
end

module RPG
  class Weapon
    def weapon?
      true
    end

    def sort_type
      2
    end

    #--------------------------------------------------------------------------
    # ● 性能評価
    #--------------------------------------------------------------------------
    def performance
      params.inject(0) { |r, v| r += v }
    end

    def create_socket_item
      SocketWeapon.new(self)
    end

    def need_enchant?
      NWConst::Enchantment::WEAPON_ID.include?(id)
    end

    def enchant_item
      RPG::EnchantWeapon.new(self)
    end

    def _change_features
      hit_features, other_features = super.partition do |feature|
        feature.code == FEATURE_XPARAM && feature.data_id == 0
      end
      hit_value = hit_features.empty? ? 0.8 : hit_features.map(&:value).inject(:+)
      hit_feature = RPG::BaseItem::Feature.new(
        FEATURE_XPARAM_EX, 0, hit_value
      )
      [hit_feature] + other_features
    end
  end
end
