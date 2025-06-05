# =ベース/Sprite
#
# ここではSpriteを中心に扱います
#
#
# ==更新履歴
#   Date     Version Author Comment
# ==15/09/03 2.0.2   トリス 統合J～U O
# ==17/09/21 2.2.0   ひまわり　統合tpatch
#

#==============================================================================
# ■ Sprite_Base
#==============================================================================
class Sprite_Base < Sprite
  class << self
    def clear_checker
      @@ani_checker.clear
      @@ani_spr_checker.clear
    end
  end
  def update
    super
    update_animation
  end

  #--------------------------------------------------------------------------
  # ○ アニメーションスプライトの作成
  #--------------------------------------------------------------------------
  def make_animation_sprites
    @ani_sprites = []
    if (@use_sprite || @animation.to_screen?) && !@@ani_spr_checker.include?(@animation)
      16.times do
        sprite = ::Sprite.new(viewport)
        sprite.visible = false
        @ani_sprites.push(sprite)
      end
      @@ani_spr_checker.push(@animation) if @animation.to_screen?
    end
    @ani_duplicated = @@ani_checker.include?(@animation)
    @@ani_checker.push(@animation) if !@ani_duplicated && @animation.to_screen?
  end

  #--------------------------------------------------------------------------
  # ○ アニメーションスプライトの設定
  #     frame : フレームデータ（RPG::Animation::Frame）
  #--------------------------------------------------------------------------
  def animation_set_sprites(frame)
    cell_data = frame.cell_data
    @ani_sprites.each_with_index do |sprite, i|
      next unless sprite

      pattern = cell_data[i, 0]
      if !pattern || pattern < 0
        sprite.visible = false
        next
      end
      sprite.bitmap = pattern < 100 ? @ani_bitmap1 : @ani_bitmap2
      sprite.visible = true
      sprite.src_rect.set(pattern % 5 * 192,
                          pattern % 100 / 5 * 192, 192, 192)
      if @ani_mirror
        sprite.x = @ani_ox - cell_data[i, 1]
        sprite.y = @ani_oy + cell_data[i, 2]
        sprite.angle = (360 - cell_data[i, 4])
        sprite.mirror = (cell_data[i, 5] == 0)
      else
        sprite.x = @ani_ox + cell_data[i, 1]
        sprite.y = @ani_oy + cell_data[i, 2]
        sprite.angle = cell_data[i, 4]
        sprite.mirror = (cell_data[i, 5] == 1)
      end
      sprite.z = z + 300 + i
      sprite.ox = 96
      sprite.oy = 96
      sprite.zoom_x = cell_data[i, 3] / 100.0
      sprite.zoom_y = cell_data[i, 3] / 100.0
      # アニメーションスプライトの拡大
      if @animation.position == 3
        zm = [Graphics.width.to_f / 544.0, Graphics.height.to_f / 416.0].max
        zm = 1.0 if zm < 1.0
        sprite.zoom_x *= zm
        sprite.zoom_y *= zm
      end
      sprite.opacity = cell_data[i, 6] * opacity / 255.0
      sprite.blend_type = cell_data[i, 7]
    end
  end

  #--------------------------------------------------------------------------
  # ● アニメーションの原点設定
  #--------------------------------------------------------------------------
  def set_animation_origin
    if @animation.position == 3
      if viewport.nil?
        @ani_ox = Graphics.width / 2
        @ani_oy = Graphics.height / 2
      else
        @ani_ox = viewport.rect.width / 2
        @ani_oy = viewport.rect.height / 2
      end
    else
      @ani_ox = x - ox + width / 2
      @ani_oy = y - oy + height / 2
      if @animation.position == 0
        # 頭上アニメ　画像上端基準
        @ani_oy -= height / 2
      elsif @animation.position == 2
        if height >= 360
          # 足元アニメで高さ360以上なら画像下端基準ではなく
          #   「画像上端から360の位置(=高さ360の場合の足元)」基準
          @ani_oy -= height / 2
          @ani_oy += 360
        else
          # 足元アニメ　画像下端基準
          @ani_oy += height / 2
        end
      end
    end
  end
end

#==============================================================================
# ■ Sprite_Battler
#==============================================================================
class Sprite_Battler < Sprite_Base
  #--------------------------------------------------------------------------
  # ○ オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(viewport, battler = nil)
    super(viewport)
    @battler = battler
    @battler_visible = false
    @effect_type = nil
    @effect_duration = 0
    init_visibility if @battler
  end

  #--------------------------------------------------------------------------
  # ● 転送元ビットマップの更新
  #--------------------------------------------------------------------------
  def update_bitmap
    if $game_temp.battler_graphic_hide
      return if @battler_graphic_hide

      @battler_graphic_hide = true
      bitmap_name = ""
    else
      @battler_graphic_hide = false
      bitmap_name = @battler.battler_name
    end
    new_bitmap = Cache.battler(bitmap_name, @battler.battler_hue)
    self.bitmap = new_bitmap if bitmap != new_bitmap
  end
end

