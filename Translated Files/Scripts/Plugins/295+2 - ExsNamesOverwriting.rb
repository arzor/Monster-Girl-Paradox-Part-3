#==============================================================================
# EX's scripts for overwriting enemy/place/etc names.
# - * - Encoding: utf-8 - * -
=begin
=Extension Script(s) For MGQ Paradox
=Library Note Name Data setting section by MGQ EX

Adds Features For MGQ Paradox
* RACE_SPECIAL_NAME			Used To Supplement Category & Note: <カテゴリー：
* PLACE_NAME				Used To Supplement Place Names
* Various Word Wrap Corrections
* Includes Scripts: YEA - Ace Message System (Unofficial Edit)
					Basic Window Resizer v1.1 (Unofficial Edit)

== Update history
Date Version Author Comment
08/14/2015 3.0,0 MGQ EX


=end
#==============================================================================
# ■ NWConst::Library
#==============================================================================
module NWConst::Library
  # Special Settings
  ENABLE_SAVE_DEBUG = false

  #Special Names
  #Found In Database Note Section
  # <図鑑名称:SPECIAL_NAME>
  # <種族:SPECIAL_NAME>

  #Race Special Names
  RACE_SPECIAL_NAME = [
    ["メイン", "Main"],
    ["アポトーシス", "Apoptosis"],
    ["エルフ", "Elf"],
    ["キメラ", "Chimera"],
    ["ゴースト", "Ghost"],
    ["スキュラ", "Scylla"],
    ["スライム", "Slime"],
    ["その他", "Other"],
    ["ゾンビ", "Zombie"],
    ["ドール", "Doll"],
    ["ラミア", "Lamia"],
    ["ロイド", "Roid"],
    ["亜人", "Demi-Human"],
    ["人間", "Human"],
    ["人魚", "Mermaid"],
    ["吸血鬼", "Vampire"],
    ["天使", "Angel"],
    ["女神", "Goddess"],
    ["妖狐", "Kitsune"],
    ["妖精", "Fairy"],
    ["妖魔", "Yoma"],
    ["植物", "Plant"],
    ["海棲種", "Sea-Dweller"],
    ["淫魔", "Succubus"],
    ["竜", "Dragon"],
    ["虫", "Insect"],
    ["邪神", "Evil Goddess"],
    ["陸棲種", "Land-Dweller"],
    ["魔獣", "Beast"],
    ["魔王", "Monster Lord"],
    ["鳥", "Harpy"],
    ["コラボ", "Collab"],
  ]

  ILLUSTRATOR_NAME = [
    ["人外モドキ", "Jingai Modoki"],
    ["あかざわRED", "Akazawa RED"],
    ["瀬戸内", "Setouchi"],
    ["健康クロス", "Kenkou Cross"],
    ["アレキシ", "Arekishi"],
    ["海の山", "Uminoyama"],
    ["ネコまんま", "Neko Manma"],
    ["すがもん", "SugaMon"],
    ["いろどり", "Irodori"],
    ["日下部", "kusakabe"],
    ["デルフィナス", "Delphinus"],
    ["鰯の頭", "Iwashi no Atama"],
    ["シルク", "Silk"],
    ["クール教信者", "Cool-Kyou Shinja"],
    ["ステルス改行", "Stealth Changing Line"],
    ["しぃずぴぃ", "Shimpi"],
    ["雪村信二", "Yukimura Shinji"],
    ["磊磊ちかさ", "rai-rai chika sa"],
    ["とーます", "Thomas"],
    ["真喜屋", "makiya"],
    ["しき", "Shiki"],
    ["えぺ", "Epée"],
    ["RPGツクール", "RPG Maker"],
  ]

  #Custom Special Sale Notes
  SPECIAL_SALE = [
    [1, "非売品を素材にしていますが、本当に売却しますか？", "Synthesis result, base item not sold anywhere, confirm sale?"],
    [2, "非売品ですが、本当に売却しますか？", "Item not sold anywhere, confirm sale?"],
    [3, "非売品かつ合成の素材になりますが、本当に売却しますか？", "Synthesis material, not sold anywhere, confirm sale?"],
    [4, "合成の素材になりますが、本当に売却しますか？", "Synthesis material, confirm sale?"],
    [5, "ちぃぱっぱはいらないよ……", "A Chi Pa Pa! I do not need that..."],
  ]

  # * New Method: SToggle Between Ranks and Percents
  def self.toggle_rank(use_percent = false)
    if !use_percent
      new_valuation = ["S","A","B","C","D","E"]
      new_status_valuation = [
        [130,120,110,100, 90], # MAXHP
        [130,120,110,100, 90], # MAXMP
        [ 30, 20, 10,  0,-20], # MAXSP
        [130,120,110,100, 90], # 攻撃力
        [130,120,110,100, 90], # 防御力
        [130,120,110,100, 90], # 魔法力
        [130,120,110,100, 90], # 魔法防御
        [130,120,110,100, 90], # 敏捷性
        [130,120,110,100, 90], # 運
      ]
    else
      new_valuation = ["500%","495%","490%","485%","480%","475%","470%","465%","460%","455%","450%","445%","440%","435%","430%","425%","420%","415%","410%","405%","400%","395%","390%","385%","380%","375%","370%","365%","360%","355%","350%","345%","340%","335%","330%","325%","320%","315%","310%","305%","300%","295%","290%","285%","280%","275%","270%","265%","260%","255%","250%","245%","240%","235%","230%","225%","220%","215%","210%","205%","200%","195%","190%","185%","180%","175%","170%","165%","160%","155%","150%","145%","140%","135%","130%","125%","120%","115%","110%","105%","100%"," 95%"," 90%"," 85%"," 80%"," 75%"," 70%"," 65%"," 60%"," 55%"," 50%"," 45%"," 40%"," 35%"," 30%"," 25%"," 20%"," 15%"," 10%","  5%"]
      new_status_valuation = [
        [500,495,490,485,480,475,470,465,460,455,450,445,440,435,430,425,420,415,410,405,400,395,390,385,380,375,370,365,360,355,350,345,340,335,330,325,320,315,310,305,300,295,290,285,280,275,270,265,260,255,250,245,240,235,230,225,220,215,210,205,200,195,190,185,180,175,170,165,160,155,150,145,140,135,130,125,120,115,110,105,100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10,  5], # MAXHP
        [500,495,490,485,480,475,470,465,460,455,450,445,440,435,430,425,420,415,410,405,400,395,390,385,380,375,370,365,360,355,350,345,340,335,330,325,320,315,310,305,300,295,290,285,280,275,270,265,260,255,250,245,240,235,230,225,220,215,210,205,200,195,190,185,180,175,170,165,160,155,150,145,140,135,130,125,120,115,110,105,100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10,  5], # MAXMP
        [400,395,390,385,380,375,370,365,360,355,350,345,340,335,330,325,320,315,310,305,300,295,290,285,280,275,270,265,260,255,250,245,240,235,230,225,220,215,210,205,200,195,190,185,180,175,170,165,160,155,150,145,140,135,130,125,120,115,110,105,100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10,  5,  0, -5,-10,-15,-20,-25,-30,-35,-40,-45,-50,-55,-60,-65,-70,-75,-80,-85,-90,-95], # MAXSP
        [500,495,490,485,480,475,470,465,460,455,450,445,440,435,430,425,420,415,410,405,400,395,390,385,380,375,370,365,360,355,350,345,340,335,330,325,320,315,310,305,300,295,290,285,280,275,270,265,260,255,250,245,240,235,230,225,220,215,210,205,200,195,190,185,180,175,170,165,160,155,150,145,140,135,130,125,120,115,110,105,100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10,  5], # 攻撃力
        [500,495,490,485,480,475,470,465,460,455,450,445,440,435,430,425,420,415,410,405,400,395,390,385,380,375,370,365,360,355,350,345,340,335,330,325,320,315,310,305,300,295,290,285,280,275,270,265,260,255,250,245,240,235,230,225,220,215,210,205,200,195,190,185,180,175,170,165,160,155,150,145,140,135,130,125,120,115,110,105,100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10,  5], # 防御力
        [500,495,490,485,480,475,470,465,460,455,450,445,440,435,430,425,420,415,410,405,400,395,390,385,380,375,370,365,360,355,350,345,340,335,330,325,320,315,310,305,300,295,290,285,280,275,270,265,260,255,250,245,240,235,230,225,220,215,210,205,200,195,190,185,180,175,170,165,160,155,150,145,140,135,130,125,120,115,110,105,100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10,  5], # 魔法力
        [500,495,490,485,480,475,470,465,460,455,450,445,440,435,430,425,420,415,410,405,400,395,390,385,380,375,370,365,360,355,350,345,340,335,330,325,320,315,310,305,300,295,290,285,280,275,270,265,260,255,250,245,240,235,230,225,220,215,210,205,200,195,190,185,180,175,170,165,160,155,150,145,140,135,130,125,120,115,110,105,100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10,  5], # 魔法防御
        [500,495,490,485,480,475,470,465,460,455,450,445,440,435,430,425,420,415,410,405,400,395,390,385,380,375,370,365,360,355,350,345,340,335,330,325,320,315,310,305,300,295,290,285,280,275,270,265,260,255,250,245,240,235,230,225,220,215,210,205,200,195,190,185,180,175,170,165,160,155,150,145,140,135,130,125,120,115,110,105,100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10,  5], # 敏捷性
        [500,495,490,485,480,475,470,465,460,455,450,445,440,435,430,425,420,415,410,405,400,395,390,385,380,375,370,365,360,355,350,345,340,335,330,325,320,315,310,305,300,295,290,285,280,275,270,265,260,255,250,245,240,235,230,225,220,215,210,205,200,195,190,185,180,175,170,165,160,155,150,145,140,135,130,125,120,115,110,105,100, 95, 90, 85, 80, 75, 70, 65, 60, 55, 50, 45, 40, 35, 30, 25, 20, 15, 10,  5], # 運
      ]
    end

    NWConst::JobChange.send(:remove_const , :VALUATION) if NWConst::Casino.const_defined?(:VALUATION)
    NWConst::JobChange.const_set(:VALUATION, new_valuation)

    NWConst::JobChange.send(:remove_const , :STATUS_VALUATION) if NWConst::Casino.const_defined?(:VALUATION)
    NWConst::JobChange.const_set(:STATUS_VALUATION, new_status_valuation)
  end

