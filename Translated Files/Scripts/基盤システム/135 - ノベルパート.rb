=begin
=ノベルパート

ノベル形式に特化した画面です


==更新履歴
  Date     Version Author Comment

=end


#==============================================================================
# ■ Game_Novel
#==============================================================================
class Game_Novel
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_reader   :screen
  attr_reader   :interpreter
  attr_reader   :event_id
  attr_accessor :bg_data
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    @screen = Game_Screen.new
    @interpreter = Game_Interpreter.new
    clear
  end  
  #--------------------------------------------------------------------------
  # ● クリア
  #--------------------------------------------------------------------------
  def clear
    @screen.clear
    @interpreter.clear
    @event_id = 0
    @bg_data = nil
  end
  #--------------------------------------------------------------------------
  # ● セットアップ
  #--------------------------------------------------------------------------
  def setup(event_id)
    @event_id = event_id
    list = $data_common_events[@event_id].list
    @interpreter.setup(list)
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #     main : インタプリタ更新フラグ
  #--------------------------------------------------------------------------
  def update(main = false)
    @interpreter.update if main
    @screen.update
  end
  #--------------------------------------------------------------------------
  # ● イベント運転中？
  #--------------------------------------------------------------------------  
  def running?
    @interpreter.running?
  end
  #--------------------------------------------------------------------------
  # ● １文字ごとのウェイト
  #--------------------------------------------------------------------------
  def one_character_wait
    $game_system.conf[:ls_wait]
  end
  #--------------------------------------------------------------------------
  # ● 読点ごとのウェイト
  #--------------------------------------------------------------------------
  def comma_wait
    $game_system.conf[:ls_wait] * 5
  end
  #--------------------------------------------------------------------------
  # ● 句点ごとのウェイト
  #--------------------------------------------------------------------------
  def period_wait
    $game_system.conf[:ls_wait] * 10
  end
  #--------------------------------------------------------------------------
  # ● 入力待ちウェイト
  #--------------------------------------------------------------------------  
  def input_pause_wait
    $game_system.conf[:ls_wait] * 15
  end
  #--------------------------------------------------------------------------
  # ● 「反省会」まで進める
  #--------------------------------------------------------------------------    
  def skip_scene
    return if @event_id == 0
    
  end
end


#==============================================================================
# ■ Game_Unit
#==============================================================================
class Game_Unit
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :in_novel
  #--------------------------------------------------------------------------
  # ○ オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    @in_battle = false
    @in_novel  = false
  end
end

#==============================================================================
# ■ Game_Troop
#==============================================================================
class Game_Troop < Game_Unit
  
  def lose_event_id
    $game_temp.lose_event_id
  end

  def lose_event_id=(other)
    $game_temp.lose_event_id = other
  end

  #--------------------------------------------------------------------------
  # ● 戦闘開始処理
  #--------------------------------------------------------------------------
  def on_battle_start
    super
    e = members.sample
    $game_temp.lose_event_id = e.lose_event_id
    $game_temp.lose_event_enemy_id = e.id
  end
end

#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ○ 画面系コマンドの対象を取得
  #--------------------------------------------------------------------------
  def screen
    if $game_party.in_battle
      return $game_troop.screen
    elsif $game_party.in_novel
      return $game_novel.screen
    else
      return $game_map.screen
    end
  end
  #--------------------------------------------------------------------------
  # ● ノベルパートの呼び出し
  #--------------------------------------------------------------------------
  def call_novel_scene(event_id)
    screen.clear_pictures # 
    $game_novel.setup(event_id)
    SceneManager.call(Scene_Novel)
    Fiber.yield
  end  
  #--------------------------------------------------------------------------
  # ● ノベルパートの背景指定
  # ピクチャフォルダからファイル名を検索します
  #--------------------------------------------------------------------------
  def novel_background_name(name)
    $game_novel.bg_data = {:pic => name}
  end
  #--------------------------------------------------------------------------
  # ● プレイヤの強制移動
  #--------------------------------------------------------------------------
  def forced_transfer(map_id, x, y)
    $game_player.reserve_transfer(map_id, x, y)
    $game_player.perform_transfer
  end
  #--------------------------------------------------------------------------
  # ● 回想なら中断
  #--------------------------------------------------------------------------
  def memory_interruption
    return unless $game_temp.lib_enemy_index != -1
    @index = @list.size
  end
  #--------------------------------------------------------------------------
  # ● 「反省会」までイベントを進める
  #--------------------------------------------------------------------------  
  def goto_ilias
    list = indirect_check(@list).dup
    until list.empty?
      command = list.shift
      break if command.code == 355 && command.parameters[0] == "memory_interruption"
    end    
    return if list.empty?
    # 画面のフェードアウト、及びウェイト60
    list.unshift(RPG::EventCommand.new(230, 0, [60]))
    list.unshift(RPG::EventCommand.new(221))
    @list = list
  end
  #--------------------------------------------------------------------------
  # ● 間接呼び出しのチェック
  #--------------------------------------------------------------------------  
  def indirect_check(list)
    list.each{|command|
      next unless command.code == 117 && (3001...4000).include?(command.parameters[0])
      return $data_common_events[command.parameters[0]].list
    }    
    return list
  end
