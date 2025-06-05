class Window_PopupConfirm_BAK < Window_Command
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    @title = []
    @name  = ""
    super(0, 0)
    self.z = 200
    deactivate
  end

  def make_command_list
    add_command("はい", :ok)
    add_command("いいえ", :cancel)
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得
  #--------------------------------------------------------------------------
  def window_width
    data = @title.map do |line|
      text_size_ex(format(line, @name)).width
    end.max || 0
    [data + 20 + standard_padding * 2, Graphics.width].min
  end

  #--------------------------------------------------------------------------
  # ● 項目の幅を取得
  #--------------------------------------------------------------------------
  def item_width
    100
  end

  #--------------------------------------------------------------------------
  # ● 項目を描画する矩形の取得
  #--------------------------------------------------------------------------
  def item_rect(index)
    rect = Rect.new
    rect.width = item_width
    rect.height = item_height
    rect.x = (contents_width - item_width) / 2
    rect.y = (index / col_max * item_height)
    rect
  end

  #--------------------------------------------------------------------------
  # ● タイトルのセット
  #--------------------------------------------------------------------------
  def set_title(title)
    @title = title.split("\\n")
  end

  #--------------------------------------------------------------------------
  # ● 名前のセット
  #--------------------------------------------------------------------------
  def set_name(name)
    @name = name
    refresh
  end

  #--------------------------------------------------------------------------
  # ● 決定ボタンが押されたときの処理
  #--------------------------------------------------------------------------
  def process_ok
    return process_cancel if current_symbol == :cancel && handle?(:cancel)

    Input.update
    deactivate
    call_ok_handler
  end

  #--------------------------------------------------------------------------
  # ● タイトルの描画
  #--------------------------------------------------------------------------
  def draw_title
    y = 0
    @title.each do |line|
      rect = text_size_ex(format(line, @name))
      x = (contents.width - rect.width) / 2
      draw_text_ex(x, y, format(line, @name))
      y += rect.height
    end
  end

  def alignment
    1
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウ高さの取得
  #--------------------------------------------------------------------------
  def window_height
    super + title_line_size
  end

  def create_contents
    move_x = (Graphics.width / 2) - (window_width / 2)
    move_y = (Graphics.height / 2) - (window_height / 2)
    move(move_x, move_y, window_width, window_height)
    super
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    super
    draw_title
  end

  def title_line_size
    return 0 unless @title

    h = @title.map do |line|
      text_size_ex(format(line, @name)).height
    end
    h.inject(&:+) || 0
  end
end