end
#==============================================================================
#From Script: ベース/DataObject
#Overwrite lib_category AND lib_name
#This Allows Searching The Above Arrays And Replacing Data
#==============================================================================
#==============================================================================
# ■ RPG::Actor
#==============================================================================
class RPG::Actor < RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● イラストレーター名

  #--------------------------------------------------------------------------

  def illustrator_name

    if @data_ex.key?(:illustrator_name)
      illustrator_name = @data_ex[:illustrator_name].to_s
      NWConst::Library::ILLUSTRATOR_NAME.each{|jap_name, tran_name|
        if jap_name == illustrator_name
          illustrator_name = tran_name
          break
        end
      }
      return illustrator_name
    else
      return self.name
    end
    return @data_ex.key?(:illustrator_name) ? @data_ex[:illustrator_name] : ""
  end
end

#==============================================================================
# ■ RPG::Enemy
#==============================================================================
class RPG::Enemy < RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● 図鑑種族名
  #--------------------------------------------------------------------------
  def lib_category
    if @data_ex.key?(:lib_category)
      category_name = @data_ex[:lib_category].to_s
      NWConst::Library::RACE_SPECIAL_NAME.each{|jap_name, tran_name|
        if jap_name == category_name
          category_name = tran_name
          break
        end
      }
      return category_name
    else
      return :EMPTY
    end
    #return @data_ex.key?(:lib_category) ? @data_ex[:lib_category] : :EMPTY
  end
