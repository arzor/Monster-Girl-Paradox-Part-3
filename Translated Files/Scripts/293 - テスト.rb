module Enchant_Item 
	def test
		error = ""
		if enchantment_data
			error += ":enchant_countが未設定です\n" if enchantment_data[:enchant_count].nil?
			error += ":enchant_countの値に範囲以外を使用しています\n" if enchantment_data[:enchant_count] && !enchantment_data[:enchant_count].is_a?(Range)
			
			rarity_data = enchantment_data.select{|k,v| k.is_a?(Range) && k.include?(@rarity_num)}.map{|k,v| v }.sample
			error += "現在のレア値に対応するデータが存在しません\n"	if rarity_data.nil?
			if rarity_data
				#~ error += ":socketが未設定です\n"if rarity_data[:socket].nil?
				#~ error += ":socketの値にhash以外を使用しています\n" if rarity_data[:socket] && !rarity_data[:socket].is_a?(Hash)
				#~ enchants_data = rarity_data[:enchants]
				#~ enchants_data.each{|enchant_id|
					#~ enchants = NWConst::Enchantment::ENCHANTS[enchant_id]
					#~ error += "ENCHANTSで定義されていない#{enchant_id}を設定しています\n" if enchants.nil?
					#~ error += "ENCHANTS[#{enchant_id}]の値にhash以外を使用しています\n" if enchants && !enchants.is_a?(Hash)
				#~ }
			end
		else
			if base_data.name ==""
				raise
			else
				error += "装備IDに対応するデータが存在しません\n" if base_data.name != ""
			end
		end
		raise error unless error == ""
		return true
	end
	
end

class RPG::EquipItem
	def create_enchant_item
		data = enchant_item
		begin
			data.test if $TEST
			data.set_data
			return data
			return nil
		rescue RuntimeError => e
			unless e.to_s == ""
				p "#---#{self.class.name},ID:#{self.id}---"
				e.to_s.split("\n").each{|line|
					p line
				}
			end
			raise e if !$TEST
		end
	end
end
class Game_Interpreter
	def test_enchantment
		p "---test_enchantment---"
		($data_armors + $data_weapons).each{|item| 
			if item && item.need_enchant?
				i = item.create_enchant_item
			end
		}
	end
end

def test(file = "test.rb")
	begin
		eval File.read(file)
	rescue Exception => exc
		p "error! #{exc.to_s}"
		p "#{exc.backtrace}"
  end
end

