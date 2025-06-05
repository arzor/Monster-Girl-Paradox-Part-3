# =もんむす総合ベーススクリプト
#
# 汎用的な機能や、VXAceデータ構造の追加定義の土台、
# 他のスクリプトの機能に依存しない処理などを、集合させています。
#
# ==更新履歴
#   Date     Version Author Comment
# ==17/05/16 2.0.4   トリス 統合V～W V
#
#

#==============================================================================
# ■ NWConst
#==============================================================================
module NWConst
end

#==============================================================================
# ■ NWConst::Sw
#==============================================================================
module NWConst::Sw
end

#==============================================================================
# ■ NWConst::Var
#==============================================================================
module NWConst::Var
end

#==============================================================================
# ■ NWConst::Actor
#==============================================================================
module NWConst::Actor
end

#==============================================================================
# ■ NWConst::Class
#==============================================================================
module NWConst::Class
end

#==============================================================================
# ■ NWConst::Armor
#==============================================================================
module NWConst::Armor
end

#==============================================================================
# ■ NWConst::Item
#==============================================================================
module NWConst::Item
end

#==============================================================================
# ■ NWConst::State
#==============================================================================
module NWConst::State
  INSTANT_DEAD = 230
  INSTA2 = 231
  INSTA3 = 232
end

#==============================================================================
# ■ NWConst::Damage
#==============================================================================
module  NWConst::Damage
  GIVE_UNIT = 100_000
end
#==============================================================================
# ■ NWRegexp
#----------------------------------------------------------------------------
# メモ欄からの拡張設定を読み込むための、
# 正規表現を格納するモジュールです。
#==============================================================================
module NWRegexp
end

#==============================================================================
# ■ NWSex
#==============================================================================
module NWSex
  LUCA   = 0x1
  MALE   = 0x2
  FEMALE = 0x4
  HERO = 0x8
  ALL = (LUCA | MALE | FEMALE | HERO)
end

