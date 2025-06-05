# Add new config entries
module NWConst::Config
CONTENTS.insert(-3, {:key => :mod_states,      :name => "Detailed Combat Status", :sub => true,
                     :help => "[Мod]Change settings for combat status viewer.\r\n←/→ Select"},
                    {:key => :mod_skills,      :name => "Skill Descriptions+", :sub => true,
                     :help => "[Mod]Enable/Disable detailed skill descriptions. ([A] Key).\r\n←/→ Select"},
                    {:key => :mod_log,      :name => "Combat Log", :sub => true,
                     :help => "[Mod]Enable/Disable combat log feature in battle.\r\n←/→ Select"})

DATA[:mod_states] = [0, 1]
DATA[:mod_skills] = [0, 1]
DATA[:mod_log] = [0, 1]

DATA_TEXT[:mod_states] = {0 => {:name => "Off", :help => "Normal combat status display--no additional details."},
                          1 => {:name => "On", :help => "Detailed combat status--select to view details."}}

DATA_TEXT[:mod_skills] = {0 => {:name => "Off", :help => "Disable detailed skill descriptions."},
                          1 => {:name => "On", :help => "Enable detailed skill descriptions."}}

DATA_TEXT[:mod_log] = {0 => {:name => "Off", :help => "Disable Log feature."},
                       1 => {:name => "On", :help => "Enable Log+ feature."}}

DEFAULT[:mod_states] = 0
DEFAULT[:mod_skills] = 1
DEFAULT[:mod_log] = 0

end

## Add help key for skills
class << ShowKey_Help
  def lr_skilldesc
    "#{Vocab.key_x}:Detailed Info"
  end
end

class Scene_Skill < Scene_ItemBase
  def show_key_text
    case
    when @command_window.active
      [ShowKey_Help.stype_move, ShowKey_Help.stype_disable, ShowKey_Help.lr_actor]
    when @item_window.active
      if $game_system.conf[:mod_skills] == 1
        [ShowKey_Help.lr_scroll, ShowKey_Help.lr_skilldesc]
      else
        [ShowKey_Help.lr_scroll]
      end
    end
  end
end

## Правка Лога сообщение в Х-Сценах
class Window_NovelMessage < Window_Message
  def update_all_windows
    super
    @backlog_window.update
    @name_window.visible = !@backlog_window.visible
  end

  def update_flip_hide
    return unless Input.trigger?(:Y) || Input.trigger?(:Z)
    return if @backlog_window.active
    Input.update
    self.active = !active
    self.visible = !visible
    @name_window.visible = visible
  end
end

## Display Help/Page Change in the Characters Library
class Window_Library_MainCommand < Window_Command
  #--------------------------------------------------------------------------
  # ● ヘルプウィンドウの更新【オーバーライド】
  #--------------------------------------------------------------------------
  def update_help
    ct = current_ext[1] / 10000
    id = current_ext[1] % 10000

    str  = Help.library[:btn_column]
    str += "　" + Help.library[:btn_page] if (id != 0) && (1..6).include?(ct)
    if (ct == 2) && (@contents_window.page == 5)
      str += "　" + Help.library[:btn_scroll]
    else
      str += "　" + Help.library[:btn_jump]
    end
    if (id != 0) &&
      (
        (ct == 1 && !actor_had?(id))     ||
          (ct == 2 && !enemy_had?(id))     ||
          (ct == 3 && !weapon_had?(id))    ||
          (ct == 4 && !armor_had?(id))     ||
          (ct == 5 && !accessory_had?(id)) ||
          (ct == 6 && !item_had?(id))
      )
      str = Help.library[:discovery]
    end
    if @category > 0 and [3, 4, 5].include?(ct)
      str += "　" + Help.library[:btn_equip]
    end
    @help_window.set_text(str)
  end
end

class Game_Library
  def presents_get(id)
    if @presents == nil
      @presents = []
    end
    return @presents[id]
  end

  def presents_set(actor,id)
    @presents[$data_actors[actor].original_persona_id] = id
  end
end