#==============================================================================
# ■ Spriteset_Battle
#==============================================================================
class Spriteset_Battle
  #--------------------------------------------------------------------------
  # ○ オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    create_viewports
    create_battleback1
    create_battleback2
    create_enemies
    create_actors
    create_pictures
    create_timer
    create_follower
    update
  end

  def player_point
    [$game_player.x, $game_player.y]
  end

  def autotile_type(x, y, z)
    $game_map.autotile_type(x, y, z)
  end

  #--------------------------------------------------------------------------
  # ● 戦闘背景（床）ファイル名の取得
  #--------------------------------------------------------------------------
  def battleback1_name
    if $BTEST
      $data_system.battleback1_name
    elsif m = $game_map.battleback_region($game_map.region_id(*player_point))
      m[0]
    elsif $game_map.battleback1_name
      $game_map.battleback1_name
    elsif $game_map.overworld?
      overworld_battleback1_name
    end
  end

  #--------------------------------------------------------------------------
  # ● 戦闘背景（壁）ファイル名の取得
  #--------------------------------------------------------------------------
  def battleback2_name
    if $BTEST
      $data_system.battleback2_name
    elsif m = $game_map.battleback_region($game_map.region_id(*player_point))
      m[1]
    elsif $game_map.battleback2_name
      $game_map.battleback2_name
    elsif $game_map.overworld?
      overworld_battleback2_name
    end
  end

  def normal_battleback2_name(x, y)
    terrain_battleback2_name(autotile_type(x, y, 1)) ||
      terrain_battleback2_name(autotile_type(x, y, 0)) ||
      default_battleback2_name
  end

  def normal_battleback1_name(x, y)
    terrain_battleback1_name(autotile_type(x, y, 1)) ||
      terrain_battleback1_name(autotile_type(x, y, 0)) ||
      default_battleback1_name
  end

  def overworld_battleback2_name
    return ship_battleback2_name if $game_player.in_boat? || $game_player.in_ship?
    return nil if $game_player.in_airship?

    normal_battleback2_name(*$game_map.search_field_tile($game_player.x, $game_player.y).first)
  end

  def overworld_battleback1_name
    return ship_battleback1_name if $game_player.in_boat? || $game_player.in_ship?
    return "Sky" if $game_player.in_airship?

    normal_battleback1_name(*$game_map.search_field_tile($game_player.x, $game_player.y).first)
  end

  #--------------------------------------------------------------------------
  # ● 地形に対応する戦闘背景（床）ファイル名の取得
  #--------------------------------------------------------------------------
  def terrain_battleback1_name(type)
    case type
    when 24, 25        # 荒れ地
      "Wasteland"
    when 26, 27        # 土肌
      "DirtField"
    when 32, 33        # 砂漠
      "Desert"
    when 34            # 岩地
      "Lava1"
    when 35, 6         # 岩地（溶岩）
      "Lava2"
    when 40, 41        # 雪原
      "Snowfield"
    when 42            # 雲
      "Clouds"
    when 4, 5          # 毒の沼
      "PoisonSwamp"
    end
  end

  #--------------------------------------------------------------------------
  # ● 地形に対応する戦闘背景（壁）ファイル名の取得
  #--------------------------------------------------------------------------
  def terrain_battleback2_name(type)
    case type
    when 20, 21          # 森
      "Forest1"
    when 22, 30, 38      # 低い山
      "Cliff"
    when 24, 25, 26, 27  # 荒れ地、土肌
      "Wasteland"
    when 32, 33          # 砂漠
      "Desert"
    when 34, 35, 6       # 岩地
      "Lava"
    when 40, 41          # 雪原
      "Snowfield"
    when 42              # 雲
      "Clouds"
    when 4, 5            # 毒の沼
      "PoisonSwamp"
    end
  end

  #--------------------------------------------------------------------------
  # ● 仲間化エネミースプライトの作成
  #--------------------------------------------------------------------------
  def create_follower
    @follower_sprite = Sprite_Follower.new(@viewport1)
  end

  #--------------------------------------------------------------------------
  # ○ 解放
  #--------------------------------------------------------------------------
  def dispose
    dispose_battleback1
    dispose_battleback2
    dispose_enemies
    dispose_actors
    dispose_pictures
    dispose_timer
    dispose_follower
    dispose_viewports
  end

  #--------------------------------------------------------------------------
  # ● 仲間化エネミースプライトの解放
  #--------------------------------------------------------------------------
  def dispose_follower
    @follower_sprite.dispose
  end

  #--------------------------------------------------------------------------
  # ○ フレーム更新
  #--------------------------------------------------------------------------
  def update
    update_battleback1
    update_battleback2
    update_enemies
    update_actors
    update_pictures
    update_timer
    update_follower
    update_viewports
  end

  #--------------------------------------------------------------------------
  # ● 仲間化エネミースプライトの更新
  #--------------------------------------------------------------------------
  def update_follower
    @follower_sprite.update
  end

  def update_pictures
    $game_troop.screen.pictures.each do |pic|
      @picture_sprites[pic.number] ||= Sprite_Picture.new(@viewport1, pic)
      @picture_sprites[pic.number].update
    end
  end

  def update_enemies
    @enemy_sprites.each do |sprite| 
      sprite.update
      sprite.visible = false if @follower_sprite.bitmap
    end
  end
end

class Spriteset_Map
  def update_pictures
    $game_map.screen.pictures.each do |pic|
      @picture_sprites[pic.number] ||= Sprite_Picture.new(@viewport1, pic)
      @picture_sprites[pic.number].update
    end
  end

  def refresh_characters
    dispose_characters
    create_characters
    $game_party.multi_party.refresh_characters
  end

  alias h_spriteset_map_create_characters create_characters
  def create_characters
    h_spriteset_map_create_characters
    $game_party.multi_party.characters.each do |c|
      @character_sprites.push(Sprite_Character.new(@viewport1, c))
    end
  end
end

class Sprite_Picture
  def update_position
    self.x = @picture.x
    self.y = @picture.y
    self.z = 250 + @picture.number
  end
end
