module RPG
  class SetEffect
    attr_reader :id
    attr_reader :name
    attr_reader :effect_ids

    def initialize(id, name, effect_ids)
      @id = id
      @name = name
      @effect_ids = effect_ids
    end

    def [](index)
      effects[index - 1]
    end

    def each(&block)
      effects.each(&block)
    end

    def size
      @effect_ids.size
    end

    def effects(set_count = 0)
      @effect_ids[0..(set_count - 1)].map do |id|
        $data_classes[id]
      end
    end

    def hash
      id.hash
    end

    def eql?(other)
      id == other.id
    end
  end
end