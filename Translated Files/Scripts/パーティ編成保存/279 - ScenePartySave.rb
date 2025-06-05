class Scene_PartySave < PartyForm::Scene_PartyForm
  def help_window_text
    Vocab::PartySaveMessage
  end

  def first_savefile_index
    $game_system.party_form.last_save_index
  end

  def on_savefile_ok
    super
    if $game_system.party_form.save(@index, $game_party.members.map(&:id))
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
