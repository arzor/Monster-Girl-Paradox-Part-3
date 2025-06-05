class Game_BattlerBase
  alias hima_succubus_element_rate element_rate
  def element_rate(element_id)
    return succubus_element_rate(element_id) if succubus?

    hima_succubus_element_rate(element_id)
  end

  def succubus_element_rate(element_id)
    return [1.0, hima_succubus_element_rate(element_id)].max if NWConst::Elem.pleasure?(element_id)
    if [0, 38].include?(element_id)
      return hima_succubus_element_rate(element_id)
    end

    0.0
  end
end

class Game_Battler < Game_BattlerBase
  alias hima_succubus_item_reflection? item_reflection?
  alias hima_succubus_item_element_rate item_element_rate
  alias hima_succubus_element_drain? element_drain?
  alias hima_succubus_element_reflection element_reflection

  def item_element_rate(user, item)
    return succubus_item_element_rate(user, item) if succubus?

    hima_succubus_item_element_rate(user, item)
  end

  def succubus_item_element_rate(user, item)
    elements = user.item_final_elements(item)
    return hima_succubus_item_element_rate(user, item) if item.damage.recover?
    if NWConst::Elem.pleasure?(elements)
      return [1.0, hima_succubus_item_element_rate(user, item)].max
    end
    return hima_succubus_item_element_rate(user, item) if elements.include?(38)

    0.0
  end

  def item_reflection?(user, item)
    return succubus_item_reflection?(user, item) if succubus?

    hima_succubus_item_reflection?(user, item)
  end

  def succubus_item_reflection?(user, item)
    false
  end

  def element_drain?(element_id)
    return succubus_element_drain?(element_id) if succubus?

    hima_succubus_element_drain?(element_id)
  end

  def succubus_element_drain?(element_id)
    false
  end

  def element_reflection(element_id)
    return succubus_element_reflection(element_id) if succubus?

    hima_succubus_element_reflection(element_id)
  end

  def succubus_element_reflection(element_id)
    false
  end
end
