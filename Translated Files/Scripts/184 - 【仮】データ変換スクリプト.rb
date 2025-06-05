


#~ class Game_Interpreter
#~   def dup_enemy_data
#~     $data_enemies.each{|enemy|
#~       next if enemy.nil? || enemy.name.empty?
#~       enemy.note.gsub!(/<仲間化(?:\:|：)id\=(\d+)\s?確率\=(\d+)>/i, "")
#~       enemy.note.gsub!(/<仲間化質問(?:\:|：)フェイス\=(\S+)\,(\d)\s?内容\=(\S+)>/i, "")
#~       enemy.note.gsub!(/<仲間化承諾(?:\:|：)フェイス\=(\S+)\,(\d)\s?内容\=(\S+)>/i, "")
#~       enemy.note.gsub!(/<仲間化拒否(?:\:|：)フェイス\=(\S+)\,(\d)\s?内容\=(\S+)>/i, "")
#~     }
#~     File.open("Enemies.rvdata2", "wb") do |file|
#~       Marshal.dump($data_enemies, file)
#~     end
#~   end
  
  
#~   def dup_follower
#~     open("follower_convert.txt", 'w') {|file|
#~       $data_enemies.each{|enemy|
#~         convert_follower_data(file, enemy)
#~       }
#~     }
#~   end
#~   def convert_follower_data(file, enemy)
#~     return if enemy.nil? || enemy.name.empty?
#~     if enemy.note =~ /<仲間化(?:\:|：)id\=(\d+)\s?確率\=(\d+)>/i
#~       id = $1.to_i
#~       denominator = $2.to_i
#~     end
#~     if enemy.note =~ /<仲間化質問(?:\:|：)フェイス\=(\S+)\,(\d)\s?内容\=(\S+)>/i
#~       que_face  = $1.to_s
#~       que_index = $2.to_i
#~       que_contents = $3.to_s
#~     end
#~     if enemy.note =~ /<仲間化承諾(?:\:|：)フェイス\=(\S+)\,(\d)\s?内容\=(\S+)>/i
#~       yes_face  = $1.to_s
#~       yes_index = $2.to_i
#~       yes_contents = $3.to_s
#~     end
#~     if enemy.note =~ /<仲間化拒否(?:\:|：)フェイス\=(\S+)\,(\d)\s?内容\=(\S+)>/i
#~       no_face  = $1.to_s
#~       no_index = $2.to_i
#~       no_contents = $3.to_s
#~     end
#~     return unless id && denominator && que_face && que_index && que_contents &&
#~       yes_face && yes_index && yes_contents && no_face && no_index && no_contents
#~       
#~     file.puts("    #{enemy.id} => { # #{enemy.name}")
#~     file.puts("      :actor_id => #{id}, :denominator => #{denominator},")
#~     file.puts("      :question => [\"#{que_contents}\", \"#{que_face}\", #{que_index}],")
#~     file.puts("      :yes => [\"#{yes_contents}\", \"#{yes_face}\", #{yes_index}],")
#~     file.puts("      :no => [\"#{no_contents}\", \"#{no_face}\", #{no_index}],")
#~     file.puts("    },")
#~   end
#~   
#~   def dup_enemy_words
#~     hoge = convert_enemy_data
#~     open("enemy_words_convert.txt", 'w') {|file|
#~       hoge.each{|akey, avalue|
#~         file.puts("    #{akey} => { # #{$data_actors[akey].name}")
#~         avalue.each{|skey, svalue|
#~           if skey.size == 1
#~             file.puts("      #{skey.inspect} => { # #{$data_skills[skey[0]].name}")          
#~           else
#~             name1 = $data_skills[skey.first].name
#~             name2 = $data_skills[skey.last].name          
#~             file.puts("      #{skey.inspect} => { # #{name1}～#{name2}") 
#~           end
#~           svalue.each{|k, v|
#~             file.puts("        #{k.inspect} => #{v.inspect},")
#~           }
#~           file.puts("      },")
#~         }
#~         file.puts("    },")
#~       }
#~     }
#~   end  

