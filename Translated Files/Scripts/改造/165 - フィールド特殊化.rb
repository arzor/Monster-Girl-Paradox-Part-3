# =改造/フィールド特殊化
#
#
#
#
# ==更新履歴
#   Date     Version Author Comment
#

#==============================================================================
# ■ Audio
#==============================================================================
class << Audio
  #--------------------------------------------------------------------------
  # ○ 更新処理
  #--------------------------------------------------------------------------
  alias nw_field_update update
  def update
    nw_field_update
    update_field if !$game_party.in_battle && $game_map.auto_bgm? && !$game_player.vehicle
  end

  #--------------------------------------------------------------------------
  # ● 更新処理（フィールド用）
  #--------------------------------------------------------------------------
  def update_field
    @fiber_bgm = Fiber.new { fiber_bgm_main } if bgm_change? && @fiber_bgm.nil?
    @fiber_bgs = Fiber.new { fiber_bgs_main } if bgs_change? && @fiber_bgs.nil?
    @fiber_bgm.resume if @fiber_bgm
    @fiber_bgs.resume if @fiber_bgs
  end

  #--------------------------------------------------------------------------
  # ● ＢＧＭ処理
  #--------------------------------------------------------------------------
  def fiber_bgm_main
    if @now_bgm.nil? || @now_bgm.name != ""
      bgm_fade(NWConst::Field::FADEOUT_FRAME * 16.666)
      NWConst::Field::FADEOUT_FRAME.times { Fiber.yield }
    end
    bgm_stop
    @now_bgm = @next_bgm

    if @now_bgm.name != ""
      now_bgm = @now_bgm
      NWConst::Field::FADEIN_FRAME.times do |i|
        volume = now_bgm.volume * (i / Float(NWConst::Field::FADEIN_FRAME))
        bgm_play("Audio/BGM/#{now_bgm.name}", volume, now_bgm.pitch)
        Fiber.yield
      end
    end
    @fiber_bgm = nil
  end

  #--------------------------------------------------------------------------
  # ● ＢＧＳ処理
  #--------------------------------------------------------------------------
  def fiber_bgs_main
    if @now_bgs.nil? || @now_bgs.name != ""
      bgs_fade(NWConst::Field::FADEOUT_FRAME * 16.666)
      NWConst::Field::FADEOUT_FRAME.times { Fiber.yield }
    end
    bgs_stop
    @now_bgs = @next_bgs
    if @now_bgs.name != ""
      NWConst::Field::FADEIN_FRAME.times  do |i|
        volume = @now_bgs.volume * (i / Float(NWConst::Field::FADEIN_FRAME))
        bgs_play("Audio/BGS/" + @now_bgs.name, volume, @now_bgs.pitch)
        Fiber.yield
      end
    end
    @fiber_bgs = nil
  end

  #--------------------------------------------------------------------------
  # ● 次のＢＧＭ
  #--------------------------------------------------------------------------
  def next_bgm(bgm)
    return if bgm.name == @next_bgm.name

    @next_bgm = bgm
  end

  #--------------------------------------------------------------------------
  # ● 次のＢＧＳ
  #--------------------------------------------------------------------------
  def next_bgs(bgs)
    return if bgs.name == @next_bgs.name

    @next_bgs = bgs
  end

  #--------------------------------------------------------------------------
  # ● ＢＧＭチェンジ？
  #--------------------------------------------------------------------------
  def bgm_change?
    @now_bgm != @next_bgm
  end

  #--------------------------------------------------------------------------
  # ● ＢＧＳチェンジ？
  #--------------------------------------------------------------------------
  def bgs_change?
    @now_bgs != @next_bgs
  end

  #--------------------------------------------------------------------------
  # ● ＢＧＭとＢＧＳのリセット
  #--------------------------------------------------------------------------
  def reset_sound
    init_basic
    @now_bgm  = RPG::BGM.new
    @next_bgm = RPG::BGM.new
    @now_bgs  = RPG::BGS.new
    @next_bgs = RPG::BGS.new
  end

  #--------------------------------------------------------------------------
  # ● 戦闘用準備
  #--------------------------------------------------------------------------
  def battle_prepare
    bgs_stop
    @fiber_bgm = nil
    @fiber_bgs = nil
    @next_bgm = RPG::BGM.new if @next_bgm.nil?
    @next_bgs = RPG::BGS.new if @next_bgs.nil?
    @now_bgm  = @next_bgm
    @now_bgs  = @next_bgs
  end

  #--------------------------------------------------------------------------
  # ● ロード用サウンドセット
  #--------------------------------------------------------------------------
  def load_sound(bgm, bgs)
    @now_bgm  = bgm
    @next_bgm = bgm
    @now_bgs  = bgs
    @next_bgs = bgs
  end

  def force_bgm(bgm)
    @now_bgm = bgm
    @next_bgm = bgm
  end

  def force_bgs(bgs)
    @now_bgs = bgs
    @next_bgs = bgs
  end
