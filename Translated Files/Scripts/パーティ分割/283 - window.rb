module MultiParty
  HELP_MESSAGE = "Please create %s parties."
  class Window_Help < ::Window_Base
    def initialize(size)
      super(0, 0, Graphics.width - 160, fitting_height(1))
      @text = format(HELP_MESSAGE, size)
      refresh
      self.z = 101
    end

    def standard_padding
      6
    end

    def refresh
      contents.clear
      draw_text_ex(4, 0, @text)
    end
  end

  class Window_Confirm < Window_Command
    attr_accessor :member_size
    def initialize
      super(0, 0)
      deactivate.unselect
    end

    def make_command_list
      add_command("Confirm Party", :ok)
    end

    def cursor_up(wrap = false)
      call_handler(:cursor_up)
    end

    def cursor_down(wrap = false)
      call_handler(:cursor_down)
    end

    def no_actor?
      true
    end

    def actors
      []
    end

    def select_actor
      nil
    end
  end

  class Window_MultiMember < Window_Command
    attr_accessor :actors
    attr_accessor :member_size

    def initialize(x, y, number, fix_actors, start_actors)
      @member_size = 1
      @number = number
      @fix_actors = fix_actors
      @actors = @fix_actors.clone
      @actors.push(*start_actors) if start_actors

      super(x, y)
      unselect
      deactivate
      self.arrows_visible = false
      refresh
    end

    def visible_line_number
      @member_size
    end

    def window_width
      160
    end

    def no_actor_name
      "【Empty】"
    end

    def make_command_list
      add_command("Party #{@number}", :n, false)
      @actors.each { |id| add_command($game_actors[id].name, :ok, !@fix_actors.include?(id)) }
      (visible_line_number - @actors.size - 1).times { add_command(no_actor_name, :ok) }
    end

    def no_actor?
      index < 0 || @actors.size + 1 <= index
    end

    def select_actor
      no_actor? ? nil : $game_actors[@actors[index - 1]]
    end

    def cursor_up(wrap = false)
      t = (index - col_max + item_max) % item_max
      if t == 0
        call_handler(:cursor_up)
      else
        super
      end
    end

    def cursor_down(wrap = false)
      t = (index + col_max) % item_max
      if t == 0
        call_handler(:cursor_down)
      else
        super
      end
    end

    def update
      super
      process_call_status
      process_move_member
    end

    def process_call_status
      return unless cursor_movable?
      return unless Input.trigger?(:X)

      Input.update
      if no_actor?
        Sound.play_buzzer
      else
        Sound.play_ok
        call_handler(:call_status)
      end
    end

    def process_move_member
      return unless cursor_movable?
      return unless Input.trigger?(:A)

      Input.update
      if !no_actor? && current_item_enabled?
        Sound.play_equip
        call_handler(:move_member)
      else
        Sound.play_buzzer
      end
    end
  end

  class Window_WaitMember < Foo::PTEdit::Window_WaitMember
    def make_command_list
      @actors.each do |id|
        enabled = !@party.any? { |w| w.actors.include?(id) }
        add_command($game_actors[id].name, :ok, enabled)
      end
    end
  end

  class Windows_MultiMember < BasicObject
    [:is_a?, :instance_of?, :class].each do |m|
      define_method(m, &::Kernel.method(m))
    end

    attr_reader :id

    def initialize(data, member_size, confirm_window)
      @data = data
      @id = 0
      @member_size = member_size
      @confirm_window = confirm_window
      size_check
    end

    def _data
      return @confirm_window if @data.size == id

      @data[id]
    end

    def id=(other)
      @id = other.reverse_clamp(0, @data.size)
      refresh
    end

    def method_missing(message, *args)
      _data.send(message, *args)
    end

    def size_check
      @data.each do |w|
        w.member_size = @member_size + 1
      end
      @oversize_flag = (@data[0].y + @data.map(&:window_height).inject(:+)) + @confirm_window.height > ::Graphics.height
    end

    def refresh
      @confirm_window.deactivate.unselect
      @data.each do |w|
        w.member_size = @oversize_flag ? 1 : @member_size + 1
        w.deactivate.unselect
      end
      _data.activate
      _data.member_size = @member_size + 1
      h = @data[0].y
      @data.each do |w|
        w.move(w.x, h, w.width, w.window_height)
        h += w.window_height
        w.refresh
      end
      @confirm_window.move(@data.first.x, @data.last.y + @data.last.height, @data.first.window_width,
                           @confirm_window.window_height)
    end

    def to_a
      @data
    end
  end
end
