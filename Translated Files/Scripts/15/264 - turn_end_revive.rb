REVIVE_SKILL = RPG::Skill.new
REVIVE_SKILL.effects = [RPG::UsableItem::Effect.new(NWUsableEffect::EFFECT_REMOVE_STATE, 1)]
REVIVE_SKILL.damage.type = 3
REVIVE_SKILL.damage.variance = 0
REVIVE_SKILL.damage.formula = "b.mhp * b.revive_rate"
REVIVE_SKILL.scope = 11

TURN_END_REVIVE_SKILL = Marshal.load(Marshal.dump(REVIVE_SKILL))
TURN_END_REVIVE_SKILL.damage.formula = "b.mhp"
