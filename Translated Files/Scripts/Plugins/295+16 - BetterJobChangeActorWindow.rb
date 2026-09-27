# encoding: UTF-8
#========================================#
# Better Job Change Character Window v1.1|
# By JoSmiHnTh                           |
#========================================#

class Foo::JobChange::Window_Actors < Window_Command

  def alignment
    0
  end

  def spacing
    6
  end

  def window_height
    Graphics.height - 120 - fitting_height(1)
  end

  def item_rect_for_text(index)
    rect = super(index)
    rect.width += 13
    rect
  end

  def draw_item(index)
    contents.font.size = 22
    super
  end

end

class Foo::JobChange::Window_ActorStatus < Window_Base

  HEIGHT     = 120
  NAME_FONT  = 22
  SUB_FONT   = 19
  LV_FONT    = 20
  LINE_LEFT  = 105
  LINE_WIDTH = 250
  LV_NUM_W   = 26
  LV_GAP     = 8

  def initialize
    super(0, Graphics.height - HEIGHT, Graphics.width, HEIGHT)
    self.z = 10
    @actor_id = -1
  end

  def col_gap
    (contents ? contents.width : Graphics.width - 24) < 700 ? 14 : 18
  end

  def grid_left
    cw = contents ? contents.width : Graphics.width - 24
    right_margin = 6
    label_w = 30
    gap     = 6
    num_w   = 56
    cell_w  = label_w + gap + num_w
    inc_x   = cell_w + col_gap
    col2    = cw - right_margin - cell_w
    col2 - inc_x * 2
  end

  def line_width
    [grid_left - LINE_LEFT - 16, LINE_WIDTH].min
  end

  def lv_gap
    (contents ? contents.width : Graphics.width - 24) < 700 ? 6 : LV_GAP
  end

  def draw_actor_level(actor, x, y, kind)
    nl = LINE_LEFT + line_width - LV_NUM_W
    change_color(system_color)
    @lv_size ||= text_size(Vocab.level_a)
    draw_text(nl - @lv_size.width - lv_gap, y, @lv_size.width + 2, line_height, Vocab.level_a)
    color = actor.max_level?(kind) ? system_color : normal_color
    change_color(color)
    draw_text(nl, y, LV_NUM_W, line_height, actor.level[kind], 2)
  end

  def draw_actor_status1
    draw_actor_face(actor, 0, 0)

    contents.font.size = LV_FONT
    @lv_size = text_size(Vocab.level_a)
    nl     = LINE_LEFT + line_width - LV_NUM_W
    lv_x   = nl - @lv_size.width - lv_gap
    name_w = lv_x - LINE_LEFT - 6

    rect1 = Rect.new(LINE_LEFT, 6, name_w, line_height)
    rect2 = Rect.new(nl, rect1.y, LV_NUM_W, rect1.height)

    change_color(normal_color)
    contents.font.size = NAME_FONT
    draw_text(rect1, actor.name)
    contents.font.size = LV_FONT
    draw_actor_level(actor, rect2.x, rect2.y, :base)

    draw_horz_line(rect1.y + line_height)
    rect1.y += line_height + 11
    rect2.y += line_height + 11
    change_color(tp_gauge_color2)
    contents.font.size = SUB_FONT
    draw_text(rect1, actor.class.name)
    contents.font.size = LV_FONT
    draw_actor_level(actor, rect2.x, rect2.y, :class)

    rect1.y += line_height + 2
    rect2.y += line_height + 2
    change_color(mp_gauge_color2)
    contents.font.size = SUB_FONT
    draw_text(rect1, actor.tribe.name)
    contents.font.size = LV_FONT
    draw_actor_level(actor, rect2.x, rect2.y, :tribe)
  end

  def draw_actor_status2
    cw = contents.width
    right_margin = 6
    label_w = 30
    gap     = 6
    num_w   = 56
    cg      = col_gap
    cell_w  = label_w + gap + num_w
    inc_x   = cell_w + cg
    g_left  = grid_left
    inc_y   = 30
    h       = 22
    y       = [(contents.height - (inc_y * 2 + h)) / 2, 0].max
    status_word  = [Vocab::hp_a, Vocab::mp_a, Vocab::tp_a]
    status_word += (0..5).collect { |i| Vocab::params_a(i) }
    status_param = (0...8).collect { |i| actor.param(i) }
    status_param.insert(2, actor.max_tp)

    temp_font_size = contents.font.size
    contents.font.size = 22

    status_word.each_with_index do |word, i|
      change_color(system_color)
      draw_text(inc_x * (i % 3) + g_left, inc_y * (i / 3) + y, label_w, h, word)
    end

    status_param.each_with_index do |param, i|
      change_color(normal_color)
      dp = param >= 1000000 ? param.give_unit_floor(4) : param
      draw_text(inc_x * (i % 3) + g_left + label_w + gap, inc_y * (i / 3) + y, num_w, h, dp, 0)
    end

    contents.font.size = temp_font_size
  end

  def draw_horz_line(y)
    line_y = y + (8 / 2) - 1
    contents.fill_rect(LINE_LEFT, line_y, line_width, 2, line_color)
    y + 8
  end

  def line_color
    color = normal_color
    color.alpha = 48
    color
  end

end

class Foo::JobChange::Window_Information < Window_Base

  def initialize
    super(Graphics.width - 120, Graphics.height - 40, 120, 40)
    self.visible = false
    self.opacity = 0
    self.contents_opacity = 0
  end

  def show
    self.visible = false
    self
  end

  def refresh
    contents.clear if contents && !contents.disposed?
  end

  def draw_information
  end

end

class Foo::JobChange::Window_SortEval < Window_Base

  alias bjc_orig_initialize initialize
  def initialize(*args)
    bjc_orig_initialize(*args)
    self.x = Graphics.width - width
  end

end

class Scene_JobChange

  alias bjc_char_show_key_text show_key_text
  def show_key_text
    aw = @actors_window

    if aw && aw.active
      Help.job_change
    else
      bjc_char_show_key_text
    end
  end

end
