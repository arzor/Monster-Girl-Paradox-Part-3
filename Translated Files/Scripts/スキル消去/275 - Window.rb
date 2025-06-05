module SkillForget
  class Window_SelectType < Window_Command
    def initialize
      super((Graphics.width - window_width) / 2, 200)
      self.z = 500
      hide.deactivate
    end

    def make_command_list
      add_command("Skill", :skill_ok)
      add_command("Ability", :ability_ok)
      add_command("Cancel", :cancel)
    end
  end

  class Window_SkillListF < Window_SkillList
    def enable?(skill)
      skill
    end

    def create_item_cost_window; end

    def make_item_list
      @data = @actor ? @actor.learn_skills.select { |skill| include?(skill) } : []
      sort_item_list
    end
  end

  class Window_AbilityTypeF < Foo::Ability::Window_AbilityType
    def initialize(stand_ability)
      super(nil, stand_ability)
    end

    def draw_item(index)
      stype_id = @actor.abilities.keys[index]
      ability_name = $data_system.skill_types[stype_id]
      reset_font_settings
      draw_text(item_rect(index), ability_name)
    end

    def item_width
      190
    end
  end

  class Window_AbilityList < Foo::Ability::Window_StandAbility
    def initialize
      super
      self.x = 0
      make_item_list
    end

    def col_max
      2
    end

    def item
      ability_id ? $data_skills[ability_id] : nil
    end

    def ability_id
      current_data ? current_data[:name] : nil
    end

    def enable_command?(id)
      true
    end

    def make_item_list
      @data = []
      return if @stype_id == 0

      @data = @actor.abilities[@stype_id].map { |id| $data_skills[id] }
      sort_item_list
    end

    def window_width
      Graphics.width
    end

    def window_height
      Graphics.height - 216
    end

    def stype_id=(id)
      @stype_id = id
      self.oy = 0
      refresh
    end

    def draw_item(index)
      rect = item_rect_for_text(index)
      ability = $data_skills[command_name(index)]
      draw_item_name(ability, rect.x, rect.y, ability)
      change_color(system_color)
      draw_text(rect, @list[index][:ext].to_s, 2)
    end

    def update_help
      @help_window.clear
      @help_window.set_item(item)
    end
  end

  class Window_SkillCommandF < Window_SkillCommand
    def process_handling
      return unless open? && active
      return process_ok       if ok_enabled?        && Input.trigger?(:C)
      return process_cancel   if cancel_enabled?    && Input.trigger?(:B)
      return process_pagedown if handle?(:pagedown) && Input.trigger?(:R)
      return process_pageup   if handle?(:pageup)   && Input.trigger?(:L)
    end

    def update
      super
      @skill_window.stype_id = current_ext if @skill_window
    end

    def make_command_list
      return unless @actor

      all_skill_types = @actor.learn_skills.collect { |skill| skill.stype_id }.uniq
      all_skill_types.reject! { |stype_id| NWConst::Ability::ABILITY_SKILL_TYPE.include?(stype_id) }

      all_skill_types.select do |stype_id|
        stype_usable?(stype_id)
      end.tap do |stypes|
        break @actor.sorted_stypes(stypes)
      end.each  do |stype_id|
        name = $data_system.skill_types[stype_id]
        add_command(name, :skill, true, stype_id)
      end
    end

    def draw_item(index)
      change_color(normal_color, true)
      draw_text(item_rect_for_text(index), command_name(index), alignment)
    end
  end
end
