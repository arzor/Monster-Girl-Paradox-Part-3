class Game_Party
  def setup_multipartymember(pt)
    multi_party.clear(pt.size)
    pt.each_with_index do |s, i|
      multi_party[i].member = s
    end
    multi_party.save_history(-pt.size, pt)
  end

  def multi_party
    @multi_party ||= MultiParty::Structs.new
  end

  def end_multiparty
    return unless multi_party?

    multi_party.clear(0)
    @multi_party_flag = false
    release_temp_actors
  end

  def start_multiparty(*pos)
    return if multi_party?

    pos.each_with_index { |ps, i| multi_party.setup(i, ps) }
    @multi_party_flag = true

    multi_party.reset
    multi_party.start
  end

  def multi_party?
    @multi_party_flag
  end

  def next_multi_party
    return unless multi_party?

    multi_party.next
    multi_party.start
  end

  def find_map(map_id)
    return nil unless multi_party?

    multi_party.find_map(map_id)
  end

  def collide_with_multiparties?(x, y)
    return false unless multi_party?

    multi_party.collide_position?(x, y)
  end

  def exist_multiparties(map_id, x, y, d)
    return true if $game_map.map_id == map_id && $game_player.pos?(x, y) && $game_player.direction == d
    return false unless multi_party?

    multi_party.exist_position?(map_id, x, y, d)
  end

  def setup_multiparty(party_id, map_id, x, y, d)
    multi_party.setup(party_id, map_id, x, y, d)
  end
end

module MultiParty
  class Structs
    attr_reader :id

    def initialize
      @id = 0
      @data = []
      @history = {}
    end

    def clear(size)
      @data = Array.new(size) { Struct.new }
      @start_map = nil
    end

    def data
      @data[@id]
    end

    def reset
      @id = 0
    end

    def save_history(id, pt)
      @history ||= {}
      @history[id] = pt.map(&:clone)
    end

    def load_history(id)
      @history ||= {}
      @history[id]
    end

    def next
      setup(@id, [$game_map.map_id, $game_player.x, $game_player.y, $game_player.direction])
      data.member = $game_party.actors.clone
      @id += 1
      @id %= @data.size
    end

    def start
      $game_player.reserve_transfer(data.map.map_id, data.position[0], data.position[1], data.position[2])
      $game_party.reserve_member = data.member
      $game_temp.fade_type = 0
    end

    def setup(id, pos = [])
      return unless @data[id]

      map = (@data.map(&:map) + [$game_map]).compact.find do |st|
        st.map_id == pos[0]
      end
      unless map
        map = Game_Map.new
        bmap = $game_map
        $game_map = map
        map._setup(pos[0])
        $game_map = bmap
        map.screen = $game_map.screen
        map.interpreter = $game_map.interpreter
        map.vehicles = $game_map.vehicles
      end
      @data[id].map = map
      @data[id].position = pos[1..-1]
    end

    def find_map(map_id)
      m = @data.find do |st|
        st.map_id == map_id
      end
      m ? m.map : nil
    end

    def [](id)
      @data[id]
    end

    def characters
      refresh_characters
      @data.map(&:character)
    end

    def refresh_characters
      @data.each do |d|
        d.character.transparent = (d == data || d.map_id != $game_map.map_id)
      end
    end

    def exist_position?(map_id, x, y, dir = 0)
      (@data - [data]).any? do |st|
        st.map_id == map_id && st.pos?(x, y, dir)
      end
    end

    def exist_in_map?(party_id, map_id)
      m = @data[party_id]
      return false unless m

      m.map_id == map_id
    end

    def collide_position?(x, y)
      exist_position?($game_map.map_id, x, y)
    end
  end

  class Struct
    attr_accessor :map
    attr_reader :member
    attr_reader :position
    attr_accessor :character

    def initialize
      @character = Game_Character.new
      clear
    end

    def party_recover
      @party_recover ||= Game_System::RecoverSkill.new
    end

    def clear
      @member = []
      self.position = [0, 0, 2]
      @map = nil
      @party_recover = Game_System::RecoverSkill.new
      @character.transparent = true
    end

    def position=(pos)
      pos [2] = @position[2] if pos[2] == 0
      @position = pos
      @character.moveto(pos[0], pos[1])
      @character.set_direction(pos[2])
    end

    def member=(m)
      @member = m
      actor = $game_actors[@member.first].actor
      @character.set_graphic(actor.character_name, actor.character_index)
    end

    def map_id
      @map ? @map.map_id : -1
    end

    def pos?(x, y, d = 0)
      @character.pos?(x, y) && d == 0 || d == @character.direction
    end
  end
end

class Game_CharacterBase
  def passable?(x, y, d)
    x2 = $game_map.round_x_with_direction(x, d)
    y2 = $game_map.round_y_with_direction(y, d)
    return false unless $game_map.valid?(x2, y2)
    return true if @through || debug_through?
    return false unless map_passable?(x, y, d)
    return false unless map_passable?(x2, y2, reverse_dir(d))
    return false if collide_with_characters?(x2, y2)
    return false if $game_party.collide_with_multiparties?(x2, y2)

    true
  end
end
