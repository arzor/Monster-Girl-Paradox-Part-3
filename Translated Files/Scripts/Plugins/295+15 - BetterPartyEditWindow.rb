
class Foo::PTEdit::Window_SortEval < Window_Base

  def initialize
    super(rect_fix[0],rect_fix[1],rect_fix[2],rect_fix[3])
    self.z = 101
    @eval_id = 0
    @all_refresh_method = nil
    make_actor_categories
    refresh
    activate
  end

  def rect_fix
   return [180, 0, 460, 36]
  end
end

class Foo::PTEdit::Window_ActorStatus < Window_Base

  def initialize(party, wait)
    @party = party
    @wait = wait
    super(0, 360, 640, 120)
    @old_party_member_id = @party.select_actor ? @party.select_actor.id : nil
    @old_wait_member_id = nil
    refresh
  end

  def draw_wait_actor_status
    draw_actor_status(@wait.select_actor, 310)
  end

  def draw_actor_level(actor, x, y, kind)
    change_color(system_color)
    @lv_size ||= text_size(Vocab.level_a)
    draw_text(x, y, width, line_height, Vocab.level_a)
    color = actor.max_level?(kind) ? system_color : normal_color
    change_color(color)
    draw_text(x + 14, y, 24, line_height, actor.level[kind], 2)
  end

  def draw_actor_status(actor, x)
    contents.font.size = 20
    draw_actor_face(actor, x, 0)

    # 残りWIDTH領域132
    rect1 = Rect.new(x + 100, 0, 170, line_height)
    rect2 = Rect.new(rect1.x + rect1.width, rect1.y, 48, rect1.height)

    change_color(normal_color)
    draw_text(rect1, actor.name) # 名前だけ少し大きく
    temp_font_size = contents.font.size
    contents.font.size = 18
    draw_actor_level(actor, rect2.x, rect2.y, :base)

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

    rect1.y += line_height
    rect2.y += line_height
    change_color(normal_color)
    draw_text(rect1, "Affection")
    draw_text(rect2, actor.luca? ? "-----" : "#{actor.love}")

    contents.font.size = temp_font_size
  end

end

class Foo::PTEdit::Window_PartyMember < Window_Command

  def initialize
    make_id_list
    super(0, 0)
  end

  def window_height
    360
  end

  def window_width
    180
  end

  def line_height
    28
  end

  def draw_item(index)
    contents.font.size = 22

    color = index < 4 ? normal_color : system_color
    change_color(color, command_enabled?(index))

    name = command_name(index)

    rect = item_rect_for_text(index)
    rect.width += 20

    draw_text(rect, name, alignment)

  end

end

class Foo::PTEdit::Window_WaitMember < Window_Command

  def initialize(sort, party)
    @sort = sort
    @party = party
    make_id_list
    super(180, line_height + 14)
    unselect
    deactivate
  end

  def window_height
    324
  end

  def window_width
    460
  end

  def line_height
    22
  end

  def col_max
    3
  end

  def spacing
    6
  end

  def alignment
    0
  end

  def item_width
    (width - standard_padding * 2 + spacing) / col_max - spacing
  end

  def draw_item(index)
    contents.font.size = 22
    change_color(command_color(index), command_enabled?(index))

    name = command_name(index)

    rect = item_rect_for_text(index)
    rect.x -= 5
    rect.width += 10

    draw_text(rect, name, alignment)
  end

end

class Scene_PartyEdit < Scene_MenuBase
  include ShowKey_HelpWindow

  def show_key_text
    result = @wait_member_window.active ? [] : ["#{Vocab.key_a}:Remove"]
    result += ["#{Vocab.key_x}:Status", "#{Vocab.key_y}:Sort",  "#{Vocab.key_z}:Warp To", "#{Vocab.key_a}:Favorite"]
    result
  end

  def show_key_sprite_window
    @wait_member_window
  end

  def create_information_window
    @information_window = Foo::PTEdit::Window_Information.new
    @information_window.hide
  end

  def create_actor_status_window
    @actor_status_window = Foo::PTEdit::Window_ActorStatus.new(@party_member_window, @wait_member_window)
  end

  def refresh_windows
    @sort_eval_window.refresh
    @party_member_window.refresh
    @wait_member_window.refresh
    @actor_status_window.refresh
  end

end

#================
#Multi-party fix
#================

module MultiParty
  class Window_MultiMember < Window_Command
    def window_width
      180
    end

    def standard_padding
      return 10
    end
  end
end

class MPFixedWindow_SortEval < Foo::PTEdit::Window_SortEval
  def rect_fix
   return [480, 0, 160, 36]
  end

  def draw_eval
    texts = {
      :id => "ID Order",
      :name => "By Name",
      :base_level => "By Base Level",
      :favorite => "Favorite"
    }

    if texts.include?(eval)
      text = texts[eval]
    else
      # Added To Translate Categories
      text = eval.to_s
      NWConst::Library::RACE_SPECIAL_NAME.each{|jap_name, tran_name|
        if jap_name.to_s == text.to_s
          text = tran_name
          break
        end
      }
    end

    change_color(system_color)
    rect = Rect.new(0,0,148,line_height)
    draw_text(rect, text, 1)
  end
end

class Scene_MultiPartyEdit < Scene_MenuBase
  def create_party_member_window
    l = 36
    h = 0
    ws = []
    @party_size.times do |i|
      w = MultiParty::Window_MultiMember.new(0, l, i + 1, @fix_members[i], @start_members[i])
      ws.push(w)
      instance_variable_set("@_w#{i}", w)
    end
    @party_member_windows = MultiParty::Windows_MultiMember.new(ws, @member_size, @confirm_window)
    (@party_member_windows.to_a + [@confirm_window]).each_with_index do |w, _i|
      w.set_handler(:cancel, method(:cancel_scene))
      w.set_handler(:ok, method(:select_party_to_wait))
      w.set_handler(:cursor_down, proc do
        @party_member_windows.id += 1
        active_party_window.select([1,active_party_window.item_max - 1].min)
        Input.update
      end)
      w.set_handler(:cursor_up, proc do
        @party_member_windows.id -= 1
        active_party_window.select(active_party_window.item_max - 1)
        Input.update
      end)
      w.set_handler(:call_status, method(:call_scene_status))
      w.set_handler(:move_member, method(:move_member))
    end
    @confirm_window.set_handler(:ok, method(:confirm_ok))
    @party_member_windows.refresh
  end

  def create_sort_eval_window
    @sort_eval_window = MPFixedWindow_SortEval.new
    @sort_eval_window.set_all_refresh_method(method(:refresh_windows))
    @sort_eval_window.set_disable_method(method(:disable_sort?))
  end
end
