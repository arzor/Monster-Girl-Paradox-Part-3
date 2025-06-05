=begin
=娯楽/ポーカー改造

CACAO SOFT「ポーカー」を改造　元スクリプトの設定項目は使わず、全てここで設定
改造点は「トリス修正H ver4」を参照　元ポーカーの 714～715 行目の無効化(#)必須

==更新履歴
  Date     Version Author Comment
==14/12/19 2.0.1   トリス 統合F～I H移植
==15/09/03 2.0.2   トリス 統合J～U J L O

=end

#==============================================================================
# ◆ 設定項目
#==============================================================================
module CAO::Poker
  #--------------------------------------------------------------------------
  # ◆ 役名と倍率（配当金）の表示X座標を調整　マイナスで左、プラスで右に移動
  #    [左の役, 左の倍率, 右の役, 右の倍率]
  #--------------------------------------------------------------------------
  HANDS_X        = [0, -20, -20, 0]   # 通常のポーカー
  BATTLE_HANDS_X = [0,   0, -20, 0]   # スキルのポーカー　倍率は不使用
  #--------------------------------------------------------------------------
  # ◆ ポーカースキル中の操作説明
  #--------------------------------------------------------------------------
  BATTLE_HELP = "\\C[2]<key_c> key:\\C[0] Flip selected card　\\C[2]<key_b> key:\\C[0] Replace face-down cards"
  #--------------------------------------------------------------------------
  # ◆ ポーカースキルの発動スキルID
  #--------------------------------------------------------------------------
  BATTLE_SKILL = [3247, 3248, 3249, 3250, 3251, 3252,
                        3253, 3254, 3255, 3256, 3257]
  #--------------------------------------------------------------------------
  # ◇ start_pokerで指定しなかった場合　掛け金で最初に表示される枚数
  #--------------------------------------------------------------------------
  DEFAULT_COIN = 100
  #--------------------------------------------------------------------------
  # ◇ start_pokerで指定しなかった場合　掛け金の増減数
  #--------------------------------------------------------------------------
  BET_RATE = 10
  #--------------------------------------------------------------------------
  # ◇ start_pokerで指定しなかった場合　掛け金の最大枚数
  #--------------------------------------------------------------------------
  MAX_BET = 100
  #--------------------------------------------------------------------------
  # ◇ 掛け金の増加量 ( n 倍)
  #--------------------------------------------------------------------------
  DIVIDEND_COVER = [0, 1, 2, 3, 5, 7, 10, 30, 50, 100, 300]
  #--------------------------------------------------------------------------
  # ◇ 配当金の下三桁が 000 の場合 K と表示する
  #--------------------------------------------------------------------------
  ADDR_DIVIDEND = true
  #--------------------------------------------------------------------------
  # ◇ 役の名前　１番目(ハイカード)は画面に表示されない
  #--------------------------------------------------------------------------
  VOCAB_HANDS = [ "High card", "One pair", "Two pair", "Three of a kind",
                  "Straight", "Flush", "Full House", "Four of a kind",
                  "Straight Flush", "Five of a kind",
                  "Royal Flush"]
  #--------------------------------------------------------------------------
  # ◇ 掛け金の名称と単位
  #--------------------------------------------------------------------------
  VOCAB_COIN = "Balance"
  VOCAB_COIN_U = " coins"
  #--------------------------------------------------------------------------
  # ◇ 掛け金選択時のメッセージ
  #--------------------------------------------------------------------------
  VOCAB_BET  = "Please set your wager"
  #--------------------------------------------------------------------------
  # ◇ １ゲーム終了後のメッセージ
  #--------------------------------------------------------------------------
  VOCAB_WIN  = "Congratulations.\n You won \\C[14]%s\\C[0] coins."
  VOCAB_LOSE = "That's too bad.\nYou lost and got \\C[14]%s\\C[0] coins."
  #--------------------------------------------------------------------------
  # ◇ ヘルプウィンドウの文章
  #--------------------------------------------------------------------------
  VOCAB_HELP = "\\C[2]<key_a>\\C[0] : Game description"
  #--------------------------------------------------------------------------
  # ◇ ゲームの説明
  #--------------------------------------------------------------------------
  MANUAL_LINE = 11            # 行数
  TEXT_MANUAL = <<-'[EOS]'    # 文章 (次の行から [EOS] まで)
\C[16]＜Setting the amount of your bid＞\C[0]
 ・\C[2]↑/↓ key\C[0] Increase/decrease your bid
 ・\C[2]<key_c> key\C[0] Confirm your bid and start the game
 ・\C[2]<key_b> key\C[0] Cancel

\C[16]＜Card selection＞\C[0]
 ・\C[2]←/→ key\C[0] Change the highlighted card
 ・\C[2]<key_c> key\C[0] Flip the selected card
 ・\C[2]<key_b> key\C[0] Replace face-down cards and confirm your hand
 
  [EOS]
  #--------------------------------------------------------------------------
  # ◇ 効果音
  #--------------------------------------------------------------------------
  SOUND_START   = "Flash2"      # カードを表にして選択可能になったとき
  SOUND_WIN     = "mon_fanfale" # 役あり
  SOUND_LOSE    = "Down1"       # 役なし
  SOUND_BET     = "Shop"        # 掛け金を決定したとき
  SOUND_COIN    = "Coin"        # 掛け金を変更したとき
  SOUND_DEAL    = "Book2"       # 手札を配るとき
  SOUND_SLOUGH  = "Book2"       # 手札を捨てるとき
  SOUND_REVERSE = "Book1"       # カードを裏返すとき
  SOUND_CHANGE  = "Book2"       # 裏のカードを交換するとき
end
# 設定項目ここまで


# ：：このスクリプトで設定するための再定義
#==============================================================================
# ■ Sound
#==============================================================================
module Sound
  #--------------------------------------------------------------------------
  # ● 再生メソッドの作成
  #--------------------------------------------------------------------------
  def self.define_poker_sound(method_name, file_name)
    if file_name.empty?
      instance_eval %Q{
        def #{method_name}
        end
      }
    else
      instance_eval %Q{
        @#{method_name} = RPG::SE.new(file_name, #{NWConst::Casino::VOLUME_POKER_OTHER})
        def #{method_name}
          @#{method_name}.play
        end
      }
    end
  end
  #--------------------------------------------------------------------------
  # ● ポーカーの効果音
  #--------------------------------------------------------------------------
  define_poker_sound :play_poker_start,   CAO::Poker::SOUND_START
  define_poker_sound :play_poker_lose,    CAO::Poker::SOUND_LOSE
  define_poker_sound :play_poker_bet,     CAO::Poker::SOUND_BET
  define_poker_sound :play_poker_coin,    CAO::Poker::SOUND_COIN
  define_poker_sound :play_poker_deal,    CAO::Poker::SOUND_DEAL
  define_poker_sound :play_poker_slough,  CAO::Poker::SOUND_SLOUGH
  define_poker_sound :play_poker_reverse, CAO::Poker::SOUND_REVERSE
  define_poker_sound :play_poker_change,  CAO::Poker::SOUND_CHANGE
end

# ：：競合エラーの対策
#==============================================================================
# ■ Game_Poker
#==============================================================================
class Game_Poker
  # Game_Poker生成でエラーが出ないようにするための暫定対処
  # スクリプト統合時は create_game_objects 側でGame_Pokerの生成をなくす
end

# ：：カジノコイン（スロット）とのコイン共通化
#==============================================================================
# ■ CAO::Poker
#==============================================================================
class << CAO::Poker
  #--------------------------------------------------------------------------
  # ● 所持コインの枚数を取得
  #--------------------------------------------------------------------------
  def coin
    return $game_party.coin
  end
  #--------------------------------------------------------------------------
  # ● コインの増加（減少）
  #--------------------------------------------------------------------------
  def gain_coin(amount)
    $game_party.gain_coin(amount)
  end
end

# ：：賭け金の設定範囲を、ポーカー台別に設定できるように
#==============================================================================
# ■ Game_Temp
#==============================================================================
class Game_Temp
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :poker_default_coin
  attr_accessor :poker_bet_rate
  attr_accessor :poker_max_bet
end
#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ● ポーカー起動
  #--------------------------------------------------------------------------
  def start_poker(max_bet = nil, bet_rate = nil, default_coin = nil)
    max_bet      ||= CAO::Poker::MAX_BET
    bet_rate     ||= CAO::Poker::BET_RATE
    default_coin ||= CAO::Poker::DEFAULT_COIN
    $game_temp.poker_max_bet       = max_bet
    $game_temp.poker_bet_rate      = bet_rate
    $game_temp.poker_default_coin  = default_coin
    SceneManager.call(Scene_Poker)
    Fiber.yield
  end
end
#==============================================================================
# ■ Window_PokerBet
#==============================================================================
class Window_PokerBet < Window_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0, 272, fitting_height(2))
    self.viewport = viewport
    @digits_max = $game_temp.poker_max_bet % 10 + 1
    self.openness = 0
    deactivate
    reset
  end
  #--------------------------------------------------------------------------
  # ● リセット
  #--------------------------------------------------------------------------
  def reset
    @count = 0
    @number = $game_temp.poker_default_coin
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 数字の変更処理
  #--------------------------------------------------------------------------
  def process_digit_change
    return unless open? && active
    if Input.repeat?(:UP) || Input.repeat?(:DOWN)
      last_number = @number
      if @count < 3
        @count += 1
        @number += $game_temp.poker_bet_rate if Input.repeat?(:UP)
        @number -= $game_temp.poker_bet_rate if Input.repeat?(:DOWN)
      else
        @number += $game_temp.poker_bet_rate * 10 if Input.repeat?(:UP)
        @number -= $game_temp.poker_bet_rate * 10 if Input.repeat?(:DOWN)
      end
      @number = $game_temp.poker_bet_rate if @number < $game_temp.poker_bet_rate
      @number = $game_temp.poker_max_bet if $game_temp.poker_max_bet < @number
      if @number != last_number
        Sound.play_poker_coin
        refresh
      end
    else
      @count = 0
    end
  end
