class AbilityForm
  class Scene_Load < Scene_File
    POPUP_MESSAGE = "Insufficient Maximum AP\\nSome abilities will be removed upon loading. Continue?"
    SE = RPG::SE.new("Equip1")
    def start
      create_popup_confirm_window
      super
    end

    def create_popup_confirm_window
      @popup_confirm_window = Window_PopupConfirm.new
      @popup_confirm_window.set_title(POPUP_MESSAGE)
      @popup_confirm_window.set_handler(:ok, method(:on_popup_ok))
      @popup_confirm_window.set_handler(:cancel, method(:on_popup_cancel))
    end

    def on_popup_ok
      on_save_success
    end

    def on_popup_cancel
      @popup_confirm_window.hide.deactivate
      @savefile_windows[@index].activate
    end

    def first_savefile_index
      @actor.ability_form.last_save_index
    end

    def help_window_text
      Vocab::AbilityLoadMessage
    end

    def on_savefile_ok
      unless exist_data?
        Sound.play_buzzer
        return
      end

      unless enough_ap?
        Sound.play_ok
        @popup_confirm_window.show.activate.unselect
        @savefile_windows[@index].deactivate
        return
      end

      on_save_success
      super
    end

    def update_savefile_selection
      return if @popup_confirm_window.active

      super
    end

    def enough_ap?
      data = @actor.ability_form.load(@index)
      tab = Marshal.load(Marshal.dump(@actor.equip_abilities))
      @actor.load_abilities(@index)
      CacheActorFeatures.init_actor(@actor)
      result = NWConst::Ability::ABILITY_SKILL_TYPE.all? do |stype_id|
        cost = data[stype_id].map { |i| $data_skills[i].memorize_cost }.inject(0, :+)
        @actor.max_ap(stype_id) >= cost
      end
      @actor.equip_abilities = tab
      CacheActorFeatures.init_actor(@actor)
      result
    end

    def on_save_success
      @actor.load_abilities(@index)
      @actor.refresh
      SE.play
      return_scene
    end
  end
end
