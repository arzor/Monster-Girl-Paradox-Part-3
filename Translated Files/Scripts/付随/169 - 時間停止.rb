=begin
=付随/時間停止

サガフロの時術：オーヴァドライブを再現します
結果ウィンドウやメモ欄取得はベース系に組み込んでいます　全て、併合するべきかな？

==更新履歴
  Date     Version Author Comment

=end

#==============================================================================
# ■ NWConst::OverDrive
#==============================================================================
module NWConst::OverDrive
  FADE_STRUCT  = Struct.new(:tone_r,:tone_g,:tone_b,:wave_a,:wave_l)
  DEFAULT_FADE = FADE_STRUCT.new(0.0, 0.0, 0.0, 0, 180)    
  START_SE     = RPG::SE.new("Skill2", 80, 100)
  FADE_FRAME   = 60
  BASE_VOLUME  = 100
end

#==============================================================================
# ■ Audio
#==============================================================================
class << Audio
  #--------------------------------------------------------------------------
  # ○ 更新処理
  #--------------------------------------------------------------------------
  alias nw_od_update update
  def update
    nw_od_update
    update_over_drive if $game_party.in_battle
  end
  #--------------------------------------------------------------------------
  # ● 更新処理（オーヴァドライブ用）
  #--------------------------------------------------------------------------
  def update_over_drive
    @fiber_bgm.resume if @fiber_bgm
  end
  #--------------------------------------------------------------------------
  # ● オーヴァドライブの開始
  #--------------------------------------------------------------------------
  def start_over_drive
    @fiber_bgm = Fiber.new{ fiber_over_drive_fadein } unless @fiber_bgm
  end
  #--------------------------------------------------------------------------
  # ● オーヴァドライブの終了
  #--------------------------------------------------------------------------
  def end_over_drive
    @fiber_bgm = Fiber.new{ fiber_over_drive_fadeout } unless @fiber_bgm    
  end  
  #--------------------------------------------------------------------------
  # ● フェードイン用ファイバー処理
  #--------------------------------------------------------------------------
  def fiber_over_drive_fadein
    bgm = RPG::BGM.last
    original_volume = NWConst::OverDrive::BASE_VOLUME
    (0...NWConst::OverDrive::FADE_FRAME).reverse_each{|i|
      volume = original_volume * (i / Float(NWConst::OverDrive::FADE_FRAME))
      bgm_play('Audio/BGM/' + bgm.name, volume, bgm.pitch)
      Fiber.yield      
    }
    @fiber_bgm = nil
  end
  #--------------------------------------------------------------------------
  # ● フェードアウト用ファイバー処理
  #--------------------------------------------------------------------------
  def fiber_over_drive_fadeout
    bgm = RPG::BGM.last
    original_volume = NWConst::OverDrive::BASE_VOLUME
    (0...NWConst::OverDrive::FADE_FRAME).each{|i|
      volume = original_volume * (i / Float(NWConst::OverDrive::FADE_FRAME))
      bgm_play('Audio/BGM/' + bgm.name, volume, bgm.pitch)
      Fiber.yield      
    }
    @fiber_bgm = nil
  end
end

#==============================================================================
# ■ BattleManager
#==============================================================================
class << BattleManager
  #--------------------------------------------------------------------------
  # ○ 次の行動主体の取得
  #    行動順序リストの先頭からバトラーを取得する。
  #    現在パーティにいないアクターを取得した場合（index が nil, バトルイベ
  #    ントでの離脱直後などに発生）は、それをスキップする。
  #--------------------------------------------------------------------------
  alias nw_od_next_subject next_subject
  def next_subject
    loop do
      battler = nw_od_next_subject
      return nil unless battler
      next unless battler.od_movable?
      return battler
    end
  end
end

#==============================================================================
# ■ Game_Screen
#==============================================================================
class Game_Screen
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_reader   :od_fade_now
  #--------------------------------------------------------------------------
  # ○ クリア
  #--------------------------------------------------------------------------
  alias nw_od_clear clear
  def clear
    nw_od_clear
    clear_od_fade
  end
  #--------------------------------------------------------------------------
  # ● オーヴァドライブ用フェードのクリア
  #--------------------------------------------------------------------------
  def clear_od_fade
    @od_fade_now   = NWConst::OverDrive::DEFAULT_FADE.clone
    @od_fade_start = @od_fade_now.clone
    @od_fade_goal  = @od_fade_now.clone
    @duration = 0
  end
  #--------------------------------------------------------------------------
  # ○ フレーム更新
  #--------------------------------------------------------------------------
  alias nw_od_update update
  def update
    nw_od_update
    update_od_fade
  end
  #--------------------------------------------------------------------------
  # ● オーヴァドライブ用フェードの更新
  #--------------------------------------------------------------------------
  def update_od_fade
    return unless od_fade?
    @duration -= 1
    @od_fade_now.tone_r = math_od_fade(@od_fade_start.tone_r, @od_fade_goal.tone_r)
    @od_fade_now.tone_g = math_od_fade(@od_fade_start.tone_g, @od_fade_goal.tone_g)
    @od_fade_now.tone_b = math_od_fade(@od_fade_start.tone_b, @od_fade_goal.tone_b)
    @od_fade_now.wave_a = math_od_fade(@od_fade_start.wave_a, @od_fade_goal.wave_a)
    @od_fade_now.wave_l = math_od_fade(@od_fade_start.wave_l, @od_fade_goal.wave_l)
  end
  #--------------------------------------------------------------------------
  # ● フェード用計算【除算注意】
  #--------------------------------------------------------------------------
  def math_od_fade(start,goal)
    goal - (goal - start) * (@duration / Float(NWConst::OverDrive::FADE_FRAME))
  end
  #--------------------------------------------------------------------------
  # ● オーヴァドライブ用フェード中？
  #--------------------------------------------------------------------------
  def od_fade?
    0 < @duration
  end
  #--------------------------------------------------------------------------
  # ● オーヴァドライブ用フェードイン
  #--------------------------------------------------------------------------
  def od_fadein
    @od_fade_goal.tone_r   = -100.0
    @od_fade_goal.tone_g   = -100.0
    @od_fade_goal.tone_b   = -100.0
    @od_fade_goal.wave_a   = 30
    @od_fade_goal.wave_l   = 360
    @od_fade_start = @od_fade_now.clone
    @duration = NWConst::OverDrive::FADE_FRAME
  end
  #--------------------------------------------------------------------------
  # ● オーヴァドライブ用フェードアウト
  #--------------------------------------------------------------------------
  def od_fadeout
    @od_fade_goal.tone_r   = 0.0
    @od_fade_goal.tone_g   = 0.0
    @od_fade_goal.tone_b   = 0.0
    @od_fade_goal.wave_a   = 0
    @od_fade_goal.wave_l   = 180
    @od_fade_start = @od_fade_now.clone
    @duration = NWConst::OverDrive::FADE_FRAME
  end
