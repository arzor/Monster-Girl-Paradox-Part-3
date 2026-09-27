# encoding: UTF-8
#========================================#
# Scroll Framework + Config v1.2          |
# Virtual/paged window framework          |
#========================================#

module ScrollFramework

  module ScrollableGrid
    attr_reader :scroll_y, :scroll_max, :scroll_page, :scroll_max_page

    def scroll_init
      @scroll_bitmap = nil
      @scroll_y = 0
      @scroll_max = 0
      @scroll_speed = 6
      @scroll_cols = 2
      @scroll_col_gap = 2
      @scroll_row_gap = 6
      @scroll_feat_size = 18
      @scroll_cell_align = 0
      @scroll_content_widths = nil
      @scroll_bar_width = 5
      @scroll_bar_color = Color.new(255, 255, 255, 120)
      @scroll_bar_bg_color = Color.new(255, 255, 255, 30)
      @scroll_up_keys = [:UP]
      @scroll_down_keys = [:DOWN]
      @scroll_page = 1
      @scroll_max_page = 1
      @scroll_page_next_keys = [:RIGHT]
      @scroll_page_prev_keys = [:LEFT]
      @scroll_page_fade_state = 0
      @scroll_fade_alpha = 0
      @scroll_fade_speed = 9
      @scroll_old_bitmap = nil
      @scroll_memory = {}
      @scroll_memory_key = :_default
      @scroll_bar_timer = 0
    end

    attr_accessor :scroll_cell_align, :scroll_content_widths, :scroll_bar_width, :scroll_bar_color, :scroll_bar_bg_color,
                  :scroll_speed, :scroll_cols, :scroll_col_gap, :scroll_row_gap,
                  :scroll_feat_size,
                  :scroll_up_keys, :scroll_down_keys, :scroll_page_next_keys, :scroll_page_prev_keys,
                  :scroll_fade_speed, :scroll_memory_key

    def scroll_page_setup(max_page)
      @scroll_max_page = [max_page, 1].max
      @scroll_page = @scroll_page.clamp(1, @scroll_max_page) rescue 1
      @scroll_page_fade_state = 0
      @scroll_fade_alpha = 0
    end

    def scroll_build(rx, rw, top_y, data_list, col_widths = nil)
      @scroll_memory ||= {}
      @scroll_memory[@scroll_memory_key] = @scroll_y
      @scroll_bitmap.dispose if @scroll_bitmap && !@scroll_bitmap.disposed?
      @scroll_y = @scroll_memory[@scroll_memory_key] || 0
      @scroll_rx = rx
      @scroll_rw = rw
      @scroll_top_y = top_y
      @scroll_vis_h = @scroll_grid_bottom - top_y rescue 0
      return if !data_list || data_list.empty?

      if col_widths
        xpos = []
        cx = 0
        @scroll_cols.times do |c|
          xpos << cx
          cx += (col_widths[c] || col_widths.last || 0) + @scroll_col_gap
        end
        actual_w = cx - @scroll_col_gap
        @scroll_rw = actual_w
        @scroll_rx = rx + ((rw - actual_w) / 2)
        @scroll_xpos = xpos
        total_w = actual_w
      else
        col_w = (rw - @scroll_col_gap) / @scroll_cols
        grid_w = col_w * @scroll_cols + @scroll_col_gap * (@scroll_cols - 1)
        grid_ox = [((rw - grid_w) / 2), 0].max
        @scroll_xpos = @scroll_cols.times.map { |c| grid_ox + c * (col_w + @scroll_col_gap) }
        total_w = rw
        @scroll_rx = rx
        if @scroll_content_widths
          ref_col = @scroll_cell_align == 0 ? @scroll_cols - 1 : 0
          cw = @scroll_content_widths[ref_col]
          if cw && cw < col_w
            slack = col_w - cw
            add_ox = @scroll_cell_align == 0 ? slack : -slack
            @scroll_rx = rx + add_ox / 2
          end
        end
      end

      row_step = line_height + @scroll_row_gap
      total_rows = (data_list.size.to_f / @scroll_cols).ceil
      total_h = total_rows * row_step
      return if total_h <= 0

      @scroll_bitmap = Bitmap.new([total_w, 1].max, [total_h, 1].max)
      @scroll_bitmap.font.size = @scroll_feat_size
      data_list.each_slice(@scroll_cols).with_index do |slice, ri|
        dy = ri * row_step
        slice.each_with_index do |data, ci|
          cw_in = col_widths ? (col_widths[ci] || col_widths.last || 0) : (rw - @scroll_col_gap) / @scroll_cols
          scroll_draw_cell(@scroll_bitmap, data, @scroll_xpos[ci], dy, cw_in, line_height)
        end
      end
      @scroll_max = [total_h - @scroll_vis_h, 0].max
    end

    def scroll_finalize(title_h)
      @scroll_memory ||= {}
      @scroll_memory[@scroll_memory_key] = @scroll_y
      @scroll_bitmap.dispose if @scroll_bitmap && !@scroll_bitmap.disposed?
      @scroll_title_h = title_h
      full_bmp = self.contents
      self.contents = Bitmap.new(contents_width, contents_height)
      contents.clear
      contents.blt(0, 0, full_bmp, Rect.new(0, 0, contents_width, [title_h, full_bmp.height].min))
      @scroll_bitmap = full_bmp
      @scroll_max = [@scroll_bitmap.height - contents_height, 0].max
      @scroll_y = [@scroll_memory[@scroll_memory_key] || 0, @scroll_max].min
      scroll_blit
    end

    def scroll_blit
      return unless @scroll_bitmap && !@scroll_bitmap.disposed?
      if @scroll_rx
        scroll_blit_area
      elsif @scroll_title_h
        scroll_blit_title
      end
    end

    def scroll_blit_area
      return if @scroll_vis_h <= 0
      contents.clear_rect(@scroll_rx, @scroll_top_y, @scroll_rw, @scroll_vis_h)
      total = @scroll_bitmap.height
      src_y = [[@scroll_y || 0, [total - @scroll_vis_h, 0].max].min, 0].max
      actual_h = [@scroll_vis_h, total - src_y].min
      contents.blt(@scroll_rx, @scroll_top_y, @scroll_bitmap, Rect.new(0, src_y, @scroll_rw, actual_h)) if actual_h > 0
      return unless @scroll_max > 0
      if @scroll_bar_width && (@scroll_bar_timer || 0) > 0
        bw = @scroll_bar_width
        a = [@scroll_bar_timer * 8, 255].min
        bg = @scroll_bar_bg_color.dup; bg.alpha = bg.alpha * a / 255
        fg = @scroll_bar_color.dup; fg.alpha = fg.alpha * a / 255
        contents.fill_rect(@scroll_rx + @scroll_rw - bw, @scroll_top_y, bw, @scroll_vis_h, bg)
        thumb_h = [@scroll_vis_h * @scroll_vis_h / (@scroll_bitmap.height + @scroll_vis_h), 8].max
        thumb_y = @scroll_top_y + (@scroll_y.to_f / @scroll_max) * (@scroll_vis_h - thumb_h)
        contents.fill_rect(@scroll_rx + @scroll_rw - bw, thumb_y || @scroll_top_y, bw, thumb_h, fg)
      end
      cx = @scroll_rx + @scroll_rw / 2
      scroll_draw_arrow(contents, cx, @scroll_top_y + 4, true, Color.new(255, 255, 255, 160)) if @scroll_y > 0
      scroll_draw_arrow(contents, cx, @scroll_top_y + @scroll_vis_h - 8, false, Color.new(255, 255, 255, 160)) if @scroll_y < @scroll_max
    end

    def scroll_blit_title
      th = @scroll_title_h
      vis_h = contents_height - th
      return if vis_h <= 0
      contents.clear_rect(0, th, contents_width, vis_h)
      total = @scroll_bitmap.height
      src_y = [[th + @scroll_y, [total - vis_h, 0].max].min, 0].max
      actual_h = [vis_h, total - src_y].min
      contents.blt(0, th, @scroll_bitmap, Rect.new(0, src_y, contents_width, actual_h)) if actual_h > 0
    end

    def scroll_update
      @scroll_bar_timer = [@scroll_bar_timer - 1, 0].max if @scroll_bar_timer
      return unless @scroll_up_keys
      scroll_update_fade if @scroll_page_fade_state && @scroll_page_fade_state > 0
      return if @scroll_page_fade_state && @scroll_page_fade_state > 0
      if @scroll_max_page > 1
        if @scroll_page_next_keys.any? { |k| Input.trigger?(k) }
          scroll_next_page
          return
        end
        if @scroll_page_prev_keys.any? { |k| Input.trigger?(k) }
          scroll_prev_page
          return
        end
      end
      return if @scroll_max <= 0
      scroll_input(@scroll_up_keys, @scroll_down_keys)
    end

    def scroll_input(up_keys, down_keys)
      up = up_keys.any? { |k| Input.press?(k) }
      down = down_keys.any? { |k| Input.press?(k) }
      @scroll_bar_timer = 60 if up || down
      return unless up || down
      ny = (@scroll_y || 0) + (down ? @scroll_speed : -@scroll_speed)
      ny = [[ny, @scroll_max || 0].min, 0].max
      return if ny == (@scroll_y || 0)
      @scroll_y = ny
      scroll_blit
    end

    def scroll_next_page
      return if @scroll_max_page <= 1 || (@scroll_page_fade_state || 0) > 0
      @scroll_page = @scroll_page >= @scroll_max_page ? 1 : @scroll_page + 1
      scroll_start_fade
    end

    def scroll_prev_page
      return if @scroll_max_page <= 1 || (@scroll_page_fade_state || 0) > 0
      @scroll_page = @scroll_page <= 1 ? @scroll_max_page : @scroll_page - 1
      scroll_start_fade
    end

    def scroll_start_fade
      return unless contents && !contents.disposed?
      @scroll_old_bitmap = @scroll_bitmap ? @scroll_bitmap.clone : nil
      scroll_on_page_change
      @scroll_fade_alpha = 0
      @scroll_page_fade_state = 1
    end

    def scroll_src_y
    [[@scroll_y || 0, [@scroll_bitmap.height - @scroll_vis_h, 0].max].min, 0].max
  end

  def scroll_blit_old(a)
    return unless @scroll_old_bitmap && !@scroll_old_bitmap.disposed?

    sy = scroll_src_y
    ah = [@scroll_vis_h, @scroll_old_bitmap.height - sy].min
    contents.blt(@scroll_rx, @scroll_top_y, @scroll_old_bitmap, Rect.new(0, sy, @scroll_rw, ah), a) if ah > 0
  end

  def scroll_blit_current(a)
    return unless @scroll_bitmap && !@scroll_bitmap.disposed?

    sy = scroll_src_y
    ah = [@scroll_vis_h, @scroll_bitmap.height - sy].min
    contents.blt(@scroll_rx, @scroll_top_y, @scroll_bitmap, Rect.new(0, sy, @scroll_rw, ah), a) if ah > 0
  end

  def scroll_update_fade
      return unless @scroll_page_fade_state && @scroll_page_fade_state > 0
      @scroll_fade_alpha = (@scroll_fade_alpha || 0) + @scroll_fade_speed
      a = [@scroll_fade_alpha, 255].min
      contents.clear_rect(@scroll_rx, @scroll_top_y, @scroll_rw, @scroll_vis_h)

      case @scroll_page_fade_state
      when 1
        scroll_blit_old(255 - a)

        if a >= 255
          @scroll_old_bitmap.dispose rescue nil if @scroll_old_bitmap
          @scroll_old_bitmap = nil
          scroll_on_page_change
          @scroll_fade_alpha = 0
          @scroll_page_fade_state = 2
        end
      when 2
        scroll_blit_current(a)

        if a >= 255
          @scroll_page_fade_state = 0
        end
      end
    end

    def scroll_on_page_change
    end

    def scroll_dispose
      @scroll_bitmap.dispose if @scroll_bitmap && !@scroll_bitmap.disposed?
      @scroll_bitmap = nil
      if @scroll_old_bitmap
        @scroll_old_bitmap.dispose rescue nil
        @scroll_old_bitmap = nil
      end
    end

    def scroll_draw_arrow(bitmap, cx, y, up, color)
      rows = up ? (0...4).map { |i| i * 2 + 1 } : (0...4).map { |i| 7 - i * 2 }
      rows.each_with_index { |w, i| bitmap.fill_rect(cx - w / 2, y + i, w, 1, color) }
    end

    def scroll_draw_cell(bmp, data, x, y, w, h)
    end
  end

  module GlowDivider

    def draw_glow_divider(x, y, width)
      draw_fading_line_h(x, y - 1, width, 3, glow_color(25))
      draw_fading_line_h(x, y, width, 1, glow_color(120))
    end

    def draw_glow_divider_v(x, y, height)
      draw_fading_line_v(x - 1, y, 3, height, glow_color(25))
      draw_fading_line_v(x, y, 1, height, glow_color(120))
    end

    def glow_color(alpha)
      Color.new(255, 255, 255, alpha)
    end

    def draw_fading_line_h(x, y, width, height, color)
      fade = width / 4

      width.times do |dx|
        ratio = 1.0

        if dx < fade
          ratio = dx / fade.to_f
        elsif dx >= width - fade
          ratio = (width - dx) / fade.to_f
        end

        c = color.dup
        c.alpha = (color.alpha * ratio).to_i
        contents.fill_rect(x + dx, y, 1, height, c)
      end
    end

    def draw_fading_line_v(x, y, w, h, color)
      fade = h / 4

      h.times do |dy|
        ratio = 1.0

        if dy < fade
          ratio = dy / fade.to_f
        elsif dy >= h - fade
          ratio = (h - dy) / fade.to_f
        end

        c = color.dup
        c.alpha = (color.alpha * ratio).to_i
        contents.fill_rect(x, y + dy, w, 1, c)
      end
    end

  end

