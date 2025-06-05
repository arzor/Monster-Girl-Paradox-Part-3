class Scene_PartyLoad < PartyForm::Scene_PartyForm
  def help_window_text
    Vocab::PartyLoadMessage
  end

  def first_savefile_index
    0
  end

  def on_savefile_ok
    super
    members = $game_system.party_form.load(@index)
    if members && members.select { |member| $game_party.exist_all_actor_id?(member) }
      $game_party.members.map(&:id).each do |id|
        $game_party.move_stand_actor(id)
      end
      members.each do |id|
        $game_party.move_actor(id)
      end
      on_save_success
    else
      Sound.play_buzzer
    end
  end

  def on_save_success
    Sound.play_ok
    return_scene
  end
end