end

#==============================================================================
# ■ Spriteset_Novel
#==============================================================================
class Spriteset_Novel
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    create_viewports
    create_background
    create_weather
    create_pictures
    create_timer
    update
  end
  #--------------------------------------------------------------------------
  # ● ビューポートの作成
  #--------------------------------------------------------------------------
  def create_viewports
    @viewport1 = Viewport.new
    @viewport2 = Viewport.new
    @viewport3 = Viewport.new
    @viewport2.z = 50
    @viewport3.z = 100
  end
  #--------------------------------------------------------------------------
  # ● 背景の作成
  #--------------------------------------------------------------------------
  def create_background
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
  # ● 天候の作成
  #--------------------------------------------------------------------------
  def create_weather
    @weather = Spriteset_Weather.new(@viewport2)
  end
  #--------------------------------------------------------------------------
  # ● ピクチャスプライトの作成
  #--------------------------------------------------------------------------
  def create_pictures
    @picture_sprites = []
  end
  #--------------------------------------------------------------------------
  # ● タイマースプライトの作成
  #--------------------------------------------------------------------------
  def create_timer
    @timer_sprite = Sprite_Timer.new(@viewport2)
  end
  #--------------------------------------------------------------------------
  # ● 解放
  #--------------------------------------------------------------------------
  def dispose
    dispose_background
    dispose_weather
    dispose_pictures
    dispose_timer
    dispose_viewports
  end
  #--------------------------------------------------------------------------
  # ● 背景の解放
  #--------------------------------------------------------------------------
  def dispose_background
    @background.bitmap.dispose if @background.bitmap
    @background.dispose
  end
  #--------------------------------------------------------------------------
  # ● 天候の解放
  #--------------------------------------------------------------------------
  def dispose_weather
    @weather.dispose
  end
  #--------------------------------------------------------------------------
  # ● ピクチャスプライトの解放
  #--------------------------------------------------------------------------
  def dispose_pictures
    @picture_sprites.compact.each {|sprite| sprite.dispose }
  end
  #--------------------------------------------------------------------------
  # ● タイマースプライトの解放
  #--------------------------------------------------------------------------
  def dispose_timer
    @timer_sprite.dispose
  end
  #--------------------------------------------------------------------------
  # ● ビューポートの解放
  #--------------------------------------------------------------------------
  def dispose_viewports
    @viewport1.dispose
    @viewport2.dispose
    @viewport3.dispose
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    update_weather
    update_pictures
    update_timer
    update_viewports
  end
  #--------------------------------------------------------------------------
  # ● 天候の更新
  #--------------------------------------------------------------------------
  def update_weather
    @weather.type = $game_novel.screen.weather_type
    @weather.power = $game_novel.screen.weather_power
    @weather.update
  end
  #--------------------------------------------------------------------------
  # ● ピクチャスプライトの更新
  #--------------------------------------------------------------------------
  def update_pictures
    $game_novel.screen.pictures.each do |pic|
      @picture_sprites[pic.number] ||= Sprite_Picture.new(@viewport2, pic)
      @picture_sprites[pic.number].update
    end
  end
  #--------------------------------------------------------------------------
  # ● タイマースプライトの更新
  #--------------------------------------------------------------------------
  def update_timer
    @timer_sprite.update
  end
  #--------------------------------------------------------------------------
  # ● ビューポートの更新
  #--------------------------------------------------------------------------
  def update_viewports
    @viewport1.tone.set($game_novel.screen.tone)
    @viewport1.ox = $game_novel.screen.shake
    @viewport2.color.set($game_novel.screen.flash_color)
    @viewport3.color.set(0, 0, 0, 255 - $game_novel.screen.brightness)
    @viewport1.update
    @viewport2.update
    @viewport3.update
  end

  def erase_background
    @background.visible = false
    update
  end
end