end

module NWConst::Config
  def self.add_toggle(key, name, help, default = 0, group = nil, &on_change)
    entry = CONTENTS.find { |e| e[:key] == key }
    if entry
      entry[:name] = name
      entry[:help] = help
      entry[:group] = group if group
      entry[:on_change] = on_change if block_given?
    else
      entry = {:key => key, :name => name, :sub => true, :help => help}
      entry[:group] = group if group
      entry[:on_change] = on_change if block_given?
      CONTENTS.insert(-3, entry)
    end
    DATA[key] = [0, 1]
    DATA_TEXT[key] = {0 => {:name => "Off", :help => ""}, 1 => {:name => "On", :help => ""}}
    DEFAULT[key] = default
  end

  def self.add_select(key, name, help, options, default, group = nil, &on_change)
    entry = CONTENTS.find { |e| e[:key] == key }
    if entry
      entry[:name] = name
      entry[:help] = help
      entry[:group] = group if group
      entry[:on_change] = on_change if block_given?
    else
      entry = {:key => key, :name => name, :sub => true, :help => help}
      entry[:group] = group if group
      entry[:on_change] = on_change if block_given?
      CONTENTS.insert(-3, entry)
    end
    DATA[key] = options.keys.sort
    DATA_TEXT[key] = options
    DEFAULT[key] = default
  end
