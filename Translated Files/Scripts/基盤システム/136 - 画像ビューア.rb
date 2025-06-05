=begin
=画像ビューア

回想用画像ビューアです


==更新履歴
  Date     Version Author Comment
==14/12/13 2.0.0   トリス 統合A～E E
==15/09/03 2.0.2   トリス 統合J～U K

=end

#==============================================================================
# ■ Sprite_CGViewer
#==============================================================================
class Sprite_CGViewer < Sprite_Base
  #--------------------------------------------------------------------------
  # ● 公開インスタンス
  #--------------------------------------------------------------------------
  attr_accessor   :current  
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(id, data)
    @id = id
    @current = false
    super(nil)
    self.bitmap = Bitmap.new(data[0] + data[1])
    self.bitmap.hue_change(data[2]) if data[2]
    self.x  = (Graphics.width - width) / 2
    self.y  = Graphics.height - height
    self.x += data[3] if data[3]
    self.y -= data[4] if data[4]
    self.z  = id
    self.zoom_x = data[5] if data[5]
    self.zoom_y = data[5] if data[5]
    self.opacity = 0
  end
  #--------------------------------------------------------------------------
  # ● 解放
  #--------------------------------------------------------------------------
  def dispose
    self.bitmap.dispose
    super
  end  
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    self.opacity += @current ? 255 : -255
  end
  #--------------------------------------------------------------------------
  # ● 完全可視状態？
  #--------------------------------------------------------------------------
  def full_view?
    return self.opacity == 255
  end  
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh(draw, forced = false)
    @current = draw.include?(@id)
    self.opacity = 255 if forced && @current
  end
end

#==============================================================================
# ■ Scene_CGViewer
#==============================================================================
class Scene_CGViewer < Scene_Base
  #--------------------------------------------------------------------------
  # ● 準備
  #--------------------------------------------------------------------------
  def prepare(enemy_id)
    @enemy_id = enemy_id
  end
  #--------------------------------------------------------------------------
  # ● CGデータ配列の取得
  #--------------------------------------------------------------------------
  def cg_view_image
    NWConst::Library::CG_VIEW_IMAGE[@enemy_id]
  end
  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    @select = 0
    create_background_sprite
    create_cg_sprites
    refresh_cg_sprites(true)
  end
  #--------------------------------------------------------------------------
  # ● 背景スプライトの生成
  #--------------------------------------------------------------------------
  def create_background_sprite
    @background = Plane.new(@viewport1)
    @background.z = -100
    if $game_novel.bg_data.nil?
      bitmap = Bitmap.new(Graphics.width, Graphics.height)
      bitmap.blt(0, 0, SceneManager.background_bitmap, bitmap.rect) 
      @background.bitmap = bitmap
    else
      bitmap = Bitmap.new(Graphics.width, Graphics.height)
      if $game_novel.bg_data.key?(:bb1)
        bb1 = Bitmap.new("Graphics/Battlebacks1/#{$game_novel.bg_data[:bb1]}")
        bitmap.stretch_blt(bitmap.rect, bb1, bb1.rect)
        bb1.dispose
      end
      if $game_novel.bg_data.key?(:bb2)
        bb2 = Bitmap.new("Graphics/Battlebacks2/#{$game_novel.bg_data[:bb2]}")
        bitmap.stretch_blt(bitmap.rect, bb2, bb2.rect)
        bb2.dispose
      end
      if $game_novel.bg_data.key?(:pic)
        pic = Bitmap.new("Graphics/Pictures/#{$game_novel.bg_data[:pic]}")
        bitmap.stretch_blt(bitmap.rect, pic, pic.rect)
        pic.dispose
      end
      @background.bitmap = bitmap
    end
    Graphics.frame_reset    
  end
  #--------------------------------------------------------------------------
  # ● ＣＧスプライトの生成
  #--------------------------------------------------------------------------
  def create_cg_sprites
    @cg_sprites = []
    cg_view_image[:regist].each{|id, data| # 後でregisterに
      @cg_sprites.push(Sprite_CGViewer.new(id, data))
    }
  end
  #--------------------------------------------------------------------------
  # ● 終了処理
  #--------------------------------------------------------------------------
  def terminate
    super
    dispose_background_sprite
    dispose_cg_sprites
    $game_novel.clear
  end
  #--------------------------------------------------------------------------
  # ● 背景スプライトの解放
  #--------------------------------------------------------------------------
  def dispose_background_sprite
    @background.bitmap.dispose
    @background.dispose
  end
  #--------------------------------------------------------------------------
  # ● ＣＧスプライトの解放
  #--------------------------------------------------------------------------
  def dispose_cg_sprites
    @cg_sprites.each{|cg_sprite| cg_sprite.dispose}
  end
  #--------------------------------------------------------------------------
  # ● ＣＧスプライトのリフレッシュ
  #--------------------------------------------------------------------------
  def refresh_cg_sprites(forced = false)
    @cg_sprites.each{|sprite|
      sprite.refresh(cg_view_image[:draw][@select], forced)
    }
  end
  #--------------------------------------------------------------------------
  # ● 表示中のＣＧスプライトの取得
  #--------------------------------------------------------------------------
  def current_cg_sprites
    @cg_sprites.select{|sprite| sprite.current}
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    process_cg_change
    @cg_sprites.each{|cg_sprite| cg_sprite.update}
    return_scene if Input.trigger?(:B)
  end
  #--------------------------------------------------------------------------
  # ● ＣＧの変更
  #--------------------------------------------------------------------------
  def process_cg_change
    return unless current_cg_sprites.first.full_view?
    if Input.trigger?(:RIGHT) || Input.trigger?(:C)
      max = cg_view_image[:draw].size
      if @select + 1 == max
        return_scene
      else
        @select = @select + 1
      end
    elsif Input.trigger?(:LEFT)
      if @select == 0
        
      else
        @select = @select - 1
      end
    end
    refresh_cg_sprites
  end
end

#==============================================================================
# ■ Scene_ActorCGViewer
#==============================================================================
class Scene_ActorCGViewer < Scene_CGViewer
  #--------------------------------------------------------------------------
  # ● 準備
  #--------------------------------------------------------------------------
  def prepare(actor_id)
    @actor_id = actor_id
  end
  #--------------------------------------------------------------------------
  # ● CGデータ配列の取得
  #--------------------------------------------------------------------------
  def cg_view_image
    NWConst::Library::ACTOR_CG_VIEW_IMAGE[@actor_id]
  end
end



