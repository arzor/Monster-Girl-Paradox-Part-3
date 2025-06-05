#========================================#
# Better Job Change Window v1.1          |
# By JoSmiHnTh                           |
#========================================#

class Foo::JobChange::Window_Actors < Window_Command

  def alignment
    0
  end

  def spacing
    6
  end

  alias original_item_rect_for_text :item_rect_for_text
  def item_rect_for_text(index)
    rect = original_item_rect_for_text(index)
    # rect.x -= 10
    rect.width += 13
    rect
  end

  alias original_draw_item :draw_item
  def draw_item(index)
    contents.font.size = 22
    original_draw_item(index)
  end

end

class Foo::JobChange::Window_ActorStatus < Window_Base

  def initialize
    super(0, 360, 640, 120)
    self.z = 10
    @actor_id = -1
  end

  def draw_wait_actor_status
    draw_actor_status(@wait.select_actor, 310)
  end

  def draw_actor_status1
    contents.font.size = 20
    draw_actor_face(actor, 0, 0)

    # 残りWIDTH領域132
    rect1 = Rect.new(105, 8, 170, line_height)
    rect2 = Rect.new(rect1.x + rect1.width + 5, rect1.y, 48, rect1.height)
    lv_str = "Lv:%d"

    change_color(normal_color)
    draw_text(rect1, actor.name) # 名前だけ少し大きく
    temp_font_size = contents.font.size
    contents.font.size = 18
    draw_actor_level(actor, rect2.x, rect2.y,  :base)

    draw_horz_line(rect1.y + line_height)
    rect1.y += line_height + 8
    rect2.y += line_height + 8
    change_color(tp_gauge_color2)
    draw_text(rect1, actor.class.name)
    draw_actor_level(actor, rect2.x, rect2.y, :class)

    rect1.y += line_height
    rect2.y += line_height
    change_color(mp_gauge_color2)
    draw_text(rect1, actor.tribe.name)
    draw_actor_level(actor, rect2.x, rect2.y, :tribe)

    contents.font.size = temp_font_size
  end

  def draw_actor_status2
    x = 330
    y = 0
    w1 = 42
    w2 = 64
    h = 22
    inc_x = 96
    inc_y = 22
    rect1 = Rect.new(0, 0, w1, h)
    rect2 = Rect.new(0 + w1, 0, w2, h)
    status_word  = [Vocab::hp_a, Vocab::mp_a, Vocab::tp_a]
    status_word += (0..5).collect{|i| Vocab::params_a(i)}
    status_param = (0...8).collect{|i|actor.param(i)}
    status_param.insert(2, actor.max_tp)

    temp_font_size = contents.font.size
    contents.font.size = 22
    change_color(system_color)
    status_word.each_with_index{|word, i|
      rect1.x = inc_x * (i % 3) + x
      rect1.y = inc_y * (i / 3) + y
      draw_text(rect1, word)
    }
    change_color(normal_color)
    status_param.each_with_index{|param, i|
      rect2.x = inc_x * (i % 3) + x + 42 - 10
      rect2.y = inc_y * (i / 3) + y
      dp = param >= 1000000 ? param.give_unit_floor(4) : param
      draw_text(rect2, dp, 2)
    }
    contents.font.size = temp_font_size
  end

  def draw_horz_line(y)
    line_y = y + (8 / 2) - 1
    contents.fill_rect(105, line_y, 212, 2, line_color)
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
    refresh
    activate
  end

  def draw_information
    change_color(normal_color)
    rect = Rect.new(0, -4, contents.width, 26)
    Help.job_change.each  do |text|
      draw_text(rect, text)
      rect.y += line_height
    end
  end
end

=begin
class Scene_ActorSelectBase < Scene_MenuBase
  include ShowKey_HelpWindow

  def show_key_text
    ["#{Vocab.key_y}/#{Vocab.key_z}:Sort"] if @help_window.visible
  end

  def show_key_sprite_window
    @help_window
  end

end
=end