end

# ：：ヘルプウインドウの文章 VOCAB_HELP を制御文字(\\C[2]など)に対応
# ：：操作説明のキー表示をコンフィグの「ボタン説明文」の機能に対応
#==============================================================================
# ■ Window_Base
#==============================================================================
class Window_Base < Window
  #--------------------------------------------------------------------------
  # ● ボタンの置換
  #--------------------------------------------------------------------------
  def vocab_key_text(text)
    return text.gsub(/<(\S{5})>/) { eval("Vocab.#{$1}") }
  end
end
#==============================================================================
# ■ Window_PokerManual
#==============================================================================
class Window_PokerManual < Window_Base
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    text = CAO::Poker::TEXT_MANUAL.gsub(/<(\S{5})>/) { eval("Vocab.#{$1}") }
    draw_text_ex(0, 0, text)
  end
end
#==============================================================================
# ■ Window_PokerHelp
#==============================================================================
class Window_PokerHelp < Window_Base
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    text = CAO::Poker::VOCAB_HELP.gsub(/<(\S{5})>/) { eval("Vocab.#{$1}") }
    draw_text_ex(0, 0, text)
  end
end

# ：：役名と倍率（配当金）の表示X座標を調整する設定項目 HANDS_X を追加
# ：：カード画像を"Graphics/System"フォルダではなく"Graphics/Casino"フォルダに
# ：：ジョーカーを追加　役にファイブカードを追加しハイカードの表示を消去
#==============================================================================
# ■ Window_PokerHands
#==============================================================================
class Window_PokerHands < Window_Base
  #--------------------------------------------------------------------------
  # ● 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    item_index = index + 1
    rect = Rect.new(0, 0, self.item_width, self.line_height)
    rect.y = (index % 5) * rect.height
    change_color(@index == item_index ? text_color(18) : normal_color)
    
    rect.x = (index / 5) * (rect.width + self.space) + hands_x[index / 5 * 2]
    draw_text(rect, CAO::Poker::VOCAB_HANDS[item_index])
    
    rect.x = (index / 5) * (rect.width + self.space) + hands_x[index / 5 * 2 + 1]
    draw_text(rect, prize_s(item_index), 2)
  end
  #--------------------------------------------------------------------------
  # ● HANDS_X の取得
  #--------------------------------------------------------------------------
  def hands_x
    CAO::Poker::HANDS_X
  end
