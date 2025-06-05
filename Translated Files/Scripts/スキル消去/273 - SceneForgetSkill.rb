module SkillForget
  class Scene_ForgetSkill < Scene_ForgetMenuBase
    def start
      super
      create_help_window
      create_command_window
      create_status_window
      create_item_window
    end

    def popup_message
      n = item.name.size > 12 ? "\\n" : ""
      "Erasing the skill %s. Are you sure?"
    end

    def create_command_window
      wy = @help_window.height
      @command_window = Window_SkillCommandF.new(0, wy)
      @command_window.viewport = @viewport
      @command_window.help_window = @help_window
      @command_window.actor = @actor
      @command_window.set_handler(:skill,    method(:command_skill))
      @command_window.set_handler(:cancel,   method(:return_scene))
    end

    def create_status_window
      y = @help_window.height
      @status_window = Window_SkillStatus.new(@command_window.width, y)
      @status_window.viewport = @viewport
      @status_window.actor = @actor
    end

    def create_item_window
      wx = 0
      wy = @status_window.y + @status_window.height
      ww = Graphics.width
      wh = Graphics.height - wy
      @item_window = Window_SkillListF.new(wx, wy, ww, wh)
      @item_window.actor = @actor
      @item_window.viewport = @viewport
      @item_window.help_window = @help_window
      @item_window.set_handler(:ok,     method(:on_item_ok))
      @item_window.set_handler(:cancel, method(:on_item_cancel))
      @command_window.skill_window = @item_window
    end

    def command_skill
      @item_window.activate
      @item_window.select(0)
    end

    def on_item_cancel
      @item_window.unselect
      @command_window.activate
    end

    def confirm_ok
      super
      @command_window.refresh
    end

    def on_item_ok
      @item_window.deactivate
      @popup_window.select(0)
      @popup_window.set_title(popup_message)
      @popup_window.set_name(item.window_name)
      @popup_window.refresh
      @popup_window.show.activate
    end
  end
end
