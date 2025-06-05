class Game_Interpreter
  #--------------------------------------------------------------------------
  # ● 
  #--------------------------------------------------------------------------  
  def scripts_to_script
    p "変換作業を開始します"
    scripts = load_data("Data/Scripts.rvdata2")
    new_script = scripts.inject("") do |script, section|
      data = Zlib::Inflate.inflate(section[2])
      data.gsub!(/^\s*#.*\n/, "")
      script + data + "\n"
    end
    new_script = Zlib::Deflate.deflate(new_script, Zlib::BEST_COMPRESSION)
    save_data([[0, "", new_script]], "Convert/Scripts.rvdata2")    
    p "変換作業が終了しました"
  end    
  #--------------------------------------------------------------------------
  # ● 
  #--------------------------------------------------------------------------  
  def convert_enemy_friend
    p "変換作業を開始します"
    bm = Benchmark.new
    bm.start       
    common_events = $data_common_events.dup
    common_events[1001, 1000].each{|common_event|
      next unless common_event
      next if common_event.name.empty?
      index = 0
      while index < common_event.list.size
        command = common_event.list[index]
        if command.code == 401 && command.parameters[0] =~ /\S+の友好度が(\d+)((?:上がった！)|(?:下がった！))/i
          value = $1.to_i * ($2.to_s == "上がった！" ? 1 : -1)
          indent = command.indent
          10.times{|length|
            i = index - length
            c = common_event.list[i]
            next unless [122, 355].include?(c.code)
            index = i
            ce = RPG::EventCommand.new(355, indent, ["change_friend(#{value})"])
            (length + 1).times{common_event.list.delete_at(index)}
            common_event.list.insert(index, ce)
            break
          }
        end
        index += 1
      end
      p "Common:#{common_event.id}をチェックしました"
    }
    save_data(common_events, "CommonEvents.rvdata2")    
    bm.stop
    p "変換作業が終了しました"    
    p "作業時間は#{bm.elapsed}です"
  end
  
  
#~     def chack_weapons
#~       weapons = $data_weapons.compact.reject{|w| w.name.empty?}
#~       weapons.sort_by!{|w| w.performance}
#~       weapons = weapons.reverse[0, 100]
#~       ranks = {}
#~       weapons.each_with_index{|w, i|
#~         ranks[w.wtype_id] ||= []
#~         ranks[w.wtype_id].push(i + 1)
#~       }

#~       File.open('weapons.txt','w'){|f|
#~         f.puts "最強武器TOP100"
#~         weapons.each_with_index{|w, i|
#~           wtype = $data_system.weapon_types[w.wtype_id]
#~           f.puts sprintf("%3d.%s:%s(%s)", i+1, wtype, w.name, w.performance)
#~         }
#~         f.puts ""
#~         f.puts "武器タイプ別順位集計"
#~         (1..31).each{|i|
#~           rank = ranks[i]
#~           if rank
#~             f.puts "#{$data_system.weapon_types[i]}:#{rank.inspect}"
#~           else
#~             f.puts "#{$data_system.weapon_types[i]}:ランク外"
#~           end          
#~         }
#~       }
#~     end
#~   def check_map_size
#~     File.open('map_size.txt','w'){|f|      
#~       (1...700).each{|i|
#~         next unless File.exist?(sprintf("Data/Map%03d.rvdata2", i))      
#~         map = load_data(sprintf("Data/Map%03d.rvdata2", i))
#~         next unless (map.width < 20) || (map.height < 15)
#~         pass = $data_mapinfos[i].name
#~         parent_id = $data_mapinfos[i].parent_id      
#~         pass.insert(0, "#{$data_mapinfos[parent_id].name}＞") if 0 < parent_id
#~         f.puts sprintf("Map%03d pass:%s", i, pass)
#~       }
#~     }
#~   end
#~   def test_script
#~     SDL_Surface* image;
#~     SDL_Rect rect, scr_rect;
#~     SDL_Init(SDL_INIT_EVERYTHING);
#~     SDL_SetVideoMode(640, 480, 32, SDL_HWSURFACE);

#~     /* 画像読み込み */
#~     image = SDL_LoadBMP("sample.bmp");

#~     /* 画像の矩形情報設定 */
#~     rect.x = 0;
#~     rect.y = 0;
#~     rect.w = image->w;
#~     rect.h = image->h;

#~     /* 画像配置位置情報の設定 */
#~     scr_rect.x = 0;
#~     scr_rect.y = 0;

#~     /* サーフェスの複写 */
#~     SDL_BlitSurface(image, &rect, SDL_GetVideoSurface(), &scr_rect);

#~     /* サーフェスフリップ */
#~     SDL_Flip(SDL_GetVideoSurface());

#~     wait(300)

#~     SDL_FreeSurface(image);

#~     SDL_Quit();
#~   end  
end