#==============================================================================
# ■ Window_BackLog
#==============================================================================
class Window_BackLog < Window_Selectable
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(message_window)
    @message_window = message_window
    super(0, 0, Graphics.width, Graphics.height)
    create_back_bitmap
    create_back_sprite
    create_contents_viewport
    create_contents_sprite
    self.opacity = 0
    hide.deactivate
    @first_check = false
  end
  #--------------------------------------------------------------------------
  # ● 背景ビットマップの作成
  #--------------------------------------------------------------------------
  def create_back_bitmap
    @back_bitmap = Bitmap.new(width, height)
    rect1 = Rect.new(0, 0, width, 12)
    rect2 = Rect.new(0, 12, width, height - 24)
    rect3 = Rect.new(0, height - 12, width, 12)
    @back_bitmap.gradient_fill_rect(rect1, back_color2, back_color1, true)
    @back_bitmap.fill_rect(rect2, back_color1)
    @back_bitmap.gradient_fill_rect(rect3, back_color1, back_color2, true)
  end
  #--------------------------------------------------------------------------
  # ● 背景色 1 の取得
  #--------------------------------------------------------------------------
  def back_color1
    Color.new(0, 0, 0, 160)
  end
  #--------------------------------------------------------------------------
  # ● 背景色 2 の取得
  #--------------------------------------------------------------------------
  def back_color2
    Color.new(0, 0, 0, 0)
  end
  #--------------------------------------------------------------------------
  # ● 背景スプライトの作成
  #--------------------------------------------------------------------------
  def create_back_sprite
    @back_sprite = Sprite.new
    @back_sprite.bitmap = @back_bitmap
    @back_sprite.z = z - 1
    @back_sprite.visible = false
  end  
  #--------------------------------------------------------------------------
  # ● 内容ビューポートの生成
  #--------------------------------------------------------------------------
  def create_contents_viewport
    @contents_viewport = Viewport.new(12, 12, 616, 456)
    @contents_viewport.z = z
  end
  #--------------------------------------------------------------------------
  # ● 内容スプライトの生成
  #--------------------------------------------------------------------------
  def create_contents_sprite
    @contents_sprites = []
  end
  #--------------------------------------------------------------------------
  # ● 解放
  #--------------------------------------------------------------------------
  def dispose
    super
    dispose_contents_sprites
    dispose_contents_viewport
    dispose_back_bitmap
    dispose_back_sprite
  end
  #--------------------------------------------------------------------------
  # ● 内容スプライトの解放
  #--------------------------------------------------------------------------
  def dispose_contents_sprites
    @contents_sprites.each{|sprite|
      sprite.bitmap.dispose
      sprite.dispose
    }
  end
  #--------------------------------------------------------------------------
  # ● 内容ビューポートの解放
  #--------------------------------------------------------------------------
  def dispose_contents_viewport
    @contents_viewport.dispose
  end
  #--------------------------------------------------------------------------
  # ● 背景ビットマップの解放
  #--------------------------------------------------------------------------
  def dispose_back_bitmap
    @back_bitmap.dispose
  end
  #--------------------------------------------------------------------------
  # ● 背景スプライトの解放
  #--------------------------------------------------------------------------
  def dispose_back_sprite
    @back_sprite.dispose
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    update_back_sprite
    update_contents
  end
  #--------------------------------------------------------------------------
  # ● 背景スプライトの更新
  #--------------------------------------------------------------------------
  def update_back_sprite
    @back_sprite.visible = self.visible
    @back_sprite.update
  end
  #--------------------------------------------------------------------------
  # ● 内容の更新
  #--------------------------------------------------------------------------
  def update_contents
    @contents_viewport.visible = self.visible
    @contents_viewport.update
    @contents_sprites.each{|sprite| sprite.update}
  end
  #--------------------------------------------------------------------------
  # ● 内容の書き出し
  #--------------------------------------------------------------------------
  def dup_contents
    shift_contents if 100 < @contents_sprites.size
    # 最初の空画像を弾くため。今の仕様ならこれで十分なはず
    unless @first_check
      @first_check = true
      return
    end
    push_contents
  end
  #--------------------------------------------------------------------------
  # ● 内容の追加
  #--------------------------------------------------------------------------
  def push_contents
    src_bitmap = @message_window.contents
    bitmap = Bitmap.new(src_bitmap.rect.width, src_bitmap.rect.height)
    bitmap.blt(0, 0, src_bitmap, bitmap.rect)
    sprite = Sprite.new(@contents_viewport)
    sprite.bitmap = bitmap
    @contents_sprites.push(sprite)
  end
  #--------------------------------------------------------------------------
  # ● 内容の押し出し
  #--------------------------------------------------------------------------
  def shift_contents
    sprite = @contents_sprites.shift
    sprite.bitmap.dispose
    sprite.dispose
  end
  #--------------------------------------------------------------------------
  # ● 内容のリフレッシュ
  #--------------------------------------------------------------------------
  def refresh_contents
    @contents_sprites.each_with_index{|sprite, i|
      sprite.y = i * sprite.height
    }
    @contents_viewport.oy = [(@contents_sprites.size * line_height * 4) - contents.height, 0].max
  end
  #--------------------------------------------------------------------------
  # ● バックログの開始
  #--------------------------------------------------------------------------
  def start
    show.activate
    @message_window.hide
    refresh_contents
  end
  #--------------------------------------------------------------------------
  # ● カーソルの移動処理
  #--------------------------------------------------------------------------
  def process_cursor_move
    return unless open? && active
    last_index = @index
    cursor_down (Input.trigger?(:DOWN))  if Input.repeat?(:DOWN)
    cursor_up   (Input.trigger?(:UP))    if Input.repeat?(:UP)
    cursor_pagedown   if Input.trigger?(:R)
    cursor_pageup     if Input.trigger?(:L)
  end
  #--------------------------------------------------------------------------
  # ● 決定やキャンセルなどのハンドリング処理
  #--------------------------------------------------------------------------
  def process_handling
    return unless open? && active
    return process_cancel   if Input.trigger?(:B)
  end
  #--------------------------------------------------------------------------
  # ● カーソルを下に移動
  #--------------------------------------------------------------------------
  def cursor_down(wrap = false)
    @contents_viewport.oy = [
      @contents_viewport.oy + line_height,
      [(@contents_sprites.size * line_height * 4) - contents.height, 0].max
    ].min
  end
  #--------------------------------------------------------------------------
  # ● カーソルを上に移動
  #--------------------------------------------------------------------------
  def cursor_up(wrap = false)
    @contents_viewport.oy = [@contents_viewport.oy - line_height, 0].max
  end
  #--------------------------------------------------------------------------
  # ● カーソルを 1 ページ後ろに移動
  #--------------------------------------------------------------------------
  def cursor_pagedown
    @contents_viewport.oy = [
      @contents_viewport.oy + line_height * 19,
      [(@contents_sprites.size * line_height * 4) - contents.height, 0].max
    ].min
  end
  #--------------------------------------------------------------------------
  # ● カーソルを 1 ページ前に移動
  #--------------------------------------------------------------------------
  def cursor_pageup
    @contents_viewport.oy = [@contents_viewport.oy - line_height * 19, 0].max
  end
  #--------------------------------------------------------------------------
  # ● キャンセルボタンが押されたときの処理
  #--------------------------------------------------------------------------
  def process_cancel
    Input.update
    hide.deactivate
    @message_window.show
  end