end

#==============================================================================
# ■ RPG::BaseItem
#==============================================================================
class RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● Special Sale                    特殊売却
  #--------------------------------------------------------------------------
  def selld_draw
    if @data_ex.key?(:selld_draw)
      sale_text = @data_ex[:selld_draw]
      NWConst::Library::SPECIAL_SALE.each{|index, jap_text, tran_text|
        if jap_text == sale_text
          sale_text = tran_text
          break
        end
      }
      return sale_text
    else
      return nil
    end
    #return @data_ex.key?(:selld_draw) ? @data_ex[:selld_draw] : nil
  end
end

#Overwrite Script:  図鑑/本体
#==============================================================================
# ■ Window_Library_RightMain
#==============================================================================
class Window_Library_RightMain < Window_Selectable
  #--------------------------------------------------------------------------
  # ● キャラ説明描画(アクター, エネミー)
  #--------------------------------------------------------------------------
  def draw_chara_description(y, chara)
    # 描画域の生成
    rect = standard_rect(y)
    rect.height = self.contents.height - rect.y
    @dest_rect = rect
    @src_rect.y = 0 if @last_ext != @ext
    # 解説文章の取得
    desc = ["No Details"]
    if chara.is_a?(RPG::Enemy)
      key = chara.id
      desc = ENEMY_DESCRIPTION[key] if ENEMY_DESCRIPTION.key?(key)
    end

    # Generating a bit map of commentary text (key to the cacheext)
    if @description[@ext].nil? || @description[@ext].disposed?
      @description[@ext] = Bitmap.new(rect.width, desc.size * line_height)
      @src_rect = @description[@ext].rect
      i = 0
      #=begin
      #Add WordWrap For English Text
      str = ""
      #Get Description From Array To String
      desc.each{|txt|
        if txt == ""
          str = str + "\n\n"
        else
          str = str + txt + " "
        end
      }
      #Process Actor
      if chara.is_a?(RPG::Actor)
        desc = []
        #Change String To Line Array
        str2 = str.split("\n")
        str = ""
        str2.each{|s|
          #If Line Blank Retain Else Reformat Line
          if s == ""
            str = str + "\n\n"
          else
            str = str + reformat_wrapped(s)
          end
        }
        str2 = ""
        #Take Reformatted Description And Overwrite Old
        str2 = str.split("\n")
        str2.each{|s|
          if s == ""
            desc<<""
          else
            desc<<s
          end
        }

        #Process Enemy
        if chara.is_a?(RPG::Enemy)
          desc = []
          #Change String To Line Array
          str2 = str.split("\n")
          str = ""
          str2.each{|s|
            #If Line Blank Retain Else Reformat Line
            if s == ""
              str = str + "\n\n"
            else
              str = str + reformat_wrapped(s)
            end
          }
          str2 = ""
          #Take Reformatted Description And Overwrite Old
          str2 = str.split("\n")
          #File.open("Library/Enemy.txt", "a") { |f|
          #  f.write("<<enemy_description/"+key.to_s+"/note>>"+"\n")
          str2.each{|s|
            if s == ""
              desc<<""
              #        f.write("\n")
            else
              desc<<s
              #        f.write(s + "\n")
            end
          }
          #  f.write("\n")
          #}
        end

        #Recalculate Dimensions Of Content
        @description[@ext] = Bitmap.new(rect.width, desc.size * line_height)
        @src_rect = @description[@ext].rect
      end

      desc.each{|txt|
        r = standard_rect(i * line_height)
        @description[@ext].draw_text(r, txt)
        i += 1
      }
    end
    bmp = @description[@ext]
    # ビットマップの範囲を設定
    @src_rect.height = bmp.height - @src_rect.y
    # 解説文章を描画域へ転送する。
    self.contents.blt(@dest_rect.x, @dest_rect.y, bmp, @src_rect)
    # スクロールカーソルを転送する。
    # 上
    if @src_rect.y > 0 && bmp.height > @dest_rect.height
      arrow_rect = Rect.new(88, 14, 14, 10)
      self.contents.blt((self.contents.width - 14) / 2, rect.y - 10,
                        self.windowskin, arrow_rect)
    end
    # 下
    if @src_rect.height > @dest_rect.height
      arrow_rect = Rect.new(88, 38, 14, 10)
      self.contents.blt((self.contents.width - 14) / 2, rect.y + rect.height - 10,
                        self.windowskin, arrow_rect)
    end
    # 戻る
    reset_font_settings
    return rect.y + rect.height
  end

  #--------------------------------------------------------------------------
  # ● 自動改行テキスト表示
  #--------------------------------------------------------------------------
  def draw_text_auto_line(rect, text)
    array = []
    s = ""
    #text.size.times{|i|
    #  s += text[i]
    #  next unless self.contents.width < text_size(s).width + (standard_padding * 2)
    #  array.push(s)
    #  s = ""
    #}
    #s = reformat_wrapped(text) #.split("\n")
    #array.push(s)
    s = reformat_wrapped(text).split("\n")
    s.each{|str| array.push(str)}
    #array.push(reformat_wrapped(text).split("\n"))
    array.each{|str| draw_text(rect, str); rect.y += rect.height}
    return rect
  end

  #--------------------------------------------------------------------------
  # ● 自動改行テキスト表示　配列の区切りで改行
  #--------------------------------------------------------------------------
  def draw_text_auto_line_ex(rect, text)
    array = []
    s = ""
    #text.size.times{|i|
    #  s += text[i] if text[i] != "\n"
    #  next if text[i] != "\n" and
    #          self.contents.width >= text_size(s).width + (standard_padding * 2)
    #  array.push(s)
    #  s = ""
    #}
    s = reformat_wrapped(text).split("\n")
    s.each{|str| array.push(str)}
    array.each{|str| draw_text(rect, str); rect.y += rect.height}
    return rect
  end

  def reformat_wrapped(s, width=48) #Promestein fix: Expand width allotted for text
    lines = []
    line = ""
    s.split(/\s+/).each do |word|
      if line.size + word.size >= width
        lines << line
        line = word
      elsif line.empty?
        line = word
      else
        line << " " << word
      end
    end
    lines << line if line
    return lines.join "\n"
  end

  #--------------------------------------------------------------------------
  # ● Unique Actor Abilities
  #--------------------------------------------------------------------------
  def draw_actor_fix_ability(y, actor)
    fix_abilities = ACTOR_FIX_ABILITY[actor.id]
    return y unless fix_abilities
    rect = standard_rect(y)
    reset_font_settings

    change_color(system_color)
    draw_text(rect, FIX_ABILITY_NAME)
    rect.y += rect.height
    change_color(special_color)
    draw_text(rect, fix_abilities.first)
    rect = Rect.new(4, rect.y + 6, contents.width - 4, 20) #Promestein fix: Expand width allotted for text
    rect.y += rect.height
    change_color(normal_color)
    contents.font.size -= 6 #Promestein adjustment: Uses smaller font

    all_text = ""
    fix_abilities[1...fix_abilities.size].each{|fix_ability|
      all_text += fix_ability + " "
      #all_text += "。" unless all_text[-1] == "。"
      #all_text += "\n"
    }
    #all_text = reformat_wrapped(all_text)
    all_text.slice!(-1, 1)
    rect = draw_text_auto_line_ex(rect, all_text)
    return rect.y
  end

  #--------------------------------------------------------------------------
  # ● Draw Common Parts (Weapons, Armor, Accessories, Items)
  #--------------------------------------------------------------------------
  def draw_items_common(item)
    rect = standard_rect
    reset_font_settings
    # アイテム名の描画
    draw_item_name(item, rect.x, rect.y)
    rect.y = self.contents.height - (line_height * 6) # Original 5

    # 解説の描画
    change_color(system_color)
    draw_text(rect, "Details")
    rect.y += rect.height
    change_color(normal_color)
    all_text = ""
    item.description.each_line do |d|
      d.slice!(/\[(.*?)\]/)
      d.chomp!
      d.gsub!("\\C[0]","")
      d.gsub!("\\C[1]","")
      d.gsub!("\\C[6]","")
      d.gsub!("\\C[8]","")
      d.gsub!("\\C[10]","")
      d.gsub!("\\C[21]","")
      next if d == ""
      all_text += d
      all_text += "\n"
    end
    rect = draw_text_auto_line_ex(rect, all_text)

    return line_height + LINE_HEIGHT
  end