end

#==============================================================================
# ■ Game_Battler
#==============================================================================
class Game_Battler < Game_BattlerBase
  #--------------------------------------------------------------------------
  # ● 使用効果［時間停止］
  #--------------------------------------------------------------------------
  def item_effect_over_drive(user, item, effect)
    @result.success = true
  end

  def item_one_use_effect_over_drive(user, item, effect, called_scene)
    return unless $game_party.in_battle
    return if $game_troop.all_dead? || $game_party.all_dead? || $game_troop.challenge_battle?

    success = false
    if !$game_party.in_over_drive?
      $game_party.od_turn = [effect.data_id, 1].max
      $game_party.od_user = user
      $game_troop.screen.od_fadein
      Audio.start_over_drive
      NWConst::OverDrive::START_SE.play
      success = true
    end

    if called_scene.is_a?(Scene_Battle)
      log_window = called_scene.instance_variable_get(:@log_window)
      if success
        log_window.display_over_drive(self, user)
      else
        log_window.display_over_drive_failure
      end
    end
  end
end

#==============================================================================
# ■ Game_Actor
#==============================================================================
class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  # ○ コマンド入力可能判定
  #--------------------------------------------------------------------------
  alias nw_od_inputable? inputable?
  def inputable?
    nw_od_inputable? && od_movable?
  end
end

#==============================================================================
# ■ Game_Party
#==============================================================================
class Game_Party < Game_Unit
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor   :od_turn
  attr_accessor   :od_user

  #--------------------------------------------------------------------------
  # ○ オブジェクト初期化 
  #--------------------------------------------------------------------------
  alias nw_od_initialize initialize
  def initialize
    nw_od_initialize
    clear_over_drive
  end
  #--------------------------------------------------------------------------
  # ● オーバードライブ状態の初期化
  #--------------------------------------------------------------------------
  def clear_over_drive
    @od_turn = 0
    @od_user = nil
  end
  #--------------------------------------------------------------------------
  # ● オーバードライブ発動中？
  #--------------------------------------------------------------------------
  def in_over_drive?
    0 < @od_turn
  end
  #--------------------------------------------------------------------------
  # ● オーバードライブのカウントを進める
  #--------------------------------------------------------------------------
  def od_count

    return unless in_over_drive?
    @od_turn -= 1
    
    return if in_over_drive?
    $game_troop.screen.od_fadeout
    Audio.end_over_drive
  end

  #--------------------------------------------------------------------------
  # ○ 戦闘開始処理
  #--------------------------------------------------------------------------
  alias nw_od_on_battle_start on_battle_start
  def on_battle_start
    nw_od_on_battle_start
    clear_over_drive
  end
  #--------------------------------------------------------------------------
  # ○ 戦闘終了処理
  #--------------------------------------------------------------------------
  alias nw_od_on_battle_end on_battle_end
  def on_battle_end
    nw_od_on_battle_end
    clear_over_drive
  end
end

#==============================================================================
# ■ Spriteset_Battle
#==============================================================================
class Spriteset_Battle
  #--------------------------------------------------------------------------
  # ○ 戦闘背景（床）スプライトの更新
  #--------------------------------------------------------------------------
  alias nw_od_update_battleback1 update_battleback1
  def update_battleback1
    nw_od_update_battleback1
    @back1_sprite.tone.red    = $game_troop.screen.od_fade_now.tone_r
    @back1_sprite.tone.green  = $game_troop.screen.od_fade_now.tone_g
    @back1_sprite.tone.blue   = $game_troop.screen.od_fade_now.tone_b
    @back1_sprite.wave_amp    = $game_troop.screen.od_fade_now.wave_a
    @back1_sprite.wave_length = $game_troop.screen.od_fade_now.wave_l
  end
  #--------------------------------------------------------------------------
  # ○ 戦闘背景（壁）スプライトの更新
  #--------------------------------------------------------------------------
  alias nw_od_update_battleback2 update_battleback2
  def update_battleback2
    nw_od_update_battleback2
    @back2_sprite.tone.red    = $game_troop.screen.od_fade_now.tone_r
    @back2_sprite.tone.green  = $game_troop.screen.od_fade_now.tone_g
    @back2_sprite.tone.blue   = $game_troop.screen.od_fade_now.tone_b
    @back2_sprite.wave_amp    = $game_troop.screen.od_fade_now.wave_a
    @back2_sprite.wave_length = $game_troop.screen.od_fade_now.wave_l
  end
end