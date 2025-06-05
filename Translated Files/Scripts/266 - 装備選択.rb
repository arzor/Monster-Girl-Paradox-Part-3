class Window_KeyItem < Window_ItemList
  def include?(item)
    return super(item) unless $game_message.item_choice_condition

    $game_message.item_choice_condition.call(item)
  end

  def enable?(item)
    return super(item) unless $game_message.item_choice_condition

    true
  end

  def on_ok
    result = item ? item.base_data.id : 0
    $game_variables[$game_message.item_choice_variable_id] = result
    close
  end
end

class Game_Interpreter
  def choice_weapon(id = -1)
    _choice_item(proc { |item| item.is_a?(RPG::Weapon) && item.equip_selectable_id == id })
  end

  def choice_armor(id = -1)
    _choice_item(proc { |item| item.is_a?(RPG::Armor) && item.equip_selectable_id == id })
  end

  def choice_item(id = -1)
    _choice_item(proc { |item| item.is_a?(RPG::Item) && item.equip_selectable_id == id })
  end

  def _choice_item(condition = nil)
    wait_for_message
    $game_message.item_choice_condition = condition
    $game_message.item_choice_variable_id = 58
    Fiber.yield while $game_message.item_choice?
  end
end

class Game_Message
  attr_accessor :item_choice_condition

  alias hima_equip_choice_clear clear
  def clear
    hima_equip_choice_clear
    @item_choice_condition = nil
  end
end