end
#==============================================================================
# ■ Sprite_PokerTrump
#==============================================================================
class Sprite_PokerTrump < Sprite
  #--------------------------------------------------------------------------
  # ● 定数
  #--------------------------------------------------------------------------
  CARD_WIDTH  = Cache.casino("PokerTrump").width  / 14
  CARD_HEIGHT = Cache.casino("PokerTrump").height / 4
  #--------------------------------------------------------------------------
  # ● カードの裏柄
  #--------------------------------------------------------------------------
  def create_backface
    @backface = Bitmap.new(CARD_WIDTH, CARD_HEIGHT)
    @backface.blt(0, 0, Cache.casino("PokerTrump"),
      Rect.new(CARD_WIDTH * 13, CARD_HEIGHT * 0, CARD_WIDTH, CARD_HEIGHT))
    self.bitmap = @backface
  end
  #--------------------------------------------------------------------------
  # ● カードを設定
  #--------------------------------------------------------------------------
  def trump=(trump)
    return if @trump == trump
    @trump = trump
    @trump_bitmap.dispose if @trump_bitmap
    @trump_bitmap = Bitmap.new(CARD_WIDTH, CARD_HEIGHT)
    rect = Rect.new(0, 0, CARD_WIDTH, CARD_HEIGHT)
    if @trump.joker?
      rect.x = CARD_WIDTH * 13
      rect.y = CARD_HEIGHT * 1
    else
      rect.x = CARD_WIDTH * (trump.number - 1)
      rect.y = CARD_HEIGHT * trump.suit
    end
    @trump_bitmap.blt(0, 0, Cache.casino("PokerTrump"), rect)
  end
