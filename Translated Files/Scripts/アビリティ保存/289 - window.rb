class AbilityForm
  class Window_SaveLoadSelect < Window_Command
    def make_command_list
      add_command(Vocab::AbilityLoad, :ok, true, :load)
      add_command(Vocab::AbilitySave, :ok, true, :save)
    end

    def initialize
      super(0, 0)
    end

    def window_width
      250
    end
  end

  class Window_Data < Window_Base
    attr_reader :selected

    def initialize(actor, height, index)
      super(0, index * height, Graphics.width, height)
      @actor = actor
      @file_index = index
      refresh
      @selected = false
    end

    def selected=(selected)
      @selected = selected
      update_cursor
    end

    def update_cursor
      if @selected
        cursor_rect.set(0, 0, @name_width + 8, line_height)
      else
        cursor_rect.empty
      end
    end

    def draw_filename(x, y)
      change_color(normal_color)
      name = "Slot" + " #{@file_index + 1}"
      draw_text(x, y, 200, line_height, name)
      @name_width = text_size(name).width
    end

    def refresh
      contents.clear
      draw_filename(4, 0)
      draw_ability_setting(0, 0)
    end

    def draw_ability_setting(x, y)
      x = contents_width - 320 + x
      rect = Rect.new(x, y, contents.width - x, line_height)
      data = @actor.ability_form.load(@file_index)
      return unless data

      tab = Marshal.load(Marshal.dump(@actor.equip_abilities))
      @actor.load_abilities(@file_index)
      CacheActorFeatures.init_actor(@actor)
      NWConst::Ability::ABILITY_SKILL_TYPE.each do |stype_id|
        draw_ability(rect.x, rect.y, stype_id, rect.width, @actor.ap(stype_id), @actor.max_ap(stype_id))
        rect.y += line_height
      end
      CacheActorFeatures.init_actor(@actor)
      @actor.equip_abilities = tab
    end
  end

  class Window_EquipAbility < Foo::Ability::Window_EquipAbility
    attr_reader :pending_index
    def initialize
      @costs = []
      @pending_index = -1
      super(nil)
    end

    def window_width
      Graphics.width
    end

    def col_max
      2
    end

    def make_command_list
      @costs = []
      super
      @list.pop
    end

    def command_color(index)
      return crisis_color if total_cost(index) > @actor.max_ap(@stype_id)

      normal_color
    end

    def draw_item_background(index)
      contents.fill_rect(item_rect(index), pending_color) if index == @pending_index
    end

    def draw_item(index)
      draw_item_background(index)
      super
    end

    def total_cost(index)
      return 0 if index < 0
      return @costs[index] if @costs[index]

      cost = command_ext(index) || 0
      cost += total_cost(index - 1) if index > 0
      @costs[index] ||= cost
    end

    def pending_index=(index)
      last_pending_index = @pending_index
      @pending_index = index
      redraw_item(@pending_index)
      redraw_item(last_pending_index)
    end
  end
end
