module SkillForget
  class Scene_ForgetAbility < Scene_ForgetMenuBase
    def popup_message
      n = item.name.size > 10 ? "\\n" : ""
      "Erasing the ability %s. #{n}Are you sure?"
    end

    def start
      super
      create_help_window
      create_item_window
      create_ability_type_window
    end

    def create_ability_type_window
      @ability_type_window = Window_AbilityTypeF.new(@item_window)
      @ability_type_window.set_handler(:ok, method(:process_ability_type_ok))
      @ability_type_window.set_handler(:cancel, method(:return_scene))
      @ability_type_window.actor = @actor
      @ability_type_window.help_window = @help_window
      @ability_type_window.refresh
      @ability_type_window.update_help
    end

    def create_item_window
      @item_window = Window_AbilityList.new
      @item_window.set_handler(:ok,     method(:on_item_ok))
      @item_window.set_handler(:cancel, method(:on_item_cancel))
      @item_window.actor = @actor
      @item_window.help_window = @help_window
    end

    def on_item_cancel
      @item_window.unselect
      @ability_type_window.activate
    end

    def on_item_ok
      @item_window.deactivate
      @popup_window.set_title(popup_message)
      @popup_window.set_name(item.window_name)
      @popup_window.select(0)
      @popup_window.refresh
      @popup_window.show.activate
    end

    def process_ability_type_ok
      @ability_type_window.deactivate
      @item_window.activate
      @item_window.select(0)
      @item_window.update_help
    end
  end
end
