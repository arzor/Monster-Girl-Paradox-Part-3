module Global
  class Game_System
    def fixd?(*keys)
      @fix ||= {}
      return true if @fix[keys]

      @fix[keys] = true
      false
    end

    def fix_actor_love
      return if fixd?(:actor_love)
      @actor_love.fix_love_data
    end

    def fix
      fix_actor_love
    end

    # @return [ActorLove]
    attr_reader :actor_love

    def initialize
      @actor_love = ActorLove.new
    end
  end

  class ActorLove
    def initialize
      make_love_data
    end

    def [](index)
      @data[actor_index(index)] || 0
    end

    def []=(index, other)
      @data[actor_index(index)] = other
    end

    def fix_love_data
      l = load_love_data(0)
      return unless l
      @data = @data.zip(l).map(&:compact).map(&:max)
    end

    private

    def actor_index(index)
      actor = $data_actors[index]
      return actor.original_persona_id if actor && actor.persona_kind == :sub

      index
    end

    def make_love_data
      @data = []
      a = (0..98).map { |i| load_love_data(i) }.compact
      ([0] * 1000).zip(*a).map(&:max).each.with_index do |love, index|
        @data[index] = love
      end
    end

    def load_love_data(index)
      return nil unless File.exist?(DataManager.make_filename(index))

      result = nil
      File.open(DataManager.make_filename(index), "rb") do |file|
        Marshal.load(file)
        v = Marshal.load(file)[:variables]
        result = (1..1000).map do |i|
          v.nw_array_get(NWConst::Var::ACTOR_REL_BASE + i) || 0
        end
        result = [0] + result
      end
      result
    end
  end
end
