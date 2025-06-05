#==============================================================================
# ■ CutIn
#==============================================================================
class CutIn
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(type, pic_name, se_name = nil)
    @type     = type
    @pic_name = pic_name
    @se = RPG::SE.new(se_name) if se_name
  end

  #--------------------------------------------------------------------------
  # ● ウェイト
  #--------------------------------------------------------------------------
  def wait(duration)
    @wait_method.call(duration) if @wait_method
  end

  #--------------------------------------------------------------------------
  # ● 効果音の実行
  #--------------------------------------------------------------------------
  def se_play
    @se.play if @se
  end

  #--------------------------------------------------------------------------
  # ● 画面系コマンドの対象を取得
  #--------------------------------------------------------------------------
  def screen
    if $game_party.in_battle
      $game_troop.screen
    elsif $game_party.in_novel
      $game_novel.screen
    else
      $game_map.screen
    end
  end

  #--------------------------------------------------------------------------
  # ● 表示
  #--------------------------------------------------------------------------
  def show(num, x, y, ori = 0, zx = 100, zy = 100, op = 255, bl = 0)
    screen.pictures[num].show(@pic_name, ori, x, y, zx, zy, op, bl)
  end

  #--------------------------------------------------------------------------
  # ● 移動
  #--------------------------------------------------------------------------
  def move(num, x, y, dur, ori = 0, zx = 100, zy = 100, op = 255, bl = 0, wait = false)
    screen.pictures[num].move(ori, x, y, zx, zy, op, bl, dur)
    wait(dur) if wait
  end

  #--------------------------------------------------------------------------
  # ● 回転
  #--------------------------------------------------------------------------
  def rotate(num, spd)
    screen.pictures[num].rotate(spd)
  end

  #--------------------------------------------------------------------------
  # ● 色調変更
  #--------------------------------------------------------------------------
  def tone_change(num, tone, dur, wait = false)
    screen.pictures[num].start_tone_change(tone, dur)
    wait(dur) if wait
  end

  #--------------------------------------------------------------------------
  # ● 消去
  #--------------------------------------------------------------------------
  def erase(num)
    screen.pictures[num].erase
  end

  #--------------------------------------------------------------------------
  # ● 実行
  #--------------------------------------------------------------------------
  def execute(wait_method)
    @wait_method = wait_method
    send("execute_#{@type}".to_sym)
  end

  #--------------------------------------------------------------------------
  # ● 実行（基本）
  #--------------------------------------------------------------------------
  def execute_basic
    se_play
    show(20, 0, 0, 0, 100, 100, 0)
    move(20, 0, 0, 15, 0, 100, 100, 255, 0, true)
    wait(30)
    move(20, 0, 0, 15, 0, 100, 100, 0, 0, true)
    erase(20)
  end

  #--------------------------------------------------------------------------
  # ● 実行（スライド）
  #--------------------------------------------------------------------------
  def execute_slide
    se_play
    show(20, Graphics.width / 10, 0, 0, 100, 100, 0)
    move(20, 0, 0, 15, 0, 100, 100, 255, 0, true)
    wait(30)
    move(20, Graphics.width / 10, 0, 15, 0, 100, 100, 0, 0, true)
    erase(20)
  end

  #--------------------------------------------------------------------------
  # ● 実行（フォーカス）
  #--------------------------------------------------------------------------
  def execute_focus
    se_play
    show(20, 0, 0, 0, 110, 110, 64, 0)
    show(19, 0, 0, 0, 120, 120, 32, 0)
    show(18, 0, 0, 0, 130, 130, 0, 0)
    move(20, 0, 0, 15, 0, 100, 100, 0, 0, false)
    move(19, 0, 0, 15, 0, 100, 100, 0, 0, false)
    move(18, 0, 0, 15, 0, 100, 100, 255, 0, true)
    wait(30)
    move(20, 0, 0, 15, 0, 110, 110, 64, 0, false)
    move(19, 0, 0, 15, 0, 120, 120, 32, 0, false)
    move(18, 0, 0, 15, 0, 130, 130, 0, 0, true)
    erase(20)
    erase(19)
    erase(18)
  end

  #--------------------------------------------------------------------------
  # ● 実行（ロング）
  #--------------------------------------------------------------------------
  def execute_long
    se_play
    show(20, 0, 0, 0, 100, 100, 0, 0)
    move(20, 0, 0, 15, 0, 100, 100, 255, 0, true)
    wait(30)
  end
end

