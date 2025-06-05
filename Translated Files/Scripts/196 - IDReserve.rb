# -*- encoding: utf-8 -*-
=begin
= ID予約

=end

#==============================================================================
# ■ NWConst::Sw
#==============================================================================
module NWConst::Sw
  # 自動メッセージ利用フラグとして扱うスイッチ（素材：メッセージ制御文字拡張で使用）
  AUTO_MESSAGE = 2
  # 仲間加入拒否スイッチ (FOLLOWER_DISABLE_2と同じ)
  FOLLOWER_DISABLE_1 = 3
  # ニューゲーム時とロード時にオンにするスイッチ
  ON_GAME_START = 24
  # オンの時、<エンカウント半減/無効>の無効化およびスキル/アイテム効果「逃げる」の無効化
  STRICT_ENCOUNT = 52
  # 上級職・上級種の解放スイッチ
  OPEN_CLASS_LANK2 = 90
  # 最上級職・最上級種の解放スイッチ
  OPEN_CLASS_LANK3 = 91
  # 封印職・封印種の解放スイッチ
  OPEN_CLASS_LANK4 = 92
  # 禁職の解放スイッチ
  OPEN_CLASS_LANK5 = 444
  # アクセサリースロットを拡張するスイッチID
  EXTRA_ACCESSORY_SLOT = 445
  # 捕食シーンカットスイッチ
  CUT_PREDATION = 95
  # 全滅不能スイッチ
  ALL_DEAD_DISABLE = 96
  # 戦闘勝利時の経験値とドロップアイテム 入手不能スイッチ
  GET_DISABLE_EXP_DROP = 97
  # 簡易ステータスを表示するスイッチ
  SIMPLE_STATUS = 98
  # 擬似敗北イベント中フラグ
  LOSE_EVENT = 99  
  # ワープ禁止スイッチID
  WARP_BAN = 100
  # メニュー画面に秘石変更画面へ移動する選択肢を追加するスイッチID
  MENU_ENCHANT_STONE = 7091
  # ワープ開放フラグのベース値
  # 実際にアクセスするのはベース値+NWConst::Warp::Placesのインデックス値になります
  WARP_OPEN_BASE = 5001
  # 図鑑用地名スイッチ番号ベース値
  # 実際にアクセスするのはベース値+PLACEのインデックス値
  PLACE_FLAG_BASE = 5201    
  # 仲間になったアクターIDを格納するベース値
  # 実際にアクセスするのはベース値+アクターID
  ADD_ACTOR_BASE = 1000
  
  # 戦闘中の「入れ替え」コマンドを禁止するスイッチ
  FORBID_BATTLE_SHIFT_CHANGE = 27
  # 仲間加入拒否スイッチID (FOLLOWER_DISABLE_1と同じ)
  FOLLOWER_DISABLE_2 = 81
  # 戦闘勝利時の経験値 入手不能スイッチ
  GET_DISABLE_EXP = 82
  # 戦闘勝利時のお金 入手不能スイッチ
  GET_DISABLE_GOLD = 83
  # 戦闘勝利時のドロップアイテム 入手不能スイッチ
  GET_DISABLE_DROP = 84
  # 盗み強制失敗スイッチ
  STEAL_FAIL = 85

  # Hシーン図鑑の全項目解放フラグに利用するスイッチID
  LIBRARY_H_OPEN = 442
  # Hシーン図鑑の回想イベント中にオンになるスイッチ
  LIBRARY_H_MEMORY = 443

end

#==============================================================================
# ■ NWConst::Var
#==============================================================================
module NWConst::Var
  # 自動ポップ表示位置の設定を行う変数の番号(変数の値 :-2=表示オフ,-1=プレイヤー,0=現在イベント,1以上=イベントID)
  ICON_POPUP_TARGET = 3
  # この変数の値が1以上なら、特定イベントコマンド(トリス修正Q参照)の敵番号をその値に強制変換
  EVENT_ENEMY_ID = 112
  # 敵のパラメーター補正を与える変数
  PARAM1 = 41 # MHP
  PARAM2 = 42 # ATK, MAG, DEX
  PARAM3 = 43 # DEF, MDF
  PARAM4 = 44 # AGI
  PARAM_STATE_RATE = {
    # ステート有効度  敵のステート有効度に [変数の値]% を乗算する
    # ただし変数の値が0なら100%（変化なし）、マイナスなら0%とする
    #   ステートID => 変数ID,
    230 => 45,
    231 => 45,
    232 => 45,
  }
  # 戦闘後終了時に上がる好感度を格納する変数の番号
  BATTLE_END_GAIN_LOVE = 52  
  # スキル使用者のIDを格納する変数の番号
  ACTION_USER = 100
  # スキル対象者のIDを格納する変数の番号
  ACTION_TARGET = 101
  # 現在の歩数を格納する変数の番号
  STEPS = 102
  # 現在の所持金を格納する変数の番号
  GOLD = 103
  # 使用スキルIDを格納する変数の番号
  USED_SKILL_ID = 104
  # スキルの成否判定を格納する変数の番号
  ACTION_HIT = 105
  # スキル対象者の友好度を格納する変数の番号
  ACTION_TARGET_FRIEND = 106  
  # 立ち上がったエネミーのIDを格納する変数の番号
  GET_UP = 107
  # スキル使用者のベースレベルを格納する変数の番号
  ACTION_USER_LEVEL = 108
  # スキル対象者の逃走レベルを格納する変数の番号
  ACTION_TARGET_LEVEL = 109  
  # 現在の所持コインを格納する変数の番号
  COIN = 110
  # 最後に行われた戦闘の勝利するまでの経過ターン数を保存する変数の番号
  BATTLE_END_TURN = 111
  # 敗北イベントが呼び出されるエネミーのIDを格納する変数の番号
  LOSE_EVENT_ENEMY_ID = 113
  # イベントコマンド「数値入力の処理」の桁数を指定する変数の番号(変数の値が0以下の場合はイベントで設定された値を利用する。「数値入力の処理」が行われる度に変数の値は0になる)
  NUM_INPUT_DIGIT = 114
  # 周回数を格納する変数の番号
  TRACK = 912
  # 現在の難易度を格納する変数の番号
  CURRENT_DIFFICULTY = 902
  # クリア時の最高難易度を格納する変数の番号
  CLEAR_DIFFICULTY = 903
  # バトルファッカー撃破数を格納する変数の番号
  BATTLEFUCKER_DEFEAT = 907
  # エネミー用友好度を格納する変数の番号ベース値
  # 実際にアクセスするのはベース値+エネミーID
  ENEMY_REL_BASE = 2000
  # アクター用好感度を格納する変数の番号ベース値
  # 実際にアクセスするのはベース値+アクターID
  ACTOR_REL_BASE = 3000
  # 共有変数IDの設定  友好度共有に使う  []内に共有したいIDを指定
  COMMON_VARIABLE = [
    [2002, 2003],
    [2009, 2910],
    [2010, 2911],
    [2011, 2912],
    [2012, 2880],
    [2015, 2952],
    [2022, 2961],
    [2051, 2542, 2939],
    [2078, 2079, 2080, 2081],
    [2087, 2088, 2089, 2090, 2091, 2092],
    [2094, 2524, 2588, 2588, 2830],
    [2110, 2543, 2940],
    [2120, 2914],
    [2143, 2845],
    [2144, 2823],
    [2145, 2150],
    [2146, 2559],
    [2147, 2562],
    [2158, 2159, 2160],
    [2168, 2169],
    [2177, 2385],
    [2178, 2286, 2536],
    [2184, 2915],
    [2197, 2198, 2199],
    [2200, 2201, 2202],
    [2206, 2207],
    [2208, 2209, 2210, 2211],
    [2216, 2217, 2218],
    [2223, 2539],
    [2224, 2538, 2605, 2606, 2607],
    [2227, 2228, 2229, 2230],
    [2232, 2505, 2506, 2535, 2810, 2811],
    [2241, 2242, 2243],
    [2255, 2809, 2941],
    [2268, 2269, 2270, 2271],
    [2295, 2917],
    [2297, 2498, 2916],
    [2298, 2918],
    [2312, 2313],
    [2315, 2632],
    [2321, 2322, 2323],
    [2331, 2919],
    [2332, 2920],
    [2333, 2921],
    [2345, 2531],
    [2346, 2532],
    [2347, 2533],
    [2348, 2349, 2350, 2648, 2797],
    [2353, 2354, 2355, 2356, 2357],
    [2358, 2359, 2360],
    [2365, 2667],
    [2368, 2369, 2370, 2805, 2806],
    [2384, 2731],
    [2515, 2516, 2517],
    [2514, 2636],
    [2523, 2641],
    [2534, 2728],
    [2537, 2690],
    [2545, 2546, 2547],
    [2560, 2566],
    [2570, 2571],
    [2582, 2614, 2655],
    [2583, 2658],
    [2612, 2676],
    [2615, 2660],
    [2624, 2625, 2886],
    [2687, 2688, 2689],
    [2696, 2777, 2924, 2925, 2926],
    [2702, 2819],
    [2705, 2995],
    [2711, 2712, 2905, 2996],
    [2722, 2821],
    [2723, 2822],
    [2734, 2820],
    [2740, 2741],
    [2744, 2815],
    [2752, 2900],
    [2753, 2754],
    [2755, 2756],
    [2758, 2898],
    [2764, 2899],
    [2766, 2897],
    [2769, 2795],
    [2779, 2784, 2856, 2906, 2994],
    [2780, 2816],
    [2798, 2799, 2800, 2963, 2965],
    [2801, 2802, 2803, 2964, 2966],
    [2825, 2826, 2827],
    [2835, 2836, 2837],
    [2842, 2858, 2859, 2971],
    [2846, 2967],
    [2847, 2892],
    [2850, 2871],
    [2854, 2934],
    [2855, 2945],
    [2860, 2861, 2893],
    [2865, 2944],
    [2866, 2945],
    [2867, 2933],
    [2868, 2977],
    [2869, 2981],
    [2870, 2923],
    [2887, 2891],
    [2942, 2943],
    [2954, 2955],
    [2968, 2984],
    [2969, 2970],
    [2972, 2983],
    [2974, 2975],
    [2982, 2998],
    [2991, 2992, 2993],

  ]
  # 拡張選択肢の結果を保存する変数の番号
  EX_CHOICE_RESULT = 9
  # 混沌の迷宮の到達階層を保存する変数の番号 値が1以上なら「今回の冒険」に表示
  EX_DUNGEON_REACH = 122
  # パーティ人数上限に加算する値を代入する変数の番号
  PARTY_MAX_PLUS = 56
  # エンチャント武器の個数を取得する変数の番号
  ENCHANT_WEAPON_ITEM_NUMBER =200
  # エンチャント防具の個数を取得する変数の番号
  ENCHANT_ARMOR_ITEM_NUMBER = 201

  #エンチャントのレア度を指定する変数
  ENCHANT_RARELITY_ID = 150

  # マップ移動時にこの変数の値が1以上なら、変数の値のマップIDへ移動する
  MAP_TRANSFER = 57

  # 敵のパラメーター補正を与える変数
  EXP = 46 # 取得経験値
  MONEY = 47 # 取得ゴールド
  MMP = 48 # 最大MP

  # チャレンジバトルモードで戦闘が中断するターン数を設定する変数の番号
  CHALLENGE_BATTLE_TURN = 84
  # チャレンジバトルモードで敵に与えたダメージの合計値を格納する変数の番号
  CHALLENGE_BATTLE_DAMAGE = 85

  # 混沌の迷宮・修羅の到達階層を保存する変数の番号 値が1以上なら「今回の冒険」に表示
  EX_DUNGEON_REACH2 = 156