## New Library Page
class Game_Interpreter
  def present_start(actor_id)
    wait_for_message
    $game_message.present_actor_id = actor_id
    Fiber.yield while $game_message.present_choice?
    # 受け取りセリフ
    actor = $game_actors[actor_id]
    actor.present_words($game_temp.choice_present_id).each{|word|
      word.execute
      wait_for_message
    }
    # 脱出判定
    if $game_temp.choice_present_id < 1
      $game_message.present_actor_id = 0
      return
    end
    ## Add Presents Data
    if $game_library.presents_get(actor_id) == nil
      a = []
    else
      a = $game_library.presents_get(actor_id)
    end
    b = a.size
    a[b] = [$game_temp.choice_present_id,actor.present_loveup($game_temp.choice_present_id)]
    a.sort!.uniq!
    $game_library.presents_set(actor_id,a)
    ##
    love_result_message(actor_id, actor.present_loveup($game_temp.choice_present_id))
    present_start(actor_id)
  end
end

module PRESDATA
  NOFEED = [1,2,3,4,544,545,546,547,548,549,550,551,552,553,554,555,556,557,
            558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,
            575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,
            592,593,594,595,596,597,598,599,600,601,602,603,801,807,811,815,819,823]
end

class Window_Library_RightMain < Window_Selectable
  ## Character Library Pages
  def draw_contents_actor
    @page_max = 7
    actor = $data_actors[@ext % 10000]
    return unless actor
    # 共通項目の描画
    case @page
    when 0
      draw_actor_image(actor)
      rect = standard_rect
      rect.y = draw_common_id(actor)
      rect.y = draw_actor_stat(rect.y, actor)
      draw_actor_illustrator(actor)
    when 1
      draw_actor_image(actor)
      rect = standard_rect
      rect.y = draw_common_id(actor)
      rect.y = draw_actor_fix_ability(rect.y, actor)
      draw_actor_illustrator(actor)
    when 2
      if PRESDATA::NOFEED.include?(actor.id)
        @page = 0
        self.refresh
      else
        draw_actor_image(actor)
        rect = standard_rect
        rect.y = draw_common_id(actor)
        rect.y = draw_actor_present_pool(rect.y, $data_actors[actor.original_persona_id], 0)
      end
    when 3
      if PRESDATA::NOFEED.include?(actor.id)
        @page = 0
        self.refresh
      else
        draw_actor_image(actor)
        rect = standard_rect
        rect.y = draw_common_id(actor)
        rect.y = draw_actor_present_pool(rect.y, $data_actors[actor.original_persona_id], 1)
      end
    when 4
      if PRESDATA::NOFEED.include?(actor.id)
        @page = 0
        self.refresh
      else
        draw_actor_image(actor)
        rect = standard_rect
        rect.y = draw_common_id(actor)
        rect.y = draw_actor_present_pool(rect.y, $data_actors[actor.original_persona_id], 2)
      end
    when 5
      if PRESDATA::NOFEED.include?(actor.id)
        @page = 0
        self.refresh
      else
        draw_actor_image(actor)
        rect = standard_rect
        rect.y = draw_common_id(actor)
        rect.y = draw_actor_present_pool(rect.y, $data_actors[actor.original_persona_id], 3)
      end
    when 6
      if PRESDATA::NOFEED.include?(actor.id)
        @page = 0
        self.refresh
      else
        draw_actor_image(actor)
        rect = standard_rect
        rect.y = draw_common_id(actor)
        rect.y = draw_actor_present_pool(rect.y, $data_actors[actor.original_persona_id], 4)
      end
    else
      @page = 0
      self.refresh
    end
  end

  def draw_actor_present_pool(y,actor,org)
    rect = standard_rect(y)
    r1 = Rect.new(rect.x, rect.y, rect.width/2-50, rect.height)
    r2 = Rect.new(rect.x+rect.width/2-28, rect.y, 28, rect.height)
    reset_font_settings
    change_color(system_color)
    draw_text(r1, "Gift Preferences")
    r1.y += r1.height
    r2.y += r2.height
    rr = r1.y
    change_color(normal_color)
    n = 0
    if $game_library.presents_get(actor.id) != nil
      a = $game_library.presents_get(actor.id).flatten
    else
      a = []
    end
    while n < 30
      m = n + 301 + 30 * org
      if $game_library.item.had?(m)
        draw_item_name($data_items[m], r1.x, r1.y, true, r1.width)
      else
        draw_text(r1, "??????")
      end
      change_color(special_color)
      if a.include?(m)
        b = a.index(m)+1
        txt = a[b].to_s
      else
        txt = "???"
      end
      draw_text(r2, txt)
      change_color(normal_color)
      r1.y += r1.height
      r2.y += r2.height
      n += 1
      if n == 15
        r1.x += r1.width + 50
        r2.x += r1.width + 50
        r1.y = rr
        r2.y = rr
      end
    end
    return r1.y + LINE_HEIGHT
  end