end
#==============================================================================
# ■ CAO::Poker::Trump
#==============================================================================
class CAO::Poker::Trump
  #--------------------------------------------------------------------------
  # ● オブジェクトの初期化
  #--------------------------------------------------------------------------
  def initialize(suit, number)
    number = 1 if suit == 4
    @suit = suit
    @number = number
  end
  #--------------------------------------------------------------------------
  # ● ジョーカーかどうか
  #--------------------------------------------------------------------------
  def joker?
    @suit == 4
  end
end
#==============================================================================
# ■ CAO::Poker::Hand
#==============================================================================
class CAO::Poker::Hand
  #--------------------------------------------------------------------------
  # ● 
  #--------------------------------------------------------------------------
  @@deck = Array.new(13 * 4 + 1) {|i| CAO::Poker::Trump.new(i/13, i%13+1) }.freeze
  #--------------------------------------------------------------------------
  # ● 役の判定
  #--------------------------------------------------------------------------
  def final
    sort! # 役を判定する前に手札のソートが必要
    return (@hand.any? {|card| card.joker? }) ? final_joker : final_normal
  end
  #--------------------------------------------------------------------------
  # ● 役の判定　ジョーカーなし
  #--------------------------------------------------------------------------
  def final_normal
    edge_straight   = _hand_edge_straight?
    straight        = _hand_straight?
    flush           = _hand_flush?
    pairs           = _hand_pairs
    pair_max        = pairs.max
    pair_min        = pairs.min
    pair_cnt        = pairs.count(pair_max)
    
    return 10 if edge_straight  && flush          # ロイヤルストレートフラッシュ
    return  8 if straight       && flush          # ストレートフラッシュ
    return  7 if pair_max == 4                    # フォーカード
    return  6 if pair_max == 3  && pair_min == 2  # フルハウス
    return  5 if flush                            # フラッシュ
    return  4 if straight                         # ストレート
    return  3 if pair_max == 3  && pair_min == 1  # スリーカード
    return  2 if pair_max == 2  && pair_cnt == 4  # ツーペア
    return  1 if pair_max == 2                    # ワンペア
    return  0                                     # ハイカード
  end
  #--------------------------------------------------------------------------
  # ● 役の判定　ジョーカーあり
  #--------------------------------------------------------------------------
  def final_joker
    @hand.delete_if {|card| card.joker? }
    edge_straight   = _hand_joker_edge_straight?
    straight        = _hand_joker_straight?
    flush           = _hand_flush?
    pairs           = _hand_pairs
    pair_max        = pairs.max
    pair_min        = pairs.min
    pair_cnt        = pairs.count(pair_max)
    
    return 10 if edge_straight  && flush          # ロイヤルストレートフラッシュ
    return  9 if pair_max == 4                    # ファイブカード(フォーカード)
    return  8 if straight       && flush          # ストレートフラッシュ
    return  7 if pair_max == 3                    # フォーカード(スリーカード)
    return  6 if pair_max == 2  && pair_cnt == 4  # フルハウス(ツーペア)
    return  5 if flush                            # フラッシュ
    return  4 if straight                         # ストレート
    return  3 if pair_max == 2                    # スリーカード(ワンペア)
    return  1                                     # ワンペア
  end
  #--------------------------------------------------------------------------
  # ● 端つながり[1, 10, 11, 12, 13]のストレートの判定　ジョーカーなし
  #--------------------------------------------------------------------------
  def _hand_edge_straight?
    list = [1, 10, 11, 12, 13]
    @hand.each {|card| list.delete(card.number) }
    return list.size == 0
  end
  #--------------------------------------------------------------------------
  # ● 端つながり[1, 10, 11, 12, 13]のストレートの判定　ジョーカーあり
  #--------------------------------------------------------------------------
  def _hand_joker_edge_straight?
    list = [1, 10, 11, 12, 13]
    @hand.each {|card| list.delete(card.number) }
    return list.size == 1
  end
  #--------------------------------------------------------------------------
  # ● ストレートの判定　ジョーカーなし
  #--------------------------------------------------------------------------
  def _hand_straight?
    return true if _hand_edge_straight?
    @hand.each_with_index do |card,i|
      return false if card.number - @hand[0].number != i
    end
    return true
  end
  #--------------------------------------------------------------------------
  # ● ストレートの判定　ジョーカーあり
  #--------------------------------------------------------------------------
  def _hand_joker_straight?
    return true if _hand_joker_edge_straight?
    for i in 1..9
      list = [i, i+1, i+2, i+3, i+4]
      @hand.each {|card| list.delete(card.number) }
      return true if list.size == 1
    end
    return false
  end
  #--------------------------------------------------------------------------
  # ● フラッシュの判定
  #--------------------------------------------------------------------------
  def _hand_flush?
    return @hand.all? {|card| card.suit == @hand[0].suit }
  end
  #--------------------------------------------------------------------------
  # ● ペア数を配列で取得 (重複する)
  #--------------------------------------------------------------------------
  def _hand_pairs
    return @hand.map {|c1| @hand.count{|c2| c1.number == c2.number } }
  end