end

#==============================================================================
# ■ RPG::BGS
#==============================================================================
class RPG::BGS < RPG::AudioFile
  #--------------------------------------------------------------------------
  # ● ＢＧＳのリザーブ
  #--------------------------------------------------------------------------
  def reserve
    Audio.next_bgs(self)
    @@last = clone
  end
end

#==============================================================================
# ■ Game_Player
#==============================================================================
class Game_Player < Game_Character
  #--------------------------------------------------------------------------
  # ○ 非公開メンバ変数の初期化
  #--------------------------------------------------------------------------
  alias nw_field_init_private_members init_private_members
  def init_private_members
    nw_field_init_private_members
    @old_region_id = 0
  end
  #--------------------------------------------------------------------------
  # ○ 場所移動の実行
  #--------------------------------------------------------------------------
  alias nw_field_perform_transfer perform_transfer
  def perform_transfer
    nw_field_perform_transfer
    if $game_map.auto_bgm?
      Audio.reset_sound
      $game_map.autoplay_field
    end
    @old_region_id = region_id
  end
  #--------------------------------------------------------------------------
  # ○ 歩数増加
  #--------------------------------------------------------------------------
  alias nw_field_increase_steps increase_steps
  def increase_steps
    nw_field_increase_steps
    $game_map.autoplay_field if $game_map.region_auto_bgm? && vehicle.nil? && (@old_region_id != region_id)
    @old_region_id = region_id
  end
end

#==============================================================================
# ■ Game_Vehicle
#==============================================================================
class Game_Vehicle
  #--------------------------------------------------------------------------
  # ○ 乗り物に乗る
  #--------------------------------------------------------------------------
  alias nw_field_get_on get_on
  def get_on
    if $game_map.auto_bgm?
      @driving = true
      @walk_anime = true
      @step_anime = true
      Audio.reset_sound
      bgm.play
    else
      nw_field_get_on
    end
  end
  #--------------------------------------------------------------------------
  # ○ 乗り物から降りる
  #--------------------------------------------------------------------------
  alias nw_field_get_off get_off
  def get_off
    if $game_map.auto_bgm?
      @driving = false
      @walk_anime = false
      @step_anime = false
      @direction = 4
      Audio.reset_sound
      $game_map.autoplay_landing
    else
      nw_field_get_off
    end
  end
end

#==============================================================================
# ■ Game_Event
#==============================================================================
class Game_Event < Game_Character
  #--------------------------------------------------------------------------
  # ● スプライトを使う？
  #--------------------------------------------------------------------------
  def use_sprite?
    @event.pages.any? do |page|
      !page.graphic.character_name.empty? || (0 < page.graphic.tile_id)
    end
  end
end

#==============================================================================
# ■ Sprite_Character
#==============================================================================
class Sprite_Character < Sprite_Base
  #--------------------------------------------------------------------------
  # ● 可視範囲内？
  #--------------------------------------------------------------------------
  def is_visibility?
    w, h = if @tile_id == 0
             [@cw * 2 || 0, @ch * 2 || 0]
           else
             [64, 64]
           end
    0 <= @character.screen_x + w && @character.screen_x - w <= Graphics.width &&
      0 <= @character.screen_y + h && @character.screen_y - h <= Graphics.height
  end
end

#==============================================================================
# ■ Spriteset_Map
#==============================================================================
class Spriteset_Map
  #--------------------------------------------------------------------------
  # ○ キャラクタースプライトの作成
  #--------------------------------------------------------------------------
  alias nw_field_create_characters create_characters
  def create_characters
    if $game_map.field?
      @character_sprites = []
      $game_map.events.values.select do |event|
        event.use_sprite?
      end.each do |event|
        @character_sprites.push(Sprite_Character.new(@viewport1, event))
      end
      $game_map.vehicles.each do |vehicle|
        @character_sprites.push(Sprite_Character.new(@viewport1, vehicle))
      end
      $game_player.followers.reverse_each do |follower|
        @character_sprites.push(Sprite_Character.new(@viewport1, follower))
      end
      @character_sprites.push(Sprite_Character.new(@viewport1, $game_player))
      @map_id = $game_map.map_id
    else
      nw_field_create_characters
    end
  end
  #--------------------------------------------------------------------------
  # ○ キャラクタースプライトの更新
  #--------------------------------------------------------------------------
  alias nw_field_update_characters update_characters
  def update_characters
    if $game_map.field?
      @character_sprites.select { |s| s.is_visibility? }.each { |s| s.update }
    else
      nw_field_update_characters
    end
  end
end
