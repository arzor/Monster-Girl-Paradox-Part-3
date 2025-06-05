module Challenge_Battle
  class Enemy < Game_Enemy
    def cant_move?
      true
    end

    def hp
      0
    end

    def mhp
      0
    end

    def state_resist_set
      super + [death_state_id]
    end

    def make_damage_value(user, item, opt = {})
      super
      if user.actor? && item.damage.to_hp?
        $game_variables[NWConst::Var::CHALLENGE_BATTLE_DAMAGE] += @result.hp_damage
      end
    end
  end
end