module NWFeature
  # 基本特徴コード
  FEATURE_ELEMENT_RATE  = Game_BattlerBase::FEATURE_ELEMENT_RATE
  FEATURE_DEBUFF_RATE   = Game_BattlerBase::FEATURE_DEBUFF_RATE
  FEATURE_STATE_RATE    = Game_BattlerBase::FEATURE_STATE_RATE
  FEATURE_STATE_RESIST  = Game_BattlerBase::FEATURE_STATE_RESIST
  FEATURE_PARAM         = Game_BattlerBase::FEATURE_PARAM
  FEATURE_XPARAM        = Game_BattlerBase::FEATURE_XPARAM
  FEATURE_SPARAM        = Game_BattlerBase::FEATURE_SPARAM
  FEATURE_ATK_ELEMENT   = Game_BattlerBase::FEATURE_ATK_ELEMENT
  FEATURE_ATK_STATE     = Game_BattlerBase::FEATURE_ATK_STATE
  FEATURE_ATK_SPEED     = Game_BattlerBase::FEATURE_ATK_SPEED
  FEATURE_ATK_TIMES     = Game_BattlerBase::FEATURE_ATK_TIMES
  FEATURE_STYPE_ADD     = Game_BattlerBase::FEATURE_STYPE_ADD
  FEATURE_STYPE_SEAL    = Game_BattlerBase::FEATURE_STYPE_SEAL
  FEATURE_EQUIP_WTYPE   = Game_BattlerBase::FEATURE_EQUIP_WTYPE
  FEATURE_EQUIP_ATYPE   = Game_BattlerBase::FEATURE_EQUIP_ATYPE
  FEATURE_EQUIP_FIX     = Game_BattlerBase::FEATURE_EQUIP_FIX
  FEATURE_EQUIP_SEAL    = Game_BattlerBase::FEATURE_EQUIP_SEAL
  FEATURE_SLOT_TYPE     = Game_BattlerBase::FEATURE_SLOT_TYPE
  FEATURE_ACTION_PLUS   = Game_BattlerBase::FEATURE_ACTION_PLUS
  FEATURE_SPECIAL_FLAG  = Game_BattlerBase::FEATURE_SPECIAL_FLAG
  FEATURE_COLLAPSE_TYPE = Game_BattlerBase::FEATURE_COLLAPSE_TYPE
  FEATURE_PARTY_ABILITY = Game_BattlerBase::FEATURE_PARTY_ABILITY

  # 特殊フラグ
  module Flag
    AUTO_BATTLE     = Game_BattlerBase::FLAG_ID_AUTO_BATTLE
    GUARD           = Game_BattlerBase::FLAG_ID_GUARD
    SUBSTITUTE      = Game_BattlerBase::FLAG_ID_SUBSTITUTE
    PRESERVE_TP     = Game_BattlerBase::FLAG_ID_PRESERVE_TP
  end
  # パーティ能力
  module Party
    ENCOUNTER_HALF    = Game_Party::ABILITY_ENCOUNTER_HALF
    ENCOUNTER_NONE    = Game_Party::ABILITY_ENCOUNTER_NONE
    CANCEL_SURPRISE   = Game_Party::ABILITY_CANCEL_SURPRISE
    RAISE_PREEMPTIVE  = Game_Party::ABILITY_RAISE_PREEMPTIVE
    GOLD_DOUBLE       = Game_Party::ABILITY_GOLD_DOUBLE
    DROP_ITEM_DOUBLE  = Game_Party::ABILITY_DROP_ITEM_DOUBLE
  end
  # 拡張追加能力値
  FEATURE_XPARAM_EX = 66
  # 拡張パーティ能力
  FEATURE_PARTY_EX_ABILITY = 67
  module PartyEx
    GET_GOLD_RATE   = 0
    GET_ITEM_RATE   = 1
    ENCOUNTER_RATE  = 2
    COLLECT_RATE    = 3
    SLOT_CHANCE     = 4
    UNLOCK_LEVEL    = 5
    GET_GOLD_RATE_STATE = 10
    GET_ITEM_RATE_STATE = 11
    COLLECT_RATE_STATE = 13
  end
  # 拡張バトラー能力
  FEATURE_BATTLER_ABILITY = 68
  module Battler
    STEAL_SUCCESS           = 0
    AUTO_STAND              = 1
    HEEL_REVERSE            = 2
    AUTO_STATE              = 3
    TRIGGER_STATE           = 4
    METAL_BODY              = 5
    DEFENSE_WALL            = 6
    INVALIDATE_WALL         = 7
    DAMAGE_MP_CONVERT       = 8
    DAMAGE_GOLD_CONVERT     = 9
    DAMAGE_MP_DRAIN         = 10
    DAMAGE_GOLD_DRAIN       = 11
    DEAD_SKILL              = 12
    BATTLE_START_SKILL      = 13
    TURN_START_SKILL        = 14
    TURN_END_SKILL          = 15
    CHANGE_ACTION           = 16
    STYPE_COST_RATE         = 17
    SKILL_COST_RATE         = 18
    TP_COST_RATE            = 19
    HP_COST_RATE            = 20
    GOLD_COST_RATE          = 21
    INCREASE_TP             = 22
    START_TP_RATE           = 23
    BATTLE_END_HEEL_HP      = 24
    BATTLE_END_HEEL_MP      = 25
    NORMAL_ATTACK           = 26
    COUNTER_SKILL           = 27
    FINAL_INVOKE            = 28
    CERTAIN_COUNTER         = 29
    MAGICAL_COUNTER         = 30
    PHYSICAL_COUNTER_EX     = 31
    MAGICAL_COUNTER_EX      = 32
    CERTAIN_COUNTER_EX      = 33
    CONSIDERATE             = 34
    GET_EXP_RATE            = 35
    GET_CLASSEXP_RATE       = 36
    INVOKE_REPEATS_TYPE     = 37
    INVOKE_REPEATS_SKILL    = 38
    OWN_CRUSH_RESIST        = 39
    IGNORE_OVER_DRIVE       = 40
    INSTANT_DEAD_REVERSE    = 41
    CHANGE_SKILL            = 42
    ITEM_COST_SCRIMP        = 43
    NEED_ITEM_IGNORE        = 44
    PHYSICAL_REFLECTION     = 45
    SLOT_CANNOT_DUAL_WIELD  = 46
    # 追加
    HP_REGEN_INVALID        = 48
    CANT_MOVE               = 49
    BATTLE_START_HP         = 50
    CERTAIN_DAMAGE_RATE     = 54
    ELEMENT_REFLECTION      = 55
    SELF_STATE_ETERNAL      = 56
    TARGET_STATE_ETERNAL    = 57
    EQUIP_ABILITY_BOOST     = 58
    ITEM_COST_SCRIMP_TYPE   = 59
    NORMAL_ATTACK_FORCE_ELEMENT = 60
    CERTAIN_REFLECTION = 61
    GET_EXP_RATE_STATE = 62
    GET_CLASSEXP_RATE_STATE = 63
    MAGICAL_COUNTER_SKILL = 64
    CERTAIN_COUNTER_SKILL = 65
    COUNTER_EX_SKILL = 66
    MAGICAL_COUNTER_EX_SKILL = 67
    CERTAIN_COUNTER_EX_SKILL = 68
    EVASION_SKILL = 69
    AUTO_STATE_WITH_SWITCH = 70
  end
  # マルチブースター
  FEATURE_MULTI_BOOSTER = 69
  module HitType
    CERTAIN = 0
    PHYSICAL = 1
    MAGICAL = 2
  end
  module Booster
    ELEMENT                 = 0
    WEAPON_PHYSICAL         = 1
    WEAPON_MAGICAL          = 2
    WEAPON_CERTAIN          = 3
    NORMAL_ATTACK           = 4
    STATE_RATIO_TYPE        = 5
    STATE_FIX_TYPE          = 6
    SKILL_TYPE              = 7
    STATE_RATIO_SKILL       = 8
    SKILL                   = 9
    WTYPE_SKILL             = 10
    COUNTER                 = 11
    FALL_HP                 = 12
    OVER_SOUL               = 13
    # 追加
    REFLECTION              = 14
    CRITICAL                = 15
    ACTOR_PARAM             = 16
    ACTOR_EXIST_PARAM       = 17
    CLASS                   = 18
    EQUIP_ABILITY           = 19
    SELF_STATE              = 20
    TARGET_STATE            = 21
    STATE_SKILL             = 22
    STATE_SKILL_TYPE        = 23
    STATE_NORMAL_ATACK      = 24
    PINCHI_SKILL            = 25
    PINCHI_SKILL_TYPE       = 26
    BATTLE_COUNT = 27
    ACTOR_DEFEAT = 28
    ACTOR_CARRY = 29
    ACTOR_DOWN = 30
    ACTOR_ORGASM = 31
    ACTOR_STEAL = 32
    ACTOR_LOVE = 33
    ENEMY_MULTI = 34
    ENEMY_SIGNLE = 35
    ITEM_DAMAGE = 36
  end
  # 解説追加
  FEATURE_DUMMY_ENCHANT     = 70
  # 地形強化
  FEATURE_TERRAIN_BOOSTER   = 71
  # 装備マスタリー
  FEATURE_EQUIP_MASTERY     = 72
  # 追加
  FEATURE_SKILL_STATE_ADD   = 73
  FEATURE_SKILL_TYPE_STATE_ADD = 74
  FEATURE_SUCCUBUS = 75
  FEATURE_ALL_ADD_ELEMENT = 76
  FEATURE_PENETRATION_ELEMENT = 77
  FEATURE_EX_CATEGORY_ATTACK = 78
  FEATURE_EX_CATEGORY_DEFENCE = 79
  FEATURE_STYPE_ADD_PARAM = 80
  FEATURE_SKILL_COMBO = 81
  FEATURE_SKILL_TYPE_COMBO = 82
  FEATURE_ADD_ELEMENT = 83
  FEATURE_EX_CATEGORY_ATTACK_BONUS = 84
  FEATURE_SKILL_PLUS_ATTACK = 85
  FEATURE_SKILL_TYPE_PLUS_ATTACK = 86
  FEATURE_STATE_RATE_FIX = 87
  FEATURE_ELEMENT_RATE_FIX = 88
  FEATURE_AUTO_SKILL_INVALID = 89
  FEATURE_SKILL_PLUS_ATTACK_ONE = 90
  FEATURE_SKILL_TYPE_PLUS_ATTACK_ONE = 91
  FEATURE_SKILL_PLUS_ATTACK_ONE_RANDOM = 92
  FEATURE_SKILL_TYPE_PLUS_ATTACK_ONE_RANDOM = 93
  FEATURE_SKILL_SCOPE_ALL = 94
  FEATURE_SKILL_TYPE_SCOPE_ALL = 95
  FEATURE_SKILL_SCOPE_ONE = 96
  FEATURE_SKILL_TYPE_SCOPE_ONE = 97
  FEATURE_ENEMY_MULTI_SKILL_BOOST = 98
  FEATURE_ENEMY_MULTI_SKILL_TYPE_BOOST = 99
  FEATURE_ENEMY_SINGLE_SKILL_BOOST = 100
  FEATURE_ENEMY_SINGLE_SKILL_TYPE_BOOST = 101
  FEATURE_WEAPON_TYPE_ATTACK_BOOST = 102
  FEATURE_ARMOR_TYPE_DEFENCE_BOOST = 103
  FEATURE_STATE_EFFECT_BOOST = 104
  FEATURE_STATE_DAMAGE_BOOST = 105
  FEATURE_WIELD_BOOST = 106
  FEATURE_BATTLE_START_STATE = 107
  FEATURE_MULTI_ELEMENT = 108
  FEATURE_PARAM_NEUTRALIZE = 109
  FEATURE_COST_ZERO = 110
  FEATURE_SKILL_COST_ZERO = 111
  FEATURE_SKILL_TYPE_COST_ZERO = 112
  FEATURE_PARAM_STATE = 113
  FEATURE_SAME_ELEMENT_DAMAGE_BOOST = 114
  FEATURE_STATE_BOOST_PLUS = 115
  FEATURE_LEARNING = 116
  FEATURE_EX_CATEGORY = 117
  FEATURE_FAST_MOVE_ALL = 118
  FEATURE_SLOW_MOVE_ALL = 119
  FEATURE_SKILL_TYPE_DEFENCE_PENETRATION = 120
  FEATURE_DUAL_SHIELD_ADD_ABILITY = 121
  FEATURE_STATE_CHAIN = 122
  FEATURE_FULL_HP_BOOST = 123
  FEATURE_FULL_HP_SKILL_BOOST = 124
  FEATURE_FULL_HP_SKILL_TYPE_BOOST = 125
  FEATURE_MAX_AP_RATE = 126
  FEATURE_SKILL_CHAIN = 127
  FEATURE_SKILL_CHAIN_BOOST = 128
  FEATURE_SKILL_CHAIN_COST_RATE = 129
  FEATURE_ITEM_COST_RATE = 130
  FEATURE_ITEM_GET_RATE = 131

  FEATURE_SKILL_COUNTER_EX = 132
  FEATURE_SKILL_TIMING_BOOST = 133
  FEATURE_SKILL_TIMING_REPEAT = 134
  module SkillTiming
    FAST = 0
    LATE = 1
  end
  FEATURE_TURN_END_REVIVE = 135
  FEATURE_FULL_SP_BOOST = 136
  FEATURE_FULL_MP_BOOST = 137
  FEATURE_UNDEAD = 138
  FEATURE_SKILL_UNSTOPPABLE = 140
  FEATURE_SKILL_TYPE_UNSTOPPABLE = 141
  FEATURE_ELEMENT_DRAIN = 142
  FEATURE_MAGICAL_CRITICAL = 143
  FEATURE_FULL_SP_STYPE_BOOST = 144
  FEATURE_FULL_MP_STYPE_BOOST = 145
  FEATURE_ADD_STEAL_STYPE = 146
  FEATURE_ADD_RESTORATION = 147
  FEATURE_ADD_RESTORATION_STYPE_HP = 148
  FEATURE_ADD_RESTORATION_STYPE_MP = 149
  FEATURE_ADD_SPEED = 150
  FEATURE_ADD_SPEED_PARAM_RATE = 151
  FEATURE_ADD_DUMMY_ENCHANT = 152
  FEATURE_AUTO_REVIVE = 153
  module AutoRevive
    COUNT = 0
    RATE = 1
  end
  FEATURE_BLOCK_RATE = 154
  FEATURE_ID_ITEM_BOOST = 155
  FEATURE_STYPE_ITEM_COST_RATE = 156
  FEATURE_STYPE_ITEM_GET_RATE = 157
  FEATURE_ONCE_TURN_END_STATE = 158
  FEATURE_DAMAGE_BOOST = 159
  FEATURE_SINGLE_SKILL_BOOST = 160
  FEATURE_STYPE_COUNTER_EX = 161
  FEATURE_FAST_MOVE_SID = 162
  FEATURE_FAST_MOVE_STYPE = 163
  FEATURE_SLOW_MOVE_SID = 164
  FEATURE_SLOW_MOVE_STYPE = 165
  FEATURE_ADD_STEAL_SID = 166
  FEATURE_ADD_ELEMENT_STYPE = 167
  FEATURE_ADD_ELEMENT_SID = 168
  FEATURE_HIT_DAMAGE_BOOST = 169
  FEATURE_TURN_HIT_DAMAGE_RATE = 170
  FEATURE_MAX_AP_BONUS = 171
  FEATURE_EX_CATEGORY_STYPE = 172
  FEATURE_REDUCE_BOOST_DAMAGE = 173
  FEATURE_ALTERNATE_TP_TO_MP = 174
  FEATURE_XPARAM_FIX = 175
  FEATURE_PARTY_PARAM_BOOST = 176
  FEATURE_VARIABLE_HP_DAMAGE = 177
  FEATURE_AUTO_SKILL_PRIORITY_INVALID = 178
  FEATURE_AUTO_SKILL_CONDITION_INVALID = 179
  FEATURE_ACTION_MINUS = 180