end

#==============================================================================
# ■ Window_NovelMessage
#==============================================================================
class Window_NovelMessage < Window_Message
  #--------------------------------------------------------------------------
  # ● インスタンス変数のクリア
  #--------------------------------------------------------------------------
  def clear_instance_variables
    super
    @auto_mode = $game_system.conf[:ls_auto]
  end  
  #--------------------------------------------------------------------------
  # ● 全ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_all_windows
    super
    @backlog_window = Window_BackLog.new(self)
  end  
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    update_flip_hide
    return unless active
    super
    update_flip_auto
  end
  #--------------------------------------------------------------------------
  # ● 全ウィンドウの更新
  #--------------------------------------------------------------------------
  def update_all_windows
    super
    @backlog_window.update
  end  
  #--------------------------------------------------------------------------
  # ● ウィンドウ隠し反転の更新
  #--------------------------------------------------------------------------
  def update_flip_hide
    return unless Input.trigger?(:Y) || Input.trigger?(:Z)
    return if @backlog_window.active
    Input.update
    self.active = !active
    self.visible = !visible
  end
  #--------------------------------------------------------------------------
  # ● オートモード反転の更新
  #--------------------------------------------------------------------------
  def update_flip_auto
    return unless Input.trigger?(:L) || Input.trigger?(:R)
    return if @backlog_window.active
    Input.update
    Sound.play_ok
    @auto_mode = !@auto_mode
  end  
  #--------------------------------------------------------------------------
  # ● 一文字出力後のウェイト
  #--------------------------------------------------------------------------
  def wait_for_one_character
    unless @auto_mode
      super
    else
      wait($game_novel.one_character_wait)
    end    
  end  
  #--------------------------------------------------------------------------
  # ● 通常文字の処理
  #--------------------------------------------------------------------------
  def process_normal_character(c, pos)
    super
    return unless @auto_mode
    case c
    when "、"; wait($game_novel.comma_wait)
    when "。"; wait($game_novel.period_wait)
    end
  end
  #--------------------------------------------------------------------------
  # ● 改ページ処理
  #--------------------------------------------------------------------------
  def new_page(text, pos)
    @backlog_window.dup_contents
    super
  end
  #--------------------------------------------------------------------------
  # ● 入力待ち処理
  # superを使用していないので注意
  #--------------------------------------------------------------------------
  def input_pause    
    return if Input.press?(:X)
    self.pause = true
    unless @auto_mode
      wait(10)
      until Input.trigger?(:B) || Input.trigger?(:C) || Input.trigger?(:X)
        open_backlog   if Input.trigger?(:UP)
        Fiber.yield 
      end
      Input.update
    else
      wait($game_novel.input_pause_wait)
    end    
    self.pause = false
  end
  #--------------------------------------------------------------------------
  # ● バックログの表示
  #--------------------------------------------------------------------------
  def open_backlog
    @backlog_window.start
    Fiber.yield while @backlog_window.active
  end