end

# ：：<スロットチャンス N> のキャラがいるとジョーカーを引く確率が増加
#==============================================================================
# ■ CAO::Poker::Hand
#==============================================================================
class CAO::Poker::Hand
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    @stock = @@deck.shuffle
    @hand = []
    5.times {|i| draw_card(i) }
  end
  #--------------------------------------------------------------------------
  # ● カード交換
  #--------------------------------------------------------------------------
  def change(index)
    draw_card(index)
  end
  #--------------------------------------------------------------------------
  # ● カードを引く
  #--------------------------------------------------------------------------
  def draw_card(index)
    $game_party.slot_chance.times do |i|
      break if @hand.any? {|card| card.joker? }
      break if @stock[-1].joker?
      @stock.shuffle!
    end
    @hand[index] = @stock.pop
  end
end

# ：：背景画像を "Graphics/Casino/casino_bg.png" に
#==============================================================================
# ■ Scene_Poker
#==============================================================================
class Scene_Poker < Scene_MenuBase
  #--------------------------------------------------------------------------
  # ● 背景の作成
  #--------------------------------------------------------------------------
  def create_background
    @background_sprite = Sprite.new
    @background_sprite.bitmap = Cache.casino("casino_bg")
  end
end
# ：：ポーカースキル
#==============================================================================
# ■ Scene_Battle
#==============================================================================
class Scene_Battle < Scene_Base
  #--------------------------------------------------------------------------
  # ● ポーカーの処理
  #--------------------------------------------------------------------------
  def process_poker
    @battlepoker_help_window = Window_BattlePokerHelp.new
    @battlepoker_help_window.y = 0
    @battlepoker_hands_window = Window_BattlePokerHands.new
    @battlepoker_hands_window.y = @battlepoker_help_window.height
    viewport = Viewport.new
    viewport.rect.y = @battlepoker_hands_window.y +
                      @battlepoker_hands_window.height - 48
    viewport.rect.height -= viewport.rect.y + @battlepoker_help_window.height
    @battlepoker_spriteset = Spriteset_PokerTrump.new(viewport)
    @battlepoker_spriteset.set_handler(:cancel, method(:battlepoker_change_card))
    
    @battlepoker_hand = CAO::Poker::Hand.new
    @battlepoker_spriteset.deal(@battlepoker_hand)
    @battlepoker_spriteset.open
    @battlepoker_spriteset.select(0)
    @battlepoker_spriteset.activate
    
    while @battlepoker_spriteset.active
      update_basic
      @battlepoker_spriteset.update
    end
    60.times do
      update_basic
      @battlepoker_spriteset.update
    end
    sound = 
      case @battlepoker_hands_window.index
      when 0;     NWConst::Casino::SE_LOSE
      when 1..2;  NWConst::Casino::SE_WIN1
      when 3..6;  NWConst::Casino::SE_WIN2
      when 7..9;  NWConst::Casino::SE_WIN3
      when 10;    NWConst::Casino::SE_WIN4
      end
    CasinoManager.process_sound(:poker, @battlepoker_hands_window.index, method(:abs_wait))
    CasinoManager.process_medal(:poker, @battlepoker_hands_window.index, 1)
    
    result_skill_id = CAO::Poker::BATTLE_SKILL[@battlepoker_hands_window.index]
    
    @battlepoker_hands_window.dispose
    @battlepoker_help_window.dispose
    @battlepoker_spriteset.dispose
    remove_instance_variable(:@battlepoker_hands_window)
    remove_instance_variable(:@battlepoker_help_window)
    remove_instance_variable(:@battlepoker_spriteset)
    remove_instance_variable(:@battlepoker_hand)
    
    return result_skill_id
  end
  #--------------------------------------------------------------------------
  # ● カード交換
  #--------------------------------------------------------------------------
  def battlepoker_change_card
    @battlepoker_spriteset.unselect
    @battlepoker_spriteset.reversed_indexes.each {|index| @battlepoker_hand.change(index) }
    @battlepoker_spriteset.open(@battlepoker_hand)
    @battlepoker_hands_window.index = @battlepoker_hand.final
  end
