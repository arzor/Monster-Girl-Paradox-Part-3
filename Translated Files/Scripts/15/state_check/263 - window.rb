class Window_BattlerStates < Window_Selectable
  attr_accessor :battlers

  def initialize
    super(0, 0, Graphics.width, Graphics.height / 2)
  end

  def draw_battler(battler, x, y)
    reset_font_settings
    change_color(normal_color)
    draw_text(x + 12, y, item_width, line_height, battler.name)
    draw_status_list(battler, x, y + line_height + 2)
  end

  def draw_status_list(battler, x, y)
    states = battler.states.select(&:display?)
    if battler.defence_wall > 0
      change_color(normal_color)
      draw_text(x + 24, y, item_width, line_height, "Barrier")
      draw_text(x, y, item_width, line_height, ":#{battler.defence_wall}", 2)
      y += line_height
      y += line_height / 4
    elsif states.empty?
      change_color(normal_color)
      draw_text(x + 24, y, item_width, line_height, "None")
      return
    end

    states[0..show_state_max].each do |state|
      turn = battler.state_turns[state.id]
      turn = "∞" if turn == -1
      str = ":#{turn}"
      draw_icon(state.icon_index, x, y, true)
      draw_text(x, y, item_width, line_height, str, 2) unless state.auto_removal_timing == 0
      change_color(item_color(state), true)
      state.display_state_name.split("\\n").each do |line|
        draw_text_autosizing(x + 24, y, item_width - text_size(str).width - 24, line_height, line)
        y += line_height
      end
      y += line_height / 4
    end
  end

  def item_width
    (contents.width + spacing) / 4 - spacing
  end

  def spacing
    4
  end

  def page_max
    1
  end

  def draw_all_items
    draw_battlers(0, 0)
  end

  def draw_battlers(x, y)
    return unless battlers

    battlers.each do |battler|
      draw_battler(battler, x, y)
      x += item_width + spacing
    end
  end

  def show_state_max
    page_row_max - 1
  end
end
