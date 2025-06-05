# 一部装備中エンチャント装備が表示される箇所で装備中アイコン表示
module Equip_display
  def draw_item_name(item, x, y, enabled = true, width = 236)
    if item && item.uniq_item? && item.equip_actor
      change_color(normal_color, enabled)
      size = text_size(":E").width + 5
      draw_text(x + width - 5, y, size, line_height, ":E")
      width -= size
    end
    super(item, x, y, enabled, width)
  end
end

class Window_SmithBaseItemList < Window_ItemList
  include Equip_display
end

class Window_EnchantItemList < Window_ItemList
  include Equip_display
end
