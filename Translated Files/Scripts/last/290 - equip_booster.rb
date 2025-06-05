module Hima
  class FeatureObjects
    def equip_booster
      features_with_id(FEATURE_BATTLER_ABILITY, EQUIP_ABILITY_BOOST).each_with_object([0] * 6) do |ft, a|
        a[ft.value] += 1
      end
    end

    def dual_shield_ability
      features_set(FEATURE_DUAL_SHIELD_ADD_ABILITY).map { |id| $data_armors[id] }
    end
  end
end

