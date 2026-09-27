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

#----
# Accessory type fix
#----
class Window_Library_RightMain < Window_Selectable
  def draw_accessory_basic(y, accessory)
    rect = standard_rect
    rect.y = draw_items_common(accessory)
    # 5行目左半分 種別
    rect = half_left_rect(rect.y)
    txt = "Type:"
    change_color(system_color)
    draw_text(rect, txt)
    reset_font_settings
    txt = $data_system.armor_types[accessory.atype_id]
    draw_text(rect, txt, 2)
    # 5行目右半分 価格の描画
    rect = half_right_rect(rect.y)
    txt = "Cost:"
    w = text_size(txt).width
    change_color(system_color)
    draw_text(rect, txt)
    reset_font_settings
    self.draw_currency_value(accessory.price, Vocab.currency_unit, rect.x + w, rect.y, rect.width - w)
    rect.y += rect.height + LINE_HEIGHT
    # 6行目左半分 装備箇所
    rect = standard_rect(rect.y)
    txt = "Slot:"
    change_color(system_color)
    draw_text(rect, txt)
    reset_font_settings
    txt = Vocab.etype(accessory.etype_id)
    rect.x = 89
    draw_text(rect, txt)
    rect.y += rect.height + LINE_HEIGHT
    # 7行目～ 能力補正
    rect.y = draw_equips_common(rect.y, accessory)
  end
end

#---
# Removing non-recruited members equipment fix
#----
class Game_Interpreter
  def delete_actor_ex(actor_id)
    if $game_switches[447] && $game_party.exist_all_actor_id?(actor_id)
      $game_actors[actor_id].clear_equipments
    end  
    $game_party.remove_actor(actor_id)
  end

  def clear_actor_equip(actor_id)
    if $game_party.exist_all_actor_id?(actor_id)
      $game_actors[actor_id].clear_equipments
    end  
  end
end