end

#==============================================================================
# ■ NWUsableEffect (新規)
#----------------------------------------------------------------------------
# メモ欄追加スキル効果機能で扱う使用効果コード値を格納するモジュールです
# コードの重複を防ぐ為、プロジェクト中で扱うコード値は全てここで定義します
#==============================================================================
module NWUsableEffect
  EFFECT_RECOVER_HP     = Game_Battler::EFFECT_RECOVER_HP
  EFFECT_RECOVER_MP     = Game_Battler::EFFECT_RECOVER_MP
  EFFECT_GAIN_TP        = Game_Battler::EFFECT_GAIN_TP
  EFFECT_ADD_STATE      = Game_Battler::EFFECT_ADD_STATE
  EFFECT_REMOVE_STATE   = Game_Battler::EFFECT_REMOVE_STATE
  EFFECT_ADD_BUFF       = Game_Battler::EFFECT_ADD_BUFF
  EFFECT_ADD_DEBUFF     = Game_Battler::EFFECT_ADD_DEBUFF
  EFFECT_REMOVE_BUFF    = Game_Battler::EFFECT_REMOVE_BUFF
  EFFECT_REMOVE_DEBUFF  = Game_Battler::EFFECT_REMOVE_DEBUFF
  EFFECT_SPECIAL        = Game_Battler::EFFECT_SPECIAL
  EFFECT_GROW           = Game_Battler::EFFECT_GROW
  EFFECT_LEARN_SKILL    = Game_Battler::EFFECT_LEARN_SKILL
  EFFECT_COMMON_EVENT   = Game_Battler::EFFECT_COMMON_EVENT
  SPECIAL_EFFECT_ESCAPE = Game_Battler::SPECIAL_EFFECT_ESCAPE

  EFFECT_STEAL            = 45 # 盗み
  EFFECT_GET_ITEM         = 46 # アイテム獲得
  EFFECT_DEFENSE_WALL     = 47 # 防御壁追加
  EFFECT_OVER_DRIVE       = 48 # 時間停止
  EFFECT_GAIN_EXP         = 49 # 経験値上昇
  EFFECT_DEATH_ELEMENT    = 50 # 属性即死の効果
  EFFECT_DEATH_STATE      = 51 # ステート限定付与の効果
  EFFECT_PREDATION        = 52 # 捕食の効果
  EFFECT_SELF_ENCHANT     = 53 # 自己ステート付与の効果
  EFFECT_RESTORATION      = 54 # ダメージ還元の効果
  EFFECT_BINDING_START    = 55 # 拘束開始技
  EFFECT_BIND_RESIST      = 56 # もがく
  EFFECT_SELF_ENCHANT_REGEN = 57 # 自己ステート解除の効果
  EFFECT_FRIENDS_ENCHANT = 58 # 味方ステート付与の効果
  EFFECT_OPPONENTS_ENCHANT = 59 # 敵ステート付与の効果
  EFFECT_FORCE_STEAL = 60
  EFFECT_ACCUMULATE_GET_RATE_UP = 61
  EFFECT_ACCUMULATE_GET_RATE_RESET = 62