end

#============================================================================
# Window_BetterConfig — tab-based grouped config
#============================================================================

$ORIGINAL_CONFIG_KEYS = NWConst::Config::CONTENTS.map { |e| e[:key] }

class Window_BetterConfigTabs < Window_Selectable
  attr_reader :tabs

  def initialize(tabs)
    @tabs = tabs
    super(0, 120, Graphics.width, fitting_height(1))
    refresh
    activate
    select(0)
  end

  def item_max
    @tabs.size
  end

  def col_max
    [item_max, 1].max
  end

  def item_width
    contents.width / [item_max, 1].max
  end

  def spacing
    0
  end

  def current_tab
    @tabs[@index]
  end

  def draw_item(index)
    rect = item_rect(index)
    draw_text(rect, @tabs[index][:name], 1)
  end

end

class Window_BetterConfigItems < Window_Selectable

  def initialize
    @items = []
    super(0, 120 + fitting_height(1), Graphics.width, Graphics.height - 120 - fitting_height(1))
    set_handler(:ok, lambda {})
    set_handler(:cancel, lambda {})
    refresh
    deactivate
  end

  def ok_enabled?
    @items[@index] != nil
  end

  def process_ok
    entry = @items[@index]
    return unless entry

    if entry[:sub]
      cursor_cycle(1)
    else
      return unless key
      Sound.play_ok
      Input.update
      call_handler(key)
    end
  end

  def call_cancel_handler
    Input.update
    clear_items
    scene = SceneManager.scene rescue nil

    if scene
      scene.instance_variable_set(:@focus_state, :tab)
      scene.instance_variable_get(:@config_window).activate
    end
  end

  def set_items(items)
    @items = items
    refresh
    select(0)
  end

  def clear_items
    @items = []
    refresh
    deactivate
    self.cursor_rect.empty rescue nil
  end

  def item_max
    @items.size
  end

  def item
    @items[@index]
  end

  def draw_item(index)
    entry = @items[index]
    return unless entry

    rect = item_rect(index)
    rect.x += 20
    rect.width -= 20
    draw_text(rect, entry[:name])
    return unless entry[:sub]

    cfg = NWConst::Config
    value = $game_system.conf[entry[:key]]
    value = cfg::DEFAULT[entry[:key]] unless cfg::DATA_TEXT[entry[:key]][value]
    val_text = cfg::DATA_TEXT[entry[:key]][value][:name] rescue nil
    draw_text(item_rect(index).tap { |r| r.x = 380 }, val_text) if val_text
  end

  def key(idx = @index)
    entry = @items[idx]
    entry ? entry[:key] : nil
  end

  def cursor_right(wrap = false)
    cursor_cycle(1)
  end

  def cursor_left(wrap = false)
    cursor_cycle(-1)
  end

  def cursor_cycle(dir)
    entry = @items[@index]
    return unless entry && entry[:sub]

    cfg = NWConst::Config
    k = entry[:key]
    cur_val = $game_system.conf[k]
    cur_val = cfg::DEFAULT[k] unless cfg::DATA[k].include?(cur_val)
    idx = cfg::DATA[k].index(cur_val) || 0
    idx = (idx + dir) % cfg::DATA[k].size
    new_val = cfg::DATA[k][idx]
    $game_system.conf[k] = new_val
    Sound.play_cursor
    entry[:on_change].call(new_val) if entry[:on_change]
    refresh
    update_help
  end

  def update_help
    return unless @help_window

    entry = @items[@index]
    return unless entry

    cfg = NWConst::Config
    text = entry[:help] || ""

    if entry[:sub]
      val = $game_system.conf[entry[:key]]
      opts = cfg::DATA_TEXT[entry[:key]]
      if opts
        val = cfg::DEFAULT[entry[:key]] unless opts[val]
        val_entry = opts[val]
        val_help = val_entry[:help] if val_entry
        text += "\r\n#{val_help}" if val_help && !val_help.empty?
      end
    end

    @help_window.set_text(text.gsub(/eval<(\S+)>/) { eval($1) rescue "" })
  end

end