end
#==============================================================================
# ■ Window_BattlePokerHelp
#==============================================================================
class Window_BattlePokerHelp < Window_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    h = fitting_height(1)
    super(0, Graphics.height - h, Graphics.width, h)
    refresh
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    text = vocab_key_text(CAO::Poker::BATTLE_HELP)
    draw_text_ex(0, 0, text)
  end
end
#==============================================================================
# ■ Window_BattlePokerHands
#==============================================================================
class Window_BattlePokerHands < Window_PokerHands
  #--------------------------------------------------------------------------
  # ● 倍率か配当金の文字列
  #--------------------------------------------------------------------------
  def prize_s(index)
    ""
  end
  #--------------------------------------------------------------------------
  # ● HANDS_X の取得
  #--------------------------------------------------------------------------
  def hands_x
    CAO::Poker::BATTLE_HANDS_X
  end
end

# ：：テストプレイ時の自由なカード変更
#==============================================================================
# ■ Spriteset_PokerTrump
#==============================================================================
class Spriteset_PokerTrump
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  alias :nw_test_poker_update :update
  def update
    nw_test_poker_update
    return unless $TEST
    if self.active
      SceneManager.scene.test_poker_send(:test_up)   if Input.repeat?(:UP)
      SceneManager.scene.test_poker_send(:test_down) if Input.repeat?(:DOWN)
      SceneManager.scene.test_poker_send(:test_l)    if Input.repeat?(:L)
      SceneManager.scene.test_poker_send(:test_r)    if Input.repeat?(:R)
    end
  end
  #--------------------------------------------------------------------------
  # ● テスト　カード再配置
  #--------------------------------------------------------------------------
  def test_deal(hand, i)
    @card_sprites[i].trump = hand[i]
    @card_sprites[i].instance_eval { self.bitmap = @trump_bitmap }
  end