end



#==============================================================================
# ■ Game_Actor
#==============================================================================
class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  # ○ レベルアップメッセージの表示
  #     new_skills : 新しく習得したスキルの配列
  #--------------------------------------------------------------------------
  def display_level_up(new_skills, kind)
    $game_message.new_page
    case kind
    when :base;  prefix = Vocab::level
    when :class; prefix = self.class.name + ' level'
    when :tribe; prefix = self.tribe.name + ' level'
    end

    @name = actor.name if @name == nil
    $game_message.add(sprintf(Vocab::LevelUp, @name, prefix, @level[kind]))
    new_skills.each { |skill|
      # ひきも記の「メッセージ制御文字拡張」競合対策
      $game_message.add(sprintf(Vocab::ObtainSkill, "\\S[#{skill.id}]"))
    }
  end
end

#==============================================================================
# ■ Foo::PTEdit::Window_SortEval
#==============================================================================
class Foo::PTEdit::Window_SortEval < Window_Base
  #--------------------------------------------------------------------------
  # ● Display Sorting Method (New)
  #--------------------------------------------------------------------------
  def draw_eval
    texts = {
      :id => "ID Order",
      :name => "By Name",
      :base_level => "By Base Level",
      :favorite => "Favorite"
    }

    if texts.include?(eval)
      text = texts[eval]
    else
      # Added To Translate Categories
      text = eval.to_s
      NWConst::Library::RACE_SPECIAL_NAME.each{|jap_name, tran_name|
        if jap_name.to_s == text.to_s
          text = tran_name
          break
        end
      }
    end

    change_color(system_color)
    rect = Rect.new(0,0,self.contents.width,line_height)
    draw_text(rect, text, 1)
  end