=begin
  def draw_actor_present_pool(y,actor)
    lr = half_left_rect(y)
    rr = half_right_rect(y)
    reset_font_settings
    change_color(system_color)
    draw_text(lr, "Presents")
    lr.y += lr.height
    rr.y += rr.height
    change_color(normal_color)
    n = 0
    a = $game_presents[actor.id]
    while n < a.size
      m = a[n]
      b = m[0]
      draw_item_name($data_items[b], lr.x, lr.y, true, lr.width)
      b = m[1]
      txt = b.to_s
      draw_text(rr, txt)
      lr.y += lr.height
      rr.y += rr.height
      n += 1
    end
    return rr.y + LINE_HEIGHT
  end
=end
  def draw_contents_enemy
    enemy = $data_enemies[@ext % 10_000]
    return unless enemy

    @page_max = 6 + enemy_skill_page(enemy)
    if @page >= @page_max
      @page = 0
      return refresh
    end
    # ページに応じた項目描画
    rect = standard_rect
    draw_enemy_image(enemy)
    draw_common_page(@page_max)
    rect.y = draw_common_id(enemy)
    case @page
    when 0
      # 1ページ目 基本情報
      draw_enemy_status(rect.y, enemy)
    when 1
      draw_element_resists(rect.y, enemy)
    when 2
      draw_enemy_statresist(rect.y, enemy)
    when 3
      draw_enemy_tropy(rect.y, enemy)
    when 4
      draw_enemy_stat(rect.y, enemy)
    when 5
      draw_chara_description(rect.y, enemy)
    else
      draw_enemy_skill(rect.y, enemy, @page - 6)
    end
  end

  ## Enemy Parameters in the Library (Scales with difficulty)
  def draw_enemy_status(y, enemy)
    rect = standard_rect(y)
    # 能力描画
    # パラメータ文字列の最大の幅を持つものを取得
    max_width = 0
    for i in 0..11
      case i
      when 0..7
      txt = "#{Vocab::param(i)}"
      when 8
        txt = "Accuracy"
      when 9
        txt = "Critical"
      when 10
        txt = "P.Evade"
      else
        txt = "M.Evade"
      end
      now_w = text_size(txt).width
      max_width = now_w if max_width < now_w
    end
    # 描画処理
    for i in 0..11
      if i % 2 == 0
        # 能力描画用の矩形作成
        lr = Rect.new(rect.x, rect.y, max_width, rect.height)
        rr = Rect.new(rect.x + max_width, rect.y, self.contents.width / 2 - max_width - 24, rect.height)
      else
        # 能力描画用の矩形作成
        lr = Rect.new(self.contents.width / 2, rect.y, max_width, rect.height)
        rr = Rect.new(self.contents.width / 2 + max_width, rect.y, self.contents.width / 2 - max_width - 24, rect.height)
        rect.y += rect.height
      end
      change_color(system_color)
      case i
      when 0..7
      txt = "#{Vocab::param(i)}"
      when 8
        txt = "Accuracy"
      when 9
        txt = "Critical Rate"
      when 10
        txt = "Phys. Evasion"
      else
        txt = "Mag. Evasion"
      end
      draw_text(lr, txt, 2)
      change_color(normal_color)
      case i
      when 0..7
      param_base = enemy.params[i]
      param_rate = enemy_features_pi(enemy, Game_BattlerBase::FEATURE_PARAM, i)
      when 8
        param_rate = enemy_features_pi(enemy, Game_BattlerBase::FEATURE_XPARAM, 0)
      when 9
        param_rate = enemy_features_pi(enemy, Game_BattlerBase::FEATURE_XPARAM, 2)
      when 10
        param_rate = enemy_features_pi(enemy, Game_BattlerBase::FEATURE_XPARAM, 1)
      else
        param_rate = enemy_features_pi(enemy, Game_BattlerBase::FEATURE_XPARAM, 4)
      end
      case i
      when 0;     cel = $game_variables[41]
      when 1;     cel = $game_variables[48]
      when 2,4,7;     cel = $game_variables[42]
      when 3,5;     cel = $game_variables[43]
      when 6;     cel = $game_variables[44]
      end
      cel = 100 if enemy.no_difficulty?
      case i
      when 0..7
      cel = (param_base * param_rate * cel).to_i/100
      cel = cel.give_unit_floor(6) if cel >= 10_000_000
      txt = "#{cel}"      
      else
        cel = (param_rate * 100).to_i
        txt = "#{cel}%" 
      end     