#----
# Fixes and additions for item effects
#----
module RPG
  class BaseItem
    def get_enchant_names(fts)
      names = []
      dummy = nil

      fts.sort_by { |ft| [-ft.priority, ft.code, ft.data_id] }.each do |ft|
        method_name = enchant_method_table[ft.code]
        if method_name == :dummy_enchant_name
          dummy ||= []
          dummy += send(method_name, ft)
        elsif method_name == :skill_type_state_add || method_name == :stype_add_param
          data = send(method_name, ft)
          if !names.include?(data)
            names.push(data) if data
          end
        elsif method_name
          data = send(method_name, ft)
          names.push(data) if data
        end
      end
      data_ex.each do |nft|
        if non_feature_table.include?(nft[0])
          method_name = non_feature_table[nft[0]]
          data = send(method_name, nft[1])
          names.push(data) if data
        end
      end
      names = dummy if dummy
      names.flatten.compact
    end

    def enchant_method_table
      {
        FEATURE_ELEMENT_RATE => :element_rate_name,
        FEATURE_DEBUFF_RATE => :debuff_rate_name,
        FEATURE_STATE_RATE => :state_rate_name,
        FEATURE_STATE_RESIST => :state_resist_name,
        FEATURE_PARAM => :param_name,
        FEATURE_XPARAM => :xparam_name,
        FEATURE_XPARAM_EX => :xparam_name,
        FEATURE_SPARAM => :sparam_name,
        FEATURE_ATK_ELEMENT => :atk_element_name,
        FEATURE_ATK_STATE => :atk_state_name,
        FEATURE_ATK_SPEED => :atk_speed_name,
        FEATURE_ATK_TIMES => :atk_times_name,
        FEATURE_STYPE_ADD => :stype_add_name,
        FEATURE_STYPE_SEAL => :stype_seal_name,
        FEATURE_EQUIP_WTYPE => :equip_wtype_name,
        FEATURE_EQUIP_ATYPE => :equip_atype_name,
        FEATURE_EQUIP_FIX => :equip_fix_name,
        FEATURE_EQUIP_SEAL => :equip_seal_name,
        FEATURE_SLOT_TYPE => :slot_type_name,
        FEATURE_ACTION_PLUS => :action_plus_name,
        FEATURE_SPECIAL_FLAG => :special_flag_name,
        FEATURE_COLLAPSE_TYPE => :collaplse_type_name,
        FEATURE_PARTY_ABILITY => :party_ability_name,
        FEATURE_XPARAM_EX => :xparam_ex_name,
        FEATURE_PARTY_EX_ABILITY => :party_ex_ability_name,
        FEATURE_BATTLER_ABILITY => :battler_ability_name,
        FEATURE_MULTI_BOOSTER => :multi_booster_name,
        FEATURE_DUMMY_ENCHANT => :dummy_enchant_name,
        FEATURE_TERRAIN_BOOSTER => :terrain_booster_name,
        FEATURE_EQUIP_MASTERY => :equip_mastery_name,
        FEATURE_ELEMENT_DRAIN => :element_drain_name,
        FEATURE_ADD_DUMMY_ENCHANT => :add_dummy_enchant_name, #Changed duplicate function, uses new function for additional effect text
        FEATURE_BLOCK_RATE => :block_rate_name,
        FEATURE_SKILL_STATE_ADD => :skill_state_add,
        FEATURE_SKILL_TYPE_STATE_ADD => :skill_type_state_add,
        FEATURE_SUCCUBUS => :fsuccubus,
        FEATURE_ALL_ADD_ELEMENT => :all_add_element,
        FEATURE_PENETRATION_ELEMENT => :penetration_element,
        FEATURE_EX_CATEGORY_ATTACK => :ex_category_attack,
        FEATURE_EX_CATEGORY_DEFENCE => :ex_category_defence,
        FEATURE_STYPE_ADD_PARAM => :stype_add_param,
        FEATURE_SKILL_COMBO => :skill_combo,
        FEATURE_SKILL_TYPE_COMBO => :skill_type_combo,
        FEATURE_ADD_ELEMENT => :add_element,
        FEATURE_EX_CATEGORY_ATTACK_BONUS => :ex_category_attack_bonus,
        FEATURE_SKILL_PLUS_ATTACK => :skill_plus_attack,
        FEATURE_SKILL_TYPE_PLUS_ATTACK => :skill_type_plus_attack,
        FEATURE_STATE_RATE_FIX => :state_rate_fix,
        FEATURE_ELEMENT_RATE_FIX => :element_rate_fix,
        FEATURE_AUTO_SKILL_INVALID => :auto_skill_invalid,
        FEATURE_SKILL_PLUS_ATTACK_ONE_RANDOM => :skill_plus_attack_one_random,
        FEATURE_SKILL_SCOPE_ALL => :skill_scope_all,
        FEATURE_SKILL_TYPE_SCOPE_ALL => :skill_type_scope_all,
        FEATURE_SKILL_SCOPE_ONE => :skill_scope_one,
        FEATURE_SKILL_TYPE_SCOPE_ONE => :skill_type_scope_one,
        FEATURE_ENEMY_MULTI_SKILL_TYPE_BOOST => :enemy_multi_skill_type_boost,
        FEATURE_ENEMY_SINGLE_SKILL_TYPE_BOOST => :enemy_single_skill_type_boost,
        FEATURE_WIELD_BOOST => :wield_boost,
        FEATURE_BATTLE_START_STATE => :battle_start_state,
        FEATURE_MULTI_ELEMENT => :multi_element,
        FEATURE_SKILL_TYPE_COST_ZERO => :skill_type_cost_zero,
        FEATURE_STATE_BOOST_PLUS => :state_boost_plus,
        FEATURE_LEARNING => :learning,
        FEATURE_FAST_MOVE_ALL => :fast_move_all,
        FEATURE_SLOW_MOVE_ALL => :slow_move_all,
        FEATURE_SKILL_TYPE_DEFENCE_PENETRATION => :skill_type_defence_penetration,
        FEATURE_DUAL_SHIELD_ADD_ABILITY => :dual_shield_add_ability,
        FEATURE_STATE_CHAIN => :state_chain,
        FEATURE_FULL_HP_BOOST => :full_hp_boost,
        FEATURE_MAX_AP_RATE => :max_ap_rate,
        FEATURE_SKILL_CHAIN => :skill_chain,
        FEATURE_SKILL_CHAIN_BOOST => :skill_chain_boost,
        FEATURE_SKILL_CHAIN_COST_RATE => :skill_chain_cost_rate,
        FEATURE_SKILL_COUNTER_EX => :skill_counter_ex,
        FEATURE_SKILL_TIMING_BOOST => :skill_timing_boost,
        FEATURE_SKILL_TIMING_REPEAT => :skill_timing_repeat,
        FEATURE_TURN_END_REVIVE => :turn_end_revive,
        FEATURE_UNDEAD => :undead,
        FEATURE_SKILL_UNSTOPPABLE => :skill_unstoppable,
        FEATURE_SKILL_TYPE_UNSTOPPABLE => :skill_type_unstoppable,
        FEATURE_ELEMENT_DRAIN => :element_drain,
        FEATURE_MAGICAL_CRITICAL => :magical_critical,
        FEATURE_FULL_SP_STYPE_BOOST => :full_sp_stype_boost,
        FEATURE_FULL_MP_STYPE_BOOST => :full_mp_stype_boost,
        FEATURE_ADD_STEAL_STYPE => :add_steal_stype,
        FEATURE_ADD_RESTORATION_STYPE_HP => :add_restoration_stype_hp,
        FEATURE_ADD_RESTORATION_STYPE_MP => :add_restoration_stype_mp,
        FEATURE_AUTO_REVIVE => :auto_revive,
        FEATURE_ID_ITEM_BOOST => :id_item_boost,
        FEATURE_STYPE_ITEM_COST_RATE => :stype_item_cost_rate,
        FEATURE_STYPE_ITEM_GET_RATE => :stype_item_get_rate,
        FEATURE_ONCE_TURN_END_STATE => :once_turn_end_state,
        FEATURE_SINGLE_SKILL_BOOST => :single_skill_boost,
        FEATURE_FAST_MOVE_SID => :fast_move_sid,
        FEATURE_FAST_MOVE_STYPE => :fast_move_stype,
        FEATURE_SLOW_MOVE_SID => :slow_move_sid,
        FEATURE_SLOW_MOVE_STYPE => :slow_move_stype,
        FEATURE_ADD_ELEMENT_STYPE => :add_element_stype,
        FEATURE_HIT_DAMAGE_BOOST => :hit_damage_boost,
        FEATURE_TURN_HIT_DAMAGE_RATE => :turn_hit_damage_rate,
        FEATURE_MAX_AP_BONUS => :max_ap_bonus,
        FEATURE_EX_CATEGORY_STYPE => :ex_category_stype,
        FEATURE_REDUCE_BOOST_DAMAGE => :reduce_boost_damage,
        FEATURE_ALTERNATE_TP_TO_MP => :alternate_tp_to_mp,
        FEATURE_AUTO_SKILL_PRIORITY_INVALID => :auto_skill_priority_invalid,
      }
    end
    
    def invoke_repeats_type_names(ft)
      names = []
      ft.value.each do |key, val|
        names.push("#{$data_system.skill_types[key]} Skills Repeat +#{val-1} #{val-1 == 1 ? "Time" : "Times"}")
      end
      names
    end

    def invoke_repeats_skill_names(ft)
      names = []
      ft.value.each do |key, val|
        names.push("#{$data_skills[key].name} Repeat #{val-1} +#{val-1 == 1 ? "Time" : "Times"}")
      end
      names
    end

    def ex_category_attack_bonus(ft)
      "#{State_Data::SLAYER[ft.data_id-10]} Slayer Effect +#{(ft.value * 100).floor}%"
    end

    def skill_plus_attack(ft)
      "#{$data_skills[ft.data_id].name} +#{ft.value} Hits"
    end

    def skill_type_plus_attack(ft)
      "Multi-Hit #{$data_system.skill_types[ft.data_id]} Skills +#{ft.value} Hits"
    end

    def state_rate_fix(ft)
      "#{$data_states[ft.data_id].name} Resist = Fixed #{(ft.value * 100).floor}%"
    end

    def element_rate_fix(ft)
      "#{$data_system.elements[ft.data_id]} Resist = Fixed #{(ft.value * 100).floor}%"
    end

    def auto_skill_invalid(ft)
      case ft.data_id
      when 12; "Disable On-Death Skills" 
      when 13; "Disable Battle Start Skills" 
      when 14; "Disable Turn Start Skills" 
      when 15; "Disable Turn End Skills" 
      end
    end

    def skill_plus_attack_one_random(ft)
      "#{$data_skills[ft.data_id].name}: #{ft.value} Hits to Random Target"
    end

    def skill_scope_all(ft)
      "#{$data_skills[ft.data_id].name}: Target - All Foes"
    end

    def skill_type_scope_all(ft)
      "#{$data_system.skill_types[ft.data_id]} Skills: Target - All Foes"
    end

    def skill_scope_one(ft)
      "#{$data_skills[ft.data_id].name}: Target - One Foe"
    end

    def skill_type_scope_one(ft)
      "#{$data_system.skill_types[ft.data_id]} Skills: Target - One Foe"
    end

    def enemy_multi_skill_type_boost(ft)
      "#{$data_system.skill_types[ft.data_id]} Skill Damage +#{(ft.value * 100).floor}% if Foe is Not Alone"
    end

    def enemy_single_skill_type_boost(ft)
      "#{$data_system.skill_types[ft.data_id]} Skill Damage +#{(ft.value * 100).floor}% if Foe is Alone"
    end

    def wield_boost(ft)
      case ft.data_id
      when 1; "Single Wield: +#{(ft.value[0] * 100).floor}% to Weapon Stats"
      when 2; "Dual Wield: +#{(ft.value[0] * 100).floor}% to Weapon Stats"
      when 3; "Triple Wield: +#{(ft.value[0] * 100).floor}% to Weapon Stats"
      end
    end

    def battle_start_state(ft)
      "On-battle start:#{$data_states[ft.value[0]].name} for #{ft.value[1]} Turns"
    end

    def multi_element(ft)
      names = []
      ft.value.each{|st|
        names.push("#{$data_system.elements[st]} Strike")
      }
      return names
    end

    def skill_type_cost_zero(ft)
      case ft.value[0]
      when :hp; "#{$data_system.skill_types[ft.value[1]]} Skills Cost No HP"
      when :mp; "#{$data_system.skill_types[ft.value[1]]} Skills Cost No MP"
      when :tp; "#{$data_system.skill_types[ft.value[1]]} Skills Cost No SP"
      end
    end

    def equip_mastery_name(ft)
      "#{ft.data_id[0] == 0 ? ($data_system.weapon_types[ft.data_id[1]]) : ($data_system.armor_types[ft.data_id[1]])} Mastery +#{(ft.value * 100 - 100).floor}%"
    end

    def auto_stand_name(ft)
      "Endure above #{(ft.value * 100).floor}% HP"
    end

    def get_gold_rate_name(ft)
      rate = (ft.value * 100.0).to_i - 100
      "Gold Drop Rate #{0 < rate ? "+" : "-"}#{rate}%"
    end

    def get_item_rate_name(ft)
      rate = (ft.value * 100.0).to_i - 100
      "Item Drop Rate #{0 < rate ? "+" : "-"}#{rate}%"
    end

    def state_boost_plus(ft)
      "Condition bonus +#{(ft.value * 100).floor}%"
    end

    def learning(ft)
      "Sorcery Learning"
    end

    def fast_move_all(ft)
      "All Skills Haste"
    end

    def slow_move_all(ft)
      "All Skills Delay"
    end

    def skill_type_defence_penetration(ft)
      "#{$data_system.skill_types[ft.data_id]} Skills Ignore Defense"
    end

    def dual_shield_add_ability(ft)
      case ft.data_id
      when 5210
        ["Dual Shield:Physical Damage Taken = 80%",
         "Dual Shield:Magical Damage Taken = 80%",
         "Dual Shield:Auto-Hit Damage Taken = 80%",
         "Dual Shield:Throwing Skills use Defense"]
      when 5212
        ["Dual Shield:Defense +30%",
         "Dual Shield:Willpower +30%",
         "Dual Shield:Physical Damage Taken = 80%",
         "Dual Shield:Magical Damage Taken = 80%",
         "Dual Shield:Auto-Hit Damage Taken = 80%"]
      when 5214
        ["Dual Shield:Defense +60%",
         "Dual Shield:Willpower +60%",
         "Dual Shield:Physical Damage Taken = 60%",
         "Dual Shield:Magical Damage Taken = 60%",
         "Dual Shield:Auto-Hit Damage Taken = 60%"]
      end
    end

    def state_chain(ft)
      "#{$data_states[ft.data_id].name} Also Adds #{$data_states[ft.value].name}"
    end

    def full_hp_boost(ft)
      "+#{(ft.value * 100 - 100).floor}% to All Stats at Max HP"
    end

    def max_ap_rate(ft)
      "#{$data_system.skill_types[ft.data_id]} #{ft.value < 0 ? "" : "+"}#{(ft.value * 100).floor}%"
    end

    def skill_chain(ft)
      names = ["#{$data_system.skill_types[ft.data_id]} Skills Chain >"]
      name = [""]
      ft.value.each{|st|
        name = "  to #{$data_system.skill_types[st]} Skills >"
        names.push(name)
      }
      names[names.size-1] = name[0,name.size-1]
      return names
    end

    def skill_chain_boost(ft)
      "Chained Skills Damage +#{(ft.value * 100).floor}%"
    end

    def skill_chain_cost_rate(ft)
      "Chained Skills Cost = #{(ft.value * 100).floor}%"
    end

    def skill_counter_ex(ft)
      "Counter #{$data_skills[ft.data_id].name} with #{$data_skills[ft.value].name}"
    end

    def skill_timing_boost(ft)
      case ft.data_id
      when 0; "+#{(ft.value * 100).floor}% Damage when Acting First"
      when 1; "+#{(ft.value * 100).floor}% Damage when Acting Last"
      end
    end

    def skill_timing_repeat(ft)
      case ft.data_id
      when 0; "Skills Repeat +1 Time when Acting First"
      when 1; "Skills Repeat +1 time when Acting Last"
      end
    end

    def turn_end_revive(ft)
      "End of Turn Revive"
    end

    def undead(ft)
      ["Can Act when Incapacitated", "Considered Dead"]
    end

    def skill_unstoppable(ft)
      "Persistent #{$data_skills[ft.data_id].name}" if $data_skills[ft.data_id].name != ""
    end

    def skill_type_unstoppable(ft)
      "#{$data_system.skill_types[ft.data_id]} Persistence"
    end

    def element_drain(ft)
      "Absorb #{$data_system.elements[ft.data_id]}"
    end

    def magical_critical(ft)
      "Magic Critical Rate = #{(ft.value * 100).floor}%"
    end

    def full_sp_stype_boost(ft)
      "+#{(ft.value * 100).floor}% to #{$data_system.skill_types[ft.data_id]} Skills at Max SP"
    end

    def full_mp_stype_boost(ft)
      "+#{(ft.value * 100).floor}% to #{$data_system.skill_types[ft.data_id]} Skills at Max MP"
    end

    def add_steal_stype(ft)
      "#{$data_system.skill_types[ft.data_id]} Skills Mug"
    end

    def add_restoration_stype_hp(ft)
      "#{$data_system.skill_types[ft.data_id]} Skills Drain #{(ft.value * 100).floor}% HP"
    end

    def add_restoration_stype_mp(ft)
      "#{$data_system.skill_types[ft.data_id]} Skills Drain #{(ft.value * 100).floor}% MP"
    end

    def auto_revive(ft)
      case ft.data_id
      when 0; "Auto-Revive #{ft.value.floor} #{ft.value == 1 ? "time" : "times"}"
      when 1; "Auto-Revive with #{(ft.value * 100).floor}% HP"
      end
    end

    def id_item_boost(ft)
      "#{$data_items[ft.data_id].name} damage +#{(ft.value * 100).floor}%"
    end

    def stype_item_cost_rate(ft)
      "#{$data_system.skill_types[ft.data_id]} Skills Item Cost ×#{ft.value}"
    end

    def stype_item_get_rate(ft)
      "#{$data_system.skill_types[ft.data_id]} Skills Item Production ×#{ft.value}"
    end

    def once_turn_end_state(ft)
      "After #{ft.data_id} turns #{$data_states[ft.value].name}"
    end

    def single_skill_boost(ft)
      "Single-Hit Skill Damage +#{(ft.value * 100 - 100).floor}%"
    end

    def fast_move_sid(ft)
      "#{$data_skills[ft.data_id].name} Haste" if $data_skills[ft.data_id].name != ""
    end

    def fast_move_stype(ft)
      "#{$data_system.skill_types[ft.data_id]} Skill Haste"
    end

    def slow_move_sid(ft)
      "#{$data_skills[ft.data_id].name} Delay" if $data_skills[ft.data_id].name != ""
    end

    def slow_move_stype(ft)
      "#{$data_system.skill_types[ft.data_id]} Skill Delay"
    end

    def add_element_stype(ft)
      "#{$data_system.skill_types[ft.data_id]} Skills Deal #{$data_system.elements[ft.value]} Damage"
    end

    def hit_damage_boost(ft)
      "Multi-Hit Skill Damage +#{(ft.value * 100 - 100).floor}% per Successive Hit"
    end

    def turn_hit_damage_rate(ft)
      "Damage Recieved #{(ft.value * 100 - 100).floor}% per Successive Hit"
    end

    def max_ap_bonus(ft)
      "#{$data_system.skill_types[ft.data_id]} +#{ft.value.floor} Max AP"
    end

    def ex_category_stype(ft)
      "#{$data_system.skill_types[ft.data_id[0]]} Skill Damage +#{(ft.value * 100).floor}% to #{State_Data::SLAYER[ft.data_id[1]-10]}"
    end

    def reduce_boost_damage(ft)
      "Recieved Slayer and Cond. Bonuses -#{(ft.value * 100).floor}%"
    end

    def alternate_tp_to_mp(ft)
      "Use MP When SP Empty at #{(ft.value * 100).floor}% cost"
    end

    def auto_skill_priority_invalid(ft)
      case ft.data_id
      when 12; "Disable On-Death Skills" 
      when 13; "Disable Battle Start Skills" 
      when 14; "Disable Turn Start Skills" 
      when 15; "Disable Turn End Skills" 
      end
    end
    
    def add_element(ft)
      "Add #{$data_system.elements[ft.value]} to #{$data_system.elements[ft.data_id]} Element"
    end
    
    def skill_type_combo(ft)
      "[#{$data_system.skill_types[ft.data_id]} Skills > #{$data_skills[ft.value].name}] Combo"
    end
    
    def skill_combo(ft)
      "[#{$data_skills[ft.data_id].name} > #{$data_skills[ft.value].name}] Combo"
    end
    
    def stype_add_param(ft)
      "#{$data_system.skill_types[ft.data_id]} Skills Power +#{(ft.value[2] * 100).floor}% #{$data_system.terms.params[ft.value[1]]}"
    end
    
    def ex_category_defence(ft)
      "Damage from #{State_Data::SLAYER[ft.data_id-10]} -#{100 - (ft.value * 100).floor}%"
    end
    
    def ex_category_attack(ft)
      "Damage to #{State_Data::SLAYER[ft.data_id-10]} +#{(ft.value * 100).floor}%"
    end
    
    def penetration_element(ft)
      "#{$data_system.elements[ft.data_id]} Element Ignore Resistance"
    end
    
    def all_add_element(ft)
      "#{$data_system.elements[ft.data_id]} Strike for All Skills"
    end
    
    def fsuccubus(ft)
      "Nightmare attribute"
    end
    
    def skill_type_state_add(ft)
      if !ft.value[:self].empty?
        names = []
        ft.value[:self].each{|st,val|
          name = "#{$data_system.skill_types[ft.data_id]} Skills Add to Self "
          name += "#{$data_states[st].name} "
          name += "#{(val*100).floor}%"
          names.push(name)
        }
        return names
      elsif !ft.value[:opponents].empty?
        names = []
        ft.value[:opponents].each{|st,val|
          name = "#{$data_system.skill_types[ft.data_id]} Skills Add to Foes "
          name += "#{$data_states[st].name} "
          name += "#{(val*100).floor}%"
          names.push(name)
        }
        return names
      elsif !ft.value[:friends].empty?
        names = []
        ft.value[:friends].each{|st,val|
          name = "#{$data_system.skill_types[ft.data_id]} Skills Add to Party "
          name += "#{$data_states[st].name} "
          name += "#{(val*100).floor}%"
          names.push(name)
        }
        return names
      end
    end
    
    def skill_state_add(ft)
      if !ft.value[:self].empty?
        pt2 = ft.value[:self].collect{|st,val| "#{$data_states[st].name}:#{(val*100).floor}%"}
        "#{$data_skills[ft.data_id].name} Adds #{pt2[0]}"
      elsif !ft.value[:target].empty?
        pt2 = ft.value[:target].collect{|st,val| "#{$data_states[st].name}:#{(val*100).floor}%"}
        "#{$data_skills[ft.data_id].name} Inflict #{pt2[0]}"
      end
    end
      
    def action_plus_name(ft)
      if ft.value < 1
        "#{(ft.value * 100).floor}% Chance to +1 Action"
      else
        "#{ft.value.floor + 1} Actions"
      end
    end
    
    

    def battler_ability_name(ft)
      method_table = {
        STEAL_SUCCESS => :steal_success_name,
        AUTO_STAND => :auto_stand_name,
        HEEL_REVERSE => :heel_reverse_name,
        AUTO_STATE => :auto_state_names,
        TRIGGER_STATE => :trigger_state_name,
        METAL_BODY => :metal_body_name,
        DEFENSE_WALL => :defense_wall_name,
        INVALIDATE_WALL => :invalidate_wall_name,
        DAMAGE_MP_CONVERT => :damage_mp_convert_name,
        DAMAGE_GOLD_CONVERT => :damage_gold_convert_name,
        DAMAGE_MP_DRAIN => :damage_mp_drain_name,
        DAMAGE_GOLD_DRAIN => :damage_gold_drain_name,
        DEAD_SKILL => :dead_skill_name,
        BATTLE_START_SKILL => :battle_start_skill_name,
        TURN_START_SKILL => :turn_start_skill_name,
        TURN_END_SKILL => :turn_end_skill_name,
        CHANGE_ACTION => :change_action_names,
        STYPE_COST_RATE => :stype_cost_rate_name,
        SKILL_COST_RATE => :skill_cost_rate_name,
        TP_COST_RATE => :tp_cost_rate_name,
        HP_COST_RATE => :hp_cost_rate_name,
        GOLD_COST_RATE => :gold_cost_rate_name,
        INCREASE_TP => :increase_tp_name,
        START_TP_RATE => :start_tp_rate_name,
        BATTLE_END_HEEL_HP => :battle_end_heel_hp_name,
        BATTLE_END_HEEL_MP => :battle_end_heel_mp_name,
        Battler::NORMAL_ATTACK => :normal_attack_name,
        FINAL_INVOKE => :final_invoke_names,
        CERTAIN_COUNTER => :certain_counter_name,
        MAGICAL_COUNTER => :magical_counter_name,
        PHYSICAL_COUNTER_EX => :physical_counter_ex_name,
        MAGICAL_COUNTER_EX => :magical_counter_ex_name,
        CERTAIN_COUNTER_EX => :certain_counter_ex_name,
        CONSIDERATE => :considerate_name,
        GET_EXP_RATE => :get_exp_rate_name,
        GET_CLASSEXP_RATE => :get_classexp_rate_name,
        INVOKE_REPEATS_TYPE => :invoke_repeats_type_names,
        INVOKE_REPEATS_SKILL => :invoke_repeats_skill_names,
        OWN_CRUSH_RESIST => :own_crush_resist_name,
        IGNORE_OVER_DRIVE => :ignore_over_drive_name,
        INSTANT_DEAD_REVERSE => :instant_dead_reverse_name,
        CHANGE_SKILL => :change_skill_name,
        PHYSICAL_REFLECTION => :physical_reclection_name,
        SLOT_CANNOT_DUAL_WIELD => :slot_cannot_dual_wield_name,
        HP_REGEN_INVALID => :hp_regen_invalid_name,
        CANT_MOVE => :cant_move_name,
        BATTLE_START_HP => :battle_start_hp_name,
        CERTAIN_DAMAGE_RATE => :certain_damage_rate_name,
        ELEMENT_REFLECTION => :element_reflection_name,
        SELF_STATE_ETERNAL => :self_state_eternal_name,
        TARGET_STATE_ETERNAL => :target_state_eternal_name,
        EQUIP_ABILITY_BOOST => :equip_ability_boost_name,
        ITEM_COST_SCRIMP_TYPE => :item_cost_scrimp_type_name,
        NORMAL_ATTACK_FORCE_ELEMENT => :normal_attack_force_element_name,
        CERTAIN_REFLECTION => :certain_reflection_name,
        COUNTER_SKILL => :counter_skill_name,
        MAGICAL_COUNTER_SKILL => :magical_counter_skill_name,
        CERTAIN_COUNTER_SKILL => :certain_counter_skill_name,
        COUNTER_EX_SKILL => :counter_ex_skill_name,
        MAGICAL_COUNTER_EX_SKILL => :magical_counter_ex_skill_name,
        CERTAIN_COUNTER_EX_SKILL => :certain_counter_ex_skill_name,
        EVASION_SKILL => :evasion_skill_name,
      }
      method_name = method_table[ft.data_id]
      method_name ? send(method_name, ft) : nil
      # return method_name ? send(method_name, ft) : "UNKNOWN:BattlerAbility #{ft.data_id}"★
    end

    def hp_regen_invalid_name(ft)
      "Disable HP Regen"
    end
    
    def cant_move_name(ft)
      "Cannot Act"
    end
    
    def battle_start_hp_name(ft)
      "Start Battle at #{(ft.value * 100).floor}% HP"
    end
    
    def certain_damage_rate_name(ft)
      "Auto-Hit Damage Taken = #{(ft.value * 100).floor}%"
    end
    
    def element_reflection_name(ft)
      "Reflects #{$data_system.elements[ft.value]} Damage"
    end
    
    def self_state_eternal_name(ft)
      names = []
      ft.value.each{|st|
        names.push("#{$data_states[st].name} is Permanent on Self")
      }
      return names
    end

    def target_state_eternal_name(ft)
      names = []
      ft.value.each{|st|
        names.push("#{$data_states[st].name} is Permanent on Targets")
      }
      return names
    end  

    def equip_ability_boost_name(ft)
      "#{$data_system.terms.etypes[ft.value]} Equipment Special Effects Doubled"
    end
    
    def item_cost_scrimp_type_name(ft)
      names = []
      ft.value.each{|st,val|
        names.push("#{$data_system.skill_types[st]} Skills Consume No Items at #{(val * 100).floor}% Chance")
      }
      return names
    end
    
    def normal_attack_force_element_name(ft)
      "Normal Attack Fixed Element"
    end
    
    def certain_reflection_name(ft)
      "Auto-Hit Reflection +#{(ft.value * 100).floor}%"
    end
    
    def counter_skill_name(ft)
      "Phys. Counter with #{$data_skills[ft.value[:id]].name} #{(ft.value[:per] * 100).floor}%"
    end

    def magical_counter_skill_name(ft)
      "Mag. Counter with #{$data_skills[ft.value[:id]].name} #{(ft.value[:per] * 100).floor}%"
    end
    
    def certain_counter_skill_name(ft)
      "Auto-Hit Counter with #{$data_skills[ft.value[:id]].name} #{(ft.value[:per] * 100).floor}%"
    end
    
    def counter_ex_skill_name(ft)
      "Null+Phys. Counter with #{$data_skills[ft.value[:id]].name} #{(ft.value[:per] * 100).floor}%"
    end
    
    def magical_counter_ex_skill_name(ft)
      "Null+Mag. Counter with #{$data_skills[ft.value[:id]].name} #{(ft.value[:per] * 100).floor}%"
    end
    
    def certain_counter_ex_skill_name(ft)
      "Null+Auto-Hit Counter with #{$data_skills[ft.value[:id]].name} #{(ft.value[:per] * 100).floor}%"
    end
    
    def evasion_skill_name(ft)
      "#{$data_skills[ft.value[:id]].name} After Evasion"
    end

    def multi_booster_name(ft)
      method_table = {
        ELEMENT => :booster_element_name,
        WEAPON_PHYSICAL => :booster_weapon_physical_name,
        WEAPON_MAGICAL => :booster_weapon_magical_name,
        WEAPON_CERTAIN => :booster_weapon_certain_name,
        Booster::NORMAL_ATTACK => :booster_normal_attack_name,
        STATE_RATIO_TYPE => :booster_state_ratio_type_name,
        STATE_FIX_TYPE => :booster_state_fix_type_name,
        SKILL_TYPE => :booster_skill_type_name,
        STATE_RATIO_SKILL => :booster_state_ratio_skill_name,
        SKILL => :booster_skill_name,
        WTYPE_SKILL => :booster_wtype_skill_name,
        COUNTER => :booster_counter_name,
        FALL_HP => :booster_fall_hp_name,
        OVER_SOUL => :over_soul_name,
        CRITICAL => :booster_critical_name,
        REFLECTION => :booster_reflection_name,
        ACTOR_PARAM => :booster_actor_param_name,
        ACTOR_EXIST_PARAM => :booster_actor_exist_param_name,
        SELF_STATE => :booster_self_state_name,
        TARGET_STATE => :booster_target_state_name,
        STATE_SKILL_TYPE => :booster_state_skill_type_name,
        STATE_NORMAL_ATACK => :booster_state_normal_atack_name,
        PINCHI_SKILL_TYPE => :booster_pinchi_skill_type_name,
        BATTLE_COUNT => :booster_battle_count_name,
        ACTOR_DEFEAT => :booster_actor_defeat_name,
        ACTOR_CARRY => :booster_actor_carry_name,
        ACTOR_DOWN => :booster_actor_down_name,
        ACTOR_ORGASM => :booster_actor_orgasm_name,
        ACTOR_STEAL => :booster_actor_steal_name,
        ACTOR_LOVE => :booster_actor_love_name
      }
      method_name = method_table[ft.data_id]
      method_name ? send(method_name, ft) : nil
      # return method_name ? send(method_name, ft) : "UNKNOWN:MultiBooster" ★
    end

    def booster_reflection_name(ft)
      "Reflected Damage = #{(ft.value * 100).floor}"
    end
    
    def booster_actor_param_name(ft)
      names = []
      ft.value.each{|st,val|
        names.push("+#{(val * 100).floor}% All Stats for #{$data_actors[st].name}")
      }
      return names
    end
    
    def booster_actor_exist_param_name(ft)
      names = []
      ft.value.each{|st,val|
        names.push("+#{(val * 100).floor}% All Stats When #{$data_actors[st].name} in Party")
      }
      return names
    end
    
    def booster_self_state_name(ft)
      names = []
      ft.value.each{|st,val|
        names.push("Duration of #{$data_states[st].name} +#{val} on Self")
      }
      return names
    end
    
    def booster_target_state_name(ft)
      names = []
      ft.value.each{|st,val|
        names.push("Duration of #{$data_states[st].name} +#{val} on Targets")
      }
      return names
    end

    
    def booster_state_skill_type_name(ft)
      names = []
      ft.value.each{|st,val|
        names.push("#{$data_system.skill_types[st[0]]} Skill Damage +#{(val * 100).floor}% to foes in #{$data_states[st[1]].name}")
      }
      return names
    end
    
    def booster_state_normal_atack_name(ft)
      names = []
      ft.value.each{|st,val|
        names.push("Normal Attack Damage +#{(val * 100).floor}% to foes in #{$data_states[st].name}")
      }
      return names
    end
    
    def booster_pinchi_skill_type_name(ft)
      names = []
      ft.value.each{|st,val|
        names.push("#{$data_system.skill_types[st]} Skills do +#{(val * 100).floor}% when below 20% HP")
      }
      return names
    end
    
    def booster_battle_count_name(ft)
      "+1% damage for every #{(ft.value * 100).floor} Battles Fought"
    end
    
    def booster_actor_defeat_name(ft)
      "+1% damage for every #{(ft.value * 100).floor} Enemy Defeated"
    end
    
    def booster_actor_carry_name(ft)
      "+1% damage for every #{(ft.value * 100).floor} Enemy Orgasmed"
    end
    
    def booster_actor_down_name(ft)
      "+1% Damage for every #{(ft.value * 100).floor} Defeats"
    end
    
    def booster_actor_orgasm_name(ft)
      "+1% Damage for every #{(ft.value * 100).floor} Orgasms"
    end
    
    def booster_actor_steal_name(ft)
      "+1% Damage for every #{(ft.value * 100).floor} Stolen Items"
    end
    
    def booster_actor_love_name(ft)
      "+1% Damage for every #{(ft.value * 100).floor} Affection"
    end
    
    def non_feature_table
      {
      :skill_convert_param_data => :non_feature_convert_param_data,
      :weapon_rate_bonus => :non_feature_weapon_rate_bonus,
      }
    end

    def non_feature_convert_param_data(nft)
      names = []
      nft.each{|st,val|
        val = val.flatten
        names.push("#{$data_system.skill_types[st]} Skills use #{$data_system.terms.params[val[1]]}")
      }
      return names
    end

    def non_feature_weapon_rate_bonus(nft)
      names = []
      nft.each{|wt|
        names.push("#{$data_system.weapon_types[wt]} Compatibility")
      }
      return names
    end
  end
end