end

#==============================================================================
# ■ Foo::JobChange::Window_SortEval
#==============================================================================
class Foo::JobChange::Window_SortEval < Window_Base
  #--------------------------------------------------------------------------
  # ● Display Sorting Method (New)
  #--------------------------------------------------------------------------
  def draw_eval
    texts = {
      :id => "ID Order",
      :name => "By Name",
      :base_level => "By Base Level"
    }

    if texts.include?(eval)
      text = texts[eval]
    else
      # Added To Translate Categories
      text = eval.to_s
      NWConst::Library::RACE_SPECIAL_NAME.each{|jap_name, tran_name|
        if jap_name.to_s == text.to_s
          text = tran_name
          break
        end
      }
    end

    change_color(system_color)
    rect = Rect.new(0,0,self.contents.width,line_height)
    draw_text(rect, text, 1)
  end
end

#==============================================================================
# ■ DataManager
#==============================================================================
class << DataManager

  #--------------------------------------------------------------------------
  # ● Load Normal Database EX
  #--------------------------------------------------------------------------
  alias dargoth_load_normal_database_ex load_normal_database_ex
  def load_normal_database_ex
    dargoth_load_normal_database_ex
    # Added To Adjust Resolution From Game.ini
    # Requires Basic Window Resizer v1.1
  end

  #--------------------------------------------------------------------------
  # ○ Load Normal Database
  #--------------------------------------------------------------------------
  alias dargoth_load_normal_database load_normal_database
  def load_normal_database
    dargoth_load_normal_database
    # Added To Adjust Resolution From Game.ini
    # Requires Basic Window Resizer v1.1
  end
end

#==============================================================================
# ■ DataManager
#==============================================================================
module DataManager
  #--------------------------------------------------------------------------
  # ● Start Load Of Saved Game
  #--------------------------------------------------------------------------
  def self.load_game(index)
    begin
      load_game_without_rescue(index) #rescue false
    rescue Exception => ex_error
      MessageBox.fatalerror(ex_error) if NWConst::Library::ENABLE_SAVE_DEBUG
      return false
    end
  end
end