#==============================================================================
# ■ Word
#==============================================================================
class Word
  attr_accessor :common
  attr_accessor :condition
  attr_accessor :face_hue

  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(word_data, face_name, face_index, face_hue = 0)
    @words = word_data.split("\\n")
    @face_name = face_name
    @face_index = face_index
    @face_hue = face_hue
  end

  #--------------------------------------------------------------------------
  # ● 実行
  #--------------------------------------------------------------------------
  def execute
    $game_message.face_name = @face_name
    $game_message.face_index = @face_index
    $game_message.face_hue = @face_hue
    $game_message.background = 0
    $game_message.position = 2
    @words.each { |line| $game_message.add(line) }
  end

  def replace_name(b, a)
    return if @common

    @words.map! do |line|
      line.gsub(/【#{b}】/, "【#{a}】")
    end
  end
end

#==============================================================================
# ■ Game_Battler
#==============================================================================
class Game_Battler < Game_BattlerBase
  #--------------------------------------------------------------------------
  # ● スキルセリフデータ格納ハッシュの取得
  #--------------------------------------------------------------------------
  def skill_word_hash
    NWConst::Actor::SKILL_WORDS[word_id]
  end

  #--------------------------------------------------------------------------
  # ● ダウンセリフデータ格納ハッシュの取得
  #--------------------------------------------------------------------------
  def down_word_hash
    if actor?
      data = NWConst::Actor::DOWN_WORDS
      data.key?(id) ? data[id] : nil
    else
      data = NWConst::Enemy::DOWN_WORDS
      word_id = $data_enemies[id].base_enemy.id
      data.fetch(word_id, nil)
    end
  end

  #--------------------------------------------------------------------------
  # ● スキルセリフが存在する？
  #--------------------------------------------------------------------------
  def exist_skill_word?(skill_id)
    return false unless skill_word_hash

    !skill_word(skill_id).nil?
  end

  #--------------------------------------------------------------------------
  # ● スキルワーズの取得
  #--------------------------------------------------------------------------
  def skill_words(skill_id)
    skey = skill_word_hash.keys.select do |skey|
      skey.respond_to?(:include?) ? skey.include?(skill_id) : skey == skill_id
    end.last
    skill_word_hash[skey]
  end

  #--------------------------------------------------------------------------
  # ● カットインが存在する？
  #--------------------------------------------------------------------------
  def exist_cutin?(skill_id)
    skill_words(skill_id).key?(:ct_type)
  end

  #--------------------------------------------------------------------------
  # ● スキルセリフの取得
  #--------------------------------------------------------------------------
  def skill_word(skill_id)
    NWConst::Actor.create_skill_words(skill_words(skill_id)).select { |w| word_conditions_met?(w) }.sample
  end

  def word_conditions_met?(word)
    word.condition.nil?
  end

  #--------------------------------------------------------------------------
  # ● カットインの取得
  #--------------------------------------------------------------------------
  def cutin(skill_id)
    data = skill_words(skill_id)
    CutIn.new(data[:ct_type], data[:ct_pic], data[:ct_se])
  end

  #--------------------------------------------------------------------------
  # ● 通常死亡セリフの取得
  #--------------------------------------------------------------------------
  def dead_word
    create_down_word(down_word_hash[:dead_word])
  end

  #--------------------------------------------------------------------------
  # ● 快楽死亡セリフの取得
  #--------------------------------------------------------------------------
  def orgasm_word
    create_down_word(down_word_hash[:orgasm_word])
  end

  #--------------------------------------------------------------------------
  # ● 捕食死亡セリフの取得
  #--------------------------------------------------------------------------
  def predation_word
    create_down_word(down_word_hash[:predation_word])
  end

  #--------------------------------------------------------------------------
  # ● 失禁セリフの取得
  #--------------------------------------------------------------------------
  def incontinence_word
    create_down_word(down_word_hash[:incontinence_word])
  end

  def create_down_word(word_data)
    return nil unless word_data

    Word.new(word_data[0], word_data[1], word_data[2])
  end

  #--------------------------------------------------------------------------
  # ● 死亡前グラフィックの変更
  #--------------------------------------------------------------------------
  def premortal_change
    return unless enemy? && down_word_hash.key?(:premortal_graphic)

    @arive_battler_name = @battler_name
    @battler_name = down_word_hash[:premortal_graphic]
  end

  def revive_change
    return unless enemy? && @arive_battler_name

    @battler_name = @arive_battler_name
    @arive_battler_name = nil
  end
end
