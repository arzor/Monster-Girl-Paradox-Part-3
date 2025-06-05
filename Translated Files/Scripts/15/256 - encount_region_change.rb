class Game_System
  class EncountRegion
    AIRSHIP = -1
    NONE = -2
    REGION_NONE = -3
    def initialize
      @data = {}
      @encounter_airship = {}
      @any_region = {}
    end

    def [](map_id, region_id)
      return region_id unless @data.key?(map_id)

      @data[map_id].fetch(region_id, region_id)
    end

    def []=(map_id, region_id, other)
      other = NONE if other == 0
      if region_id == -1
        any_region[map_id] = other
        any_region.delete(map_id) if other == -1
        return
      end
      other = REGION_NONE if other < 0
      @data[map_id] ||= {}
      @data[map_id][region_id] = other
    end

    def any_region
      @any_region ||= {}
    end

    def add_encounter_airship(map_id, troop_id, encounter_step)
      e = RPG::Map::Encounter.new
      e.region_set = [AIRSHIP]
      e.troop_id = troop_id
      e.weight = 1
      @encounter_airship[map_id] = []
      @encounter_airship[map_id].push(e, encounter_step)
    end

    def delete_encounter_airship(map_id)
      return unless @encounter_airship.key?(map_id)

      @encounter_airship[map_id] = []
    end

    def encounter_airship(map_id)
      result = @encounter_airship.fetch(map_id, [])
      return [] if result.empty?

      [result[0]]
    end

    def encounter_step_airship(map_id)
      result = @encounter_airship.fetch(map_id, [])
      return 999 if result.empty?

      result[1]
    end
  end

  def encount_region
    @encount_region ||= EncountRegion.new
  end
end
