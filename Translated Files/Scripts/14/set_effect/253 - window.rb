class Window_SetEffect < Window_Base
  SET_CONST = "%i Piece Bonus"
  include EquipInfoWindow
  def initialize(x, y, width, height)
    super(x, y, width, height)
    self.back_opacity = 192
    self.z = 100
    hide
    @index = 0
    @col = 0
    @set_effect_count = {}
    self.arrows_visible = false
  end

  def refresh
    start_contents_build
    draw_all_items
    build_contents
    draw_all_items
  end

  def draw_all_items
    return unless @item

    @index = 0
    @col = 0
    @item.set_effects.each do |effect|
      draw_set_effect_name(effect)
      effect.size.times do |i|
        draw_set_effect(effect, i + 1)
      end
      next_page
    end
  end

  def draw_next_page
    rect = Rect.new(320, contents.height - line_height, 320, line_height)
    page_max.times do |i|
      change_color(system_color)
      draw_text(rect, "→次のページ") if page_max - 1 > i
      rect.x += width
    end
  end

  def draw_set_effect_name(effect)
    change_color(text_color(11))
    rect = item_rect
    rect.x -= 4
    draw_text(rect, effect.name)
    change_color(normal_color)
    @index += 1
  end

  def line_max
    12
  end

  def remain_line
    line_max - @index % line_max
  end

  def new_col
    @col += 1
    @index = 0
  end

  def next_page
    new_col
    @col += 1 if @col.odd?
  end

  def item_rect
    Rect.new(4 + (@col * width / 2), line_height * @index, (width / 2 - 20), line_height)
  end

  def actor=(actor)
    @actor = actor
    if @actor.nil?
      @set_effect_count = {}
      return
    end
    @set_effect_count = @actor.set_effect_count
  end

  def enabled(effect, id)
    @actor && @set_effect_count.fetch(effect, 0) >= id
  end

  def draw_set_effect(effect, id)
    if effect_line(effect, id) + @index > line_max
      new_col
      if @col.even?
        draw_set_effect_name
      else
        @index += 1
      end
    end
    change_color(system_color, enabled(effect, id))
    draw_text(item_rect, format(SET_CONST, id))
    @index += 1
    change_color(normal_color, enabled(effect, id))
    effect[id].enchant_names.each do |name|
      rect = item_rect
      rect.x += 10
      draw_text_plus(rect, name)
      @index += 1
    end
  end

  def effect_line(effect, id)
    effect[id].enchant_names.size + 1
  end

  def page_max
    return 0 if @item.nil? || @item.set_effects.empty?

    [(@col / 2), 1].max
  end

  def page_index=(index)
    self.ox = index * width
    super
  end
end
