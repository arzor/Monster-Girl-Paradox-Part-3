#
#    セルフスイッチの一括操作(RGSS2, RGSS3)
#　　(C)2011 TYPE74RX-T
#

class Game_Interpreter
  #--------------------------------------------------------------------------
  # ★ セルフスイッチの一括操作
  #--------------------------------------------------------------------------
  def rx_self_sw(rx_map_id, id, type = "on", sw = "on")
    rx_map_id2 = rx_map_id
    # 引数がずれた時のための補正
    rx_map_id2 = @map_id unless rx_map_id.kind_of?(Numeric)
    switches = []
    switches.push(id).flatten! if id.kind_of?(Array) # id を配列に入れる
    # 引数がずれた時のための補正
    switches.push(rx_map_id).flatten! if rx_map_id.kind_of?(Array) # id を配列に入れる
    types = type
    # 引数がずれた時のための補正
    types = id if id.kind_of?(String)
    rx_switch = sw
    # 引数がずれた時のための補正
    rx_switch = type if id.kind_of?(String)
    for i in 0...switches.size
      key = [rx_map_id2, switches[i], types]
      $game_self_switches[key] = (rx_switch == "on")
      $game_map.need_refresh = true
    end
  end
end