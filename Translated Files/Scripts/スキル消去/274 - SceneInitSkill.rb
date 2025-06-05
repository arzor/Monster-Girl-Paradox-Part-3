module Sound
  @play_init_skill_ok = RPG::SE.new("Powerup", 80)
  def self.play_init_skill_ok
    @play_init_skill_ok.play
  end
end

class Scene_InitSkill < Scene_ActorSelectBase
  def create_all_window
    super
    create_popup_window
  end

  def popup_message
    "%s's skills will be relearned. Are you sure?"
  end

  def process_actor_ok
    @actors_window.deactivate
    @popup_window.select(0)
    @popup_window.set_name(actor.name)
    @popup_window.refresh
    @popup_window.show.activate
  end

  def create_popup_window
    @popup_window = Window_PopupConfirm.new
    @popup_window.z = 500
    @popup_window.hide
    @popup_window.set_title(popup_message)
    @popup_window.set_handler(:ok, method(:confirm_ok))
    @popup_window.set_handler(:cancel, method(:confirm_cancel))
  end

  def confirm_ok
    actor.relearn_skills
    $game_variables[11] = actor.id
    @popup_window.deactivate.hide
    @actors_window.refresh
    @actors_window.activate
    Sound.play_init_skill_ok
    @popup_window.deactivate.hide
    @actors_window.activate
  end

  def confirm_cancel
    @popup_window.deactivate.hide
    @actors_window.activate
  end
end

