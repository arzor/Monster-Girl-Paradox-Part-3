class Game_Switches
  # @param switch_id [Integer]
  # @param value [Boolearn]
  def actor_switch_set(switch_id, value)
    id = switch_id - ADD_ACTOR_BASE
    return $game_party.remove_actor(id) if value == false

    return if $game_party.exist_all_actor_id?(id)

    $game_party.persona_change(id)
    $game_party.add_stand_actor(id)
  end
end

