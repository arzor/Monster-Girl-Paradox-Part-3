#~ class Game_Interpreter
#~   #
#~   def test_convert
#~     p "変換作業を開始します"
#~     (1...700).each{|i|
#~       next unless File.exist?(sprintf("Data/Map%03d.rvdata2", i))      
#~       map = load_data(sprintf("Data/Map%03d.rvdata2", i))
#~       map.events.values.each{|event|
#~         if blue_treasure?(event)
#~           p "青宝箱がヒット"
#~           convert_blue_treasure(event)
#~         elsif green_treasure?(event)
#~           p "緑宝箱がヒット"
#~           convert_green_treasure(event)
#~         elsif silver_treasure?(event)
#~           p "銀宝箱がヒット"
#~           convert_silver_treasure(event)
#~         end      
#~       }
#~       save_data(map, sprintf("Data/Map%03d.rvdata2", i)) 
#~       p "#{sprintf("Data/Map%03d.rvdata2", i)}チェック完了"
#~     }
#~     p "変換作業全終了"
#~   end
#~   #
#~   def unlock_command?(c)
#~     return c.code == 118 && c.parameters[0] == "鍵開け"
#~   end
#~   #
#~   def blue_treasure?(event)
#~     return false unless event.pages[0].list.any?{|c| unlock_command?(c)}
#~     i = 0
#~     event.pages[0].list.each{|c|
#~       i += 1
#~       break if unlock_command?(c)
#~     }
#~     return i == 28
#~   end
#~   #
#~   def convert_blue_treasure(event)
#~     event.pages[0].list.slice!(0, 28)
#~     commands = [
#~       RPG::EventCommand.new(111, 0, [12, "unlock_level < 1"]),
#~       RPG::EventCommand.new(101, 1, ["", 0, 0, 2]),
#~       RPG::EventCommand.new(401, 1, ["宝箱には鍵が掛かっている……"]),
#~       RPG::EventCommand.new(115, 1, []),
#~       RPG::EventCommand.new(0, 1, []),
#~       RPG::EventCommand.new(412, 0, []),
#~     ]
#~     commands.reverse_each{|command| event.pages[0].list.unshift(command)}
#~   end
#~   #
#~   def green_treasure?(event)
#~     return false unless event.pages[0].list.any?{|c| unlock_command?(c)}
#~     i = 0
#~     event.pages[0].list.each{|c|
#~       i += 1
#~       break if unlock_command?(c)
#~     }
#~     return i == 20
#~   end
#~   #
#~   def convert_green_treasure(event)
#~     event.pages[0].list.slice!(0, 20)
#~     commands = [
#~       RPG::EventCommand.new(111, 0, [12, "unlock_level < 2"]),
#~       RPG::EventCommand.new(101, 1, ["", 0, 0, 2]),
#~       RPG::EventCommand.new(401, 1, ["宝箱には鍵が掛かっている……"]),
#~       RPG::EventCommand.new(115, 1, []),
#~       RPG::EventCommand.new(0, 1, []),
#~       RPG::EventCommand.new(412, 0, []),
#~     ]
#~     commands.reverse_each{|command| event.pages[0].list.unshift(command)}
#~   end
#~   #
#~   def silver_treasure?(event)
#~     return false unless event.pages[0].list.any?{|c| unlock_command?(c)}
#~     i = 0
#~     event.pages[0].list.each{|c|
#~       i += 1
#~       break if unlock_command?(c)
#~     }
#~     return i == 12
#~   end
#~   #
#~   def convert_silver_treasure(event)
#~     event.pages[0].list.slice!(0, 12)
#~     commands = [
#~       RPG::EventCommand.new(111, 0, [12, "unlock_level < 3"]),
#~       RPG::EventCommand.new(101, 1, ["", 0, 0, 2]),
#~       RPG::EventCommand.new(401, 1, ["宝箱には鍵が掛かっている……"]),
#~       RPG::EventCommand.new(115, 1, []),
#~       RPG::EventCommand.new(0, 1, []),
#~       RPG::EventCommand.new(412, 0, []),
#~     ]
#~     commands.reverse_each{|command| event.pages[0].list.unshift(command)}
#~   end  
#~ end









