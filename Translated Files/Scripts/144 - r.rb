module NWRegexp
  ENCHANT_VALUE = /\\e\[\d+\]|\\e\[\d+-\d+\]/i
  VALUE = /[-+]?\d+|#{ENCHANT_VALUE}/i
  FEATURE_RATE_ARRAY = %w[属性 弱体 ステート]
  FEATURE_XPARAM_EX_ARRAY = %w[命中 回避 会心 会心回避 魔法回避 魔法反射 反撃 HP再生 MP再生 TP再生 必中回避]
  FEATURE_SPARAM_ARRAY = %w[
    狙われ率 防御効果率 回復効果率 薬の知識 MP消費率 TPチャージ率
    物理ダメージ率 魔法ダメージ率 床ダメージ率 経験獲得率
  ]
  PARTY_ABILITY_ARRAY = %w[獲得金額 獲得アイテム エンカウント 仲間加入]
  FEATURE_PARAM_ARRAY = %w[最大HP 最大MP 攻撃力 防御力 魔力 精神力 素早さ 器用さ]
  MULTI_BOOSTER_ARRAY = %w[
    属性強化 武器強化物理 武器強化魔法 武器強化必中 通常攻撃強化
    ステート割合強化タイプ ステート固定強化タイプ スキルタイプ強化
    ステート割合強化スキル スキル強化
  ]
  EX_VALUES = %w[戦闘回数 倒した数 イかせた数 倒された数 イかされた回数 盗んだ回数 好感度]
  INVALID_ARRAY = %w[死亡時スキル 戦闘開始時発動 ターン開始時発動 ターン終了時発動 反撃スキル 最終反撃 回避時スキル]
  COUNTER_ARRAY = %w[魔法 必中] + [""]
  INVALID_ID_ARRAY = [
    NWFeature::Battler::DEAD_SKILL,
    NWFeature::Battler::BATTLE_START_SKILL,
    NWFeature::Battler::TURN_START_SKILL,
    NWFeature::Battler::TURN_END_SKILL,
    NWFeature::Battler::COUNTER_SKILL,
    NWFeature::Battler::FINAL_INVOKE,
    NWFeature::Battler::EVASION_SKILL
  ]
  SEX_ARRAY = [0x0, NWSex::LUCA, NWSex::FEMALE, NWSex::MALE, NWSex::HERO]
  SKILL_TIMING_ARRAY = %w[最速 最遅]

  module BaseItem
    FEATURE_PARAM = /<(#{FEATURE_PARAM_ARRAY.join("|")})\s?(#{VALUE})%>/i
    FEATURE_ELEMENT_RATE = /<(拡張|)属性有効度\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    FEATURE_DEBUFF_RATE = /<(拡張|)弱体有効度\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    FEATURE_STATE_RATE = /<(拡張|)ステート有効度\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    FEATURE_SPARAM = /<(#{FEATURE_SPARAM_ARRAY.join("|")})\s?(#{VALUE})%>/i
    FEATURE_ATK_STATE = /<攻撃時ステート\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    ITEM_COST_SCRIMP_TYPE = /<消費アイテム節約スキルタイプ\s?((?:\d+-#{VALUE}(?:,\s?)?)+)>/i
    ELEMENT_REFLECTION = /<属性反射(?::|：|\s)(((?:\d+)(?:,\s?)?)+)>/i
    REFLECTION_BOOST = /<反射ダメージ増加(?:\s|：|:)?(#{VALUE})%?>/i
    CERTAIN_DAMAGE_RATE = /<必中ダメージ率\s?(#{VALUE}%)>/i
    CRITICAL_BOOST = /<会心ダメージ増加(?::|：)(#{VALUE})>/i
    ACTOR_PARAM_BOOST = /<特定アクター能力アップ\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    ACTOR_EXIST_PARAM_BOOST = /<パーティ特定アクター能力アップ\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    CLASS_BOOST = /<職業アップ\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    STATE_EXTEND = /<(自己|相手)ステート延長\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    STATE_ETERNAL = /<(自己|相手)ステート永続\s?((?:\d+(?:,\s?)?)+)>/i
    HP_REGEN_INVALID = /<HPターン回復無効>/i
    CANT_MOVE = /<行動不能>/
    BATTLE_START_HP = /<開始時HP\s?(#{VALUE}%)>/i
    SKILL_STATE_ADD = /<スキルステート(自己|)付加\s?(((?:\d+-\d+-#{VALUE})(?:,\s?)?)+)>/i
    SKILL_TYPE_STATE_ADD = /<スキルタイプステート(敵|味方|自己)付加\s?(((?:\d+-\d+-#{VALUE})(?:,\s?)?)+)>/i
    EQUIP_ABILITY_BOOST = /<装備品アビリティ強化\s?(\d+)>/i
    FAST_MOVE_TYPE = /<速攻発動スキル(タイプ|)(?::|：|\s)((?:\d+(?:,\s?)?)+)>/i
    SLOW_MOVE_TYPE = /<遅攻発動スキル(タイプ|)(?::|：|\s)((?:\d+(?:,\s?)?)+)>/i
    STATE_SKILL_BOOST = /<ステート特攻スキル\s?((?:\d+-\d+-#{VALUE}(?:,\s?)?)+)>/i
    STATE_SKILL_TYPE_BOOST = /<ステート特攻スキルタイプ\s?((?:\d+-\d+-#{VALUE}(?:,\s?)?)+)>/i
    STATE_NORMAL_ATACK_BOOST = /<ステート特攻通常攻撃\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    STATE_BOOST_PLUS = /<ステート特攻強化 (#{VALUE})>/i
    PINCHI_SKILL_BOOST = /<窮地スキル強化\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    PINCHI_SKILL_TYPE_BOOST = /<窮地スキルタイプ強化\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    FEATURE_XPARAM_EX = /<(?:拡張|)(#{FEATURE_XPARAM_EX_ARRAY.join("|")})(?:率|)\s?(#{VALUE})%>/i
    XPARAM_FIX = /<(?:拡張|)(#{FEATURE_XPARAM_EX_ARRAY.join("|")})(?:率|)固定\s?(#{VALUE})%>/i
    PARTY_ABILITY = /<(#{PARTY_ABILITY_ARRAY.join("|")})倍率\s?(#{VALUE})%>/i
    SLOT_CHANCE = /<スロットチャンス\s?(\d+)>/i
    UNLOCK_LEVEL = /<解錠レベル\s?(\d+)>/i
    # バトラー能力
    STEAL_SUCCESS = /<スティール成功率\s?(#{VALUE})%>/i
    GET_EXP_RATE = /<獲得経験値倍率\s?(#{VALUE})%>/i
    GET_CLASSEXP_RATE = /<獲得職業経験値倍率\s?(#{VALUE})%>/i
    AUTO_STAND = /<踏みとどまり\s?(\d+)%>/i
    HEEL_REVERSE = /<回復反転\s?(\d+)%>/i
    AUTO_STATE = /<オートステート\s?((?:\d+(?:,\s?)?)+)>/i
    AUTO_STATE_WITH_SWITCH = /<オートステート\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    TRIGGER_STATE = /<トリガーステート\s?([HMT])\s?,\s?(\d+)\s?,\s?(\d+)%\s?,\s?(\d+)>/i
    METAL_BODY = /<メタルボディ\s?(#{VALUE})(%|)>/i
    DEFENSE_WALL = /<防御壁展開\s?(\d+)>/i
    INVALIDATE_WALL = /<無効化障壁\s?(#{VALUE}(%|))>/i
    DAMAGE_MP_CONVERT = /<ダメージMP変換\s?(\d+)%>/i
    DAMAGE_GOLD_CONVERT = /<ダメージゴールド変換\s?(#{VALUE})%>/i
    DAMAGE_MP_DRAIN = /<ダメージMP吸収\s?(#{VALUE})%>/i
    DAMAGE_GOLD_DRAIN = /<ダメージゴールド回収\s?(\d+)%>/i
    DEAD_SKILL = /<死亡時スキル\s?(\d+)>/i
    BATTLE_START_SKILL = /<戦闘開始時発動\s?(?:(\d+):\s?)?(\d+)\s?,\s?(\d+)%>/i
    AUTO_SKILL_TURN = /<ターン(開始|終了)時発動\s?(?:(\d+):\s?)?(\d+)\s?,\s?(\d+)%(?:,\s?(\d+),((?:(?:\d+)(?:,\s?)?)+)|)>/i
    CHANGE_ACTION = /<行動変化\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    STYPE_COST_RATE = /<(HP|MP|TP)タイプ消費率\s?(\d+)\s?,\s?(#{VALUE})%>/i
    SKILL_COST_RATE = /<(HP|MP|TP)スキル消費率\s?(\d+)\s?,\s?(#{VALUE})%>/i
    SCOST_RATE_M = /(HP|MP|TP)(タイプ|スキル)消費率\s?((?:\d+-#{VALUE}(?:,\s?)?)+)/
    TP_COST_RATE = /<TP消費率\s?(#{VALUE})%>/i
    HP_COST_RATE = /<HP消費率\s?(#{VALUE})%>/i
    GOLD_COST_RATE = /<ゴールド消費率\s?(#{VALUE})%>/i
    INCREASE_TP = /<最大TP(増加|減少)\s?(#{VALUE})(%)?>/i
    START_TP_RATE = /<開始時TP\s?(#{VALUE})%>/i
    BATTLE_END_HEEL_HP = /<戦闘後HP回復\s?(#{VALUE})%>/i
    BATTLE_END_HEEL_MP = /<戦闘後MP回復\s?(#{VALUE})%>/i
    NORMAL_ATTACK = /<通常攻撃\s?(\d+)>/i
    COUNTER_SKILL = /<(#{COUNTER_ARRAY.join("|")})反撃スキル\s?(\d+)\s?,\s?(#{VALUE})%>/
    COUNTER_EX_SKILL = /<無効化(#{COUNTER_ARRAY.join("|")})反撃スキル\s?(\d+)\s?,\s?(#{VALUE})%>/
    FINAL_INVOKE = /<最終反撃\s?((?:\d+(?:,\s?)?)+)>/i
    MAGICAL_COUNTER = /<(?:拡張|)魔法反撃(?:率|)\s?(#{VALUE}%)>/i
    CERTAIN_COUNTER = /<(?:拡張|)必中反撃(?:率|)\s?(#{VALUE}%)>/i
    CERTAIN_COUNTER_EX = /<無効化必中反撃(?:率|)\s?(#{VALUE}%)>/i
    PHYSICAL_COUNTER_EX = /<無効化反撃(?:率|)\s?(#{VALUE}%)>/i
    MAGICAL_COUNTER_EX = /<無効化魔法反撃(?:率|)\s?(#{VALUE}%)>/i
    CONSIDERATE = /<仲間想い\s?(#{VALUE})%>/i
    INVOKE_REPEATS_TYPE = /<連続発動タイプ\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    INVOKE_REPEATS_SKILL = /<連続発動スキル\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    OWN_CRUSH_RESIST = /<自爆耐性>/i
    ELEMENT_DRAIN = /<属性吸収\s?((?:\d+(?:,\s?)?)+)>/i
    IGNORE_OVER_DRIVE = /<時間停止無視>/i
    INSTANT_DEAD_REVERSE = /<即死反転>/i
    CHANGE_SKILL = /<スキル変化\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    ITEM_COST_SCRIMP = /<消費アイテム節約\s?((?:\d+-#{VALUE}(?:,\s?)?)+)>/i
    NEED_ITEM_IGNORE = /<必要アイテム無視\s?((?:\d+(?:,\s?)?)+)>/i
    # ブースター
    MULTI_BOOSTER = /<(#{MULTI_BOOSTER_ARRAY.join("|")})\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    WTYPE_SKILL_BOOST = /<武器スキル倍率強化\s?((?:\d+-\d+-#{VALUE}(?:,\s?)?)+)>/i
    COUNTER_BOOST = /<反撃強化\s?(#{VALUE})%>/i
    FALL_HP_BOOST = /<HP減少時強化\s?(\d+)\s?,\s?(#{VALUE})%>/i
    OVER_SOUL = /<オーバーソウル\s?(#{VALUE})%>/i
    # 解説追加
    DUMMY_ENCHANT = /<解説追加(?::|：)(\S+)>/i
    TERRAIN_BOOSTER = /<(\S+)地形(超)?強化>/i
    SKILL_CONVERT_PARAM = /<能力値置き換え\s?(\d+),\s?(\d+),\s?(\d+)>/
    SKILL_CONVERT_PARAM_MULTI = /<能力値置き換え\s?(?:\[((?:\d+(?:,\s?)?)+)\]),\s?(\d+),\s?(\d+)>/
    PHYSICAL_REFLECTION = /<(拡張|)物理反射(率|)\s?(#{VALUE})%>/i
    EQUIP_MASTERY = /<(武器|防具)マスタリー\s?((?:\d+-#{VALUE}+(?:,\s?)?)+)>/i
    
    SUCCUBUS = /<夢魔>/
    PENETRATION_ELEMENT = /<属性貫通\s?((?:\d+(?:,\s?)?)+)>/i
    NORMAL_ATTACK_FORCE_ELEMENT = /<通常攻撃物理属性化>/i

    SUCCUBUS = /<夢魔>/i
    PENETRATION_ELEMENT = /<属性貫通\s?((?:\d+(?:,\s?)?)+)>/i
    ALL_ADD_ELEMENT = /<全攻撃属性付加\s?((?:\d+(?:,\s?)?)+)>/i
    LEARNING = /<ラーニング>/
    SKILL_PLUS_ATTACK_ONE = /<スキル(タイプ|)単体攻撃回数アップ\s?(((?:\d+-\d+)(?:,\s?)?)+)>/i
    SKILL_PLUS_ATTACK_ONE_RANDOM = /<スキル(タイプ|)単体攻撃回数アップランダム\s?(((?:\d+-\d+)(?:,\s?)?)+)>/i
    SKILL_SCOPE_ALL = /<スキル(タイプ|)全体化\s((?:\d+(?:,\s?)?)+)?>/i
    SKILL_SCOPE_ONE = /<スキル(タイプ|)単体化\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    ENEMY_NUMBER_SKILL_BOOSTER = /<敵(複数|単体)時スキル(タイプ|)強化\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    ENEMY_NUMBER_BOOSTER = /<敵(複数|単体)時強化\s?(#{VALUE})>/i
    WTYPE_ATTACK_BOOSTER = /<武器装備ダメージアップ\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    ATYPE_DEFENCE_BOOSTER = /<防具装備ダメージダウン\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    SKILL_TYPE_COST_ZERO = /<(HP|MP|TP)タイプ消費なし\s((?:\d+(?:,\s?)?)+)?>/i
    SKILL_COST_ZERO = /<(HP|MP|TP)スキル消費なし\s((?:\d+(?:,\s?)?)+)?>/i
    COST_ZERO = /<(HP|MP|TP)消費なし>/i
    ITEM_DAMAGE_BOOSTER = /<アイテムダメージアップ\s?(#{VALUE})%?>/
    PARAM_NEUTRALIZE = /<無力化\s?((?:\d+(?:,\s?)?)+)/
    STATE_DAMAGE_BOOSTER = /<ステートダメージアップ\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    FAST_MOVE_ALL = /<全行動速攻>/i
    SLOW_MOVE_ALL = /<全行動遅攻>/i
    ADD_ELEMENT = /<属性追加\s?(\d+),(\d+)>/i
    SKILL_ADD_PARAM = /<能力値加算\s?(\d+),\s?(\d+),\s?(\d+),\s?(#{VALUE})>/i
    BATTLE_START_STATE = /<開始時限ステート\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    MULTI_ELEMENT = /<複合属性\s?((?:\d+(?:,\s?)?)+)>/i
    SAME_ELEMENT_DAMAGE_BONUS = /<スキル属性一致ボーナス強化\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    CERTAIN_REFLECTION = /<必中反射率 (#{VALUE})%>/
    STATE_CHAIN = /<連鎖ステート\s?(((?:\d+-\d+)(?:,\s?)?)+)>/i
    EX_VALUE_BOOSTER = /<(#{EX_VALUES.join("|")})ダメージアップ\s?(#{VALUE})>/i
    WIELD_BOOSTER = /<(一|二|三)刀流強化\s?(#{VALUE}),(#{VALUE})>/i
    MAX_AP_BONUS = /<最大APボーナス(固定値|)\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    PARAM_OVERRIDE = /<(#{FEATURE_PARAM_ARRAY.join("|")})変化量\s?(\d+)>/
    MAGICAL_CRITICAL = /<(?:拡張|)魔法会心率\s?(#{VALUE})%>/i
    EX_CATEGORY_BOOSTER = /<特殊カテゴリー(与ダメージアップ|被ダメージダウン)\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    WEAPON_RATE_BONUS = /<武器ボーナス取得\s?((?:\d+(?:,\s?)?)+)>/i
    AUTO_SKILL_INVALID = /(#{INVALID_ARRAY.join("|")})無効(優先度|)\s?((?:\d+(?:,\s?)?)+)/i
    EX_CATEGORY_BOOSTER_BONUS = /<特殊カテゴリー与ダメージアップ強化\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    EX_CATEGORY_BOOSTER_SKILL_TYPE = /<特殊カテゴリー与ダメージアップスキルタイプ\s?(((?:\d+-\d+-#{VALUE})(?:,\s?)?)+)>/
    ELEMENT_RATE_FIX = /<属性耐性固定\s?((?:\d+-#{VALUE}(?:,\s?)?)+)>/i
    STATE_RATE_FIX = /<ステート耐性固定\s?((?:\d+-#{VALUE}(?:,\s?)?)+)>/i
    EX_CATEGORY = /<特殊カテゴリー\s?((?:\d+(?:,\s?)?)+)>/i
    SKILL_PLUS_ATTACK = /<スキル(タイプ|)攻撃回数アップ\s?(((?:\d+-\d+)(?:,\s?)?)+)>/i
    SKILL_UNSTOPPABLE = /<頑強スキル(タイプ|)\s((?:\d+(?:,\s?)?)+)?>/i
    SKILL_COMBO = /<スキル(タイプ|)コンボ\s?(((?:\d+-\d+)(?:,\s?)?)+)>/i
    STATE_EFFECT_BOOSTER = /<ステート増加効果アップ\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    SKILL_TIMING_BOOST = /<(#{SKILL_TIMING_ARRAY.join("|")})ダメージアップ\s?(#{VALUE})>/
    SKILL_TIMING_REPEAT = /<(#{SKILL_TIMING_ARRAY.join("|")})連続発動>/
    SKILL_TYPE_DEFENCE_PENETRATION = /<防御無効化スキルタイプ\s?((?:\d+(?:,\s?)?)+)>/i
    DUAL_SHIELD = /<両手盾>/i
    TRIPLE_WIELD = /<三刀流>/i
    DUAL_SHIELD_ADD_ABILITY = /<両手盾時能力(?::|：)(\d+)>/i
    EVASION_SKILL = /<回避時スキル\s?(\d+)\s?,\s?(#{VALUE})%>/
    FULL_HP_SKILL_BOOST = /<全快スキル強化\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    FULL_HP_SKILL_TYPE_BOOST = /<全快スキルタイプ強化\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    FULL_HP_BOOST = /<HP全快時強化\s?(\d+)\s?,\s?(#{VALUE})%>/i
    FULL_SP_BOOST = /<SP満タン威力アップ\s?(#{VALUE})%>/
    FULL_MP_BOOST = /<MP満タン威力アップ\s?(#{VALUE})%>/
    FULL_SP_STYPE_BOOST = /<SP満タン威力アップスキルタイプ\s?(\d+)\s?,\s?(#{VALUE})%>/
    FULL_MP_STYPE_BOOST = /<MP満タン威力アップスキルタイプ\s?(\d+)\s?,\s?(#{VALUE})%>/
    ITEM_COST_RATE = /<消費アイテム効果倍率 (#{VALUE})>/
    ITEM_GET_RATE = /<獲得アイテム効果倍率 (#{VALUE})>/
    SKILL_CHAIN = /<スキルチェーン\s?((?:\d+(?:,\s?)?)+)>/i
    SKILL_CHAIN_BOOST = /<チェーン強化\s?(#{VALUE})%>/i
    SKILL_CHAIN_COST_RATE = /<チェーン消費軽減\s?(#{VALUE})%>/i
    SKILL_COUNTER_EX = /<スキル(タイプ|)無効化反撃\s?(\d+),((?:\d+(?:,\s?)?)+)>/i
    TURN_END_REVIVE = /<毎ターン復活>/
    UNDEAD = /<戦闘不能にならない>/
    HIT_DAMAGE_BOOST = /<ヒット数で威力(アップ|ダウン)\s?(#{VALUE})%>/i
    DISPLAY_ID = /<表示ID:\s?(\d+(?:\.\d*)?)>/i
    ADD_STEAL_SKILL = /<スキル(タイプ|)スティール付与\s?(((?:\d+-\d+)(?:,\s?)?)+)>/i
    ADD_RESTORATION = /<全攻撃(HP|MP)還元\s?(#{VALUE})%>/
    ADD_RESTORATION_STYPE = /<スキルタイプ(HP|MP)還元\s?(\d+)\s?,\s?(#{VALUE})%>/
    ADD_SPEED_STYPE = /<速度補正スキルタイプ(素早さ倍率|)\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    ADD_DUMMY_ENCHANT = /<補足解説追加(?::|：)(\S+)>/i
    AUTO_REVIVE = /<回数制限自動復活\s?(#{VALUE}-#{VALUE}>)/
    BLOCK_RATE = /<(物理|魔法|必中)ブロック率\s?(#{VALUE})%>/
    ID_ITEM_DAMAGE_BOOST = /<個別アイテムダメージアップ\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    STYPE_ITEM_COST_RATE = /<消費アイテム効果倍率スキルタイプ\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    STYPE_ITEM_GET_RATE = /<獲得アイテム効果倍率スキルタイプ\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/i
    ONCE_TURN_END_STATE = /<ターン後ステート発動\s?(((?:\d+-\d+)(?:,\s?)?)+)>/i
    DAMAGE_BOOST = /<ダメージアップ\s?(#{VALUE})%>/i
    SINGLE_SKILL_BOOST = /<単発スキルダメージアップ\s?(#{VALUE})%>/i
    ADD_ELEMENT_SKILL = /<スキル(タイプ|)属性追加\s?(((?:\d+-#{VALUE})(?:,\s?)?)+)>/
    TURN_HIT_DAMAGE_RATE = /<ターン内ダメージ減少 \s?(#{VALUE})%>/
    REDUCE_BOOST_DAMAGE = /<特攻ダメージ軽減\s?(#{VALUE})>/
    ALTERNATE_TP_TO_MP = /<MP代替消費\s?(#{VALUE})%>/
    REPLACE_GAIN = /<入手置き換え\s?(\d+)-(\d+)>/i
    PARTY_MEMBER_PARAM_BOOST = /<パーティ全員能力アップ (#{VALUE})%>/
    PARTY_MEMBER_HPMP_BOOST = /<パーティ全員HPMPアップ (#{VALUE})%>/
    VARIABLE_HP_DAMAGE = /<変数割合HP減少率\s?(\d+)>/
    ACTION_MINUS = /<行動回数減少\s?(#{VALUE})>/
    AUTO_REVIVE_MINUS = /<自動復活減少\s?(#{VALUE})>/
  end

  module UsableItem
    HEEL_REVERSE_IGNORE = /<回復反転無視>/i
    CONSIDERATE_REVISE = /<仲間想い\s?(\d+)%>/i
    PAY_LIFE = /<自爆属性>/i
    RANDOM_INVOKE = /<ランダム発動\s?((?:\d+(?:,\s?)?)+)>/i
    MULTI_INVOKE = /<順番発動\s?((?:\d+(?:,\s?)?)+)>/i
    ADD_ANIME = /<追加アニメ\s+(\d+)>/i
    ELEMENT_EX = /<攻撃属性\s?((?:\d+(?:,\s?)?)+)>/i
    WEAPON_RATE = /<武器倍率\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    APPLY_PHARMACOLOGY = /<薬の知識適用>/i
    WARP_ITEM = /<ワープアイテム>/i
    PENETRATE = /<(属性)?(ステート)?耐性無視>/i
    SLOT = /<スロット>/i
    POKER = /<ポーカー>/i
    THROW = /<投擲専用>/i
    ADD_STEAL = /<スティール付与\s?(\d+)>/i
    ITEM_GET = /<獲得アイテム\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    ADD_DEFENSE_WALL = /<防御壁追加\s?(\d+)>/i
    OVER_DRIVE = /<時間停止\s?(\d+)>/i
    GAIN_EXP = /<(基本|職業|種族)経験値上昇\s?(\d+)>/i
    DEATH_ELEMENT = /<属性即死\s*ID=(\d+)(?:\s+耐性無視=([01]))?>/i
    DEATH_STATE = /<ステート限定付与\s*対象=(\d+)\s+付与=(\d+)(?:\s+確率=(\d+))?(?:\s+耐性無視=([01]))?>/i
    SELF_ENCHANT = /<自己付与\s+ステート=(\d+)(?:\s+確率=(\d+))?(?:\s+耐性無視=([01]))?>/i
    PREDATION = /<捕食技\s+起動ステート=((?:\d+(?:,)?)+)\s+吸収=(HP)?(MP)?(TP)?>/i
    RESTORATION = /<(HP|MP)還元\s?(\d+)%>/i
    BINDING_START = /<拘束開始技\s?(\d+)>/i
    EBINDING_START = /<永久拘束開始技>/i
    BIND_RESIST = /<もがく>/i

    REPEATS_EX = /<連続回数\s?(\d+)>/i
    TARGET_REJECT_USER = /<特殊使用者除外>/i
    ERASE_DEFENSE_WALL = /<防御壁無効化>/i

    ADD_ANIME = /<追加アニメ\s?((?:\d+(?:,\s?)?)+)>/i
    GAIN_EXP = /<(基本|職業|種族)経験値上昇(非表示)?\s?(\d+)>/i # 110
    INCLUDE_BENCH = /<待機メンバー含む>/i
    PERSONA_CHANGE = /<人格切替\s?(\d+)>/i
    FAST_MOVE = /<速攻発動>/i
    SLOW_MOVE = /<遅攻発動>/i
    ALLOWANCE = /<手加減>/i
    SELF_ENCHANT_REGEN = /<自己解除\s+ステート=(\d+)(?:\s+確率=(\d+))?>/i
    STATE_BOOST = /<ステート特攻\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    PINCHI_BOOST = /<窮地強化\s?(\d+)>/i
    DISPLAY_NAME = /<スキルタイトル(?:\s|:)(\S+)>/i
    LEARNING_SKILL = /<ラーニングスキル(?:\s|:)(\d+)>/
    EXT_SCOPE_SETTING = /<使用対象\s?((?:\d+(?:,\s?)?)+)>/i
    BENCH_ONLY = /<待機メンバーのみ>/
    FULL_HP_BOOST = /<全快強化\s?(\d+)>/i
    MIMIC = /<ものまね>/
    SUPER_MIMIC = /<超ものまね>/
    ACCUMULATE_GET_RATE_UP = /<累積獲得倍化>/
    ACCUMULATE_GET_RATE_RESET = /<累積獲得初期化>/
    WEAPON_EQUIP_SIZE_BOOST = /<(二|三)刀流時威力アップ\s?(\d+)%>/i
    ENEMY_FORMULA = /<敵式\s?(.+)>/
    IGNORE_NO_EFFECT = /<効果文章不要>/
  end

  module Class
    CLASS_LANK = /<職業ランク\s?(\d+)>/i
    NEED_JOBCHANGE_CLASS = /<要求経験職\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    SELECT_JOBCHANGE_CLASS = /<選択経験職\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    NEED_JOBCHANGE_ITEM = /<転職アイテム\s?((?:\d+(?:,\s?)?)+)>/i
    MEMORIZE_CAPACITY_REVISE = /<メモライズ容量補正\s?((?:\d+(?:,\s?)?)+)>/i
    BOTH_DISABLE = /<両立不可(?::|：)?((?:\d+(?:,\s?)?)+)>/i
    PREFIX = /<接頭(?::|：)(\S+)>/i
    RARE_PREFIX = /<レア接頭(?::|：)(\S+)>/i
    PARAM_BONUS = /<(#{FEATURE_PARAM_ARRAY.join("|")})ボーナス\s?(#{VALUE})>/i
    MAX_SP_BONUS = /<最大SPボーナス\s?(#{VALUE})>/i
    FINAL_BONUS = /<最終ボーナス\s?(#{VALUE})%>/i
    DUMMY_ENCHANT_COLOR = /<文字色\s?(\d+)>/i
    SET_EFFECT = /<揃い効果\s?((?:\d+(?:,\s?)?)*)>/i
    EXP_RATE = /<経験値倍率\s?(\d+)>/
    MAX_LV = /<最大レベル\s?(\d+)>/
  end

  module Actor
    INITIAL_TRIBE_ID = /<初期サブクラス\s?(\d+)>/i
    USE_EXP_CURVE = /<経験値曲線\s?(\d+)>/i
    HUMAN_ADD_FEATURES = /<人間時追加特徴\s?(\d+)>/i
    PECULIAR_SKILL = /<固有習得\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    INIT_CLASS_LEVEL = /<経験済職業\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    INIT_EQUIPS = /<初期装備(\d)(?::|：)(\d+)(?:,(\d+))?(?::((?:\d+,?)+)?)?>/i
    INIT_ABILITIES = /初期アビリティ\s?((?:\d+(?:,\s?)?)+)/i
    BASE_TP = /<TP基本値\s?(\d+)>/i
    TP_LEVEL_REVISE = /<TPLv補正\s?(\d+(?:\.\d+)?)>/i
    TP_LEVEL100_REVISE = /<TPLv100補正\s?(\d+(?:\.\d+)?)>/i
    CATEGORY = /<カテゴリー(?::|：)(\S+)>/i
    BEST_PLACE = /<ナワバリ(?::|：)(\d+)-(\d+)-(\d+)>/i
    PERSONA = /<(主人格|副人格(?::|：)ID\s*=\s*(\d+))>/i
    ILLUSTRATOR_NAME = /<イラスト(?::|：)(\S+)>/i
    INIT_BASE_LEVEL = /<初期レベル\s?(\d+)>/i
    SEX = /<性別(?::|：|\s)(\d)>/i
  end

  module Map
    BATTLEBACK_REGION = /<背景(\d+):(.*?),(.*?)>/i
  end
  module Enemy
    ESCAPE_LEVEL = /<逃走レベル\s?(\d+)>/i
    CLASSEXP = /<職業Exp\s?(\d+)>/i
    FRIEND_VARIABLE = /<友好度変数\s?(\d+)>/i
    STEAL_LIST = /<スティールリスト\s?(\d+)\s?,\s?([IWA])\s?,\s?(\d+)\s?,\s?(\d+)>/i
    WEAPON_TYPE = /<武器タイプ(?::|：)(\d+)>/i
    CATEGORY = /<種族(?::|：)(\S+)>/i
    LIB_NAME = /<図鑑名称(?::|：)(\S+)>/i
    JOIN_SWITCH = /<仲間ID:(\d+)>/i
    NO_DIFFICULTY = /<難易度補正無視>/i
    NO_PREDATION = /<捕食無効>/
    NO_LOSE_SKIP = /<スキップ不能>/
    DEFEAT_MESSAGE = /<撃破時メッセージ\s?(\S+)>/i
    HP_INFINITE = /<HP無限>/i
    MP_INFINITE = /<MP無限>/i
    ESCAPE_NOT_COUNT = /<逃走カウントなし>/i
    SKILL_WORD_ACTOR = /<スキルセリフ\s?(\d+)>/i
    PARAM_REF = /<数値参照\s?(\d+)>/i
    REPLACE_MEMBER = /<出現置き換え\s?(\d+)-(\d+)>/i
  end

  module Battler
    TEMPTATION_SKILL = /<誘惑時使用スキル(?::|：)(\d+)>/i
  end

  module State
    TMP_EQUIP = /<武器装備\s+(\d+)>/i
    DEATH = /<即死>/i
    DEATH_PLEASURE = /<快楽死亡>/i
    ALL_DEAD = /<全滅判定有>/i
    SEAL_ACTION = /<敵行動削除\s?((?:\d+(?:,\s?)?)+)>/i
    ADD_ACTION = /<敵行動追加\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    FORCE_ITEM_DROP = /<ドロップアイテム全取得>/
    DISPLAY_NAME = /<表示(?::|：)(\S+)>/
    POPUP_BOOST_NAME = /<左上効果表示(?::|：)(\S+)>/i
    REMOVE_STATE = /<ステート解除(?::|：)\s?id=((?:\d+(?:,\s?)?)+)>/i
  end

  module Skill
    HP_COST_EX = /<(絶対)?消費(HP|MAXHP)\s?(\d+)(%)?>/i
    MP_COST_EX = /<(絶対)?消費(MP|MAXMP)\s?(\d+)(%)?>/i
    TP_COST_EX = /<(絶対)?消費(TP|MAXTP)\s?(\d+)(%)?>/i
    GOLD_COST = /<消費金額\s?(\d+)>/i
    ITEM_COST = /<消費アイテム\s?((?:\d+-\d+(?:,\s?)?)+)>/i
    NEED_ITEM = /<必要アイテム\s?((?:\d+(?:,\s?)?)+)>/i
    NEED_DUAL_WIELD = /<二刀流要求>/i
    FRIEND_DRAW = /<友好度表示>/i
    STYPE_EX = /<拡張スキルタイプ\s?((?:\d+(?:,\s?)?)+)>/i
    SKILL_HIT = /<スキル命中率(?::|：)(\d+)>/i
    SKILL_HIT_FACTOR = /<スキル命中補正率(?::|：)([-+]?\d+)>/i
    NOT_LEARN_ACTORS = /<習得不可>/i
    NOT_LEARN_ACTORS_SET = /<習得不可\s?((?:\d+(?:,\s?)?)+)>/i
    MEMORIZE_COST = /<記憶容量\s?(\d+)>/i
    PASSIVE_ARMORS = /<パッシブ能力防具\s?((?:\d+(?:,\s?)?)+)>/i
    NOT_JUMBLE_MEMORIZE = /<共存不可メモライズ\s?((?:\d+(?:,\s?)?)+)>/i
    LIB_NAME = /<図鑑名称(?::|：)(\S+)>/i
    INVISIBLE = /<(?:技|スキル)名非表示>/i
    RECHARGE = /<必殺技\s?(\d+)>/i
    CYCLE = /<周期技\s?(\d+)\+(\d+)\*X>/i
    LONELY_UNUSED = /<一人旅未使用>/i
    CRITICAL_EX = /<スキル会心率(?::|：)(\d+)>/i
    SUCCUBUS_UNAVAILABLE = /<夢魔使用不可>/i
    EX_CATEGORY_BOOSTER = /<特殊カテゴリー与ダメージアップスキル\s?(((?:\d+-\d+)(?:,\s?)?)+)>/i
    NO_INVOKE_REPEATS = /<連続発動なし>/i
    AUTO_BATTLE_NORMAL_USEBLE = /<通常戦闘使用可>/i
    AUTO_BATTLE_SETTING = /<自動戦闘\s?((?:\d+(?:,\s?)?)*)>/i
    NEED_DUAL_SHIELD = /<両手盾時使用可能>/
    ADD_FORCE_STEAL = /<確定スティール付与\s?(\d+)>/i
    INVALID_BOOST = /<威力強化なし>/i
    NEED_STATES = /<必要ステート\s?((?:\d+(?:,\s?)?)+)>/i
    CLASS_CONDITIONS = /<セット職業限定\s?((?:\d+(?:,\s?)?)+)>/
    CRITICAL_TYPE = /<会心設定\s?(\d+)>/
    MASTER_ABILIRY = /<証アビリティ>/
  end

  module EquipItem
    EXCLUSIVE_ACTORS = /<専用装備\s?((?:\d+(?:,\s?)?)+)>/i
    NOT_ENCHANT_ID = /<付加能力不可\s?((?:\d+(?:,\s?)?)+)>/i
    FINAL_BONUS = /<最終ボーナス\s?\s?(#{VALUE})%>/i
    SELECTABLE = /<装備選択可>/i
    SELECTABLE_ID = /<装備選択可(?::|：)(\d+)>/
    SOCKET_NUM = /<ソケット\s?(\d+)>/i
  end

  module Weapon
    NOT_DUAL_WIELD = /<二刀流不可>/i
  end

  module Armor
    ACCESSORY_SLOT = /<アクセサリ(\d+)>/
  end
  module Item
    ENCHANT_STONE_CATEGORY = /<秘石カテゴリー(?::|：)(\d+)>/i
    ENCHANT_STONE_ID = /<秘石能力防具\s?((?:\d+(?:,\s?)?)+)>/i
  end
end
