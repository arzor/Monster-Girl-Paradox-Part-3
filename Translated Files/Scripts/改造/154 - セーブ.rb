=begin
=改造/セーブ




==更新履歴
  Date     Version Author Comment

=end


#==============================================================================
# ■ Game_Party
#==============================================================================
class Game_Party < Game_Unit
  #--------------------------------------------------------------------------
  # ○ セーブファイル表示用のキャラクター画像情報
  #--------------------------------------------------------------------------
  def characters_for_savefile
    all_members.collect do |actor|
      [actor.character_name, actor.character_index]
    end
  end  
end

#==============================================================================
# ■ Window_SaveFile
#==============================================================================
class Window_SaveFile < Window_Base
  #--------------------------------------------------------------------------
  # ○ リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    draw_thumbnail(0, 0)
    draw_filename(164, 0)
    draw_realtime(164, 0, contents.width - 164, 2)
    draw_party_characters(164, contents.height - line_height - 4)
    draw_level(164, contents.height - line_height, contents.width - 164, 0)
    draw_playtime(164, contents.height - line_height, contents.width - 164, 2)
  end
  #--------------------------------------------------------------------------
  # ● サムネイルの描画
  #--------------------------------------------------------------------------
  def draw_thumbnail(x, y)
    thumbnail = DataManager.get_thumbnail(@file_index)
    thumbnail ||= DataManager.get_dummy_thumbnail
    contents.blt(x, y, thumbnail, thumbnail.rect) 
  end  
  #--------------------------------------------------------------------------
  # ● ファイル名の描画
  #--------------------------------------------------------------------------
  def draw_filename(x, y)
    change_color(normal_color)
    name = Vocab::File + " #{@file_index + 1}"
    draw_text(x, y, 200, line_height, name)
    @name_width = text_size(name).width
  end
  #--------------------------------------------------------------------------
  # ○ パーティキャラの描画
  #--------------------------------------------------------------------------
  def draw_party_characters(x, y)
    header = DataManager.load_header(@file_index)
    return unless header

    header[:characters].each{|data|
      character_name = data[0]
      n = data[1]
      bitmap = Cache.character(character_name)
      sign = character_name[/^[\!\$]./]
      if sign && sign.include?('$')
        cw = bitmap.width / 3
        ch = bitmap.height / 4
      else
        cw = bitmap.width / 12
        ch = bitmap.height / 8
      end
      src_rect = Rect.new((n%4*3+1)*cw, (n/4*4)*ch, cw, ch)
      contents.blt(x, y - ch, bitmap, src_rect)
      x += cw
    }
  end
  #--------------------------------------------------------------------------
  # ○ プレイ時間の描画
  #--------------------------------------------------------------------------
  def draw_playtime(x, y, width, align)
    header = DataManager.load_header(@file_index)
    return unless header
    text = sprintf("Time Played:%s", header[:playtime_s])
    draw_text(x, y, width, line_height, text, align)
  end
  #--------------------------------------------------------------------------
  # ● ルカのレベルの描画
  #--------------------------------------------------------------------------
  def draw_level(x, y, width, align)
    header = DataManager.load_header(@file_index)
    return unless header
    text = sprintf("Luka Level:%s", header[:luca_level])
    draw_text(x, y, width, line_height, text, align)
  end
  #--------------------------------------------------------------------------
  # ● リアル時間の描画
  #--------------------------------------------------------------------------
  def draw_realtime(x, y, width, align)
    header = DataManager.load_header(@file_index)
    return unless header
    draw_text(x, y, width, line_height, header[:realtime_s], align)
  end
  #--------------------------------------------------------------------------
  # ○ カーソルの更新
  #--------------------------------------------------------------------------
  def update_cursor
    if @selected
      cursor_rect.set(164, 0, @name_width + 8, line_height)
    else
      cursor_rect.empty
    end
  end  

  def initialize(height, index)
    super(0, index * height, Graphics.width, height)
    @file_index = index
    @selected = false
  end
end

#==============================================================================
# ■ Scene_File
#==============================================================================
class Scene_File < Scene_MenuBase
  #--------------------------------------------------------------------------
  # ○ 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    @savefile_drawflag = []
    DataManager.clear_thumbnail
    create_help_window
    create_savefile_viewport
    create_savefile_windows
    init_selection
  end
  #--------------------------------------------------------------------------
  # ○ 終了処理
  #--------------------------------------------------------------------------
  def terminate
    super
    @savefile_windows.each {|window| window.dispose }
    @savefile_viewport.dispose
    DataManager.dispose_thumbnail
  end  
  #--------------------------------------------------------------------------
  # ○ 画面内に表示するセーブファイル数を取得
  #--------------------------------------------------------------------------
  def visible_max
    return 3
  end  
  #--------------------------------------------------------------------------
  # ○ セーブファイル［決定］
  #--------------------------------------------------------------------------
  def on_savefile_ok
    DataManager.change_thumbnail(index)
  end

  def init_selection
    @index = first_savefile_index
    draw_window(@index)
    @savefile_windows[@index].selected = true
    self.top_index = @index - visible_max / 2
    draw_page
    ensure_cursor_visible
  end

  def draw_page
    (top_index..bottom_index).each {|i| draw_window(i)}
  end

  def draw_window(index)
    return if @savefile_drawflag[index]

    @savefile_windows[index].refresh
    @savefile_drawflag[index] = true
  end

  def update_cursor
    last_index = @index
    cursor_down (Input.trigger?(:DOWN))  if Input.repeat?(:DOWN)
    cursor_up   (Input.trigger?(:UP))    if Input.repeat?(:UP)
    cursor_pagedown   if Input.trigger?(:R)
    cursor_pageup     if Input.trigger?(:L)
    if @index != last_index
      Sound.play_cursor
      draw_page
      @savefile_windows[last_index].selected = false
      @savefile_windows[@index].selected = true
    end
  end
end

#==============================================================================
# ◆ Exit
#==============================================================================
module Exit
  # ---------------------------------------------------------------------------
  # ◆ カスタマイズポイント セットアップ処理を記述します。
  # ---------------------------------------------------------------------------
  def self.setup
    DataManager.load_database
    DataManager.setup_system
  end
  # ---------------------------------------------------------------------------
  # ◆ カスタマイズポイント 解放処理を記述します。
  # ---------------------------------------------------------------------------
  def self.dispose
    DataManager.save_system
  end
end





