class Scene_Config
  unless method_defined?(:_create_tone_config_window)
    alias _create_tone_config_window create_tone_config_window
    alias _create_sound_config_window create_sound_config_window
  end

  def create_tone_config_window
    _create_tone_config_window
    @tone_config_window.set_handler(:return, method(:end_tone_config))
    @tone_config_window.set_handler(:cancel, method(:end_tone_config))
  end

  def create_sound_config_window
    _create_sound_config_window
    @sound_config_window.set_handler(:return, method(:end_sound_config))
    @sound_config_window.set_handler(:cancel, method(:end_sound_config))
  end

  def create_config_window
    build_config_groups
    @config_window = Window_BetterConfigTabs.new(@groups)
    @config_window.help_window = @help_window
    @config_window.viewport = @viewport
    @config_window.set_handler(:window_tone, method(:start_tone_config))
    @config_window.set_handler(:sound_volume, method(:start_sound_config))
    @config_window.set_handler(:default, method(:set_default))
    @config_window.set_handler(:return, method(:return_scene))
    @config_window.set_handler(:cancel, method(:on_tab_cancel))
    @config_window.set_handler(:ok, method(:on_config_tab_ok))
    @config_window.activate
    @item_window = Window_BetterConfigItems.new
    @item_window.viewport = @viewport
    @item_window.help_window = @help_window
    @item_window.set_handler(:window_tone, method(:start_tone_config))
    @item_window.set_handler(:sound_volume, method(:start_sound_config))
    @item_window.set_handler(:default, method(:set_default))
    @item_window.set_handler(:return, method(:return_scene))
  end

  def on_tab_cancel
    return_scene
  end

  def set_default
    NWConst::Config::DEFAULT.each { |k, v| $game_system.conf[k] = v }
  rescue => e
    p "set_default crash: #{e}"
  end

  def build_config_groups
    @groups = []
    grouped = {}
    NWConst::Config::CONTENTS.each_with_index do |entry, ei|
      group = entry[:group] || ($ORIGINAL_CONFIG_KEYS.include?(entry[:key]) ? "General" : "Extra")
      grouped[group] ||= []
      grouped[group] << entry
    end
    grouped.each { |name, items| @groups << { :name => name, :items => items } }
  end

  def on_config_tab_ok
    data = @groups[@config_window.index]
    @item_window.set_items(data[:items])
    @item_window.activate.select(0)
    @focus_state = :item
  end

  def start_tone_config
    @focus_state = :item
    @config_window.deactivate if @config_window
    @item_window.deactivate if @item_window
    @tone_config_window.activate.show.select(0)
  end

  def end_tone_config
    @tone_config_window.deactivate.hide
    target = @focus_state == :item ? @item_window : @config_window
    target.activate if target
  end

  def start_sound_config
    @focus_state = :item
    @config_window.deactivate if @config_window
    @item_window.deactivate if @item_window
    @sound_config_window.activate.show.select(0)
  end

  def end_sound_config
    @sound_config_window.deactivate.hide
    target = @focus_state == :item ? @item_window : @config_window
    target.activate if target
  end

  def on_config_item_cancel
    Input.update
    @item_window.clear_items
    (@focus_state == :item ? @item_window : @config_window).activate
  end
end

