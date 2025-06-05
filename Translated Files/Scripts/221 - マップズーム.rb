#==============================================================================
# ■ RGSS3 マップズーム Ver1.02 by 星潟
#------------------------------------------------------------------------------
# マップをズームさせます。それだけです。
# セーブデータにもズーム状態は維持されますのでご注意ください。
#==============================================================================
# イベントコマンドのスクリプトを使用します。
#------------------------------------------------------------------------------
# map_zoom(150)
# 
# この場合、150％にズームされます。
#------------------------------------------------------------------------------
# map_zoom(300)
# 
# この場合、300％にズームされます。
#------------------------------------------------------------------------------
# map_zoom
# 
# この場合、ズームが解除されます。
#==============================================================================
# 100未満のズーム（縮小）や2000％を超えるのズームには制限をかけてあります。
# よって、100が最小、2000が最大です。
#==============================================================================
module ZoomFrequency
  
  #ズーム画像更新頻度を指定します。
  #何フレームに一度画像を更新するかを指定します。
  #数が大きくなればなるほど画像更新速度が減ります。
  #1だと毎フレーム更新しますが、動作速度への影響が大きくなります。
  
  Number = 2
  
end
class Game_System
  attr_accessor :zoom_mode
  #--------------------------------------------------------------------------
  # ズームモード
  #--------------------------------------------------------------------------
  def zoom_mode
    @zoom_mode ||= 100
  end
end
class Spriteset_Map
  #--------------------------------------------------------------------------
  # ビューポートの作成
  #--------------------------------------------------------------------------
  alias create_viewports_zoommap create_viewports
  def create_viewports
    create_viewports_zoommap
    @zoommap = ZoomMap.new(@viewport1,@viewport2)
  end
  #--------------------------------------------------------------------------
  # 更新処理
  #--------------------------------------------------------------------------
  alias update_zoommap update
  def update
    update_zoommap
    @zoommap.update
  end
  #--------------------------------------------------------------------------
  # 解放処理
  #--------------------------------------------------------------------------
  alias dispose_zoommap dispose
  def dispose
    @zoommap.dispose
    dispose_zoommap
  end
end
class ZoomMap < Sprite_Base
  #--------------------------------------------------------------------------
  # 初期化
  #--------------------------------------------------------------------------
  def initialize(v1,v2)
    super(v2)
    @viewport_data = v1
    @zoom_rate = $game_system.zoom_mode
    @frequency = ZoomFrequency::Number - 1
  end
  #--------------------------------------------------------------------------
  # 解放
  #--------------------------------------------------------------------------
  def dispose
    self.bitmap.dispose if self.bitmap && !self.bitmap.disposed?
    super
  end
  #--------------------------------------------------------------------------
  # 更新処理
  #--------------------------------------------------------------------------
  def update
    self.visible = @zoom_rate != 100
    @frequency += 1
    flag1 = @frequency >= ZoomFrequency::Number
    @frequency = 0 if flag1
    flag2 = flag1 && self.bitmap && !self.bitmap.disposed?
    if flag2
      self.bitmap.dispose
      self.bitmap = nil
    end
    if $game_system.zoom_mode != 100 or @zoom_rate != 100
      if @zoom_rate != $game_system.zoom_mode
        d = (@zoom_rate - $game_system.zoom_mode).abs.to_i
        case d
        when 0..9;i = 2
        when 10..99;i = 4
        when 100..199;i = 8
        when 200..399;i = 16
        when 400..799;i = 32
        else; i = 64
        end
        flag3 = @zoom_rate < $game_system.zoom_mode
        @zoom_rate += (@zoom_rate < $game_system.zoom_mode) ? i : -i
        @zoom_rate = $game_system.zoom_mode if (flag3 ? @zoom_rate > $game_system.zoom_mode : @zoom_rate < $game_system.zoom_mode)
      end
      zm = @zoom_rate.to_f / 100
      @viewport_data.z += 10000000
      self.bitmap = Graphics.snap_to_bitmap if flag2 or !self.bitmap
      w = self.bitmap.width
      h = self.bitmap.height
      wd1 = ((w * zm / 2) - w / 2) / zm + (($game_player.screen_x - w / 2).to_f)
      wd2 = (w * zm - w) / zm
      hd1 = ((h * zm / 2) - h / 2) / zm + (($game_player.screen_y - 16 - h / 2).to_f)
      hd2 = (h * zm - h) / zm
      wd1 = 0 if wd1 < 0
      wd1 = wd2 if wd1 > wd2
      hd1 = 0 if hd1 < 0
      hd1 = hd2 if hd1 > hd2
      self.ox = wd1
      self.oy = hd1
      self.zoom_x = zm
      self.zoom_y = zm
      self.visible = true
      @viewport_data.z -= 10000000
    end
    super
  end
end
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ズーム
  #--------------------------------------------------------------------------
  def map_zoom(rate = 100)
    $game_system.zoom_mode = rate
    $game_system.zoom_mode = 100 if rate < 100
    $game_system.zoom_mode = 2000 if rate > 2000
  end
end