end

#==============================================================================
# ■ NWConst::Actor
#==============================================================================
module NWConst::Actor
  # ルカのアクターID
  LUCA = 1
  # 個人レベル最大値
  MAX_BASE_LEVEL = 9999
  # <習得不可>スキルを習得できないアクターのID
  NOT_LEARN_ACTORS = [1,2,3,4,9,10,520,521,522,523,526,527,531,535,538,539,540,541,542,543,563,564,565,566,567,569,701,702,703,801,807,811,815,819,823,922,923]

  # 武器として盾を装備している場合の通常攻撃のアニメーションID
  DUAL_SHIELD_ANIMATION_ID = 17

end

#==============================================================================
# ■ NWConst::Class
#==============================================================================
module NWConst::Class
  # 職業・種族範囲
  JOB_RANGE   = (1..149).to_a + (6998..7100).to_a
  TRIBE_RANGE = (151..370).to_a + (7401..7455).to_a
  # アクターの基礎ステータス用職業ベース値
  # 実際にアクセスするのはベース値+アクターID
  BASE_PARAM_BASE = 400
  # 種族「人間」のID
  HUMANS = [151]
end

#==============================================================================
# ■ NWConst::Item
#==============================================================================
module NWConst::Item
  # ポケット魔王城アイテムID
  POCKET_CASTLE = 501
  # プレゼントアイテムID範囲
  PRESENT_RANGE = (301..460)  
end

module NWConst::Enchantment
  # IDの範囲の武器が秘武器として扱われる。
  WEAPON_ID = 1000..4080

  # IDの範囲の防具が秘防具として扱われる。
  ARMOR_ID = 2500..3799
end

#==============================================================================
# ■ NWConst::Skill
#==============================================================================
module NWConst::Skill
  BIND_RESIST = 52        # 「もがく」のスキルID
  MERCY = 51              # 「なすがまま」のスキルID
  DEFAULT_TEMPTATION = 31 # 個別スキル未設定時に適用される誘惑時スキル
  NO_VALID_ACTION  = 4241 # 敵が選択可能な行動がない場合の代用スキル
end 
 
#==============================================================================
# ■ NWConst::Common
#==============================================================================
module NWConst::Common
  MAP_DRAW     = 2 # 地図表示用コモンイベント
  CALL_CASTLE  = 3 # ポケット魔王城の呼び出しコモンイベント
  BATTLE_START = 4 # 戦闘開始時に予約するコモンイベント
  BATTLE_END   = 5 # 戦闘終了時に予約するコモンイベント
  GIVEUP_START = 9 # 降参時に予約するコモンイベント
  LOSE_EVENT_BASE = 3000 # 敗北時に起動するコモンイベントベース値
end
 
#==============================================================================
# ■ NWConst::State
#==============================================================================
module NWConst::State
  UBIND   = 3  # 拘束使用者ステートID
  TBIND   = 4  # 拘束対象ステートID
  EUBIND  = 5  # 永久拘束使用者ステートID
  ETBIND  = 6  # 永久拘束対象ステートID
  TEMPTATION = 26 # 誘惑ステートID
  INCONTINENCE = 27 # 失禁ステートID

  # ラーニングが無効化される状態異常
  LEARNING_INVALID = [10,11,17,20,25,27]

end

#==============================================================================
# ■ NWConst::WType
#==============================================================================
module NWConst::WType
  # エネミーの基本武器タイプ
  DEFAULT_ENEMY = 0  
end

#==============================================================================
# ■ NWConst::SType
#==============================================================================
module NWConst::SType
  BIND     = 65 # 拘束中スキルタイプID
  EBIND    = 66 # 永久拘束中スキルタイプID
end

#==============================================================================
# ■ NWConst::Elem
#==============================================================================
module NWConst::Elem
  # 快楽属性のID
  # 台詞・カウントの特殊化に必要
  PLEASURE = 2

  # 耐性無視・反射吸収無効となる属性ID
  RATE_FIX_ID = [41, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53]

  # 属性一致ボーナスを適応しないID
  IGNORE_SAME_ELEMENT_DAMAGE_BONUS = 1, 2

  # 属性一致ボーナスに追加される値 基本値は(100+設定した値)%
  SAME_ELEMENT_DAMAGE_BONUS_VALUE = 20

end


module  NWConst::Actor

  #最大HP上限
  MAX_MHP = 999999999999999
  #その他能力値上限
  MAX_PARAM = 999999999999999

  #最大HPの追加成長値上限
  MAX_MHP_PLUS = 999999999
  #その他能力値の追加成長値上限
  MAX_PARAM_PLUS = 99999999

end

#==============================================================================
# ■ NWConst::Party
#==============================================================================
module NWConst::Party
  #所持金上限
  MAX_MONEY = 999999999
end