#==============================================================================
# ■ PluginFramework Precomputed Type Icon Tables
#==============================================================================
#==============================================================================
# ■ GameIconRegistry
# Centralized Icon Mapping for Weapon Types, Armor Types, Skill Types & Features
#==============================================================================
module GameIconRegistry
  # Custom Composite Badge IDs
  CUSTOM_ICON_NO_DUAL_WIELD = 9600
  CUSTOM_ICON_ABSORB        = 9601
  CUSTOM_ICON_NULLIFY       = 9603
  CUSTOM_ICON_TRIPLE_WIELD  = 9604
  CUSTOM_ICON_MASTERY       = 9605
  CUSTOM_ICON_BOOSTER       = 9606
  CUSTOM_ICON_ELEM_BOOSTER  = 9606 # Alias for backward compatibility
  CUSTOM_ICON_ELEM_RESIST   = 9607

  # Element ID -> Icon ID
  ELEMENT_ICONS = {
    1=>244, 2=>188, 3=>144, 4=>145, 5=>146, 6=>149, 7=>148, 8=>147, 9=>150, 10=>151,
    35=>176, 36=>51, 38=>5014, 41=>3610, 43=>185, 44=>165, 45=>166, 46=>168, 47=>167,
    48=>169, 49=>303, 50=>274, 51=>245, 52=>3671
  }

  XPARAM_ICONS = [80, 81, 82, 83, 84, 85, 86, 87, 88, 89]
  SPARAM_ICONS = [153, 154, 155, 156, 157, 158, 159, 160, 161, 162]
  CODE_ICONS   = {33=>274, 34=>85, 41=>206, 42=>207, 55=>97, 61=>86, 62=>82, 64=>58, 68=>129, 69=>130, 71=>176, 72=>130}

  # Tiered threshold sets for value-based icon levels
  TIER_SETS = {
    :mhp     => [5014, 5015, 5016, 5017],
    :mmp     => [5018, 5019, 5020, 5021],
    :sp      => [5022, 5023, 5024, 5024],
    :atk     => [5021, 5022, 5023, 5024],
    :hit     => [5034, 5035],
    :eva_phy => [5026, 5027],
    :eva_mag => [5028, 5029],
    :cri     => [5141, 5142],
    :guard   => [5021, 5022, 5023, 5024],
    :mpc     => [5017, 5018, 5019, 5020],
    :tpc     => [5021, 5022, 5023, 5024]
  }

  TIER_THRESH = {
    :two   => [0.10, 0.30, 0.50],
    :three => [0.15, 0.50, 1.00],
    :four  => [0.20, 0.50, 0.80]
  }

  # Reusable Composite Badge Layout Presets
  # Change these presets once, and all matching badges update globally across the game.
  NULLIFY_BADGE_CONFIG = {
    overlay: 49,
    scale:   0.75,
    align:   :center,
    alpha:   255
  }

  BOOSTER_BADGE_CONFIG = {
    overlay: 99,
    scale:   0.58,
    align:   :bottom_left,
    alpha:   255
  }

  RESIST_BADGE_CONFIG = {
    overlay: 143,
    scale:   0.63,
    align:   :bottom_left,
    alpha:   255
  }

  ABSORB_BADGE_CONFIG = {
    overlay: 57,
    scale:   1.0,
    align:   :center,
    alpha:   255
  }

  MASTERY_BADGE_CONFIG = {
    base:        99,
    size_offset: -5,
    align:       :center,
    alpha:       204
  }

  NO_DUAL_WIELD_CONFIG = {
    overlay:     49,
    size_offset: -4,
    align:       :center,
    alpha:       204
  }

  # Declarative configuration mapping Composite Badge IDs -> Layout Settings
  STACKED_ICON_CONFIGS = {
    CUSTOM_ICON_NO_DUAL_WIELD => NO_DUAL_WIELD_CONFIG.merge(
      base: ->(data) { sname_icon('Multiweapon') || 476 }
    ),
    CUSTOM_ICON_ABSORB => ABSORB_BADGE_CONFIG.merge(
      base: ->(data) { element_icon(data[2]) }
    ),
    CUSTOM_ICON_NULLIFY => NULLIFY_BADGE_CONFIG.merge(
      base: ->(data) { data[2] || 0 }
    ),
    CUSTOM_ICON_MASTERY => MASTERY_BADGE_CONFIG.merge(
      overlay: ->(data) { data[2] || 0 }
    ),
    CUSTOM_ICON_BOOSTER => BOOSTER_BADGE_CONFIG.merge(
      base: ->(data) { data[2] || element_icon(3) || 144 }
    ),
    CUSTOM_ICON_ELEM_RESIST => RESIST_BADGE_CONFIG.merge(
      base: ->(data) { data[2] || element_icon(3) || 144 }
    )
  }

  # Command / Skill Type / Weapon Name -> Icon ID
  SNAME_ICONS = {
    'Attack' => 11, 'Sword' => 463, 'Katana' => 922, 'Spear' => 836,
    'Axe' => 972, 'Scythe' => 1182, 'Gun' => 1576, 'Unarmed' => 182,
    'Black Magic' => 206, 'Time Magic' => 208, 'Holy' => 171, 'Dark' => 177,
    'Chaos' => 172, 'Piracy' => 221, 'EX-Item' => 2999, 'Singing' => 184, 'Talk' => 4,
    'Medicine' => 228, 'Heroism' => 215, 'Demon Arts' => 205, 'Special' => 300,
    'Wait' => 62, 'Defend' => 2270, 'Item' => 2675, 'Service' => 225,
    'Beast' => 3842, 'Wing' => 3761, 'Nature' => 157, 'Breath' => 152,
    'White Magic' => 207, 'Ninjutsu' => 1482, 'Dancing' => 176, 'Dagger' => 306,
    'Throwing' => 1485, 'Club' => 1056, 'Thievery' => 3009, 'Bow' => 1345,
    'Tentacle' => 3974, 'Corpse' => 1, 'Whip' => 1462, 'Multiweapon' => 476,
    'Rapier' => 697, 'Summoning' => 209, 'Alchemy' => 3574, 'Grimoire' => 183,
    'Magic Science' => 223, 'Makina' => 4066, 'Artificial' => 3829, 'Sorcery' => 210,
    'Slime' => 174, 'Flail' => 1505, 'Giant' => 287, 'Sexcraft' => 188,
    'Ocean' => 155, 'Spellblade' => 181, 'Oracle' => 220, 'Psychic' => 180,
    'Taoism' => 233, 'Justice' => 227, 'Mercantile' => 3444, 'Cooking' => 224,
    'Ruling' => 226, 'Snake' => 3973, 'Insect' => 3975, 'Plant' => 3355,
    'Struggle' => 32, 'Fan' => 1540
  }

  # Weapon Type ID -> Icon ID
  WTYPE_ICONS = {
    1 => 306, 2 => 933, 3 => 555, 4 => 584, 5 => 697, 6 => 469, 7 => 836,
    8 => 850, 9 => 923, 10 => 344, 11 => 957, 12 => 4021, 13 => 972, 14 => 1056,
    15 => 1188, 16 => 1243, 17 => 1284, 18 => 1373, 19 => 1461, 20 => 4195,
    21 => 1485, 22 => 4362, 23 => 1546, 24 => 334, 25 => 1562, 26 => 417,
    27 => 4210, 28 => 4046, 29 => 3192, 30 => 1586, 31 => 4224, 32 => 172
  }

  # Armor Type ID -> Icon ID
  ATYPE_ICONS = {
    1 => 1769, 2 => 1781, 3 => 1884, 4 => 1890, 5 => 1923, 6 => 4251, 7 => 2031,
    8 => 4261, 9 => 4267, 33 => 2156, 34 => 2200, 35 => 2213, 36 => 2175,
    37 => 2365, 38 => 2256, 39 => 2254, 40 => 2275, 41 => 3604
  }

  # Skill Type ID -> Icon ID
  STYPE_ICONS = {
    1 => 97, 2 => 102, 3 => 100, 4 => 98, 5 => 99, 6 => 306, 7 => 463,
    8 => 697, 9 => 922, 10 => 836, 11 => 972, 12 => 1056, 13 => 1182, 14 => 1345,
    15 => 1462, 16 => 1485, 17 => 1505, 18 => 1540, 19 => 1576, 20 => 476,
    21 => 182, 22 => 207, 23 => 206, 24 => 208, 25 => 209, 26 => 171, 27 => 177,
    28 => 181, 29 => 233, 30 => 3009, 31 => 1482, 32 => 221, 33 => 227,
    34 => 3444, 35 => 2999, 36 => 220, 37 => 176, 38 => 184, 39 => 4,
    40 => 223, 41 => 3574, 42 => 183, 43 => 4061, 44 => 2966, 45 => 228,
    46 => 225, 47 => 226, 48 => 215, 49 => 188, 50 => 205, 51 => 155,
    52 => 174, 53 => 3842, 54 => 3973, 55 => 3974, 56 => 3761, 57 => 3975,
    58 => 3355, 59 => 1, 60 => 3829, 61 => 157, 62 => 144, 63 => 205,
    64 => 726, 67 => 180, 68 => 210, 69 => 287, 70 => 177
  }

  def self.valid_icon?(i)
    i.is_a?(Numeric) && i > 0 && i < 5200
  end

  def self.sname_icon(name)
    SNAME_ICONS[name] || 0
  end

  def self.name_icon(name)
    SNAME_ICONS[name] || 0
  end

  def self.has_sname?(name)
    SNAME_ICONS.key?(name)
  end

  def self.wtype_icon(id)
    WTYPE_ICONS[id] || 0
  end

  def self.atype_icon(id)
    ATYPE_ICONS[id] || 0
  end

  def self.stype_icon(id)
    STYPE_ICONS[id] || 0
  end

  def self.element_icon(id)
    ELEMENT_ICONS[id] || 0
  end

  def self.ri_tier(set_key, thresh_key, eff)
    return 0 if eff <= 0.0
    set = TIER_SETS[set_key] or return 0
    t1, t2, t3 = TIER_THRESH[thresh_key]
    rank = eff <= t1 ? 1 : (eff <= t2 ? 2 : (eff <= t3 ? 3 : 4))
    set[rank - 1] || set.last || 0
  end

  def self.stacked_config(icon_id)
    STACKED_ICON_CONFIGS[icon_id]
  end

  def self.stacked_icon?(icon_id)
    STACKED_ICON_CONFIGS.key?(icon_id)
  end

  def self.booster_generic_fallback(key)
    return 0 unless key
    st = $data_states[key] rescue nil; return st.icon_index if st && valid_icon?(st.icon_index)
    sk = $data_skills[key] rescue nil; return sk.icon_index if sk && valid_icon?(sk.icon_index)
    el = ELEMENT_ICONS[key]; return el if el
    sn = $data_system.skill_types[key] rescue nil
    sn ? (SNAME_ICONS[sn] || 0) : 0
  end

  def self.resource_feature_icon(ft)
    case ft.code
    when 21
      case ft.data_id
      when 0 then ri_tier(:mhp, :three, ft.value.to_f - 1.0)
      when 1 then ri_tier(:mmp, :three, ft.value.to_f - 1.0)
      else 0
      end
    when 22, 66
      case ft.data_id
      when 7 then ri_tier(:mhp, :two, ft.value.to_f)
      when 8 then ri_tier(:mmp, :two, ft.value.to_f)
      when 9 then ri_tier(:sp, :two, ft.value.to_f)
      else 0
      end
    when 23
      case ft.data_id
      when 2 then ri_tier(:mhp, :two, ft.value.to_f - 1.0)
      when 1, 4 then 29
      when 5 then ri_tier(:sp, :three, ft.value.to_f - 1.0)
      when 6, 7
        eff = (1.0 - ft.value.to_f).abs
        eff <= 0.15 ? 124 : 132
      else 0
      end
    when 68
      case ft.data_id
      when 8  then ri_tier(:mmp, :two, (ft.value.to_f rescue 0.0))
      when 10 then ri_tier(:mmp, :two, (ft.value.to_f rescue 0.0))
      when 17, 18
        stid = ft.value[:id] rescue nil
        if stid
          sn = $data_system.skill_types[stid] rescue nil
          return (SNAME_ICONS[sn] || 0) if sn
        end
        eff = (((ft.value[:rate] rescue 1.0) - 1.0).abs)
        case (ft.value[:type] rescue nil)
        when :MP then ri_tier(:mpc, :four, eff)
        when :TP then ri_tier(:tpc, :four, eff)
        else 0
        end
      when 19 then ri_tier(:tpc, :four, (1.0 - ft.value.to_f).abs)
      when 22 then ri_tier(:tpc, :two, ((ft.value[:num].to_f/100.0 rescue ft.value.to_f rescue 0.0).abs))
      when 23 then ri_tier(:atk, :three, (ft.value.to_f rescue 0.0))
      when 24 then ri_tier(:mhp, :two, (ft.value.to_f rescue 0.0))
      when 25 then ri_tier(:mmp, :two, (ft.value.to_f rescue 0.0))
      else 0
      end
    else 0
    end
  end

  # Feature-code X-Param Resolver
  def self.resolve_xparam_icon(ft)
    case ft.data_id
    when 0 then ft.value.to_f < 1.0 ? 5034 : 5035
    when 1 then ft.value.to_f < 1.0 ? 5026 : 5027
    when 2 then ft.value.to_f < 1.0 ? 5141 : 5142
    when 3 then 0
    when 4 then ft.value.to_f < 1.0 ? 5028 : 5029
    when 5 then 5144
    when 6 then 5056
    when 7 then ri_tier(:mhp, :two, ft.value.to_f)
    when 8, 9 then ri_tier(:sp, :two, ft.value.to_f)
    else XPARAM_ICONS[ft.data_id] || 0
    end
  end

  # Feature-code 68 (Battler Ability) Resolver
  def self.resolve_btl_ability_icon(ft)
    case ft.data_id
    when 0   then SNAME_ICONS['Thievery'] || 3009
    when 1   then 50 # Endure
    when 3   then SNAME_ICONS['Special'] || 300
    when 4   then st = $data_states[ft.value[:state_id]] rescue nil; st ? st.icon_index : (CODE_ICONS[68] || 0)
    when 6   then 29 # Barrier
    when 7   then CUSTOM_ICON_NULLIFY # Nullify Barrier <= X
    when 9, 11, 21 then 3444
    when 12, 13, 14, 15
      sid = ft.value.is_a?(Hash) ? (ft.value[:id] || ft.value[:skill_id]) : ft.value
      sk = $data_skills[sid] rescue nil
      (sk && valid_icon?(sk.icon_index) && sk.icon_index > 0) ? sk.icon_index : 56
    when 16  then 56
    when 26
      sid = ft.value.to_i rescue 0
      sk = $data_skills[sid] rescue nil
      return 0 unless sk
      icon = valid_icon?(sk.icon_index) ? sk.icon_index : 0
      if icon <= 0 && sk.effects.any? { |e| e.code == 45 }
        icon = SNAME_ICONS['Thievery'] || 3009
      end
      icon = stype_icon(sk.stype_id) if icon <= 0
      if icon <= 0 && (sn = $data_system.skill_types[sk.stype_id] rescue nil)
        icon = SNAME_ICONS[sn] || 0
      end
      icon > 0 ? icon : 11
    when 27, 29, 30, 31, 32, 33, 64, 65 then CUSTOM_ICON_NULLIFY
    when 35
      v = (ft.value.to_f rescue 0.0)
      v <= 0.5 ? 5058 : (v <= 2.0 ? 5059 : 5060)
    when 36
      v = (ft.value.to_f rescue 0.0)
      v <= 0.5 ? 5061 : (v <= 2.0 ? 5062 : 5063)
    when 37
      sid = ft.value.keys.first rescue nil
      sn = $data_system.skill_types[sid] rescue nil
      sn ? (SNAME_ICONS[sn] || 0) : (CODE_ICONS[68] || 0)
    when 38
      sid = ft.value.keys.first rescue nil
      sk = $data_skills[sid] rescue nil
      sn = $data_system.skill_types[sk.stype_id] rescue nil
      sn ? (SNAME_ICONS[sn] || 0) : (CODE_ICONS[68] || 0)
    when 40  then CUSTOM_ICON_NULLIFY
    when 41  then 50
    when 42
      sk = $data_skills[ft.value[:after]] rescue nil
      (sk && valid_icon?(sk.icon_index)) ? sk.icon_index : 56
    when 45  then 5143
    when 46  then CUSTOM_ICON_NO_DUAL_WIELD
    when 55  then 5144
    else
      sid = case ft.data_id
            when 13, 14, 15 then ft.value[:id] rescue nil
            else ft.value.is_a?(Array) ? ft.value.first : ft.value
            end
      sk = $data_skills[sid] rescue nil
      return (CODE_ICONS[68] || 0) unless sk
      return (SNAME_ICONS['Thievery'] || 3009) if sk.effects.any? { |e| e.code == 45 }
      sn = $data_system.skill_types[sk.stype_id] rescue nil
      icon = sn ? (SNAME_ICONS[sn] || 0) : 0
      icon = sk.icon_index if icon <= 0 && valid_icon?(sk.icon_index)
      if icon <= 0
        sk.effects.each do |e|
          next unless e.code == (defined?(Game_Battler::EFFECT_ADD_STATE) ? Game_Battler::EFFECT_ADD_STATE : 11)
          st = $data_states[e.data_id] rescue nil
          if st && valid_icon?(st.icon_index)
            icon = st.icon_index
            break
          end
        end
      end
      icon > 0 ? icon : (CODE_ICONS[68] || 56)
    end
  end

  # Resolves the underlying base icon for any booster feature
  def self.booster_base_icon(ft, entry_key = nil)
    key = if entry_key
      entry_key
    elsif ft.value.is_a?(Hash)
      ft.value.keys.first
    else
      ft.value
    end

    case ft.data_id
    when 0 # Element
      (key && element_icon(key).nonzero?) || 144
    when 1, 3 # Weapon Physical / Certain
      (key && wtype_icon(key).nonzero?) || sname_icon('Sword') || 463
    when 2 # Weapon Magical
      (key && wtype_icon(key).nonzero?) || sname_icon('Staff') || 1056
    when 4 # Normal Attack
      11
    when 5, 6, 7, 20, 21, 23, 24, 26 # Skill Type / State Ratio Type
      if key
        ic = stype_icon(key)
        return ic if ic > 0
        sn = $data_system.skill_types[key] rescue nil
        return sname_icon(sn) if sn && sname_icon(sn) > 0
      end
      sname_icon('Sword') || 463
    when 8, 9, 22, 25 # Skill / State Ratio Skill
      skid = key.is_a?(Array) ? key[1] : key
      sk = $data_skills[skid] rescue nil
      if sk && valid_icon?(sk.icon_index) && sk.icon_index > 0
        return sk.icon_index
      end
      if sk
        ic = stype_icon(sk.stype_id)
        return ic if ic > 0
        sn = $data_system.skill_types[sk.stype_id] rescue nil
        return sname_icon(sn) if sn && sname_icon(sn) > 0
      end
      56
    when 10 # Wtype Skill
      if key.is_a?(Array) && key.size == 2
        ic = stype_icon(key[1])
        return ic if ic > 0
        sn = $data_system.skill_types[key[1]] rescue nil
        return sname_icon(sn) if sn && sname_icon(sn) > 0
        wic = wtype_icon(key[0])
        return wic if wic > 0
      end
      sname_icon('Sword') || 463
    when 11 # Counter
      5056
    when 12 # Fall HP
      50
    when 14 # Reflection
      5142
    when 15 # Critical
      5160
    when 27
      5035
    when 28
      5021
    else
      if key.is_a?(Array) && key.size == 2
        st = $data_states[key[1]] rescue nil
        (st && valid_icon?(st.icon_index) && st.icon_index > 0) ? st.icon_index : (booster_generic_fallback(key[0]) || 56)
      else
        booster_generic_fallback(key) || 56
      end
    end
  end

  # Feature-code 69 (Multi-Booster) Resolver
  def self.resolve_multi_booster_icon(ft)
    case ft.data_id
    when 0
      el = ft.value.keys.first rescue nil
      return ri_tier(:mhp, :two, (ft.value[el].to_f rescue 0.0)) if el == 38
      CUSTOM_ICON_BOOSTER
    when 1, 2, 3, 5, 6, 7, 8, 9, 10, 20, 21, 22, 23, 24, 25, 26
      CUSTOM_ICON_BOOSTER
    when 4 then 11
    when 11 then 5056
    when 12 then 50
    when 14 then 5142
    when 15
      v = (ft.value.to_f rescue 0.0)
      v < 1.0 ? 5160 : (v < 2.0 ? 5161 : 5162)
    when 27 then 5035
    when 28 then 5021
    else
      CUSTOM_ICON_BOOSTER
    end
  end

  # Universal Feature Icon Resolver
  def self.feature_icon(ft, item = nil)
    ri = resource_feature_icon(ft)
    return ri if ri > 0

    case ft.code
    when 11
      if ft.value && ft.value.to_f == 0.0
        CUSTOM_ICON_NULLIFY
      elsif ft.value && ft.value.to_f < 1.0
        CUSTOM_ICON_ELEM_RESIST
      else
        element_icon(ft.data_id)
      end
    when 12
      if ft.value && ft.value.to_f < 1.0
        CUSTOM_ICON_ELEM_RESIST
      else
        (defined?(Game_BattlerBase::ICON_BUFF_START) ? Game_BattlerBase::ICON_BUFF_START : 64) + ft.data_id
      end
    when 13
      if ft.value && ft.value.to_f < 1.0
        CUSTOM_ICON_ELEM_RESIST
      else
        st = $data_states[ft.data_id] rescue nil; st ? st.icon_index : 0
      end
    when 14
      return 14 if ft.data_id == 30
      st = $data_states[ft.data_id] rescue nil
      st ? CUSTOM_ICON_NULLIFY : 0
    when 21
      return (element_icon(1).nonzero? || 244) if ft.data_id == 2
      (defined?(Game_BattlerBase::ICON_BUFF_START) ? Game_BattlerBase::ICON_BUFF_START : 64) + ft.data_id
    when 22, 66 then resolve_xparam_icon(ft)
    when 31
      ft.data_id == 40 ? (sname_icon('Time Magic') || 208) : (element_icon(ft.data_id))
    when 32
      st = $data_states[ft.data_id] rescue nil
      st ? st.icon_index : 0
    when 34 then 5044
    when 41, 42
      sn = $data_system.skill_types[ft.data_id] rescue nil
      icon = sn ? (sname_icon(sn) || 0) : 0
      icon > 0 ? icon : (sname_icon('Sword') || 463)
    when 43, 44
      if item && valid_icon?(item.icon_index) && item.icon_index > 0
        item.icon_index
      else
        sk = $data_skills[ft.data_id] rescue nil
        (sk && valid_icon?(sk.icon_index) && sk.icon_index > 0) ? sk.icon_index : 56
      end
    when 51 then wtype_icon(ft.data_id)
    when 52 then atype_icon(ft.data_id)
    when 55
      ft.data_id == 0 ? CUSTOM_ICON_NO_DUAL_WIELD : (ft.data_id == 3 ? CUSTOM_ICON_TRIPLE_WIELD : (sname_icon('Multiweapon') || 476))
    when 61 then 5132
    when 62 then ft.data_id == 0 ? 14 : (CODE_ICONS[62] || 0)
    when 64
      ft.data_id == 2 ? CUSTOM_ICON_NULLIFY : (ft.data_id == 3 ? 2510 : (ft.data_id == 4 ? 3444 : (CODE_ICONS[64] || 58)))
    when 67
      if ft.data_id == 0
        3444
      elsif ft.data_id == 2
        0
      elsif ft.data_id == 3
        v = (ft.value.to_f rescue 0.0)
        v <= 1.5 ? 5070 : (v <= 3.0 ? 5071 : 5072)
      elsif ft.data_id == 5
        sname_icon('Thievery') || 3009
      else
        3444
      end
    when 68 then resolve_btl_ability_icon(ft)
    when 69, 85, 159 then resolve_multi_booster_icon(ft)
    when 70 then 29
    when 71 then 176
    when 72 then CUSTOM_ICON_MASTERY
    when 73
      v = ft.value rescue nil
      sid = (v.is_a?(Hash) && v[:self].is_a?(Hash)) ? v[:self].keys.first : ((v.is_a?(Hash) && v[:target].is_a?(Hash)) ? v[:target].keys.first : nil)
      st = $data_states[sid] rescue nil
      if st && valid_icon?(st.icon_index) && st.icon_index > 0
        st.icon_index
      elsif sid == 413
        2270
      else
        sk = $data_skills[ft.data_id] rescue nil
        (sk && valid_icon?(sk.icon_index) && sk.icon_index > 0) ? sk.icon_index : 56
      end
    when 74
      v = ft.value rescue nil
      sid = (v.is_a?(Hash) && v[:self].is_a?(Hash)) ? v[:self].keys.first : ((v.is_a?(Hash) && v[:target].is_a?(Hash)) ? v[:target].keys.first : nil)
      st = $data_states[sid] rescue nil
      if st && valid_icon?(st.icon_index) && st.icon_index > 0
        st.icon_index
      elsif sid == 413
        2270
      else
        sn = $data_system.skill_types[ft.data_id] rescue nil
        icon = sn ? (sname_icon(sn) || 0) : 0
        icon > 0 ? icon : (sname_icon('Sword') || 463)
      end
    when 138 then 5056
    when 142 then CUSTOM_ICON_ABSORB
    when 143 then 5141
    when 152
      v = ft.value.to_s
      v.include?("Cannot") ? CUSTOM_ICON_NO_DUAL_WIELD : 0
    when 153 then 50
    when 154 then ft.data_id == 2 ? 2248 : 2247
    when 160
      sk = $data_skills[ft.data_id] rescue nil
      (sk && valid_icon?(sk.icon_index)) ? sk.icon_index : 56
    else
      CODE_ICONS[ft.code] || 56
    end
  end

  # Formats / extracts the display string for a feature
  def self.feature_name(ft, item = nil)
    if ft.code == 68
      case ft.data_id
      when 31
        rate = ((ft.value || 0) * 100.0).to_i
        return "Nullify Physical Counter #{rate}%"
      when 32
        rate = ((ft.value || 0) * 100.0).to_i
        return "Nullify Magic Counter #{rate}%"
      when 33
        rate = ((ft.value || 0) * 100.0).to_i
        return "Nullify Sure-Hit Counter #{rate}%"
      end
    end

    if item && item.respond_to?(:enchant_method_table)
      mn = item.enchant_method_table[ft.code] rescue nil
      if mn && item.respond_to?(mn)
        r = item.send(mn, ft) rescue nil
        r = r.first if r.is_a?(Array)
        return r.is_a?(String) ? r.gsub(/\\c\[\d+\]/, '') : nil
      end
    end
    nil
  end

  # Extracts compound data tuples for a single feature
  def self.extract_feature_rows(ft, item = nil)
    return [] unless ft
    return [] if ft.code == 70 || ft.code == 152 # Ignore explanation-only tags

    if ft.code == 68
      case ft.data_id
      when 31
        rate = ((ft.value || 0) * 100.0).to_i
        return [[CUSTOM_ICON_NULLIFY, "Nullify Physical Counter #{rate}%", 5056]]
      when 32
        rate = ((ft.value || 0) * 100.0).to_i
        return [[CUSTOM_ICON_NULLIFY, "Nullify Magic Counter #{rate}%", 5056]]
      when 33
        rate = ((ft.value || 0) * 100.0).to_i
        return [[CUSTOM_ICON_NULLIFY, "Nullify Sure-Hit Counter #{rate}%", 5056]]
      end
    end

    mn = item.enchant_method_table[ft.code] rescue nil
    return [] unless mn
    res = item.send(mn, ft) rescue nil
    return [] unless res

    keys = ft.value.is_a?(Hash) ? ft.value.keys : []
    rows = []
    items_to_process = res.is_a?(Array) ? res.flatten.compact : [res]
    items_to_process.each_with_index do |sub_item, idx|
      next unless sub_item.is_a?(String) && !sub_item.strip.empty?
      name = sub_item.gsub(/\\c\[\d+\]/, '')
      ic = feature_icon(ft, item)
      entry_key = keys[idx] || keys.first

      if ic == CUSTOM_ICON_ABSORB
        rows << [CUSTOM_ICON_ABSORB, name, entry_key || ft.data_id]
      elsif ic == CUSTOM_ICON_NULLIFY
        sic = if ft.code == 14
          st = $data_states[ft.data_id] rescue nil
          st ? st.icon_index : 0
        elsif ft.code == 68 && ft.data_id == 40
          sname_icon('Time Magic') || 208
        elsif ft.code == 68 && ft.data_id == 7
          29
        elsif ft.code == 68 && [27, 29, 30, 31, 32, 33, 64, 65].include?(ft.data_id)
          5056
        elsif ft.code == 64 && ft.data_id == 2
          CODE_ICONS[64] || 58
        elsif ft.code == 11
          element_icon(entry_key || ft.data_id).nonzero? || 144
        else
          (ft.data_id.is_a?(Numeric) && $data_states[ft.data_id]) ? $data_states[ft.data_id].icon_index : 56
        end
        rows << [CUSTOM_ICON_NULLIFY, name, sic]
      elsif ic == CUSTOM_ICON_MASTERY
        did = entry_key || ft.data_id
        oic = 0
        if did.is_a?(Array)
          cat, tid = did[0], did[1]
          if cat == 0
            type_name = $data_system.weapon_types[tid] rescue nil
            oic = wtype_icon(tid).nonzero? || (type_name ? sname_icon(type_name) : 0)
          else
            type_name = $data_system.armor_types[tid] rescue nil
            oic = atype_icon(tid).nonzero? || (type_name ? sname_icon(type_name) : 0)
          end
          name = type_name ? "#{type_name} #{name}" : name
        end
        rows << [CUSTOM_ICON_MASTERY, name, oic]
      elsif ic == CUSTOM_ICON_BOOSTER || ic == CUSTOM_ICON_ELEM_BOOSTER
        base_ic = booster_base_icon(ft, entry_key)
        rows << [CUSTOM_ICON_BOOSTER, name, base_ic]
      elsif ic == CUSTOM_ICON_ELEM_RESIST
        elem_ic = if ft.code == 11
          element_icon(entry_key || ft.data_id).nonzero? || 144
        elsif ft.code == 12
          (defined?(Game_BattlerBase::ICON_BUFF_START) ? Game_BattlerBase::ICON_BUFF_START : 64) + ft.data_id
        elsif ft.code == 13
          st = $data_states[ft.data_id] rescue nil
          st ? st.icon_index : 0
        else
          element_icon(entry_key || ft.data_id).nonzero? || 144
        end
        rows << [CUSTOM_ICON_ELEM_RESIST, name, elem_ic]
      else
        ic2 = (valid_icon?(ic) || stacked_icon?(ic) || ic == CUSTOM_ICON_TRIPLE_WIELD) ? ic : 56
        rows << [ic2, name]
      end
    end
    rows
  end

  # Universal feature data builder for any item/actor/class
  def self.build_features_data(item)
    return [] unless item && item.respond_to?(:features) && item.features
    data = []
    item.features.each do |ft|
      data.concat(extract_feature_rows(ft, item))
    end

    unique_data = []
    seen = {}
    data.each do |row|
      key = row[1].to_s.strip.downcase
      if seen[key]
        existing_idx = seen[key]
        if [29, 56, 112].include?(unique_data[existing_idx][0]) && !([29, 56, 112].include?(row[0]))
          unique_data[existing_idx] = row
        end
      else
        seen[key] = unique_data.size
        unique_data << row
      end
    end
    unique_data
  end
end

# Backward compatibility aliases
SNAME_ICONS = GameIconRegistry::SNAME_ICONS
NAME_TO_ICON = GameIconRegistry::SNAME_ICONS

module PluginFramework
  SNAME_ICONS = GameIconRegistry::SNAME_ICONS
  WTYPE_ICONS = GameIconRegistry::WTYPE_ICONS
  ATYPE_ICONS = GameIconRegistry::ATYPE_ICONS
  STYPE_ICONS = GameIconRegistry::STYPE_ICONS
  ELEMENT_ICON_TABLE = GameIconRegistry::ELEMENT_ICONS

  def self.feature_icon(ft, item = nil)
    GameIconRegistry.feature_icon(ft, item)
  end

  def self.feature_name(ft, item = nil)
    GameIconRegistry.feature_name(ft, item)
  end

  def self.build_features_data(item)
    GameIconRegistry.build_features_data(item)
  end
end

