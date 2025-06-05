#~ =begin
#~ =基盤システム/画面演出




#~ ==更新履歴
#~   Date     Version Author Comment

#~ =end

#~ #==============================================================================
#~ # ■ Game_Screen
#~ #==============================================================================
#~ class Game_Screen
#~   #--------------------------------------------------------------------------
#~   # ● 公開インスタンス変数
#~   #--------------------------------------------------------------------------
#~   attr_reader   :processing_type
#~   #--------------------------------------------------------------------------
#~   # ○ クリア
#~   #--------------------------------------------------------------------------
#~   def clear
#~     clear_fade
#~     clear_tone
#~     clear_flash
#~     clear_shake
#~     clear_weather
#~     clear_pictures
#~     idle_processing
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● 画面加工の初期化
#~   #--------------------------------------------------------------------------
#~   def idle_processing
#~     @processing_type = :idle
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● ネガポジ反転の開始
#~   #--------------------------------------------------------------------------
#~   def start_reverse_processing
#~     @processing_type = :reverse_fadein
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● 画面加工のクリア
#~   #--------------------------------------------------------------------------
#~   def fade_processing
#~     @processing_type = :fadeout
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● 画面加工のクリア
#~   #--------------------------------------------------------------------------
#~   def clear_processing
#~     @processing_type = :clear
#~   end
#~ end

#~ #==============================================================================
#~ # ■ Spriteset_Map
#~ #==============================================================================
#~ class Spriteset_Map
#~   #--------------------------------------------------------------------------
#~   # ○ オブジェクト初期化
#~   #--------------------------------------------------------------------------
#~   def initialize
#~     create_viewports
#~     create_tilemap
#~     create_parallax
#~     create_characters
#~     create_shadow
#~     create_processing
#~     create_weather
#~     create_pictures
#~     create_timer
#~     update
#~   end
#~   #--------------------------------------------------------------------------
#~   # ○ ビューポートの作成
#~   #--------------------------------------------------------------------------
#~   def create_viewports
#~     @viewport1 = Viewport.new
#~     @viewport2 = Viewport.new
#~     @viewport3 = Viewport.new
#~     @viewport4 = Viewport.new    
#~     @viewport2.z = 50
#~     @viewport3.z = 100
#~     @viewport4.z = 10
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● 画面加工スプライトの作成
#~   #--------------------------------------------------------------------------
#~   def create_processing
#~     @processing_sprite = Sprite.new(@viewport4)
#~     @processing_sprite.bitmap = Bitmap.new(Graphics.width, Graphics.height)
#~     @processing_fiber = nil
#~   end
#~   #--------------------------------------------------------------------------
#~   # ○ 解放
#~   #--------------------------------------------------------------------------
#~   def dispose
#~     dispose_tilemap
#~     dispose_parallax
#~     dispose_characters
#~     dispose_shadow
#~     dispose_processing
#~     dispose_weather
#~     dispose_pictures
#~     dispose_timer
#~     dispose_viewports
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● 画面加工スプライトの解放
#~   #--------------------------------------------------------------------------
#~   def dispose_processing
#~     @processing_sprite.bitmap.dispose
#~     @processing_sprite.dispose
#~   end
#~   #--------------------------------------------------------------------------
#~   # ○ ビューポートの解放
#~   #--------------------------------------------------------------------------
#~   def dispose_viewports
#~     @viewport1.dispose
#~     @viewport2.dispose
#~     @viewport3.dispose
#~     @viewport4.dispose    
#~   end
#~   #--------------------------------------------------------------------------
#~   # ○ フレーム更新
#~   #--------------------------------------------------------------------------
#~   def update
#~     update_tileset
#~     update_tilemap
#~     update_parallax
#~     update_characters
#~     update_shadow
#~     update_processing
#~     update_weather
#~     update_pictures
#~     update_timer
#~     update_viewports
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● 画面加工スプライトの更新
#~   #--------------------------------------------------------------------------
#~   def update_processing
#~     case $game_map.screen.processing_type
#~     when :reverse_fadein
#~       $game_map.screen.idle_processing
#~       blt_reverse_bitmap
#~       @processing_fiber = Fiber.new{ fiber_processing_fadein }
#~     when :fadeout
#~       $game_map.screen.idle_processing
#~       @processing_fiber = Fiber.new{ fiber_processing_fadeout }
#~     when :clear
#~       $game_map.screen.idle_processing
#~       @processing_sprite.bitmap.clear    
#~     end
#~     @processing_fiber.resume if @processing_fiber
#~     @processing_sprite.update
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● 画面加工処理（フェードイン）
#~   #--------------------------------------------------------------------------
#~   def fiber_processing_fadein    
#~     (0..30).each{|i|
#~       @processing_sprite.opacity = Integer(255 * (i / 30.0))
#~       Fiber.yield
#~     }
#~     @processing_fiber = nil
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● 画面加工処理（フェードアウト）
#~   #--------------------------------------------------------------------------
#~   def fiber_processing_fadeout
#~     (0..15).reverse_each{|i|
#~       @processing_sprite.opacity = Integer(255 * (i / 15.0))
#~       Fiber.yield
#~     }
#~     @processing_sprite.bitmap.clear
#~     @processing_fiber = nil    
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● 画面加工処理（ネガポジ反転）
#~   #--------------------------------------------------------------------------
#~   def blt_reverse_bitmap
#~     bitmap = Graphics.snap_to_bitmap 
#~     bitmap.width.times{|x|
#~       bitmap.height.times{|y|
#~         src_color = bitmap.get_pixel(x, y)
#~         dst_color = Color.new(0,0,0,255)
#~         bit  = 0x000000
#~         bit |= Integer(src_color.red)   << 16
#~         bit |= Integer(src_color.green) << 8
#~         bit |= Integer(src_color.blue)  << 0
#~         bit ^= 0xFFFFFF
#~         dst_color.red   = (bit & 0xFF0000) >> 16
#~         dst_color.green = (bit & 0x00FF00) >> 8
#~         dst_color.blue  = (bit & 0x0000FF) >> 0
#~         bitmap.set_pixel(x, y, dst_color)
#~       }
#~     }
#~     @processing_sprite.bitmap.blt(0, 0, bitmap, @processing_sprite.src_rect) 
#~     bitmap.dispose
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● 画面加工処理（ネガポジ反転フェードイン）
#~   #--------------------------------------------------------------------------
#~ #  def blt_reverse_bitmap
#~ #    bitmap = Graphics.snap_to_bitmap 
#~ #    bitmap.invert
#~ #    @processing_sprite.bitmap.blt(0, 0, bitmap, @processing_sprite.src_rect) 
#~ #    bitmap.dispose
#~ #  end
#~   #--------------------------------------------------------------------------
#~   # ○ ビューポートの更新
#~   #--------------------------------------------------------------------------
#~   def update_viewports
#~     @viewport1.tone.set($game_map.screen.tone)
#~     @viewport1.ox = $game_map.screen.shake
#~     @viewport2.color.set($game_map.screen.flash_color)
#~     @viewport3.color.set(0, 0, 0, 255 - $game_map.screen.brightness)
#~     @viewport1.update
#~     @viewport2.update
#~     @viewport3.update
#~     @viewport4.update
#~   end
#~ end











