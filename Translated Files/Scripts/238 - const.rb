module NWConst
  module Actor
    MAX_MSP = 99_999
    AWAKEN_BASE_ID = 400
  end

  module Numeric
  end
  module Sw
    ENCOUNT_NONE = 89
    ENCHANT_OFF = 502
    EQUIP_DISABLED = 503
    NO_DISPLAY_KEY_ITEM = 504
    INVALID_GIVEUP = 505
    ADD_ACTOR_BASE_NUMBER = 1000
    ADD_ACTOR_RANGE = (ADD_ACTOR_BASE + 1)..(ADD_ACTOR_BASE + ADD_ACTOR_BASE_NUMBER)
    AWAKEN_ID = Actor::AWAKEN_BASE_ID + 5600
    ADD_ELEMENT_RESIST = 7092
    CONFIG_DUNGEON_NAVI = 446
    CONFIG_AUTO_UNEQUIP_ACTOR = 447
  end

  module Var
    CLASS_EXP = 49
    LIBRARY_BGM_ID = 60
    MHP_ADD = 65
    MMP_ADD = 66
    ATK_ADD = 67
    DEF_ADD = 68
    MAT_ADD = 69
    MDF_ADD = 70
    AGI_ADD = 71
    LUK_ADD = 72
    EXP_ADD = 73
    CLASS_EXP_ADD = 74
    MONEY_ADD = 75
    MHP_SETTING = 92
    ATK_SETTING = 93
    DEF_SETTING = 94
    AGI_SETTING = 95
    EXP_SETTING = 96
    CEXP_SETTING = 97
    GOLD_SETTING = 98
    HP_DAMAGE_SETTING = 99
  end

  module EquipInfo
    STATUS_MAX = 11
  end

  module Armor
    ACCESSORY = 41
  end

  module Common
    MEDAL_CHECK = 115
  end

  module Elem
    NIGHTMARE = 52
    class << self
      def pleasure?(elements)
        Array(elements).include_any?([PLEASURE, NIGHTMARE])
      end

      def nightmare?(elements)
        Array(elements).include?(NIGHTMARE)
      end
    end
  end

  module Skill
    NO_LUCA_TEMPTATION = 3284
  end

  module Slot
    WEAPON = 0b1
    SHIELD = 0b10
    ARMOR = 0b100
    HEAD = 0b1000
    ACCESSORY1 = 0b10000
    ACCESSORY2 = 0b100000
    CHANGE_MAP = [WEAPON, SHIELD, ARMOR, HEAD, ACCESSORY1 | ACCESSORY2, ACCESSORY1, ACCESSORY2]
  end

  module Etype
    WEAPON = 0
    SHIELD = 1
    ARMOR = 2
    HEAD = 3
    ACCESSORY = 4
    ACCESSORY1 = 5
    ACCESSORY2 = 6
  end

  module Map
    FIELD_BRIDGES = [104, 105, 108, 109]
  end

  module Field
    SW_BGM = {
      1001 => {
        2963 => RPG::BGM.new("fieldm", 100, 100)
      },
      1287 => {
        2963 => RPG::BGM.new("fieldg2", 100, 100)
      }
    }
  end

  module Enchantment
    def self.display_color(id)
      case id
      when 0
        0
      when 1
        23
      when 2
        6
      when 3
        2
      when 4
        11
      end
    end
  end
end

module ExCategory
  INVALID_REDUCE_BOOST_DAMAGE_ID = [10]
end

module Container
  class << self
    def item(type, id)
      container = get(type)
      return unless container

      container[id]
    end

    def get(type)
      case type
      when :I, 0
        $data_items
      when :W, 1
        $data_weapons
      when :A, 2
        $data_armors
      end
    end
  end
end
