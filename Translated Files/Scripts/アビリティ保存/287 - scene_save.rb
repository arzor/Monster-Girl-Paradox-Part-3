class AbilityForm
  class Scene_Save < Scene_File
    SE = RPG::SE.new("Load")
    def help_window_text
      Vocab::AbilitySaveMessage
    end

    def first_savefile_index
      0
    end

    def on_savefile_ok
      @actor.save_abilities(@index)
      on_save_success
      super
    end

    def on_save_success
      SE.play
      return_scene
    end
  end
end