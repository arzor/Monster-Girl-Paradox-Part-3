class Scene_Forget < Scene_ActorSelectBase
  def create_all_window
    super
    create_popup_window
  end

  def process_actor_ok_check
    @popup_window.show.activate
    @popup_window.actor_ok = true
    @popup_window.select(0)
  end

  def create_popup_window
    @popup_window = SkillForget::Window_SelectType.new
    @popup_window.set_handler(:skill_ok, method(:process_actor_skill_ok))
    @popup_window.set_handler(:ability_ok, method(:process_actor_ability_ok))
    @popup_window.set_handler(:cancel, method(:process_actor_cancel))
  end

  def process_actor_skill_ok
    $game_party.menu_actor = actor
    SceneManager.call(SkillForget::Scene_ForgetSkill)
  end

  def process_actor_ability_ok
    $game_party.menu_actor = actor
    SceneManager.call(SkillForget::Scene_ForgetAbility)
  end

  def process_actor_ok
    @popup_window.show.activate
    @popup_window.select(0)
  end

  def process_actor_cancel
    @popup_window.hide.deactivate
    @actors_window.activate
  end
end