end
#==============================================================================
# ■ Scene_Poker
#==============================================================================
class Scene_Poker < Scene_MenuBase
  #--------------------------------------------------------------------------
  # ● テスト　カード変更
  #--------------------------------------------------------------------------
  def test_poker_send(symbol)
    i = @spriteset.index
    @hand.instance_eval { @stock.unshift(self[i]) }
    @hand.send(symbol, i)
    @hand.instance_eval { @stock.delete_if {|card| card.id == self[i].id } }
    @spriteset.test_deal(@hand, i)
  end
end
#==============================================================================
# ■ Scene_Battle
#==============================================================================
class Scene_Battle < Scene_Base
  #--------------------------------------------------------------------------
  # ● テスト用　カード変更
  #--------------------------------------------------------------------------
  def test_poker_send(symbol)
    i = @battlepoker_spriteset.index
    @battlepoker_hand.instance_eval { @stock.unshift(self[i]) }
    @battlepoker_hand.send(symbol, i)
    @battlepoker_hand.instance_eval { @stock.delete_if {|card| card.id == self[i].id } }
    @battlepoker_spriteset.test_deal(@battlepoker_hand, i)
  end
end
#==============================================================================
# ■ CAO::Poker::Hand
#==============================================================================
class CAO::Poker::Hand
  def test_up(i)
    send(:test_card_number, i,  1)
    send(:test_card_number, i,  1) while test_on_loop?(i)
  end
  def test_down(i)
    send(:test_card_number, i, -1)
    send(:test_card_number, i, -1) while test_on_loop?(i)
  end
  def test_l(i)
    last_n = @hand[i].number
    send(:test_card_suit,   i, -1)
    if @hand[i].joker? and test_on_loop?(i)
      @hand[i] = CAO::Poker::Trump.new(3, last_n)
    end
    send(:test_card_number, i,  1) while test_on_loop?(i)
  end
  def test_r(i)
    last_n = @hand[i].number
    send(     :test_card_suit,   i,  1)
    if @hand[i].joker? and test_on_loop?(i)
      @hand[i] = CAO::Poker::Trump.new(0, last_n)
    end
    send(:test_card_number, i,  1) while test_on_loop?(i)
  end
  def test_card_number(i, plus)
    s = @hand[i].suit
    n = @hand[i].number + plus
    n =  1 if n == 14
    n = 13 if n ==  0
    @hand[i] = CAO::Poker::Trump.new(s, n)
  end
  def test_card_suit(i, plus)
    s = @hand[i].suit + plus
    n = @hand[i].number
    s =  0 if s ==  5
    s =  4 if s == -1
    @hand[i] = CAO::Poker::Trump.new(s, n)
  end
  def test_on_loop?(i)
    return (@hand.count {|c2| @hand[i].id == c2.id }) == 2
  end
end

# ：：メッセージ表示を改造
#==============================================================================
# ■ Scene_Poker
#==============================================================================
class Scene_Poker < Scene_MenuBase
  #--------------------------------------------------------------------------
  # ● 勝利の表示
  #--------------------------------------------------------------------------
  def show_mes_win
    show_mes_result(true)
  end
  #--------------------------------------------------------------------------
  # ● 敗北の表示
  #--------------------------------------------------------------------------
  def show_mes_lose
    show_mes_result(false)
  end
  #--------------------------------------------------------------------------
  # ● 結果の表示
  #--------------------------------------------------------------------------
  def show_mes_result(win)
    if win
      CAO::Poker.gain_coin(@hands_window.prize)
      @coin_window.refresh
      @message_window.set_text(CAO::Poker::VOCAB_WIN % @hands_window.prize)
    else
      @message_window.set_text(CAO::Poker::VOCAB_LOSE % @hands_window.prize)
    end
    @message_window.arrows_visible = false
    @message_window.open.deactivate
    CasinoManager.process_sound(:poker, @hands_window.index, method(:abs_wait))
    CasinoManager.process_medal(:poker, @hands_window.index, 0)
    @message_window.arrows_visible = true
    @message_window.activate
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新（ウェイト用）
  #--------------------------------------------------------------------------
  def abs_wait(duration)
    duration.times { update_basic }
  end
end
#==============================================================================
# ■ Window_PokerMessage
#==============================================================================
class Window_PokerMessage < Window_Base
  #--------------------------------------------------------------------------
  # ● ウィンドウ内容の高さを計算
  #--------------------------------------------------------------------------
  def contents_height
    super + 1
  end
end