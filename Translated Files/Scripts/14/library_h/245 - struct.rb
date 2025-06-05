module LibraryH
  class << self
    def init_background(background)
      return { :pic => NWConst::Library::H_SCENE_DEFAULT_MEMORY_BG_IMAGE } if background.nil?

      type = background[:type] || 0
      id = background[:id]
      case type
      when 0
        NWConst::Library::H_SCENE_MEMORY_BG_IMAGE[id]
      when 1
        NWConst::Library::MEMORY_BG_IMAGE[id]
      when 2
        NWConst::Library::ACTOR_MEMORY_BG_IMAGE[id]
      end
    end
  end
  module Condition
    # @param data [Hash]
    # @return [Condition]
    class << self
      def make(data)
        data ? Normal.new(data) : DEFAULT_CONDITION
      end

      def make_hevent(data)
        data ? Hevent.new(data) : DEFAULT_CONDITION
      end
    end
    def show?; end

    def hide; end

    class Normal
      include Condition

      def initialize(data)
        instance_variable_set_in_hash(data)
        @op ||= 0
      end

      def show?
        return item unless type == 1

        compare
      end

      def hide?
        @hide != 0 && !show?
      end

      private

      attr_reader :op
      attr_reader :type
      attr_reader :id
      attr_reader :value

      def compare
        case op
        when 0
          item == value
        when 1
          item >= value
        when 2
          item <= value
        end
      end

      def item
        case type
        when -1
          $game_switches[id]
        when 0
          $game_system_switches[id]
        when 1
          $game_variables[id]
        when 2
          $game_library.actor.discovery?(id)
        when 3
          $game_library.enemy.discovery?(id)
        when 4
          $game_library.enemy.discovery?(id)
        when 5
          $game_library.weapon.discovery?(id)
        when 6
          $game_library.armor.discovery?(id)
        when 7
          $game_library.item.discovery?(id)
        when 8
          $game_party.has_item?($data_items[id])
        end
      end
    end

    class Hevent < Normal
      def show?
        return true if $game_system_switches[:fullopen]

        super
      end
    end

    class Default
      include Condition
      def show?
        true
      end

      def hide?
        false
      end
    end

    DEFAULT_CONDITION = Default.new
  end

  class Item
    class << self
      # @param data [Hash]
      # @return [Array<Item>]
      def make(data)
        return [] unless data

        data.keys.sort.map do |id|
          new(data[id])
        end
      end
    end
    def initialize(data)
      instance_variable_set_in_hash(data)
      @data = data
      @condition = Condition.make_hevent(@condition)
      @background = LibraryH.init_background(@background)
    end

    attr_reader :name
    attr_reader :common
    attr_reader :map
    attr_reader :condition
    attr_reader :fadeout

    def show?
      condition.show?
    end

    def hide?
      condition.hide?
    end

    def call(item)
      Manager.save_bgm_and_bgs
      Manager.save
      Audio.bgm_stop
      Audio.bgs_stop
      $game_switches[NWConst::Sw::LIBRARY_H_MEMORY] = true
      if @map.nil? || @map[0] == 0
        $game_novel.bg_data = @background
        $game_novel.setup(@common)
        SceneManager.call(Scene_Novel)
        $game_novel.screen.instance_variable_set(:@brightness, 0) if fadeout
      else
        $game_temp.clear_common_event
        $game_map.interpreter.clear
        $game_map.interpreter.setup($data_common_events[@common].list)
        $game_map.interpreter.map_id = map[0]
        $game_map.interpreter.return_flag = true
        SceneManager.scene.fadeout_all
        $game_player.forced_get_off_vehicle
        $game_player.reserve_transfer(map[0], map[1], map[2], map[3] || 2)
        $game_player.perform_transfer
        SceneManager.call(Scene_Map)
        $game_map.screen.instance_variable_set(:@brightness, 0) if fadeout
      end
      Manager.return_scene_data = [item, self]
    end
  end

  class Cgs
    class << self
      # @param data [Hash]
      # @return [Cgs]
      def make(data)
        return new([]) unless data

        new(
          data.keys.sort.map do |id|
            Cg.new(data[id])
          end
        )
      end
    end
    # @param cg_array [Array<Cg>]
    def initialize(cg_array)
      @data = cg_array
    end

    def call(item)
      SceneManager.call(LibraryH::Scene_CGViewer)
      SceneManager.scene.prepare(self)
      Manager.return_scene_data = [item, self]
    end

    def enable?
      @data.any?(&:show?)
    end

    def showable_data
      @data.select(&:show?)
    end

    def to_a
      @data
    end
  end

  class Cg
    def initialize(data)
      instance_variable_set_in_hash(data)
    end

    def condition
      @_condition ||= Condition.make_hevent(@condition)
    end

    def background
      @_background ||= LibraryH.init_background(@background)
    end

    def [](symbol)
      send(symbol)
    end

    def show?
      condition.show? && !draw.empty?
    end

    def open?
      condition.show? || !draw.empty?
    end

    def regist
      delete_nothing_file
      @regist
    end

    def draw
      @draw ||= regist.map { |k, _v| [k] }
      delete_nothing_file
      @draw
    end

    def all_regist
      delete_nothing_file
      @all_regist
    end

    private

    def delete_nothing_file
      return if @delete_flag

      @delete_flag = true
      @all_regist = @regist.clone
      nothing_file = @regist.reject do |_k, v|
        NWSimpleFileTest.png_exist?(v[0], v[1])
      end.keys

      @draw.select! do |ar|
        (ar & nothing_file).empty?
      end
      @regist.reject! do |k, _v|
        nothing_file.include?(k)
      end
    end
  end

  class Charactor
    def initialize(key)
      @key = key
      instance_variable_set_in_hash(NWConst::Library::H_SCENE_ITEMS.fetch(@key))
      @items = Item.make(@items)
      @cgs = Cgs.make(@cg)
      @condition = Condition.make_hevent(@condition)
    end

    attr_reader :key
    attr_reader :name
    attr_reader :condition
    attr_reader :cgs
    attr_reader :items

    def show?
      condition.show?
    end

    def hide?
      condition.hide?
    end
  end
end