module NWConst::Troop
  # チャレンジバトルモードで戦闘を行う敵グループID　複数指定は「,」で区切る
  CHALLENGE_BATTLE = 328
end

# -*- encoding: utf-8 -*-
=begin
=ダメージ計算式

=end

#==============================================================================
# ■ NWConst::Parameter
#==============================================================================
module NWConst::Parameter
  # 武器タイプに応じた基礎攻撃力の算出計算式テーブル
  WEAPON_TYPE_DAMAGE = {
  # ID => "算出式(スキル使用者の能力をa.atkやa.defなどで参照可能)"
    1 => "(a.atk + a.luk) * 1.2",
    2 => "a.atk * 2",
    3 => "a.atk * 2",
    4 => "a.atk * 2.5",
    5 => "(a.atk + a.agi) * 1.2",
    6 => "(a.atk + a.mat) * 1.2",
    7 => "(a.atk + a.agi) * 1.2",
    8 => "(a.atk + a.agi) * 1.2",
    9 => "(a.atk + a.luk) * 1.2",
    10 => "(a.atk + a.luk) * 1.2",
    11 => "(a.atk + a.agi) * 1.2",
    12 => "a.atk * 2",
    13 => "a.atk * 2",
    14 => "a.atk * 2",
    15 => "a.atk * 2",
    16 => "(a.atk * 3 + a.mat) / 2 * 1.2",
    17 => "(a.atk * 3 + a.mat) / 2 * 1.2",
    18 => "(a.atk + a.luk) * 1.2",
    19 => "(a.atk + a.luk) * 1.2",
    20 => "a.luk * 2",
    21 => "(a.atk + a.luk) * 1.2",
    22 => "a.atk * 2",
    23 => "(a.luk + a.agi) * 1.2",
    24 => "(a.atk + a.luk) * 1.2",
    25 => "a.atk * 2",
    26 => "(a.atk + a.luk) * 1.2",
    27 => "(a.atk + a.luk) * 1.2",
    28 => "(a.atk + a.luk) * 1.2",
    29 => "a.atk * 2",
    30 => "a.luk * 2",
    31 => "a.luk * 2",
    32 => "a.atk * 2",
    99 => "a.def * 2",
  # 0番は素手での基礎攻撃力算出式となります。
    0 => "a.atk * 2"
  }

  # Lv100以降の計算式
  # 最大HP
  LEVEL_100_MHP = "lv * d + ((lv * (lv -1)) / 2) * d / 1000"
  # 最大MP
  LEVEL_100_MMP = "lv * d + ((lv * (lv -1)) / 2) * d / 1000"
  # 攻撃力
  LEVEL_100_ATK = "lv * d + ((lv * (lv -1)) / 2) * d / 1000"
  # 防御力
  LEVEL_100_DEF = "lv * d + ((lv * (lv -1)) / 2) * d / 1000"
  # 魔力
  LEVEL_100_MAT = "lv * d + ((lv * (lv -1)) / 2) * d / 1000"
  # 精神力
  LEVEL_100_MDF = "lv * d + ((lv * (lv -1)) / 2) * d / 1000"
  # 素早さ
  LEVEL_100_AGI = "lv * d + ((lv * (lv -1)) / 2) * d / 1000"
  # 器用さ
  LEVEL_100_LUK = "lv * d + ((lv * (lv -1)) / 2) * d / 1000"
  # 必要経験値
  LEVEL_100_EXP = "lv * d + ((lv * (lv -1)) / 2) * 10000"
  # 必要経験値が上昇するレベルの上限
  LEVEL_EXP_MAX = 1000

end

#==============================================================================
# ■ NWConst::Map
#==============================================================================
module NWConst::Map
  # エラーチェックを省略したので
  # ダメージ床が存在しない地形タグも全て対応数値を入力してください
  DAMAGE_FLOOR = {
    # 地形タグ  => ダメージ量,
    0           => 2,
    1           => 10,
    2           => 2,
    3           => 2,
    4           => 2,
    5           => 2,
    6           => 2,
    7           => 2,
    8           => 50,
  }
end

module NWConst
  module Audio
    AUDIO_ALIAS = {
    "Audio/BGM/cb1" => "System/sys1", "Audio/BGM/cb2" => "System/sys2", "Audio/BGM/cb3" => "System/sys3", "Audio/BGM/cb4" => "System/sys4", "Audio/BGM/cb5" => "System/sys5"
    }
  end
end

# -*- encoding: utf-8 -*-
=begin
=図鑑_地名データ設定セクション by Foo

図鑑の地名に関するデータを登録します

==更新履歴
Date     Version Author Comment
13/07/24 1.0,0   Foo    新設


=end