end

#==============================================================================
# ■ Scene_Novel
#==============================================================================
class Scene_Novel < Scene_Base
  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    $game_party.in_novel = true
    $game_message.visible = false
    create_spriteset
    create_all_windows
    update
  end
  #--------------------------------------------------------------------------
  # ● トランジション速度の取得
  #--------------------------------------------------------------------------
  def transition_speed
    return 15
  end
  #--------------------------------------------------------------------------
  # ● 終了処理
  #--------------------------------------------------------------------------
  def terminate
    super
    dispose_spriteset
    $game_novel.clear
    $game_party.in_novel = false
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    $game_novel.update(true)
    $game_timer.update
    @spriteset.update
    return_scene unless $game_novel.running?
    update_transfer
  end

  def update_transfer
    return unless $game_player.transfer?
    $game_player.forced_get_off_vehicle
    $game_player.perform_transfer
    SceneManager.call(Scene_Map)
    case $game_temp.fade_type
    when 0
      fadeout(fadeout_speed)
    when 1
      white_fadeout(fadeout_speed)
    end
    $game_map.interpreter = Marshal.load(Marshal.dump($game_novel.interpreter))
    $game_map.interpreter.return_flag = true
    $game_novel.clear
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新（フェード用）
  #--------------------------------------------------------------------------
  def update_for_fade
    update_basic
    $game_novel.update(false)
    @spriteset.update
  end
  #--------------------------------------------------------------------------
  # ● 汎用フェード処理
  #--------------------------------------------------------------------------
  def fade_loop(duration)
    duration.times do |i|
      yield 255 * (i + 1) / duration
      update_for_fade
    end
  end
  #--------------------------------------------------------------------------
  # ● 画面のフェードイン
  #--------------------------------------------------------------------------
  def fadein(duration)
    fade_loop(duration) {|v| Graphics.brightness = v }
  end
  #--------------------------------------------------------------------------
  # ● 画面のフェードアウト（白）
  #--------------------------------------------------------------------------
  def white_fadeout(duration)
    fade_loop(duration) {|v| @viewport.color.set(255, 255, 255, v) }
  end
  #--------------------------------------------------------------------------
  # ● 画面のフェードアウト
  #--------------------------------------------------------------------------
  def fadeout(duration)
    fade_loop(duration) {|v| Graphics.brightness = 255 - v }
  end
  #--------------------------------------------------------------------------
  # ● スプライトセットの作成
  #--------------------------------------------------------------------------
  def create_spriteset
    @spriteset = Spriteset_Novel.new
  end
  #--------------------------------------------------------------------------
  # ● スプライトセットの解放
  #--------------------------------------------------------------------------
  def dispose_spriteset
    @spriteset.dispose
  end
  #--------------------------------------------------------------------------
  # ● 全ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_all_windows
    create_message_window
    create_skillname_window
  end
  #--------------------------------------------------------------------------
  # ● メッセージウィンドウの作成
  #--------------------------------------------------------------------------
  def create_message_window
    @message_window = Window_NovelMessage.new
  end
  #--------------------------------------------------------------------------
  # ● スキル名ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_skillname_window
    @sname_window = Window_SkillName.new
  end
  #--------------------------------------------------------------------------
  # ● フェードアウト速度の取得
  #--------------------------------------------------------------------------
  def fadeout_speed
    return 30
  end
  #--------------------------------------------------------------------------
  # ● フェードイン速度の取得
  #--------------------------------------------------------------------------
  def fadein_speed
    return 30
  end

  def erase_background
    @spriteset.erase_background
  end
end

# バトルイベント：HPの変更で全滅した時は…可能性あるか？

