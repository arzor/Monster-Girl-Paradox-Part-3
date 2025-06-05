class AbilityForm
  class Scene_File < ::Scene_File
    include ShowKey_HelpWindow

    def show_key_text
      [ShowKey_Help.ability_form_show]
    end

    def create_savefile_windows
      @savefile_windows = Array.new(item_max) do |i|
        Window_Data.new(@actor, savefile_height, i)
      end
      @savefile_windows.each { |window| window.viewport = @savefile_viewport }
    end

    def on_savefile_ok; end

    def item_max
      3
    end

    def exist_data?
      @actor.ability_form.exist?(@index)
    end

    def update_savefile_selection
      return on_savefile_x if Input.trigger?(:X)

      super
    end

    def on_savefile_x
      unless exist_data?
        Sound.play_buzzer
        return
      end
      SceneManager.call(Scene_ShowAbility)
      SceneManager.scene.prepare(@index)
    end
  end
end