#      txt = "#{(param_base * param_rate).to_i}"
      draw_text(rr, txt, 2)
    end  
    rect = standard_rect(rect.y + LINE_HEIGHT)
    acts = 1
    enemy.features.select{|f|
      f.code == NWFeature::FEATURE_ACTION_PLUS
    }.each{|f|
      acts += f.value.to_i
    }
    change_color(system_color)
    draw_text(rect, "Actions per Turn:", 1)
    change_color(normal_color)
    draw_text(rect, "                   #{acts}", 1)
    return rect.y + rect.height
  end

  ## Enemy Elemental Resistance Page in the Library
  def draw_element_resists(y, enemy)
    rect = standard_rect(y)
    change_color(system_color)
    draw_text(rect, "Element Resistances")
    rect.y += rect.height
    r = []
    elements = $game_switches[NWConst::Sw::ADD_ELEMENT_RESIST] ? NWConst::Status::ADD_ELEMENT_RESIST : NWConst::Status::ELEMENT_RESIST
    icons = $game_switches[NWConst::Sw::ADD_ELEMENT_RESIST] ? NWConst::Status::ADD_ELEMENT_ICONS : NWConst::Status::ELEMENT_ICONS
    elements.size.times{r.push(half_left_rect(rect.y))}
    r.each_with_index { |elem, i|
      elem.x += elem.width * (i % 2)
      elem.y += elem.height * (i / 2)
      elem.width -= 16
    }
    r.each_with_index do |rect, i|
      element_id = elements[i]
      icon_id = icons[i]
      draw_element_resist(rect, enemy, element_id, icon_id)
    end
    return r[-1].y + r[-1].height
  end
  ## Enemy Status Resistance Page in the Library
  def draw_enemy_statresist(y, enemy)
    rect = standard_rect(y)
    change_color(system_color)
    draw_text(rect, "Status Resistances")
    rect.y += rect.height
    r = []
    NWConst::Status::STATE_RESIST.size.times{r.push(half_left_rect(rect.y))}
    r.each_with_index { |state_id, i|
      state_id.x += state_id.width * (i % 2)
      state_id.y += state_id.height * (i / 2)
      state_id.width -= 16
    }
    r.each_with_index do |rect, i|
      state_id = NWConst::Status::STATE_RESIST[i]
      icon_id = $data_states[state_id].icon_index
      draw_state_resist(rect, enemy, state_id, icon_id)
    end
    return r[-1].y + r[-1].height + LINE_HEIGHT
  end
  ## Window Element Corrections in the Monsterpedia
  def draw_element_resist(rect, enemy, element_id, icon_id)
    draw_icon(icon_id, rect.x, rect.y)
    rect.x += 24
    rect.width -= 24
    r1 = Rect.new(rect.x, rect.y, rect.width/2+4, rect.height)
    r2 = Rect.new(rect.x+rect.width/2, rect.y, rect.width/2, rect.height)
    reset_font_settings
    change_color(system_color)
    text = "#{$data_system.elements[element_id]}"
    draw_text(r1, text)
    reset_font_settings
    # Game_EnemyではなくRPG::Enemyなので手動でアクセスしています
    element_rate = 1.00
    enemy.features.select{|f|
      f.code == NWFeature::FEATURE_ELEMENT_RATE && f.data_id == element_id
    }.each{|f|
      element_rate *= f.value
    }
    drain_result = !enemy.features_with_id(NWFeature::FEATURE_ELEMENT_DRAIN, element_id).empty?
    resist = Integer(element_rate * 100)
    if drain_result
      color = special_color
      text = "DRAIN"
    else
      if resist == 0
        color = special_color
      elsif resist > 100
        color = bad_color
      elsif resist < 100
        color = good_color
      else
        color = normal_color
      end
      text = resist == 0 ? "NULL" : "#{resist}%"
    end
    change_color(color)
    draw_text(r2, text, 2)
  end
  ## Window Element Corrections in the Monsterpedia 2
  def draw_state_resist(rect, enemy, state_id, icon_id)
    draw_icon(icon_id, rect.x, rect.y)
    rect.x += 24
    rect.width -= 24
    r1 = Rect.new(rect.x, rect.y, rect.width/2+16, rect.height)
    r2 = Rect.new(rect.x+rect.width/2, rect.y, rect.width/2, rect.height)
    reset_font_settings
    change_color(system_color)
    text = "#{$data_states[state_id].name}"
    draw_text(r1, text)
    reset_font_settings
    state_rate = 1.00
    case state_id
    when 230..232 then
      cel = $game_variables[45]
    else
      cel = 100
    end
    enemy.features.select{|f|
      f.code == NWFeature::FEATURE_STATE_RATE && f.data_id == state_id
    }.each{|f|
      state_rate *= f.value
    }
    resist = Integer(state_rate * cel)
    if resist == 0
      color = special_color
    elsif resist > 100
      color = bad_color
    elsif resist < 100
      color = good_color
    else
      color = normal_color
    end
    text = resist == 0 ? "NULL" : "#{resist}%"
    change_color(color)
    draw_text(r2, text, 2)
  end
  ## Window Element Corrections in the Monsterpedia 3
  def draw_enemy_tropy_drop_item(y, enemy)
    rect = standard_rect(y)
    txt = "Drops"
    reset_font_settings
    change_color(system_color)
    draw_text(rect, txt)
    rect.y += rect.height
    reset_font_settings
    unless enemy.drop_items.all?{|drop|drop.kind == 0}
      i = 0
      r = [
        Rect.new(rect.x, rect.y, rect.width/2-18, rect.height),
        Rect.new(rect.x+rect.width/2, rect.y, rect.width/2-18, rect.height),
        Rect.new(rect.x, rect.y+rect.height, rect.width/2-18, rect.height),
      ]
      enemy.drop_items.each do |drop|

        num = $game_library.enemy_item_drop_num(enemy.id, drop)
        if 1 <= num || ($TEST && Input.press?(:CTRL))
          case drop.kind
          when 1; item = $data_items[drop.data_id]
          when 2; item = $data_weapons[drop.data_id]
          when 3; item = $data_armors[drop.data_id]
          else; item = nil
          end
          draw_item_name(item, r[i].x, r[i].y, true, r[i].width) if item
        else
          txt = "?" * 8
          draw_text(r[i], txt)
        end
        i += 1
      end
      return r[i-1].y + rect.height + LINE_HEIGHT
    end

    draw_text(rect, GET_ITEM_NO_NAME)
    return rect.y + rect.height + LINE_HEIGHT
  end

  ## Window Element Corrections in the Monsterpedia 4
  def draw_enemy_tropy_steal_item(y, enemy)
    rect = standard_rect(y)
    reset_font_settings
    enemy.steal_list.each{ |list_id, list|
      next unless steal_item_list_index.key?(list_id)
      rect = standard_rect(rect.y)
      txt = steal_item_list_index[list_id]
      change_color(system_color)
      draw_text(rect, txt)
      rect.y += rect.height
      i = 0
      r = [
        Rect.new(rect.x,rect.y,rect.width/2-18,rect.height),
        Rect.new(rect.x+rect.width/2,rect.y,rect.width/2-18,rect.height)
      ]
      change_color(normal_color)
      list.each { |steal|
        num = $game_library.enemy_item_steal_num(enemy.id, list_id, steal)
        if 1 <= num || ($TEST && Input.press?(:CTRL))
          item = nil
          case steal[:kind]
          when 1; item = $data_items[steal[:data_id]]
          when 2; item = $data_weapons[steal[:data_id]]
          when 3; item = $data_armors[steal[:data_id]]
          end
          draw_item_name(item, r[i].x, r[i].y, true, r[i].width) if item
        else
          txt = "?" * 8
          draw_text(r[i], txt)
        end
        break if r.size - 1 <= i
        i += 1
      }
      draw_text(rect, GET_ITEM_NO_NAME) if list.empty?
      rect.y += rect.height + LINE_HEIGHT
    }
    return rect.y + rect.height + LINE_HEIGHT
  end
  ## Window Element Corrections in the Monsterpedia 5
  def draw_enemy_stat(y, enemy)
    rect = standard_rect(y)
    lr = half_left_rect(rect.y)
    rr = half_right_rect(rect.y)
    join_flag = false
    join_exist = false
    if enemy.follower?
      join_flag = true
      join_exist = $game_party.exist_all_actor_id?(enemy.follower_actor_id)
    elsif enemy.join_switch
      join_flag = true
      join_actor_id = enemy.join_switch - NWConst::Sw::ADD_ACTOR_BASE
      join_exist = $game_party.exist_all_actor_id?(join_actor_id)
    end
    if join_flag
      txt = "Recruited: #{ join_exist ? "Yes" : "No" }"
      change_color(normal_color)
      draw_text(lr, txt)
      lr.y += lr.height + LINE_HEIGHT
      rr.y += rr.height + LINE_HEIGHT
    end
    txt = "Characteristics:"
    change_color(system_color)
    draw_text(lr, txt)
    change_color(normal_color)
    enemy.features.select{|f|
      f.code == NWFeature::FEATURE_EX_CATEGORY
    }.each{|f|
      txt = State_Data::SLAYER[f.data_id-10]
      draw_text(rr, txt)
      lr.y += lr.height
      rr.y += rr.height
    }
    draw_common_friend(lr, rr, enemy)
    lr.y += lr.height
    rr.y += rr.height    
    txt = "Times Defeated:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{enemy_down(enemy.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    txt = "Times Came:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{enemy_orgasm(enemy.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    txt = "Times Raped By:"
    change_color(system_color)
    draw_text(lr, txt)
    txt = "#{enemy_victory(enemy.id).to_i}"
    change_color(normal_color)
    draw_text(rr, txt)
    lr.y += lr.height
    rr.y += rr.height
    lr.y += LINE_HEIGHT
    rr.y += LINE_HEIGHT
    y = draw_encounter_enemy_place(lr.y, enemy)
    return y
  end
end



## Switch configurations to default if they're not in the game save
class Window_Config < Window_Selectable
  def draw_item(index)
    rect = item_rect(index)
    rect.x += 20
    rect.width -= 20
    draw_text(rect, name(index))
    return unless sub_exist?(index)
    value = $game_system.conf[key(index)]
    $game_system.conf[key(index)] = nil unless DATA_TEXT[key(index)][value]
    if $game_system.conf[key(index)] == nil
      $game_system.conf[key(index)] = DEFAULT[key(index)]
    end
    value = $game_system.conf[key(index)]
    draw_text(item_sub_rect(index), DATA_TEXT[key(index)][value][:name])
  end
end

#----
# Actors Drop/Write in library
#----
class Game_Actor < Game_Battler
  def vxace_sp1_release_unequippable_items(item_gain = true)
    CacheActorFeatures.init_actor(self)
    @equips.each_with_index do |item, i|
      next if equip_type_fixed?(basic_equip_slots[i]) || item.object.nil? || (equippable?(item.object) && equippable_slot?(
        i, item.object
      ))
      next if $game_party.members.include?(@actor_id)
      i = item.object
      item.object = nil
      next unless item_gain
      
      trade_item_with_party(nil, i)
      $game_party.restore_socket_item(i)
    end
  end

  def init_equips(equips)
    @equips = Array.new(basic_equip_slots.size) { Game_BaseItem.new }
    equips.each_with_index do |item_data, i|
      next unless item_data
      next if @equips[i].nil?

      etype_id = item_data[1] || index_to_etype_id(i)
      if i == 4 && etype_id != NWConst::Etype::WEAPON && extra_accessory_slot? && $data_armors[item_data[0]].etype_id == NWConst::Etype::ACCESSORY2 && equips[5].nil?
        i = 5
      end
      @equips[i].set_equip(etype_id == NWConst::Etype::WEAPON, item_data[0])
      refresh_socket_item(i)
      next unless item_data[2]

      item_data[2].each_with_index do |stone_id, slot_index|
        stone = $data_items[stone_id]
        @equips[i].object.add_stone(slot_index, stone) if @equips[i]
      end
      refresh
    end
  end
end

module RPG
  module Uniq_Item
    def add_stone(slot_id, item)
      return if slot_id >= socket_num

      if item
        stones.each.with_index do |stone, index|
          if stone && index != slot_id && stone.enchant_stone_category == item.enchant_stone_category
            add_stone(index, nil)
          end
        end
      end

      @stones[slot_id] = item ? item.id : nil
      e = equip_actor
      e.refresh if e
    end
  end
end