#==============================================================================
# ■ NWConst::Library
#==============================================================================
module NWConst::Library  
  # 図鑑用地名
  # 文字列はシンボルで統一してください
  PLACE = [
    :"Iliasville",
    :"Ilias Temple",
    :"Iliasburg",
    :"Nameless Slums",
    :"Pornof",
    :"Happiness Village",
    :"Harpy Village",
    :"Midas Village",
    :"Enrika",
    :"Rostrum Village",
    :"Iliasport",
    :"Port Natalia",
    :"Luddite Village",
    :"San Ilia",
    :"Underground Library",
    :"Monte Carlo",
    :"Rubiana",
    :"Sabasa",
    :"Grandeur",
    :"Magistea Village",
    :"Lily's Mansion",
    :"Saloon",
    :"Port Marle",
    :"Navy Headquarters",
    :"Finoa",
    :"Grand Noah",
    :"Yamatai Village",
    :"Esta",
    :"Plansect Village",
    :"Lima Village Ruins",
    :"Goddard",
    :"Grangold",
    :"Gold Port",
    :"Succubus Village",
    :"Lady's Village",
    :"Devastated Plains",
    :"Elf Village",
    :"Kitsune Village",
    :"Tanuki Village",
    :"Snow Heaven",
    :"Pocket Castle",
    :"Sealed Castle Mithra",
    :"Tartarus (Ilias Continent South)",
    :"Medal Queen's Castle",
    :"Tartarus (Ilias Continent East)",
    :"Haunted Mansion",
    :"Tartarus (Sabasa Continent North)",
    :"MS Fish",
    :"Magical Academy",
    :"Tartarus (Gold Continent West)",
    :"Ghost Ship",
    :"Snow Shrine",
    :"Hellgondo Shrine",
    :"Sealed Sinner's Prison",
    :"Tartarus (Hellgondo Continent West)",
    :"Missing Number",
    :"Missing Number",
    :"Missing Number",
    :"Missing Number",
    :"Missing Number",
    :"Cave of Trials",
    :"North Ilina Mountains Cave",
    :"South Ilina Mountains Cave",
    :"Pornof Mines",
    :"Harpy Tower",
    :"Slug Tower",
    :"Midas Abandoned Mines",
    :"Rostrum Mountain Caverns",
    :"Cave of Treasures",
    :"Southern Undersea Temple",
    :"Ancient Temple Ruins",
    :"Seeker's Cave",
    :"Pyramid",
    :"Tower of Magic",
    :"Saloon Abandoned Mines",
    :"Great Marle Corridor",
    :"Grand Pirate's Cave",
    :"Administrator's Tower",
    :"Fossil Mines",
    :"Cave to Yamatai",
    :"Orochi's Cave",
    :"Labyrinth Caverns",
    :"Minotauros' Labyrinth",
    :"Undine's Spring",
    :"Gold Fort",
    :"Lava Mines",
    :"Gold Volcano",
    :"Vampire Castle",
    :"Northern Undersea Temple",
    :"Forgotten Tower",
    :"The World Tree",
    :"The Secluded Lands",
    :"Puppeteer's Tower",
    :"Snow Cave",
    :"Hall of Creation",
    :"Hellgondo Cave",
    :"Monster Lord's Castle",
    :"Iliasville Mountains",
    :"Talus Hill",
    :"Lost Woods",
    :"Lemuse Beach",
    :"Natalia Coast",
    :"Mount Saint Amos",
    :"Forest of Spirits",
    :"Carlos Hill",
    :"Oasis of Blessings",
    :"Safar Ruins",
    :"Saloon Hill",
    :"Red Mountain",
    :"Lyra Falls",
    :"Eastern Gold Toxic Swamp",
    :"Gold Coast",
    :"March Hills",
    :"Scenic Hill",
    :"Nightmare Wastes",
    :"Fairy's Island",
    :"Mount Horai",
    :"Ilias Temple Ruins",
    :"Succubus Village (Alt)",
    :"Hellgondo Cave (Alt)",
    :"Hellgondo Continent (Alt)",
    :"Monster Lord's Castle (Alt)",
    :"Collab Scenario",
    :"Tartarus (Esta)",
    :"Around Esta (AD)",
    :"Around Sabasa (AD)",
    :"Around Grand Noah (AD)",
    :"Around Grangold (AD)",
    :"Hellgondo Continent (AD)",
    :"Around San Ilia (AD)",
    :"Ilias Continent (AD)",
    :"Esta (AD)",
    :"Water Spirit's Spring (AD)",
    :"Administrator's Tower (AD)",
    :"Rubiana (AD)",
    :"Safar Ruins (AD)",
    :"Sabasa (AD)",
    :"Finoa (AD)",
    :"Grand Noah (AD)",
    :"Grangold (AD)",
    :"Goddard (AD)",
    :"Gold Volcano (AD)",
    :"Sealed Sinner's Prison (AD)",
    :"Monster Lord's Castle Ruins (AD)",
    :"Remina Research Institute (AD)",
    :"Monster Lord's Castle (Angel Occupation)",
    :"Port Natalia (AD)",
    :"Luddite Village (AD)",
    :"San Ilia (AD)",
    :"Forest of Spirits (AD)",
    :"Fairy‘s Island (AD)",
    :"Black Mansion",
    :"Alliance of Wisdom Laboratory (AD)",
    :"The Moon (AD)",
    :"Mount Saint Amos (AD)",
    :"Iliasburg (AD)",
    :"Sealed Castle Mithra (AD)",
    :"Ilias Temple (AD)",
    :"Hellgondo Continent (MR)",
    :"Around Succubus Village (MR)",
    :"Around Grangold (MR)",
    :"Around Grand Noah (MR)",
    :"Around Yamatai (MR)",
    :"Around San Ilia (MR)",
    :"Around Sabasa (MR)",
    :"Ilias Continent (MR)",
    :"Hell Station (MR)",
    :"Succubus Village (MR)",
    :"Gold Port (MR)",
    :"Grangold (MR)",
    :"Gold Fort (MR)",
    :"Around Iliasville",
    :"Around Iliasburg",
    :"Around Nameless Slums",
    :"Around Pornof",
    :"Around Happiness Village",
    :"Around Iliasport",
    :"Eastern Natalia Region",
    :"Western Natalia Region",
    :"Southern Sabasa Desert",
    :"Northern Sabasa Desert",
    :"Around Magistea Village",
    :"Around Port Marle",
    :"Inland Sea",
    :"Around Grand Noah",
    :"Around Yamatai",
    :"Around Esta",
    :"Around Grangold",
    :"Around Succubus Village",
    :"Around Devastated Plains",
    :"Open Sea",
    :"Around Fairy‘s Island",
    :"Hellgondo Continent",
    :"Around Snow Heaven",
    :"Field (AD)",
    :"Field (MR)",
    :"Various Places",
    :"Around Iliasville (Alt)",
    :"Iliasville (Alt)",
    :"Rostrum Village (Alt)",
    :"Cooking",
    :"Casino Prize (Pornof)",
    :"Casino Prize (Grandeur)",
    :"Casino Prize (Pocket Castle)",
    :"Colosseum Prize",
    :"Battle fuck Prize",
    :"Remina (Alt)",
    :"Around Goddard",
    :"Grand Noah (MR)",
    :"Plansect Village (MR)",
    :"Gold Volcano (MR)",
    :"Water Spirit's Spring (MR)",
    :"Mount Horai (MR)",
    :"Yamatai Village (MR)",
    :"Finoa (MR)",
    :"Port Natalia (MR)",
    :"Forest of Spirits (MR)",
    :"San Ilia (MR)",
    :"Monte Carlo (MR)",
    :"Safar Ruins (MR)",
    :"Sabasa (MR)",
    :"Enrika (MR)",
    :"Sealed Castle Mithra (MR)",
    :"Place of Memory",
    :"Calamity Star Demiurge (MR)",
    :"Sealed Sinner's Prison (MR)",
    :"Dark Goddess' Castle (MR)",
    :"Grand Pirate's Cave (MR)",
    :"Alliance of Wisdom Laboratory",
    :"Central Tartarus",
    :"Collapsed Pocket Castle",
    :"Iliasville (Chaos)",
    :"Iliasburg (Chaos)",
    :"Nameless Slum (Chaos)",
    :"Pornof (Chaos)",
    :"Happiness Village (Chaos)",
    :"Harpy Village (Chaos)",
    :"Midas Village (Chaos)",
    :"Enrika (Chaos)",
    :"Rostrum Village (Chaos)",
    :"Iliasport (Chaos)",
    :"Port Natalia (Chaos)",
    :"Luddite Village (Chaos)",
    :"San Ilia (Chaos)",
    :"Monte Carlo (Chaos)",
    :"Rubiana (Chaos)",
    :"Sabasa (Chaos)",
    :"Grandeur (Chaos)",
    :"Magistea Village (Chaos)",
    :"Saloon (Chaos)",
    :"Port Marle (Chaos)",
    :"Navy Headquarters (Chaos)",
    :"Finoa (Chaos)",
    :"Grand Noah (Chaos)",
    :"Yamatai Village (Chaos)",
    :"Esta (Chaos)",
    :"Plansect Village (Chaos)",
    :"Lima Village Ruins (Chaos)",
    :"Goddard (Chaos)",
    :"Grangold (Chaos)",
    :"Gold Port (Chaos)",
    :"Succubus Village (Chaos)",
    :"Hall of Lust (Chaos)",
    :"Lady's Village (Chaos)",
    :"Snow Heaven (Chaos)",
    :"Kitsune Village (Chaos)",
    :"Tanuki Village (Chaos)",
    :"Elf Village (Chaos)",
    :"Remina (Chaos)",
    :"Remina Research Institute (Chaos)",
    :"Sealed Castle Mithra (Chaos)",
    :"Medal Queen's Castle (Chaos)",
    :"Haunted Mansion (Chaos)",
    :"Gold Fort (Chaos)",
    :"Magical Academy (Chaos)",
    :"Ghost Ship (Chaos)",
    :"Devastated Plains (Chaos)",
    :"Holy Wings Shrine(Chaos)",
    :"Sheep Forest (Chaos)",
    :"Mimic Island (Chaos)",
    :"Snow Shrine (Chaos)",
    :"Hall of Creation (Chaos)",
    :"Ilias Temple Ruins (Chaos)",
    :"Hellgondo Shrine (Chaos)",
    :"Sealed Sinner's Prison (Chaos)",
    :"Cave of Trials (Chaos)",
    :"Hall of Greed (Chaos)",
    :"Pornof Mines (Chaos)",
    :"Harpy Tower (Chaos)",
    :"Slug Tower(Chaos)",
    :"Midas Abandoned Mines (Chaos)",
    :"Rostrum Mountain Caverns (Chaos)",
    :"Cave of Treasures (Chaos)",
    :"Southern Undersea Temple (Chaos)",
    :"Seeker's Cave (Chaos)",
    :"Puppeteer's Tower (Chaos)",
    :"Pyramid (Chaos)",
    :"Hall of Envy (Chaos)",
    :"Saloon Abandoned Mines (Chaos)",
    :"Administrator's Tower (Chaos)",
    :"Great Marle Corridor (Chaos)",
    :"Grand Pirate's Cave (Chaos)",
    :"Fossil Mines (Chaos)",
    :"Labyrinth Caverns (Chaos)",
    :"Hall of Wrath (Chaos)",
    :"Cave to Yamatai (Chaos)",
    :"Orochi's Cave (Chaos)",
    :"Water Spirit's Spring (Chaos)",
    :"Lava Mines (Chaos)",
    :"Northern Undersea Temple (Chaos)",
    :"Gold Volcano (Chaos)",
    :"The World Tree (Chaos)",
    :"Snow Cave (Chaos)",
    :"Hall of Pride (Chaos)",
    :"Forgotten Tower (Chaos)",
    :"Hellgondo Cave (Chaos)",
    :"Black Mansion (Chaos)",
    :"Ilias Temple (Chaos)",
    :"Dark Goddess' Castle (Chaos)",
    :"Cursed Undersea Temple (Chaos)",
    :"Sealed Monster's Cave (Chaos)",
    :"Towers of Light and Darkness (Chaos)",
    :"Inside Lilith's Body (Chaos)",
    :"Road to R'lyeh (Chaos)",
    :"Deep Chaos (Chaos)",
    :"Place of Memory (Chaos)",
    :"Alliance of Wisdom Laboratory (Chaos)",
    :"Calamity Star Demiurge (Chaos)",
    :"Eroded Demiurge (Chaos)",
    :"Palace of the Deadly Sins (Chaos)",
    :"Chaos Domain (Chaos)",
    :"Iliasville Mountains (Chaos)",
    :"Talus Hill (Chaos)",
    :"Lost Woods (Chaos)",
    :"Lemuse Beach (Chaos)",
    :"Natalia Coast (Chaos)",
    :"Mount Saint Amos (Chaos)",
    :"Forest of Spirits (Chaos)",
    :"Carlos Hill (Chaos)",
    :"Oasis of Blessings (Chaos)",
    :"Safar Ruins (Chaos)",
    :"Saloon Hill (Chaos)",
    :"Mount Horai (Chaos)",
    :"Gestalt Hivemind (Chaos)",
    :"Lyra Falls (Chaos)",
    :"Eastern Gold Toxic Swamp (Chaos)",
    :"Gold Coast (Chaos)",
    :"Hall of Gluttony (Chaos)",
    :"Nightmare Wastes (Chaos)",
    :"Fairy's Island (Chaos)",
    :"The Moon (Chaos)",
    :"Valley of the Fallen Angel (Chaos)",
    :"Lunar Mechanical Fortress (Chaos)",
    :"Forge of Chaos",
    :"Around Iliasville (Chaos)",
    :"Around Happiness Village (Chaos)",
    :"Around Iliasport (Chaos)",
    :"Around Port Natalia Beach (Chaos)",
    :"Around Port Natalia (Chaos)",
    :"Around Monte Carlo (Chaos)",
    :"Sabasa Desert (Chaos)",
    :"Around Magistea Village (Chaos)",
    :"Around Grand Noah (Chaos)",
    :"Around Yamatai (Chaos)",
    :"Around Esta (Chaos)",
    :"Around Goddard (Chaos)",
    :"Around Grangold (Chaos)",
    :"Western Gold Region (Chaos)",
    :"Sea (Chaos)",
    :"Hellgondo Continent (Chaos)",
    :"Around Snow Heaven (Chaos)",
    :"Around Kitsune and Tanuki Village (Chaos)",
    :欠番,
    :欠番,
    :欠番,
    :欠番,
    :欠番,
    :"Field (Chaos)",
    :"Various Places (Chaos)",
    :"Casino Prize (Chaos)",
    :"Colosseum Prize (Chaos)",
    :"Battle Fuck Prize (Chaos)",
    :"Core of the Star (Chaos)",
    :"Road to the Underworld (Chaos)",
    :"R'lyeh (Chaos)",
    :"Sky (Chaos)",
    :"Granberia's Nightmare (Chaos)",
    :"Starting Equipment",
    :"Oasis of Blessings (MR)",
    :"Paipai (AD)",
    :"Paipai (MR)",
    :"Paipai (Chaos)",
    :"Alt. World Paipai (Chaos)",
    :"Vanilla's Shop",
    :"Hades",
    :"Four Spirits Gathered (Chaos)",
    :"16 Phenomema of Ruin Half Defeated",
    :"16 Phenomema of Ruin All Defeated",
    :"True Ending",
    :"Hellgondo Shrine (MR)",

  ]
