class DataBaseEquip
  include Enumerable
  def initialize(data, type)
    @a = data
    @type = type
  end

  def each(&block)
    @a.each(&block)
  end

  def [](index)
    return $game_party.socket_item_by_id(@type, index) unless index.integer?
    return $game_party.enchant_item_by_id(@type, index - size) if index >= @a.size

    @a[index]
  end

  def compact
    @a.compact
  end

  def size
    @a.size
  end
end

class Socket_Item_List
  include Enumerable
  def initialize
    @a = []
  end

  def each(&block)
    @a.each(&block)
  end

  def add_item(item)
    data = Item_Data.new
    data.item_object = item
    @a.insert(item.index, data)
    @a.compact!
    refresh
    item
  end

  def delete_item(item)
    @a.delete_if { |e| e.item_object == item }
    refresh
  end

  def refresh
    @a.each_with_index { |e, i| e.item_object.id = i }
  end

  def [](index)
    @a[index] || Item_Data.new
  end

  def exist?(item)
    @a[item.index] && @a[item.index].item_object == item
  end

  def compact
    @a.compact
  end

  def size
    @a.size
  end
end

class Socket_Container
  include Enumerable
  def initialize
    @h = {}
  end

  def each(&block)
    @h.each(&block)
  end

  def refresh
    @h.values.each(&:refresh)
  end

  def [](index)
    @h[index] ||= Socket_Item_List.new
  end

  def items(&block)
    item_data(&block).map(&:item_object).compact
  end

  def item_data(&block)
    return item_data { |data| data.item_number > 0 } unless block_given?

    result = map do |_k, v|
      next [] unless v

      v.select do |data|
        data && block.call(data)
      end
    end
    result.flatten
  end

  def storehouse_items
    items { |data| data.storehouse_item_number > 0 }
  end
end

module RPG
  module Uniq_Item
    attr_accessor :shop_item_flag

    def change_stone(slot_id, item)
      return if slot_id >= socket_num
      return unless $game_party.trade_item(item, stones[slot_id])

      if item
        stones.each.with_index do |stone, index|
          if stone && index != slot_id && stone.enchant_stone_category == item.enchant_stone_category
            change_stone(index, nil)
          end
        end
      end

      @stones[slot_id] = item ? item.id : nil
      e = equip_actor
      e.refresh if e
    end

    def data_ex
      base_data.data_ex
    end

    def need_socket?
      false
    end

    def need_enchant?
      false
    end

    def uniq_item?
      true
    end

    def equip_actor
      equip_actor_data[0]
    end

    def equip_actor_data
      CacheUniq.cache[self] ||= _equip_actor_data
    end

    def _equip_actor_data
      return [nil, nil] if $game_party.item_number(self) > 0 || $game_party.storehouse_item_number(self) > 0

      $game_actors.each do |actor|
        i = actor.base_equips.index(self)
        return [actor, i] if i
      end
      [nil, nil]
    end

    def change_ok?
      actor, slot_id = equip_actor_data
      return true unless actor

      actor.equip_change_ok?(slot_id)
    end

    def initialize(item)
      @base_id = item.id
      @id = $game_party.uniq_item_container(item).size
    end

    def name
      base_data.name
    end

    def icon_index
      base_data.icon_index
    end

    def description
      base_data.description
    end

    def price
      base_data.price
    end

    def params
      base_data.params
    end

    def etype_id
      base_data.etype_id
    end

    def base_etype_id
      base_data.base_etype_id
    end

    def note
      base_data.note
    end

    def features
      base_data.features
    end

    def feature_data
      base_data.feature_data
    end
  end

  module Socket
    ID = 1000

    def socket_number
      data_ex.fetch(:socket_number, 0)
    end

    def socket_num
      socket_number
    end

    def socket?
      socket_num > 0
    end

    def stones
      @stones ||= [nil] * socket_num
      @stones.map { |stone| $data_items[stone] if stone }
    end

    def stones_armor_data
      stones.compact.map(&:enchant_stone_id).flatten.map { |armor_id| $data_armors[armor_id] }
    end

    def trade_stone(item)
      return unless item

      item.socket_num.times do |i|
        next if item.stones[i]

        b = stones.find_index { |a| a }
        break unless b

        stone = stones[i]
        change_stone(i, nil)
        item.change_stone(i, stone)
      end
    end

    def change_stone(slot_id, item); end

    def clear_stones
      socket_num.times do |i|
        change_stone(i, nil)
      end
    end

    def need_socket?
      socket_number > 0
    end
  end

  module SocketItem
    include Uniq_Item

    def socket_num
      socket_number
    end

    def sort_id
      base_data.sort_id
    end

    def append_sort_id
      Rational(@id + 1, Socket::ID)
    end

    def id
      @base_id + Rational(@id + 1, Socket::ID)
    end

    def socket_item?
      true
    end
  end

  class SocketWeapon < Weapon
    include SocketItem

    def wtype_id
      base_data.wtype_id
    end

    def animation_id
      base_data.animation_id
    end

    def base_data
      $data_weapons[@base_id]
    end
  end

  class SocketArmor < Armor
    include SocketItem

    def atype_id
      base_data.atype_id
    end

    def base_data
      $data_armors[@base_id]
    end
  end

  class EquipItem
    include Socket
  end
end
