class Window_Actor_Actions < Window_Selectable
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  include Window::NoFrame
  def initialize
    super(0, 0, 240, fitting_height(2))
    self.z = 200
    open
    @actor = nil
  end

  def setup(actor)
    @actor = actor
    refresh
  end

  def refresh
    create_contents
    draw_count
    draw_background
  end

  def line_number
    draw_procs.size
  end

  def back_rect
    Rect.new(0, standard_padding, width, line_number * line_height)
  end

  def draw_procs
    return [] unless @actor

    a = []
    l = 0
    if @actor.actions.size > 1
      a.push(proc do
        rect = item_rect_for_text(l)
        draw_text(rect, "Actions Remaining")
        draw_text(rect, format(":%2d", @actor.remine_input), 2)
        l += 1
      end)
    end

    if @actor.chain_input?
      a.push(proc do
        rect = item_rect_for_text(l)
        draw_text(rect, "Chain Activated")
        draw_text(rect, format("%d回目", @actor.chain_action_input_index + 1), 2) if @actor.chain_actions.size > 1
        l += 1
      end)
    end
    a
  end

  def draw_count
    draw_procs.each(&:call)
  end
end