end

#==============================================================================
# ■ NWFileTest
#----------------------------------------------------------------------------
# 暗号化アーカイブ内のファイルの存在判定を行うためのモジュールです
#==============================================================================
module NWFileTest
  #--------------------------------------------------------------------------
  # ● 画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    暗号化アーカイブへのアクセスは、FileTestモジュールでは不可能なため、
  #    Bitmap.newで実際にアクセスし、例外を捕捉することで存在判定を行う。
  #    キャッシュが存在するなら、ファイルも存在するものとして、
  #    判定自体を行わずにtrueを返す。
  #--------------------------------------------------------------------------
  def image_exist?(path, filename)
    return true if Cache.include?(path + filename)

    begin
      test = Bitmap.new(path + filename)
    rescue Errno::ENOENT
      print "File does not exist - \"#{path + filename}\"\n" if $TEST
      return false
    ensure
      test.dispose if !test.nil? && !test.disposed?
    end
    true
  end

  #--------------------------------------------------------------------------
  # ● アニメーション画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def animation_exist?(filename)
    image_exist?("Graphics/Animations/", filename)
  end

  #--------------------------------------------------------------------------
  # ● 戦闘背景1画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def battleback1_exist?(filename)
    image_exist?("Graphics/Battlebacks1/", filename)
  end

  #--------------------------------------------------------------------------
  # ● 戦闘背景2画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def battleback2_exist?(filename)
    image_exist?("Graphics/Battlebacks2/", filename)
  end

  #--------------------------------------------------------------------------
  # ● バトラー画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def battler_exist?(filename)
    image_exist?("Graphics/Battlers/", filename)
  end

  #--------------------------------------------------------------------------
  # ● キャラクター画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def character_exist?(filename)
    image_exist?("Graphics/Characters/", filename)
  end

  #--------------------------------------------------------------------------
  # ● フェイス画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def face_exist?(filename)
    image_exist?("Graphics/Faces/", filename)
  end

  #--------------------------------------------------------------------------
  # ● 遠景画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def parallax_exist?(filename)
    image_exist?("Graphics/Parallaxes/", filename)
  end

  #--------------------------------------------------------------------------
  # ● ピクチャー画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def picture_exist?(filename)
    image_exist?("Graphics/Pictures/", filename)
  end

  #--------------------------------------------------------------------------
  # ● システム画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def system_exist?(filename)
    image_exist?("Graphics/System/", filename)
  end

  #--------------------------------------------------------------------------
  # ● タイルセット画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def tileset_exist?(filename)
    image_exist?("Graphics/Tilesets/", filename)
  end

  #--------------------------------------------------------------------------
  # ● タイトル1画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def title1_exist?(filename)
    image_exist?("Graphics/Titles1/", filename)
  end

  #--------------------------------------------------------------------------
  # ● タイトル2画像の存在判定 (新規)
  #------------------------------------------------------------------------
  #    内部でimage.exist?を呼び出しています
  #--------------------------------------------------------------------------
  def title2_exist?(filename)
    image_exist?("Graphics/Titles2/", filename)
  end

  #--------------------------------------------------------------------------
  # ● データファイルの存在判定 (新規)
  #------------------------------------------------------------------------
  #    暗号化アーカイブへのアクセスは、FileTestモジュールでは不可能なため、
  #    load_dataで実際にアクセスし、例外を捕捉することで存在判定を行う。
  #--------------------------------------------------------------------------
  def file_exist?(filename, print_flag = true)
    begin
      test = load_data(filename)
    rescue Errno::ENOENT
      print "File does not exist - \"#{filename}\"\n" if $TEST && print_flag
      return false
    end
    true
  end
  module_function :image_exist?, :file_exist?
  module_function :animation_exist?, :battleback1_exist?, :battleback2_exist?
  module_function :battler_exist?, :character_exist?, :face_exist?
  module_function :parallax_exist?, :picture_exist?, :system_exist?
  module_function :tileset_exist?, :title1_exist?, :title2_exist?
