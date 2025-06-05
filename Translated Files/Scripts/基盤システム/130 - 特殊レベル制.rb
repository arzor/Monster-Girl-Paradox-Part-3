=begin
=基盤システム/特殊レベル制

全てのアクターは個人レベル、職業レベル、種族レベルを保持


==更新履歴
  Date     Version Author Comment
==17/05/16 2.0.4   トリス 統合V～W V W

=end

#==============================================================================
# ■ Game_Actor
#==============================================================================
class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  # ● 定数
  #--------------------------------------------------------------------------
  BASE_CLASS_ID = 0 # 経験値ハッシュ用ダミーID
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_reader   :level_list
  attr_reader   :tribe_id
  #--------------------------------------------------------------------------
  # ○ セットアップ
  #--------------------------------------------------------------------------
  def setup(actor_id)
    @actor_id = actor_id
    init_name
    init_nickname
    init_graphics
    @class_id = actor.class_id
    @tribe_id = actor.initial_tribe_id
    @level_list = {}
    @exp = {}
		@equips = []
    init_level
    init_exp
    init_skills
		init_equips(actor.equips)

    clear_param_plus
    recover_all
  end
  #--------------------------------------------------------------------------
  # ● 能力値用ベースオブジェクト取得
  #--------------------------------------------------------------------------
  def base
    $data_classes[NWConst::Class::BASE_PARAM_BASE + @actor_id]
  end
  #--------------------------------------------------------------------------
  # ● 経験値計算用オブジェクト取得
  #--------------------------------------------------------------------------
  def exp_curve
    $data_classes[actor.use_exp_curve]
  end  
  #--------------------------------------------------------------------------
  # ● 種族オブジェクト取得
  #--------------------------------------------------------------------------
  def tribe
    $data_classes[@tribe_id]
  end
  #--------------------------------------------------------------------------
  # ● ベースレベルの取得
  #--------------------------------------------------------------------------
  def base_level
    @level[:base]
  end

  #--------------------------------------------------------------------------
  # ● 職業レベルの取得
  #--------------------------------------------------------------------------
  def class_level
    @level[:class]
  end
  #--------------------------------------------------------------------------
  # ● 種族レベルの取得
  #--------------------------------------------------------------------------
  def tribe_level
    @level[:tribe]
  end
  #--------------------------------------------------------------------------
  # ● 指定レベルに上がるのに必要な累計経験値の取得
  #--------------------------------------------------------------------------
  def exp_for_level(level, kind)
    case kind
    when :base; self.exp_curve.exp_for_level(level)
    when :class; self.class.exp_for_level(level)
    when :tribe; self.tribe.exp_for_level(level)
    end
  end
  #--------------------------------------------------------------------------
  # ● 経験済職業初期設定
  #--------------------------------------------------------------------------
  def init_level
    actor.init_class_level.each{|obj| @level_list[obj[:id]] = obj[:lv]}
    @level_list[@class_id] = 1 unless @level_list.key?(@class_id)
    @level_list[@tribe_id] = 1 unless @level_list.key?(@tribe_id)
    @level = {:base => actor.initial_level, :class => @level_list[@class_id], :tribe => @level_list[@tribe_id]}
  end
  #--------------------------------------------------------------------------
  # ○ 経験値の初期化
  #--------------------------------------------------------------------------
  def init_exp
    self.base_exp = exp_for_level(@level[:base], :base)
    @level_list.each{|id, level| @exp[id] = $data_classes[id].exp_for_level(level)}
  end
  #--------------------------------------------------------------------------
  # ● ベース経験値を取得
  #--------------------------------------------------------------------------
  def base_exp
    @exp[BASE_CLASS_ID]
  end
  #--------------------------------------------------------------------------
  # ● ベース経験値を設定
  #--------------------------------------------------------------------------
  def base_exp=(exp)
    @exp[BASE_CLASS_ID] = exp
  end
  #--------------------------------------------------------------------------
  # ● 職業経験値を取得
  #--------------------------------------------------------------------------
  def class_exp
    @exp[@class_id]
  end
  #--------------------------------------------------------------------------
  # ● 職業経験値を設定
  #--------------------------------------------------------------------------
  def class_exp=(exp)
    @exp[@class_id] = exp
  end
  #--------------------------------------------------------------------------
  # ● 種族経験値を取得
  #--------------------------------------------------------------------------
  def tribe_exp
    @exp[@tribe_id]
  end
  #--------------------------------------------------------------------------
  # ● 種族経験値を設定
  #--------------------------------------------------------------------------
  def tribe_exp=(exp)
    @exp[@tribe_id] = exp
  end
  #--------------------------------------------------------------------------
  # ● 種族「人間」？
  #--------------------------------------------------------------------------
  def human?
    return NWConst::Class::HUMANS.include?(@tribe_id)
  end
  #--------------------------------------------------------------------------
  # ● 人間時特徴の取得
  #--------------------------------------------------------------------------
  def human_add_features
    return human? ? actor.human_add_features : []
  end  
  #--------------------------------------------------------------------------
  # ○ 現在のレベルの最低経験値を取得
  #--------------------------------------------------------------------------
  def current_level_exp(kind)
    exp_for_level(@level[kind], kind)
  end
  #--------------------------------------------------------------------------
  # ○ 次のレベルの経験値を取得
  #--------------------------------------------------------------------------
  def next_level_exp(kind)
    exp_for_level(@level[kind] + 1, kind)
  end
  #--------------------------------------------------------------------------
  # ○ 最大レベル
  #--------------------------------------------------------------------------
  def max_level(kind)
    case kind
    when :class
      self.class.max_lv
    when :tribe
      tribe.max_lv
    else
      NWConst::Actor::MAX_BASE_LEVEL
    end
  end
  #--------------------------------------------------------------------------
  # ○ 最大レベル判定
  #--------------------------------------------------------------------------
  def max_level?(kind)
    @level[kind] >= max_level(kind)
  end
  #--------------------------------------------------------------------------
  # ○ 通常能力値の基本値取得
  #--------------------------------------------------------------------------
  def param_base(param_id)
    self.base.params[param_id, base_level]
  end
  #--------------------------------------------------------------------------
  # ○ スキルの初期化
  #--------------------------------------------------------------------------
  def init_skills
    @skills = []
    self.original_persona_data_actor.peculiar_skill.each{ |obj|
      learn_skill(obj[:id]) if obj[:lv] <= base_level
    }
    @level_list.each{|id, level|                        
      $data_classes[id].learnings.each{|learning|
        learn_skill(learning.skill_id) if learning.level <= level
      }
    }
    self.actor.init_abilities.each{ |id|
      skill = $data_skills[id]
      next unless skill
      stype_id = skill.stype_id
      next unless NWConst::Ability::ABILITY_SKILL_TYPE.include?(stype_id)
      next unless abilities[stype_id].include?(id)
      next if skill_learn?(skill)
      next unless skill.memorize_cost <= max_ap(stype_id) - ap(stype_id)
      @equip_abilities[stype_id].push(id)  
    }
    @skill_types_disabled = $data_system.skill_types.collect{|stype| false}    
  end
  #--------------------------------------------------------------------------
  # ○ 特徴を保持する全オブジェクトの配列取得
  #--------------------------------------------------------------------------
  def feature_objects
    super + [self.actor] + [self.class] + [self.tribe] + equips.compact + human_add_features
  end
  #--------------------------------------------------------------------------
  # ○ 経験値の変更
  #     show : レベルアップ表示フラグ
  #--------------------------------------------------------------------------
  def change_exp(exp, show, kind)
    case kind
    when :base;  key = BASE_CLASS_ID
    when :class; key = @class_id
    when :tribe; key = @tribe_id
    end

    @exp[key] = [[exp, 0].max, exp_for_level(max_level(kind), kind)].min
    last_level = @level[kind]
    last_skills = skills
    level_up(kind) while !max_level?(kind) && @exp[key] >= next_level_exp(kind)
    level_down(kind) while @exp[key] < current_level_exp(kind)
    if show && @level[kind] > last_level
      display_level_up(skills - last_skills, kind) 
    end
    refresh
  end

  #--------------------------------------------------------------------------
  # ● 現在職業・種族レベルを記録する
  #--------------------------------------------------------------------------
  def record_level
    @level_list[@class_id] = class_level
    @level_list[@tribe_id] = tribe_level    
  end
  #--------------------------------------------------------------------------
  # ○ レベルアップ
  #--------------------------------------------------------------------------
  def level_up(kind)
    @level[kind] += 1
    record_level
    case kind
    when :base
      original_persona_data_actor.peculiar_skill.each{ |obj|
        learn_skill(obj[:id]) if obj[:lv] <= base_level
      }
    when :class
      self.class.learnings.each { |learning|
        learn_skill(learning.skill_id) if learning.level == class_level
      }
    when :tribe
      self.tribe.learnings.each { |learning|
        learn_skill(learning.skill_id) if learning.level == tribe_level
      }
    end
  end
  #--------------------------------------------------------------------------
  # ○ レベルダウン
  #--------------------------------------------------------------------------
  def level_down(kind)
    @level[kind] -= 1
    record_level
  end  
  #--------------------------------------------------------------------------
  # ○ レベルアップメッセージの表示
  #     new_skills : 新しく習得したスキルの配列
  #--------------------------------------------------------------------------
  def display_level_up(new_skills, kind)
    $game_message.new_page
    case kind
    when :base;  prefix = Vocab::level
    when :class; prefix = Vocab::ClassLevel
    when :tribe; prefix = Vocab::TribeLevel        
    end
    if SceneManager.scene_is?(Scene_JobChange)
      r = kind == :class ? self.class : tribe
      prefix = "#{r.name}#{Vocab::level}"
    end
    level_text = max_level?(kind) ? "\eC[16]#{@level[kind]}\eCC" : @level[kind]
    $game_message.add(sprintf(Vocab::LevelUp, @name, prefix, level_text))
    new_skills.each { |skill|
      # ひきも記の「メッセージ制御文字拡張」競合対策
      $game_message.add(sprintf(Vocab::ObtainSkill, skill.window_name))
    }
  end
  #--------------------------------------------------------------------------
  # ○ 経験値の獲得（経験獲得率を考慮）
  #--------------------------------------------------------------------------
  def gain_exp(exp, cexp)
    change_exp(base_exp + (exp * final_exp_rate).ceil, true, :base)
    change_exp(class_exp + (cexp * final_cexp_rate).ceil, true, :class)
    change_exp(tribe_exp + (cexp * final_cexp_rate).ceil, true, :tribe)
  end
  #--------------------------------------------------------------------------
  # ○ レベルの変更
  #     show : レベルアップ表示フラグ
  #--------------------------------------------------------------------------
  def change_level(level, show, kind)
    level = [[level, max_level(kind)].min, 1].max
    change_exp(exp_for_level(level, kind), show, kind)
  end

  #--------------------------------------------------------------------------
  # ○ 職業の変更
  #     keep_exp : 経験値を引き継ぐ
  #--------------------------------------------------------------------------
  def change_class(class_id, kind, keep_exp = false)
    case kind
    when :base
      return
    when :class
      @exp[class_id] = class_exp if keep_exp
      @class_id = class_id
      change_exp(@exp[@class_id] || 0, false, kind)
    when :tribe
      @exp[class_id] = tribe_exp if keep_exp
      @tribe_id = class_id      
      change_exp(@exp[@tribe_id] || 0, false, kind)
    end
    
    unless @level_list.key?(class_id)
      @exp[class_id] = 0
      @level_list[class_id] = 1
      $data_classes[class_id].learnings.each{|learning|
        learn_skill(learning.skill_id) if learning.level <= 1
      }
    end
    @level[kind] = @level_list[class_id]
    refresh
  end
end

#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ○ レベルの増減
  #--------------------------------------------------------------------------
  def command_316
    value = operate_value(@params[2], @params[3], @params[4])
    iterate_actor_var(@params[0], @params[1]) do |actor|
      actor.change_level(actor.base_level + value, @params[5], :base)
    end
  end  
  #--------------------------------------------------------------------------
  # ○ 職業の変更
  #--------------------------------------------------------------------------
  def command_321
    return unless $game_actors.exist?(@params[0])
    actor = $game_actors[@params[0]]
    kind = NWConst::Class::JOB_RANGE.include?(@params[1]) ? :class : :tribe    
    actor.change_class(@params[1], kind)
  end
end