#~   
#~   def convert_enemy_data
#~     hash = {}
#~     NWConst::enemy_words.each{|key, value|
#~       hash[key] = {}
#~       value.each{|data|
#~         hash[key][data.id] ||= {}
#~         (1..10).collect{|i| "word_#{i}".to_sym}.each{|wkey|
#~           next if hash[key][data.id].key?(wkey)
#~           hash[key][data.id][wkey] = [data.contents, data.face, data.index]
#~           break
#~         }
#~         hash[key][data.id][:ct_type] = data.ct_type if data.ct_type
#~         hash[key][data.id][:ct_pic] = data.ct_pic if data.ct_pic
#~         hash[key][data.id][:ct_se] = data.ct_se if data.ct_se               
#~       }
#~     }
#~     return hash
#~   end

#~   def dup_actor_words
#~     hoge = convert_actor_data
#~     open("actor_words_convert.txt", 'w') {|file|
#~       hoge.each{|akey, avalue|
#~         file.puts("    #{akey} => { # #{$data_actors[akey].name}")
#~         avalue.each{|skey, svalue|
#~           if skey.size == 1
#~             file.puts("      #{skey.inspect} => { # #{$data_skills[skey[0]].name}")          
#~           else
#~             name1 = $data_skills[skey.first].name
#~             name2 = $data_skills[skey.last].name          
#~             file.puts("      #{skey.inspect} => { # #{name1}～#{name2}") 
#~           end
#~           svalue.sort.each{|k, v|
#~             file.puts("        #{k.inspect} => #{v.inspect},")
#~           }
#~           file.puts("      },")
#~         }
#~         file.puts("    },")
#~       }
#~     }
#~   end  

#~   
#~   def convert_actor_data
#~     hash = {}
#~     NWConst::actor_words.each{|key, value|
#~       hash[key] = {}
#~       value.each{|data|
#~         hash[key][data.id] ||= {}
#~         (1..10).collect{|i| "word_#{i}".to_sym}.each{|wkey|
#~           next if hash[key][data.id].key?(wkey)
#~           hash[key][data.id][wkey] = [data.contents, data.face, data.index]
#~           break
#~         }
#~         hash[key][data.id][:ct_type] = data.ct_type if data.ct_pic && !data.ct_pic.empty?
#~         hash[key][data.id][:ct_pic] = data.ct_pic if data.ct_pic && !data.ct_pic.empty?
#~         hash[key][data.id][:ct_se] = data.ct_se if data.ct_pic && !data.ct_pic.empty?
#~       }
#~     }
#~     return hash
#~   end

#~   def dup_present_words
#~     hoge = convert_present_data
#~     open("present_words_convert.txt", 'w') {|file|
#~       hoge.each{|akey, avalue|
#~         file.puts("    #{akey} => { # #{$data_actors[akey].name}")
#~         avalue.each{|ikey, ivalue|
#~           item_name = 0 < ikey ? $data_items[ikey].name : "欲しいものがない場合"
#~           file.puts("      #{ikey} => { # #{item_name}")
#~           ivalue.each{|k, v|
#~             file.puts("        #{k.inspect} => #{v.inspect},")
#~           }
#~           file.puts("      },")
#~         }
#~         file.puts("    },")
#~       }
#~     }
#~   end
#~   def convert_present_data
#~     hoge = {}
#~     NWConst::present_words.each{|key, value|
#~       hoge[key] = {}
#~       value.each{|data|
#~         id = data.item_id.nil? ? 0 : data.item_id
#~         hoge[key][id] = {}
#~         hoge[key][id][:love] = data.love if 0 < id
#~         data.words.each_with_index{|w, i|
#~           hoge[key][id]["word_#{i+1}".to_sym] = w
#~         }
#~       }
#~     }
#~     return hoge
#~   end
#~ end

#~ class Present_Word
#~   attr_accessor :item_id
#~   attr_accessor :love
#~   attr_accessor :words  
#~   
#~   def initialize(item_id, love, words)
#~     @item_id = item_id
#~     @love = love
#~     @words = words
#~     @words.collect!{|w| [w[0], w[1], w[2].nil? ? 0 : w[2]]}
#~   end
#~ end

#~ class Skill_Word
#~   attr_accessor   :id
#~   attr_accessor   :contents
#~   attr_accessor   :face
#~   attr_accessor   :index
#~   attr_accessor   :ct_pic
#~   attr_accessor   :ct_type
#~   attr_accessor   :ct_se
#~   
#~   def initialize(a, b, c, d, e=nil, f=nil, g=nil, h=nil, i=nil)
#~     @id = Array(a)
#~     @contents = b
#~     @face = c
#~     @index = d
#~     @ct_pic = f
#~     @ct_type = g ? :basic : nil
#~     @ct_se = h
#~   end
#~ end












