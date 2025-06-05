=begin
=窓/獲得メダル




==更新履歴
  Date     Version Author Comment

=end

#==============================================================================
# ■ Window_GainMedal
#==============================================================================
class Window_GainMedal < Window_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0, window_width, fitting_height(1))
    self.opacity = 0
    self.contents_opacity = 0
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得
  #--------------------------------------------------------------------------
  def window_width
    return 240
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウを開く
  #--------------------------------------------------------------------------
  def open
    refresh
    NWConst::Library::SE_GAIN_MEDAL.play
    $game_temp.gain_medal_count = 150    
    self
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    if 0 < $game_temp.gain_medal_count
      self.contents_opacity += 16
      $game_temp.gain_medal_count -= 1
    else
      self.contents_opacity -= 16      
      open if $game_temp.gain_medal_exist? && self.contents_opacity == 0
    end
  end    
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    medal_id = $game_temp.gain_medal_pop
    draw_background(contents.rect)
    draw_icon($game_library.medal_icon_id(medal_id), 0, 0)
    rect = contents.rect.clone
    rect.x += 24
    rect.width -= 24
    draw_text(rect, $game_library.medal_title(medal_id))
  end
  #--------------------------------------------------------------------------
  # ● 背景の描画
  #--------------------------------------------------------------------------
  def draw_background(rect)
    temp_rect = rect.clone
    temp_rect.width /= 2
    contents.gradient_fill_rect(temp_rect, back_color2, back_color1)
    temp_rect.x = temp_rect.width
    contents.gradient_fill_rect(temp_rect, back_color1, back_color2)
  end
  #--------------------------------------------------------------------------
  # ● 背景色 1 の取得
  #--------------------------------------------------------------------------
  def back_color1
    return Color.new(0, 0, 0, 192)
  end
  #--------------------------------------------------------------------------
  # ● 背景色 2 の取得
  #--------------------------------------------------------------------------
  def back_color2
    return Color.new(0, 0, 0, 0)
  end  
end