end

# -*- encoding: utf-8 -*-
=begin
= ワープの設定

スイッチ関係は重複を避ける為にIDReserve.rbで管理しています
禁止したい場合はWARP_BANの値を
個別開放したい場合はWARP_FREE_BASE値を設定してください

=end

#==============================================================================
# ■ NWConst::Warp
#==============================================================================
module NWConst::Warp
  # ワープ先一覧
  Places = [
    {:name => "Pocket Castle", :map_id => 126, :x => 15, :y => 13, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "Ilias Temple", :map_id => 5, :x => 24, :y => 11, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "Iliasville", :map_id => 2, :x => 295, :y => 356, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "Iliasburg", :map_id => 2, :x => 300, :y => 326, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 302, 326]},    
    {:name => "Nameless Slums", :map_id => 2, :x => 236, :y => 341, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 235, 341]},    
    {:name => "Pornof", :map_id => 2, :x => 349, :y => 377, :category => :地上,
      :v2location => [[2, 349, 382, "v[1001]>=30"],[2, 284, 274, "true"]], :v3location => [2, 351, 377]},
    {:name => "Happiness Village", :map_id => 2, :x => 353, :y => 326, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 352, 326]},    
    {:name => "Midas Village", :map_id => 2, :x => 366, :y => 279, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 367, 279]},    
    {:name => "Medal Queen's Castle", :map_id => 2, :x => 338, :y => 273, :category => :地上,
      :v2location => [2, 338, 268], :v3location => [2, 339, 273]},    
    {:name => "Enrika", :map_id => 2, :x => 241, :y => 368, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 284, 363]},    
    {:name => "Rostrum Village", :map_id => 2, :x => 385, :y => 354, :category => :地上,
      :v2location => [[2, 388, 353, "v[1001]>=30"],[2, 284, 274, "true"]], :v3location => [2, 386, 354]},   
    {:name => "Iliasport", :map_id => 2, :x => 282, :y => 275, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 281, 275]},    
    {:name => "Port Natalia", :map_id => 2, :x => 282, :y => 260, :category => :地上,
      :v2location => [2, 284, 261], :v3location => [2, 281, 260]},    
    {:name => "Luddite Village", :map_id => 2, :x => 257, :y => 250, :category => :地上,
      :v2location => [2, 284, 261], :v3location => [2, 258, 250]},    
    {:name => "San Ilia", :map_id => 2, :x => 236, :y => 261, :category => :地上,
      :v2location => [[2, 234, 268, "v[1001]>=30"],[2, 284, 261, "true"]], :v3location => [2, 238, 261]}, 
    {:name => "Monte Carlo", :map_id => 2, :x => 200, :y => 273, :category => :地上,
      :v2location => [2, 284, 261], :v3location => [2, 201, 273]},    
    {:name => "Rubiana", :map_id => 2, :x => 142, :y => 317, :category => :地上,
      :v2location => [[2, 141, 318, "v[1001]>=30"],[2, 284, 261, "true"]], :v3location => [2, 143, 317]},
    {:name => "Sabasa", :map_id => 2, :x => 103, :y => 294, :category => :地上,
      :v2location => [[2, 104, 296, "v[1001]>=30"],[2, 100, 225 ,"true"]], :v3location => [2, 105, 294]},    
    {:name => "Grandeur", :map_id => 2, :x => 85, :y => 272, :category => :地上,
      :v2location => [2, 100, 225], :v3location => [2, 84, 272]},    
    {:name => "Magistea Village", :map_id => 2, :x => 47, :y => 295, :category => :地上,
      :v2location => [[2, 37, 292, "v[1001]>=30"],[2, 100, 225, "true"]], :v3location => [2, 46, 295]},  
    {:name => "Saloon", :map_id => 2, :x => 98, :y => 230, :category => :地上,
      :v2location => [2, 100, 225], :v3location => [2, 100, 230]},    
    {:name => "Port Marle", :map_id => 2, :x => 254, :y => 234, :category => :地上,
      :v2location => [2, 253, 232], :v3location => [2, 253, 234]},    
    {:name => "Navy Headquarters", :map_id => 2, :x => 335, :y => 240, :category => :地上,
      :v2location => [2, 334, 240], :v3location => [2, 338, 240]},    
    {:name => "Finoa", :map_id => 2, :x => 330, :y => 209, :category => :地上,
      :v2location => [2, 322, 227], :v3location => [2, 329, 209]},    
    {:name => "Grand Noah", :map_id => 2, :x => 328, :y => 187, :category => :地上,
      :v2location => [2, 322, 227], :v3location => [2, 327, 187]},    
    {:name => "Yamatai Village", :map_id => 2, :x => 372, :y => 166, :category => :地上,
      :v2location => [[2, 379, 167, "v[1001]>=30"],[2, 322, 227, "true"]], :v3location => [2, 374, 166]},  
    {:name => "Esta", :map_id => 2, :x => 261, :y => 202, :category => :地上,
      :v2location => [2, 322, 227], :v3location => [2, 263, 202]},    
    {:name => "Plansect Village", :map_id => 2, :x => 283, :y => 198, :category => :地上,
      :v2location => [2, 322, 227], :v3location => [2, 282, 198]},    
    {:name => "Lima Ruins", :map_id => 2, :x => 236, :y => 179, :category => :地上,
      :v2location => [2, 322, 227], :v3location => [2, 235, 179]},    
    {:name => "Goddard", :map_id => 2, :x => 221, :y => 176, :category => :地上,
      :v2location => [2, 322, 227], :v3location => [2, 223, 176]},    
    {:name => "Grangold", :map_id => 2, :x => 234, :y => 154, :category => :地上,
      :v2location => [2, 322, 227], :v3location => [2, 233, 154]},    
    {:name => "Gold Port", :map_id => 2, :x => 234, :y => 131, :category => :地上,
      :v2location => [[2, 233, 130, "v[1001]>=30"],[2, 322, 227, "true"]], :v3location => [2, 236, 131]}, 
    {:name => "Succubus Village", :map_id => 2, :x => 165, :y => 142, :category => :地上,
      :v2location => [[2, 168, 121, "v[1001]>=30"],[2, 322, 227, "true"]], :v3location => [2, 167, 142]},  
    {:name => "Lady's Village", :map_id => 2, :x => 150, :y => 122, :category => :地上,
      :v2location => [[2, 168, 121, "v[1001]>=30"],[2, 322, 227, "true"]], :v3location => [2, 152, 122]},  
    {:name => "Holy Wings Shrine", :map_id => 2, :x => 134, :y => 125, :category => :地上,
      :v2location => [[2, 168, 121, "v[1001]>=30"],[2, 322, 227, "true"]], :v3location => [2, 135, 125]},   
    {:name => "Fairy's Island", :map_id => 2, :x => 42, :y => 348, :category => :地上,
      :v2location => [2, 46, 338], :v3location => [2, 43, 346]},    
    {:name => "Elf Village", :map_id => 300, :x => 23, :y => 50, :category => :地上,
      :v2location => [2, 365, 157], :v3location => [2, 372, 160]},    
    {:name => "Kitsune Village", :map_id => 2, :x => 388, :y => 158, :category => :地上,
      :v2location => [2, 379, 167], :v3location => [2, 389, 158]},    
    {:name => "Snow Heaven", :map_id => 2, :x => 89, :y => 158, :category => :地上,
      :v2location => [2, 82, 144], :v3location => [2, 91, 158]},    
    {:name => "Ilias Temple Ruins", :map_id => 2, :x => 33, :y => 193, :category => :地上,
      :v2location => [2, 82, 144], :v3location => [2, 35, 193]},    
    {:name => "Hellgondo Shrine", :map_id => 2, :x => 223, :y => 93, :category => :地上,
      :v2location => [2, 203, 102], :v3location => [2, 297, 356]},    
    {:name => "Monster Lord's Castle", :map_id => 2, :x => 164, :y => 55, :category => :地上,
      :v2location => [2, 203, 102], :v3location => [2, 297, 356]},    

    {:name => "Missing Number", :map_id => 1193, :x => 261, :y => 202, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Administrator's Tower", :map_id => 1303, :x => 25, :y => 23, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Esta", :map_id => 1193, :x => 261, :y => 202, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Rubiana", :map_id => 1193, :x => 142, :y => 317, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Sabasa", :map_id => 1193, :x => 103, :y => 294, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},   
    {:name => "Finoa", :map_id => 1193, :x => 330, :y => 209, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "Grand Noah", :map_id => 1193, :x => 328, :y => 187, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "Grangold", :map_id => 1193, :x => 234, :y => 154, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "Goddard", :map_id => 1193, :x => 226, :y => 174, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "Sealed Sinner's Prison", :map_id => 1193, :x => 243, :y => 82, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "Monster Lord's Castle", :map_id => 1193, :x => 162, :y => 50, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},  
    {:name => "Port Natalia", :map_id => 1193, :x => 282, :y => 260, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "San Ilia", :map_id => 1193, :x => 236, :y => 260, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "Alliance of Wisdom Laboratory", :map_id => 1495, :x => 29, :y => 56, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "Lucifina's House", :map_id => 1006, :x => 23, :y => 6, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Iliasburg", :map_id => 1193, :x => 300, :y => 326, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},   
    {:name => "Ilias Temple", :map_id => 1193, :x => 295, :y => 356, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},    
    {:name => "Ilias Temple", :map_id => 1890, :x => 29, :y => 54, :category => :天界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 

    {:name => "Hellgondo Shrine", :map_id => 1001, :x => 223, :y => 92, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Succubus Village", :map_id => 1001, :x => 165, :y => 141, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Gold Port", :map_id => 1001, :x => 234, :y => 130, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Grangold", :map_id => 1001, :x => 234, :y => 153, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Plansect Village", :map_id => 1001, :x => 283, :y => 197, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Grand Noah", :map_id => 1001, :x => 328, :y => 186, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Yamatai Village", :map_id => 1001, :x => 372, :y => 165, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Finoa", :map_id => 1001, :x => 330, :y => 208, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Port Natalia", :map_id => 1001, :x => 282, :y => 261, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "San Ilia", :map_id => 1001, :x => 237, :y => 260, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Monte Carlo", :map_id => 1001, :x => 200, :y => 272, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Sabasa", :map_id => 1001, :x => 103, :y => 293, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Enrika", :map_id => 1001, :x => 240, :y => 368, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Dark Goddess' Castle", :map_id => 1001, :x => 164, :y => 54, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Dark Goddess' Castle", :map_id => 1650, :x => 30, :y => 52, :category => :魔界,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},  

    {:name => "Missing Number", :map_id => 1193, :x => 261, :y => 202, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]},  
    {:name => "Missing Number", :map_id => 1193, :x => 261, :y => 202, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Missing Number", :map_id => 1193, :x => 261, :y => 202, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Missing Number", :map_id => 1193, :x => 261, :y => 202, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Missing Number", :map_id => 1193, :x => 261, :y => 202, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Missing Number", :map_id => 1193, :x => 261, :y => 202, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Missing Number", :map_id => 1193, :x => 261, :y => 202, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Missing Number", :map_id => 1193, :x => 261, :y => 202, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Iliasville (Alt)", :map_id => 196, :x => 59, :y => 54, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Rostrum (Alt)", :map_id => 195, :x => 38, :y => 20, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Administrator's Tower (Alt)", :map_id => 197, :x => 58, :y => 12, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Succubus Village (Alt)", :map_id => 194, :x => 74, :y => 120, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Remina (Alt)", :map_id => 194, :x => 55, :y => 63, :category => :地上,
      :v2location => [2, 322, 227], :v3location => [2, 117, 138]},    
    {:name => "Monster Lord's Castle (Alt)", :map_id => 194, :x => 73, :y => 33, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Missing Number", :map_id => 1193, :x => 261, :y => 202, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Alliance of Wisdom Laboratory (Alt)", :map_id => 439, :x => 29, :y => 56, :category => :地上,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 

    {:name => "Missing Number", :map_id => 1193, :x => 261, :y => 202, :category => :混沌,
      :v2location => [2, 284, 274], :v3location => [2, 297, 356]}, 
    {:name => "Pocket Castle", :map_id => 126, :x => 15, :y => 13, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [1287, 297, 356]},
    {:name => "Ilias Temple", :map_id => 1791, :x => 15, :y => 19, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [[1287, 297, 356, "v[1143]>=21"],[1287, 0, 0, "true"]]}, 
    {:name => "Iliasville", :map_id => 1287, :x => 295, :y => 356, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [[1287, 297, 356, "v[1143]>=21"],[1287, 0, 0, "true"]]}, 
    {:name => "Iliasburg", :map_id => 1287, :x => 300, :y => 326, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [1287, 302, 326]},
    {:name => "Nameless Slum", :map_id => 1287, :x => 236, :y => 341, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [[1287, 235, 341, "v[1143]>=21"],[1287, 0, 0, "true"]]}, 
    {:name => "Pornof", :map_id => 1287, :x => 349, :y => 377, :category => :混沌,
      :v2location => [1287, 349, 382], :v3location => [1287, 351, 377]},
    {:name => "Happiness Village", :map_id => 1287, :x => 353, :y => 326, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [1287, 352, 326]},
    {:name => "Midas Village", :map_id => 1287, :x => 366, :y => 279, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [1287, 367, 279]},
    {:name => "Medal Queen's Castle", :map_id => 1287, :x => 338, :y => 273, :category => :混沌,
      :v2location => [1287, 338, 268], :v3location => [1287, 339, 273]},
    {:name => "Enrika", :map_id => 1287, :x => 241, :y => 368, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [[1287, 284, 363, "v[1143]>=21"],[1287, 0, 0, "true"]]}, 
    {:name => "Sealed Castle Mithra", :map_id => 1287, :x => 235, :y => 354, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [[1287, 237, 353, "v[1143]>=21"],[1287, 0, 0, "true"]]}, 
    {:name => "Rostrum Village", :map_id => 1287, :x => 385, :y => 354, :category => :混沌,
      :v2location => [1287, 388, 353], :v3location => [1287, 386, 354]},   
    {:name => "Iliasport", :map_id => 1287, :x => 282, :y => 275, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [1287, 281, 275]},
    {:name => "Port Natalia", :map_id => 1287, :x => 282, :y => 260, :category => :混沌,
      :v2location => [1287, 284, 261], :v3location => [1287, 281, 260]},
    {:name => "Luddite Village", :map_id => 1287, :x => 257, :y => 250, :category => :混沌,
      :v2location => [1287, 284, 261], :v3location => [1287, 258, 250]},
    {:name => "San Ilia", :map_id => 1287, :x => 236, :y => 261, :category => :混沌,
      :v2location => [1287, 234, 268], :v3location => [1287, 238, 261]}, 
    {:name => "Monte Carlo", :map_id => 1287, :x => 200, :y => 273, :category => :混沌,
      :v2location => [1287, 284, 261], :v3location => [1287, 201, 273]},
    {:name => "Rubiana", :map_id => 1287, :x => 142, :y => 317, :category => :混沌,
      :v2location => [1287, 141, 318], :v3location => [1287, 143, 317]},
    {:name => "Sabasa", :map_id => 1287, :x => 103, :y => 294, :category => :混沌,
      :v2location => [1287, 104, 296], :v3location => [1287, 105, 294]},
    {:name => "Grandeur", :map_id => 1287, :x => 85, :y => 272, :category => :混沌,
      :v2location => [1287, 100, 225], :v3location => [1287, 84, 272]},
    {:name => "Magistea Village", :map_id => 1287, :x => 47, :y => 295, :category => :混沌,
      :v2location => [1287, 37, 292], :v3location => [1287, 46, 295]},  
    {:name => "Saloon", :map_id => 1287, :x => 98, :y => 230, :category => :混沌,
      :v2location => [1287, 100, 225], :v3location => [1287, 100, 230]},
    {:name => "Port Marle", :map_id => 1287, :x => 254, :y => 234, :category => :混沌,
      :v2location => [1287, 253, 232], :v3location => [1287, 253, 234]},
    {:name => "Navy Headquarters", :map_id => 1287, :x => 335, :y => 240, :category => :混沌,
      :v2location => [1287, 334, 240], :v3location => [1287, 338, 240]},
    {:name => "Finoa", :map_id => 1287, :x => 330, :y => 209, :category => :混沌,
      :v2location => [1287, 322, 227], :v3location => [1287, 329, 209]},
    {:name => "Grand Noah", :map_id => 1287, :x => 328, :y => 187, :category => :混沌,
      :v2location => [1287, 322, 227], :v3location => [1287, 327, 187]},
    {:name => "Yamatai Village", :map_id => 1287, :x => 372, :y => 166, :category => :混沌,
      :v2location => [1287, 379, 167], :v3location => [1287, 374, 166]},  
    {:name => "Esta", :map_id => 1287, :x => 261, :y => 202, :category => :混沌,
      :v2location => [1287, 322, 227], :v3location => [1287, 263, 202]},
    {:name => "Plansect Village", :map_id => 1287, :x => 283, :y => 198, :category => :混沌,
      :v2location => [1287, 322, 227], :v3location => [1287, 282, 198]},
    {:name => "Lima Village Ruins", :map_id => 1287, :x => 236, :y => 179, :category => :混沌,
      :v2location => [1287, 322, 227], :v3location => [1287, 235, 179]},
    {:name => "Goddard", :map_id => 1287, :x => 221, :y => 176, :category => :混沌,
      :v2location => [1287, 322, 227], :v3location => [1287, 223, 176]},
    {:name => "Grangold", :map_id => 1287, :x => 234, :y => 154, :category => :混沌,
      :v2location => [1287, 322, 227], :v3location => [1287, 233, 154]},
    {:name => "Gold Port", :map_id => 1287, :x => 234, :y => 131, :category => :混沌,
      :v2location => [1287, 233, 130], :v3location => [1287, 236, 131]}, 
    {:name => "Succubus Village", :map_id => 1287, :x => 165, :y => 142, :category => :混沌,
      :v2location => [1287, 168, 121], :v3location => [1287, 167, 142]},  
    {:name => "Lady's Village", :map_id => 1287, :x => 150, :y => 122, :category => :混沌,
      :v2location => [1287, 168, 121], :v3location => [1287, 152, 122]},  
    {:name => "Holy Wings Shrine", :map_id => 1287, :x => 134, :y => 125, :category => :混沌,
      :v2location => [1287, 168, 121], :v3location => [1287, 135, 125]},   
    {:name => "Fairy's Island", :map_id => 1287, :x => 42, :y => 348, :category => :混沌,
      :v2location => [1287, 46, 338], :v3location => [1287, 43, 346]},
    {:name => "Elf Village", :map_id => 1504, :x => 23, :y => 50, :category => :混沌,
      :v2location => [1287, 365, 157], :v3location => [1287, 372, 160]},
    {:name => "Kitsune Village", :map_id => 1287, :x => 388, :y => 158, :category => :混沌,
      :v2location => [1287, 379, 167], :v3location => [1287, 389, 158]},
    {:name => "Snow Heaven", :map_id => 1287, :x => 89, :y => 158, :category => :混沌,
      :v2location => [1287, 82, 144], :v3location => [1287, 91, 158]},
    {:name => "Ilias Temple Ruins", :map_id => 1287, :x => 33, :y => 193, :category => :混沌,
      :v2location => [1287, 82, 144], :v3location => [1287, 35, 193]},
    {:name => "Hellgondo Shrine", :map_id => 1287, :x => 223, :y => 93, :category => :混沌,
      :v2location => [1287, 203, 102], :v3location => [1287, 222, 93]},
    {:name => "Sealed Sinner's Prison", :map_id => 1287, :x => 244, :y => 84, :category => :混沌,
      :v2location => [1287, 203, 102], :v3location => [1287, 245, 84]},
    {:name => "Remina", :map_id => 1287, :x => 146, :y => 89, :category => :混沌,
      :v2location => [1287, 203, 102], :v3location => [1287, 148, 87]},
    {:name => "Dark Goddess' Castle", :map_id => 1287, :x => 164, :y => 55, :category => :混沌,
      :v2location => [1287, 203, 102], :v3location => [1287, 166, 55]},
    {:name => "Lucifina's House", :map_id => 1840, :x => 23, :y => 6, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [1287, 297, 356]},
    {:name => "月面の機械要塞", :map_id => 1837, :x => 40, :y => 16, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [1287, 297, 356]},
    {:name => "封魔の洞窟", :map_id => 1287, :x => 182, :y => 158, :category => :混沌,
      :v2location => [1287, 322, 227], :v3location => [1287, 182, 160]},
    {:name => "カオスの領域", :map_id => 1836, :x => 10, :y => 8, :category => :混沌,
      :v2location => [1287, 284, 274], :v3location => [1287, 297, 356]}, 

  ]  
end

# -*- encoding: utf-8 -*-
=begin
= フィールド特殊化

=end

#==============================================================================
# ■ NWConst::Field
#==============================================================================
module NWConst::Field
  # フィールド特殊化マップID
  # 現在
  # ・ポケット魔王城呼び出し可能判定
  # ・マップ表示呼び出し可能判定
  # ・マップ軽量化
  # の３つが適用されます
  FIELD_MAP_ID = [2, 1001, 1193, 1287]
  # BGMの自動切替適用マップID
  AUTO_BGM_MAP_ID = [2,194]
  
  # フェードアウトに掛けるフレーム数
  # ※除算にも使っているので絶対に0は指定しないでください
  FADEOUT_FRAME = 120
  # フェードインに掛けるフレーム数
  FADEIN_FRAME  = 60
  
  # BGM設定
  BGM = {
    # マップID
    2 => {
      # 0はリージョンが未設定の状態です。引数はname, volume, pitch
      0 => RPG::BGM.new("field1", 100, 100),
      1 => RPG::BGM.new("field1", 100, 100),
      2 => RPG::BGM.new("field1", 100, 100),
      3 => RPG::BGM.new("field1", 100, 100),
      4 => RPG::BGM.new("field1", 100, 100),
      5 => RPG::BGM.new("field1", 100, 100),
      6 => RPG::BGM.new("field1", 100, 100),
      7 => RPG::BGM.new("field2", 100, 100),
      8 => RPG::BGM.new("field2", 100, 100),
      9 => RPG::BGM.new("field2", 100, 100),
      10 => RPG::BGM.new("sabaku", 100, 100),
      11 => RPG::BGM.new("sabaku", 100, 100),
      12 => RPG::BGM.new("field2", 100, 100),
      13 => RPG::BGM.new("field2", 100, 100),
      14 => RPG::BGM.new("field2", 100, 100),
      15 => RPG::BGM.new("umi", 100, 100),
      16 => RPG::BGM.new("field2", 100, 100),
      17 => RPG::BGM.new("field2", 100, 100),
      18 => RPG::BGM.new("field2", 100, 100),
      19 => RPG::BGM.new("field2", 100, 100),
      20 => RPG::BGM.new("field2", 100, 100),
      21 => RPG::BGM.new("field2", 100, 100),
      22 => RPG::BGM.new("umi", 100, 100),
      23 => RPG::BGM.new("field2", 100, 100),
      24 => RPG::BGM.new("field3", 100, 100),
      25 => RPG::BGM.new("field4", 100, 100),
      26 => RPG::BGM.new("field2", 100, 100),
    },
    194 => {
      0 => RPG::BGM.new("field2", 100, 100),
      1 => RPG::BGM.new("field2", 100, 100),
      2 => RPG::BGM.new("field2", 100, 100),
      3 => RPG::BGM.new("umi", 100, 100),
      4 => RPG::BGM.new("field4", 100, 100),
    }
  }
  # BGS設定
  BGS = {
    2 => {
      #22 => RPG::BGS.new("Sea", 100, 100),
    },
    194 => {
    
    }
  }
  # 地形定義
  TERRAIN = {
    :森 => {
      :tag => 1,
      :map_id => [125,128,132,153,205,206,207,208,209,331,332,333,415,416,417,443,446,668,670,674,767,813,816,828,832,
        1107,1108,1203,1204,1212,1213,1214,1215,1216,1217,1218,1219,1220,1306,1307,1308,1435,1436,1525,1526,1528,1529,1600,1756,1757,1758,1786,1787,1828,1829,1830,1847,1869,
      ],
     },
    :砂漠 => {
      :tag => 2,
      :map_id => [114,115,116,117,307,379,380,381,393,397,404,405,407,408,409,410,411,412,413,414,445,449,653,655,662,676,677,688,695,769,786,1221,1222,1223,1224,1225,1226,1227,
        1228,1229,1230,1231,1233,1234,1235,1236,1237,1238,1239,1240,1241,1309,1310,1311,1639,1640,1641,1642,1743,1822,1810,1877,1924,
      ],
    },
    :海 => {
      :tag => 3,
      :map_id => [
        124,127,131,369,370,371,372,373,376,478,479,671,672,685,689,690,696,701,762,776,763,784,796,825,1428,1498,1499,1592,1740,1741,1750,1915,1920,1922,1923,
      ],
    },
    :深海 => {
      :tag => -1,
      :map_id => [145,146,147,148,149,659,809,1083,1084,1085,1175,1176,1232,1267,1268,1279,1514,1910,1932,1933,1934,1935,
      ],
    },
    :洞窟 => {
      :tag => -1,
      :map_id => [17,18,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,150,155,156,157,158,160,161,163,165,166,175,192,198,204,
         210,214,231,232,233,234,236,239,241,243,245,247,258,259,261,263,265,266,267,283,284,285,286,287,288,289,290,328,330,364,365,366,367,368,398,399,400,401,402,403,
         444,447,448,449,454,475,643,647,656,657,658,664,699,700,704,795,796,798,799,801,805,806,807,808,812,821,822,
         1150,1151,1152,1155,1210,1242,1243,1244,1245,1246,1247,1248,1249,1255,1256,1257,1258,1259,1260,1261,1262,1332,1357,1358,1359,
         1576,1582,1584,1590,1591,1593,1594,1599,1602,1610,1611,1613,1626,1628,1629,1630,1633,1645,1716,1717,1718,1719,1720,1721,1724,1725,1726,1727,1732,1733,1735,1737,1746,1747,1748,1931,
      ],
    },
    :市街 => {
      :tag => -1,
      :map_id => [
         23,29,33,45,46,55,56,164,176,177,185,219,225,226,279,280,338,359,360,361,362,363,378,387,388,389,483,484,513,515,616,624,667,679,680,681,682,683,684,686,
        687,688,689,690,691,692,693,694,695,697,698,719,720,721,722,723,742,762,763,764,765,766,768,770,771,776,777,778,779,783,785,789,815,829,
        1003,1004,1007,1008,1009,1022,1023,1026,1027,1030,1031,1032,1038,1043,1044,1045,1046,1049,1058,1059,1060,1061,1062,1063,1071,1086,1087,1088,1097,1098,1099,1100,1101,
        1102,1103,1104,1106,1109,1112,1115,1116,1118,1127,1128,1129,1156,1157,1158,1159,1160,1161,1163,1164,1199,1200,1250,1251,1252,1253,1254,1263,1264,1265,1266,1269,1270,1271,1371,1372,1373,1374,
        1449,1450,1453,1465,1469,1475,1482,1497,1503,1516,1517,1519,1532,1538,1570,1572,1597,1617,1618,1634,1635,1636,1637,1644,1646,1647,1648,1649,1653,1662,1667,1670,1671,1680,1685,1691,1696,
        1701,1708,1710,1711,1765,1807,1855,1867,1868,1869,1872,1873,1875,1877,1879,1884,1895,1904,1907,1916,1917,1918,1919,1921,1925,1977,1978,1980,
      ],
    },
  }   
end

# 視界制限　設定項目
module TMBLSIGHT
  # 何番のマップをどれだけ視界制限するか
  # 例）SIGHT[3] = 128  # ３番のマップの視界を128ドット四方に制限する
  SIGHT = {}
  SIGHT[94] = 350
  SIGHT[234] = 350
  SIGHT[236] = 350
  SIGHT[265] = 350
  SIGHT[258] = 350
  SIGHT[259] = 350
  SIGHT[261] = 350
  SIGHT[263] = 350
  SIGHT[239] = 350
  SIGHT[175] = 350
  SIGHT[241] = 350
  SIGHT[243] = 350
  SIGHT[245] = 350
  SIGHT[247] = 350
  SIGHT[1610] = 350
  SIGHT[1611] = 350
  SIGHT[1732] = 350
  SIGHT[1733] = 350
  SIGHT[1735] = 350
  SIGHT[1737] = 350

  VN_SIGHT = 2    # 視界のサイズ補正に利用するゲーム変数番号
end

module NWConst::Numeric
  # 無量大数以降に使用する単位
  # 例:["単位１","単位２"]の場合、無量大数の10000倍が単位１、更に10000倍が単位２
  ADD_UNIT = ["■■","■"]
end