end

#==============================================================================
# ■ Game_Troop
#==============================================================================
class Game_Troop < Game_Unit
  #--------------------------------------------------------------------------
  # ● セットアップ
  #--------------------------------------------------------------------------
  alias nw_base_setup setup
  def setup(troop_id)
    nw_base_setup(troop_id)
    auto_correct_bitmap_xy
  end

  #--------------------------------------------------------------------------
  # ● 大きい画像の座標補正
  #--------------------------------------------------------------------------
  def auto_correct_bitmap_xy
    @enemies.each do |enemy|
      # 座標補正
      bmp = Cache.battler(enemy.battler_name, enemy.battler_hue)
      unless troop.name =~ /<画像非固定>/
        enemy.screen_x = Graphics.width / 2 if bmp.width >= 640
      end
      enemy.screen_y = bmp.height if bmp.height >= 360
      bmp.dispose unless bmp.disposed?
    end
  end
end

#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ● 現在のメンバーで指定のスキルIDのスキルを持つキャラがいるか？
  #--------------------------------------------------------------------------
  def members_skill_have?(skill_id)
    $game_party.in_battle ? battle_members_skill_have?(skill_id) : all_members_skill_have?(skill_id)
  end

  #--------------------------------------------------------------------------
  # ● 現在の全メンバーで指定のスキルIDのスキルを持つキャラがいるか？
  #--------------------------------------------------------------------------
  def all_members_skill_have?(skill_id)
    skill = $data_skills[skill_id]
    return false if skill.nil?

    $game_party.all_members.any? { |actor| actor.skill_learn?(skill) }
  end

  #--------------------------------------------------------------------------
  # ● 現在の戦闘メンバーで指定のスキルIDのスキルを持つキャラがいるか？
  #--------------------------------------------------------------------------
  def battle_members_skill_have?(skill_id)
    skill = $data_skills[skill_id]
    return false if skill.nil?

    $game_party.battle_members.any? { |actor| actor.skill_learn?(skill) }
  end

  #--------------------------------------------------------------------------
  # ● 現在の全メンバーで指定の防具IDの防具を持つキャラがいるか？
  #--------------------------------------------------------------------------
  def all_members_armor_have?(armor_id)
    $game_party.all_members.any? { |actor| actor.armors.any? { |armor| armor_id == armor.id } }
  end

  #--------------------------------------------------------------------------
  # ● 現在地のMAPIDの取得
  #--------------------------------------------------------------------------
  def now_map_id
    $game_map.map_id
  end

  #--------------------------------------------------------------------------
  # ● 現在地のMAP名の取得
  #--------------------------------------------------------------------------
  def now_map_name
    $game_map.display_name
  end

  #--------------------------------------------------------------------------
  # ● 現在地のX座標の取得
  #--------------------------------------------------------------------------
  def now_x
    $game_player.x
  end

  #--------------------------------------------------------------------------
  # ● 現在地のY座標の取得
  #--------------------------------------------------------------------------
  def now_y
    $game_player.y
  end

  #--------------------------------------------------------------------------
  # ● 現在地の向きの取得
  #--------------------------------------------------------------------------
  def now_dir
    $game_player.direction
  end

  #--------------------------------------------------------------------------
  # ● 指定されたゲーム変数を取得
  #--------------------------------------------------------------------------
  def v(num)
    $game_variables[num]
  end

  #--------------------------------------------------------------------------
  # ● 指定されたゲームスイッチを取得
  #--------------------------------------------------------------------------
  def sw(num)
    $game_switches[num]
  end
end
