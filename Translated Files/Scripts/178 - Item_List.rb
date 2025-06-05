#==============================================================================
# ■ Item_Data
#------------------------------------------------------------------------------
# 　Item_Listで利用する、アイテムに付随するデータ群
#==============================================================================
class Item_Data
  attr_accessor :item_number
  attr_accessor :favorite_flag
  attr_accessor :item_object

  def initialize
    @item_number = 0
    @favorite_flag = false
    @item_object = nil
  end

  def count?
    return true if @item_object.nil?
    return true if @item_number > 0 || @storehouse_item_number > 0

    !@item_object.shop_item_flag
  end

  def restore?
    return false if count? || @item_object.equip_actor || @item_object.shop_item_flag

    true
  end
end

#==============================================================================
# ■ Item_List
#------------------------------------------------------------------------------
# 　Game_Partyの全アイテムリスト用のクラス
#==============================================================================
class Item_List < Array
  def [](index)
    data = super
    return data if data

    self[index] = Item_Data.new
    super
  end

  def exist?(item)
    true
  end

  def items(container, &block)
    return items(container) { |data| data.item_number > 0 } unless block_given?

    result = map.with_index do |data, index|
      next nil if index == 0

      data && block.call(data) ? container[index] : nil
    end
    result.compact
  end

  def storehouse_items(container)
    items(container) { |data| data.storehouse_item_number > 0 }
  end
end
