#===============================================================================
# Adding Color Tag To States
#===============================================================================

class RPG::State < RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● メモ欄解析
  #--------------------------------------------------------------------------
  def nw_line_analyze(line)
    case line
    when NWRegexp::State::TMP_EQUIP
      @data_ex[:tmp_equip] = Regexp.last_match(1).to_i
    when NWRegexp::State::DEATH
      @data_ex[:death?] = true
    when NWRegexp::State::DEATH_PLEASURE
      @data_ex[:death_pleasure?] = true
    when NWRegexp::State::ALL_DEAD
      @data_ex[:all_dead] = true
    when NWRegexp::State::DISPLAY_NAME
      if Regexp.last_match(1) == "なし"
        @data_ex[:display?] = false
      else
        @data_ex[:display_name] = Regexp.last_match(1)
      end
    when NWRegexp::State::DISSTATECOLOR
      @data_ex[:disstatecolor] = Regexp.last_match(1).to_i
    when NWRegexp::State::SEAL_ACTION
      @data_ex[:seal_action] ||= []
      Regexp.last_match(1).split(/,\s?/).each { |id| @data_ex[:seal_action].push(id.to_i) }
    when NWRegexp::State::ADD_ACTION
      @data_ex[:add_action] ||= []
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        action = RPG::Enemy::Action.new
        action.skill_id = a.to_i
        action.rating = b.to_i
        @data_ex[:add_action].push(action)
      end
    when NWRegexp::State::FORCE_ITEM_DROP
      @data_ex[:force_item_drop] = true
    when NWRegexp::BaseItem::ONCE_TURN_END_STATE
      @data_ex[:once_turn_end_state] ||= []
      Regexp.last_match(1).scan(/(\d+)-(\d+)/) do |a, b|
        @data_ex[:once_turn_end_state].push([a.to_i, b.to_i])
      end
    when NWRegexp::State::POPUP_BOOST_NAME
      @data_ex[:popup_boost_name] = Regexp.last_match(1)
    when NWRegexp::State::REMOVE_STATE
      @data_ex[:remove_state] = Regexp.last_match(1).split(",").map(&:to_i)
    else
      super
    end
  end
end

module NWRegexp
  module State
    DISSTATECOLOR = /<color(?::|：)(\S+)>/
  end
end

module RPG
  class State
    def dis_color
      @data_ex.fetch(:disstatecolor, 0)
    end
  end
end

#===============================================================================
# Attack Attributes (ID icons, names)
#===============================================================================

module Skill_Data
  TARG = ["None", "Foe", "All Foes", "Random Foes", "Random Allies", "Everyone", "Random Foes and Allies", "Ally", "All Allies", "Fallen Ally", "All Fallen Allies", "Self", "All Allies (Including Reserve)"]
  EX_TAR = [/<敵単体連続:(\d+)>/, /<敵全体連続:(\d+)>/, /<敵ランダム:(\d+)>/,
            /<味方ランダム:(\d+)>/, /<敵味方全体>/ ,/<敵味方ランダム:(\d+)>/, /<待機メンバー含む>/]
  ATK_TYPE = ["\\c[6]Auto-Hit\\c[0]", "\\c[6]Physical\\c[0]", "\\c[6]Magical\\c[0]"]
  STEAL_TYPE = ["Nothing", "Item", "Food", "Material", "Panties"]
end

#===============================================================================
# Display/Hide Window
#===============================================================================

class Scene_Skill < Scene_ItemBase

  alias old_start :start
  def start
    old_start
    create_description_window
    create_descstatus_window
  end

  def create_description_window
    @description_window = Window_Item_Description.new
    @description_window.z = 300
    @description_window.back_opacity = 192
    @description_window.hide
  end

  def unexpand
    @description_window.hide
    @item_window.activate
    @item_window.show
    @status_window.show
    @command_window.show
    @item_window.cursor_fix = false
  end

  alias old_create_item_window :create_item_window
  def create_item_window
    old_create_item_window
    @item_window.set_handler(:expand,     method(:on_item_expand))
    @item_window.set_handler(:statuspack,     method(:on_statuspack))
  end

  alias old_on_item_ok :on_item_ok
  def on_item_ok

    if @selstate_window.active
      @selstate_window.hide
      @selstate_window.active = false
      @description_window.visible = true
      @help_window.show
    end

    if @description_window.visible
      @description_window.hide
      @item_window.show
      @status_window.show
      @command_window.show
      @item_window.cursor_fix = false
    end

    old_on_item_ok
  end

  def on_item_cancel

    if @selstate_window.active
      @selstate_window.hide
      @selstate_window.active = false
      @description_window.visible = true
      @help_window.show
    end

    if @description_window.visible
      @description_window.hide
      @item_window.activate
      @item_window.show
      @status_window.show
      @command_window.show
      @item_window.cursor_fix = false

    else
      @item_window.unselect
      @command_window.activate
    end

  end

  def on_item_expand
    if @selstate_window.active
      @selstate_window.hide
      @selstate_window.active = false
      @description_window.visible = true
      @help_window.show
    end

    if @description_window.visible

      if @description_window.close_page?
        @description_window.hide
        @item_window.activate
        @item_window.show
        @status_window.show
        @command_window.show
        @item_window.cursor_fix = false
      else
        @description_window.next_page
        @description_window.show_description(item,@actor)
      end

    else
      @description_window.show
      @item_window.hide
      @status_window.hide
      @command_window.hide
      @item_window.cursor_fix = true
      @description_window.nul_page
      @description_window.show_description(item,@actor)
    end

  end

  #
  # For states window from skills
  #

  def create_descstatus_window
    @selstate_window = Window_States_Select.new
  end

  def on_statuspack
    if @description_window.get_state_pack_full(@item_window.item,@actor) != []

      if @description_window.visible && @selstate_window.visible == false
        temp = @description_window.get_state_pack_full(@item_window.item,@actor)
        @selstate_window.show.activate
        @selstate_window.get_selection_l(temp)
        @description_window.visible = false
        @description_window.active = false
        @help_window.hide

      elsif @selstate_window.visible == true
        @selstate_window.hide
        @selstate_window.active = false
        @description_window.active = true
        @description_window.visible = true
        @help_window.show
      end

    end

  end

end

class Window_Item_Description < Window_Base

  def initialize
    super(0,fitting_height(4),Graphics.width,Graphics.height-fitting_height(4))
    @page    = 0
    @maxpage = 0
  end

  #===============================================================================
  #   Display Parameters
  #===============================================================================

  def close_page?
    return @page >= @maxpage
  end

  def next_page
    @page += 1
  end

  def nul_page
    @page = 0
    @maxpage = 0
  end

  def skill_name(item)
    temp = item.icon_index
    temp = temp.to_s
    temp = "\\C[1]Name:\\C[0] " + "\\i[" + temp + "]" + item.name + "\n"
    return temp
  end

  def skill_target(item)
    temp = [item.scope,1]
    temp2 = item.note
    temp2.each_line{|line|
      case line
      when Skill_Data::EX_TAR[0] ; temp = [1,$1.to_i]
      when Skill_Data::EX_TAR[1] ; temp = [2,$1.to_i]
      when Skill_Data::EX_TAR[2] ; temp = [3,$1.to_i]
      when Skill_Data::EX_TAR[3] ; temp = [4,$1.to_i]
      when Skill_Data::EX_TAR[4] ; temp = [5, 1]
      when Skill_Data::EX_TAR[5] ; temp = [6,$1.to_i]
      end
    }
    if temp[1] != 1
      temp[1] = temp[1].to_s
      temp[1] = temp[1] + "×"
    else
      temp[1] = ""
    end
    temp = "\\C[1]Target:\\C[0] " + temp[1] + Skill_Data::TARG[temp[0]]
    return temp
  end

  def skill_atk_type(item)
    temp = Skill_Data::ATK_TYPE[item.hit_type]
    return temp
  end

  def skill_speed(item)
    temp = item.speed
    if item.fast_move?
      temp = "|\\c[3]Haste\\c[0]"
    elsif item.slow_move?
      temp = "|\\c[10]Delay\\c[0]"
    elsif temp != 0
      temp = temp.to_s
      temp = "|\\c[6]Speed\\c[0] + " + temp
    else
      temp = ""
    end
    return temp
  end

  def skill_accuracy(item)
    if item.data_ex[:skill_hit] != nil
      temp = item.data_ex[:skill_hit] * 100
      temp = temp.to_i
      temp = temp.to_s
      temp = "|\\c[6]Accuracy\\c[0] = " + temp + "%"
    elsif item.data_ex[:skill_hit_factor] != nil
      temp = item.data_ex[:skill_hit_factor] * 100
      temp = temp.to_i
      if temp < 0
        temp = -temp
        temp = temp.to_s
        temp = "|\\c[6]Accuracy\\c[0] - " + temp + "%"
      else
        temp = temp.to_s
        temp = "|\\c[6]Accuracy\\c[0] + " + temp + "%"
      end
    else
      temp = ""
    end
    return temp
  end

  def skill_critical(item)
    if item.damage.type != 0
      if item.damage.critical
        if item.data_ex[:critical_ex] != nil
          temp = item.data_ex[:critical_ex]
          temp = temp.to_s
          temp = "|" + temp +"% \\c[6]Critical Rate\\c[0]"
        else
          temp = ""
        end
      else
        temp = "|\\c[8]No Critical\\c[0]"
      end
    else
      temp = ""
    end
    return temp
  end

  def skill_dformula(item)
    if item.damage.type != 0
      temp = item.damage.formula
      temp = temp.gsub("b.mhp", "Max HP")
      temp = temp.gsub("b.hp", "Current HP")
      temp = temp.gsub("(b.def + b.mdef)/2", "(Defense+Willpower)/2")
      temp = temp.gsub("b.mdf", "Willpower")
      temp = temp.gsub("b.def", "Defense")
      temp = temp.gsub("[a.atk, a.def, a.mat, a.mdf, a.agi, a.luk].max", "Highest Stat")
      temp = temp.gsub("v[108]", "Level")
      temp = temp.gsub("v[102]", "Steps Taken")
      temp = temp.gsub("$game_library.actor_down(a.id)", "User Deaths")
      temp = temp.gsub("$game_library.actor_steal(a.id)", "User Steals")
      temp = temp.gsub("[", "Highest of (")
      temp = temp.gsub("].max", ")")
      temp = temp.gsub("a.atk", "Attack")
      temp = temp.gsub("a.def", "Defense")
      temp = temp.gsub("a.mat", "Magic")
      temp = temp.gsub("a.mdf", "Willpower")
      temp = temp.gsub("a.agi", "Agility")
      temp = temp.gsub("a.luk", "Dexterity")
      temp = temp.gsub("a.hp", "HP")
      temp = temp.gsub("a.mhp", "Max HP")
      temp = temp.gsub("a.mmp", "Max MP")
      temp = temp.gsub("a.wp_atk", "Normal Attack")
      temp = temp.gsub("*", "×")
      temp = "\\C[1]Formula: \\C[0](" + temp + ")"
      temp2 = item.damage.variance
      if temp2 != 0
        temp2 = temp2.to_s
        temp = temp + " ± " + temp2 + "%"
      end
      temp = temp + "\n"
    else
      temp = ""
    end
    return temp
  end

  def skill_attribute(item)
    if item.damage.type != 0
      temp = ""
      if item.damage.element_id == -1
        temp = temp + "of Normal Attack"
      else
        temp = temp + $data_system.elements[item.damage.element_id]
      end
      if item.data_ex[:element_ex] != nil
        temp2 = 0
        while temp2 < item.data_ex[:element_ex].uniq.size
          if item.data_ex[:element_ex].uniq[temp2] != item.damage.element_id
            temp = temp + ", " + $data_system.elements[item.data_ex[:element_ex].uniq[temp2]]
          end
          temp2 += 1
        end
      end
      if temp != ""
        temp = "\\C[1]Element: \\C[0]" + temp + "\n"
      end
    else
      temp = ""
    end
    return temp
  end

  def skill_slayer(item)
    if item.data_ex[:booster_ex_category_attack] != nil
      temp = item.data_ex[:booster_ex_category_attack]
      temp2 = ""
      temp.each{|key, val|
        temp3 = val * 100
        temp3 = temp3.to_i
        temp3 = temp3.to_s
        if key-10 < State_Data::SLAYER.size
          temp2 = temp2 + State_Data::SLAYER[key-10] + " + " + temp3 + "%, "
          #      else
          #        temp2 = temp2 + "??? + " + temp3 + "%, "
        end
      }
      if temp2 != ""
        temp = "\\C[1]Slayer: \\C[0]" + temp2.chop.chop + "\n"
      else
        temp = ""
      end
    else
      temp = ""
    end
    return temp
  end

  def skill_wrate(item)
    if item.data_ex[:weapon_rate] != nil
      temp = item.data_ex[:weapon_rate]
      temp3 = []
      temp2 = 0
      cc = 0
      temp.each{|key, val|
        if key == 0
          temp3.push "\\C[21]No Weapon\\C[0], "
        elsif key >= $data_system.weapon_types.size
          temp3.push "\\C[21]Shields\\C[0], "
        else
          temp3.push "\\C[21]#{$data_system.weapon_types[key].gsub(" ", " ")}\\C[0], "
        end
        if temp2 != (val * 100).to_i
          temp2 = (val * 100).to_i
          temp3.push " + #{temp2.to_s}%; "
          cc = 0
        else
          temp3.delete_at(temp3.size-2)
          temp3.push " + #{temp2.to_s}%; "
          cc += 1
        end
      }
      if cc == $data_system.weapon_types.size
        temp = "\\C[1]Weapon Compatibility: \\C[21]Everything\\C[0] + #{temp2.to_s}% "+ "\n"
      else
        temp = "\\C[1]Weapon Compatibility: \\C[0]" + temp3.join.chop.chop.gsub(",  + ", " + ")+ "\n"
      end
    else
      temp = ""
    end
    return temp
  end

  def skill_sboost(item)
    if item.data_ex[:state_boost] != nil
      temp = item.data_ex[:state_boost]
      temp2 = ""
      temp.each{|key, val|
        temp3 = val * 100
        temp3 = temp3.to_i
        temp3 = temp3.to_s
        if !(key >= 271 && key <= 276)
          temp2 = temp2 + "[\\C[" + $data_states[key].dis_color.to_s+ "]" + $data_states[key].name + "\\C[0] + " + temp3 + "%] "
        end
      }
      temp = "\\C[1]Amplified Damage Condition: \\C[0]" + temp2.chop + "\n"
    else
      temp = ""
    end
    return temp
  end

  def skill_addstate(item)
    temp = ""
    item.effects.each{|effect|
      if effect.code == 21
        temp2 = effect.value1 * 100
        temp2 = temp2.to_i
        temp2 = temp2.to_s
        if effect.data_id == 0
          temp = temp + "[" + temp2 + "% " + "of Equipped Effect Chance" + "] "
        else
          temp = temp + "[" + temp2 + "% \\C[" + $data_states[effect.data_id].dis_color.to_s+ "]" + $data_states[effect.data_id].name + "\\C[0]] "
        end
      end
    }
    if temp.size > 1000
      temp = "Many (Press \"S\" to look) "
    end
    if temp != ""
      temp = "\\C[1]Adds Status: \\C[0]" + temp.chop + "\n"
    end
    return temp
  end

  def skill_remstate(item)
    temp = ""
    item.effects.each{|effect|
      if effect.code == 22
        temp = temp + "[\\C[" + $data_states[effect.data_id].dis_color.to_s+ "]" + $data_states[effect.data_id].name + "\\C[0]] "
      end
    }
    if temp.size > 500
      temp = "Many (Press \"S\" to look) "
    end
    if temp != ""
      temp = "\\C[1]Removes Status: \\C[0]" + temp.chop + "\n"
    end
    return temp
  end

  def skill_selfstate(item)
    temp = ""
    item.effects.each{|effect|
      if effect.code == 53
        temp = temp + "[\\C[" + $data_states[effect.data_id].dis_color.to_s+ "]" + $data_states[effect.data_id].name + "\\C[0]] "
      end
    }
    if temp.size > 500
      temp = "Many (Press \"S\" to look) "
    end
    if temp != ""
      temp = "\\C[1]Sets Status: \\C[0]" + temp.chop + "\n"
    end
    return temp
  end

  def skill_predstate(item)
    temp = ""
    item.effects.each{|effect|
      if effect.code == 52
        effect.value1.each{|val|
          temp = temp + "[\\C[" + $data_states[val].dis_color.to_s+ "]" + $data_states[val].name + "\\C[0]] "
          if effect.data_id >= 271 && effect.data_id <=276
            temp = nil
          end
        }
        if effect.value2 != 0
          temp = temp.chop + "\n\\C[1]Recovery from Predation: \\C[0]"
          if effect.value2 & 0x1 == 0x1
            temp = temp + "HP, "
          end
          if effect.value2 & 0x2 == 0x2
            temp = temp + "MP, "
          end
          if effect.value2 & 0x4 == 0x4
            temp = temp + "SP, "
          end
          temp.chop!
        end
      end
    }
    if temp != ""
      temp = "\\C[1]Predation Condition: \\C[0]" + temp.chop + "\n"
    end
    return temp
  end

  def skill_deadstate(item)
    temp = ""
    item.effects.each{|effect|
      if effect.code == 51
        temp = temp + "[\\C[" + $data_states[effect.value2[:id]].dis_color.to_s+ "]" + $data_states[effect.value2[:id]].name + "\\C[0]] "
      end
    }
    if temp != ""
      temp = "\\C[1]Instant KO Condition: \\C[0]" + temp.chop + "\n"
    end
    return temp
  end

  def skill_effects(item)
    temp = ""
    item.effects.each{|effect|
      case effect.code
      when 11
        temp2 = effect.value1 * 100
        temp2 = temp2.to_i
        temp2 = temp2.to_s
        temp = temp + "Recover " + temp2 +"% HP, "
      when 12
        if effect.value1 != 0
          temp2 = effect.value1 * 100
          temp2 = temp2.to_i
          temp2 = temp2.to_s
          temp = temp + "Recover " + temp2 +"% MP, "
        else
          temp2 = effect.value2
          temp2 = temp2.to_i
          temp2 = temp2.to_s
          temp = temp + "Recover " + temp2 +" MP, "
        end
      when 13
        temp2 = effect.value1
        temp2 = temp2.to_i
        temp2 = temp2.to_s
        temp = temp + "Recover " + temp2 +"% SP, "
      when 54
        temp2 = effect.value1 * 100
        temp2 = temp2.to_i
        temp2 = temp2.to_s
        if effect.data_id == :HP
          temp = temp + "Drain " + temp2 +"% HP, "
        elsif effect.data_id == :MP
          temp = temp + "Drain " + temp2 +"% MP, "
        end
      when 41
        temp = temp + "Guaranteed Escape, "
      when 44
        temp2 = $data_common_events[effect.data_id].name
        temp = temp + temp2 + ", "
      when 45
        temp = temp + "Steal " + Skill_Data::STEAL_TYPE[effect.data_id] + ", "
      when 46
        temp2 = effect.value2[0]
        temp2 = temp2.to_s
        temp3 = $data_items[effect.value1[0]].name
        temp = temp + "Acquire " + temp2 + " × " + temp3 + ", "
      when 47
        temp2 = effect.data_id.to_s
        temp = temp + "Nullify Attack ×" + temp2 + ", "
      when 48
        temp2 = effect.data_id.to_s
        temp = temp + "Freeze Time for " + temp2 + " Turns, "
      end
    }
    if item.data_ex[:pinchi_boost] != nil
      temp2 = item.data_ex[:pinchi_boost]
      temp2 = temp2.to_s
      temp = temp + "+" + temp2 +"% Damage per % of Missing HP, "
    end
    if item.data_ex[:warp_item?]
      temp = temp + "Overworld Warp, "
    end
    if item.data_ex[:apply_pharmacology?]
      temp = temp + "Boosted by Medicine Lore, "
    end
    temp2 = ""
    item.features.each{|effect|
      if effect.code == 105
        temp2 = effect.value * 100
        temp2 = temp2.to_i.to_s
      end
    }
    if temp2 != ""
      temp = temp + "+" + temp2 +"% Damage from Offensive Buffs, "
    end
    #    if item.data_ex[:use_slot?]
    #      temp = temp + "Play Slots, "
    #    end
    #    if item.data_ex[:use_poker?]
    #      temp = temp + "Play Poker, "
    #    end
    if temp != ""
      temp = "\\C[1]Other Effects: \\C[0]" + temp.chop.chop + "\n"
    end
    return temp
  end

  def get_description(item)
    tempx = skill_name(item)
    tempx = tempx + skill_target(item) + "\n"
    tempx = tempx + skill_atk_type(item) + skill_speed(item) + skill_accuracy(item) + skill_critical(item) + "\n"
    tempx = tempx + skill_dformula(item)
    tempx = tempx + skill_attribute(item)
    tempx = tempx + skill_slayer(item)
    tempx = tempx + skill_wrate(item)
    tempx = tempx + skill_sboost(item)
    tempx = tempx + skill_addstate(item)
    tempx = tempx + skill_remstate(item)
    tempx = tempx + skill_selfstate(item)
    tempx = tempx + skill_predstate(item)
    tempx = tempx + skill_deadstate(item)
    tempx = tempx + skill_effects(item)
    return tempx
  end

  def skill_get_state_pack(item)
    tempx = []
    if item.data_ex[:state_boost] != nil
      temp = item.data_ex[:state_boost]
      temp.each{|key, val|
        if !(key >= 271 && key <= 276)
          tempx[tempx.size] = key
        end
      }
    end
    item.effects.each{|effect|
      if effect.code == 21
        if effect.data_id != 0
          tempx[tempx.size] = effect.data_id
        end
      end
      if effect.code == 22
        tempx[tempx.size] = effect.data_id
      end
      if effect.code == 53
        tempx[tempx.size] = effect.data_id
      end
      if effect.code == 52
        effect.value1.each{|val| tempx[tempx.size] = val}
      end
      if effect.code == 51
        tempx[tempx.size] = effect.value2[:id]
      end
    }
    return tempx.uniq
  end

  def get_state_pack_full(item,actor)
    ntemp = []
    if item.data_ex[:multi_invoke] != nil
      ntemp[ntemp.size] = skill_get_state_pack($data_skills[item.data_ex[:multi_invoke][0]])
      ntemp[ntemp.size] = skill_get_state_pack($data_skills[item.data_ex[:multi_invoke][1]])
    elsif item.id == 3147
      ntemp[ntemp.size] = skill_get_state_pack($data_skills[actor.change_skill(item.id)])
    elsif item.id == 1996
      @maxpage = 10
      ntemp[ntemp.size] = skill_get_state_pack($data_skills[3247 + @page])
    elsif item.id == 1995
      @maxpage = 6
      ntemp[ntemp.size] = skill_get_state_pack($data_skills[3270 + @page])
    elsif item.data_ex[:random_invoke] != nil
      @maxpage = item.data_ex[:random_invoke].size - 1
      temp2 = $data_skills[item.data_ex[:random_invoke][@page]]
      if temp2.data_ex[:multi_invoke] != nil
        ntemp[ntemp.size] = skill_get_state_pack($data_skills[temp2.data_ex[:multi_invoke][0]])
        ntemp[ntemp.size] = skill_get_state_pack($data_skills[temp2.data_ex[:multi_invoke][1]])
      else
        ntemp[ntemp.size] = skill_get_state_pack(temp2)
      end
    else
      ntemp[ntemp.size] = skill_get_state_pack(item)
    end
    ntemp.flatten!.uniq!
    return ntemp
  end

  def show_description(item,actor)
    contents.clear
    temp = ""
    if item.data_ex[:multi_invoke] != nil
      temp = temp + get_description($data_skills[item.data_ex[:multi_invoke][0]])
      temp = temp + get_description($data_skills[item.data_ex[:multi_invoke][1]])
    elsif item.id == 3147
      temp = temp + get_description($data_skills[actor.change_skill(item.id)])
    elsif item.id == 1996
      @maxpage = 10
      temp = temp + get_description($data_skills[3247 + @page])
    elsif item.id == 1995
      @maxpage = 6
      temp = temp + get_description($data_skills[3270 + @page])
    elsif item.data_ex[:random_invoke] != nil
      @maxpage = item.data_ex[:random_invoke].size - 1
      temp2 = $data_skills[item.data_ex[:random_invoke][@page]]
      if temp2.data_ex[:multi_invoke] != nil
        temp = temp + get_description($data_skills[temp2.data_ex[:multi_invoke][0]])
        temp = temp + get_description($data_skills[temp2.data_ex[:multi_invoke][1]])
      else
        temp = temp + get_description(temp2)
      end
    else
      temp = temp + get_description(item)
    end
    draw_text_ex(0, 0, temp)
#    if item.succubus_unavailable? && actor.succubus?
#      draw_text_ex(400,24,"[\\c[10]× Nightmare\\c[0]]")
#    elsif item.succubus_unavailable?
#      draw_text_ex(400,24,"[\\c[8]× Nightmare\\c[0]]")
#    end
    if @page != @maxpage
      draw_text(464,height-72,156,24,"A:More Results")
    end
    if get_state_pack_full(item,actor) != []
      draw_text(440,height-48,180,24,"S:View State Info")
    end
  end
end

class Window_SkillList < Window_Selectable

  def process_handling
    return unless open? && active
    return process_ok       if ok_enabled?        && Input.trigger?(:C)
    return process_cancel   if cancel_enabled?    && Input.trigger?(:B)
    return process_pagedown if handle?(:pagedown) && Input.trigger?(:R)
    return process_pageup   if handle?(:pageup)   && Input.trigger?(:L)
    return process_alt      if Input.trigger?(:X)
    return process_sta      if Input.trigger?(:Y)
  end

  def process_alt
    call_handler(:expand) if $game_system.conf[:mod_skills] == 1
  end

  def process_sta
    call_handler(:statuspack) if $game_system.conf[:mod_states] == 1
  end
end

#===============================================================================
# End
#===============================================================================

module State_Data
  RES_TYPE = ["•None", "•Attack Foes", "•Attack Random Foes or Allies", "•Attack Allies", "•Cannot Act"]
  SEAL_TYPE = ["[None]", "[None]", "[None]", "[None]", "[None]","[None]",
               "Dagger","Sword","Rapier",
               "Katana","Spear","Axe",
               "Club","Scythe","Bow",
               "Whip","Throwing","Flail",
               "Fan","Gun","Multiweapon",
               "Unarmed","White Magic","Black Magic",
               "Time Magic","Summoning","Holy",
               "Dark","Spellblade","Taoism",
               "Thievery","Ninjutsu","Piracy",
               "Justice","Mercantile","EX-Item",
               "Oracle","Dancing","Singing","Talk",
               "Magic Science","Alchemy","Grimoire",
               "Makina","Cooking","Medicine",
               "Service","Ruling","Heroism",
               "Sexcraft","Demon Arts","Ocean",
               "Slime","Beast","Snake",
               "Tentacle","Wing","Insect",
               "Plant","Corpse","Artificial",
               "Nature","Breath","Special",
               "Weapon","[None]","[None]","Psychic","Sorcery","Giant","Chaos"]
  SLAYER = ["Boss", "Human", "Yoma", "Demi-Human", "Succubus",
            "Vampire", "Mermaid", "Elf", "Fairy",
            "Slime", "Beast", "Kitsune", "Lamia",
            "Scylla", "Harpy", "Dragon", "Land-Dweller",
            "Sea-Dweller", "Insect", "Plant", "Zombie",
            "Ghost", "Doll", "Chimera", "Angel",
            "Apoptosis", "???", "Giant", "Roid", "Nightmare",
            "Flying", "God", "Monster Lord"]
  FEATURE_TYPE = ["•Auto-Fight","•Guard","•Cover","•Conserve SP"]
end

#===============================================================================
# State Timer
#===============================================================================

class Game_BattlerBase
  def st_states(state_id)
    return @state_turns[state_id]
  end

  def def_wall
    case @cnt[:defense_wall].size
    when 0
      return "\\c[7]□□"
    when 1
      return "\\c[3]■\\c[7]□"
    else
      return "\\c[3]■■"
    end
  end

  def d_skill
    if @cnt[:dead_skill_flag] && (dead_skill.size + final_invoke.size) != 0
      return "○"
    else
      return "×"
    end
  end

  def a_stand
    if @cnt[:auto_stand] && auto_stand != 1
      return "○"
    else
      return "×"
    end
  end
end

#===============================================================================
# Status Window
#===============================================================================

class Window_States_Description < Window_Base
  def initialize
    super(0,48,Graphics.width,384)
    self.z = 400
    self.visible = false
    @yy = 0
  end

  def state_name(state)
    draw_icon(state.icon_index == 0 ? 299 : state.icon_index,0,@yy)
    col = state.dis_color
    change_color(text_color(col))
    draw_text(24,@yy,516,24,state.name)
    change_color(normal_color)
  end

  def state_timer(item,state)
    if state.auto_removal_timing != 0
      temp = (item.st_states(state.id)).to_s
    else
      temp = "∞"
    end
    temp = "Turns:#{temp}"
    draw_text(540,@yy,70,24,temp)
  end

  def state_restrict(state)
    draw_text(0,@yy,389,24,State_Data::RES_TYPE[state.restriction])
    @yy +=24
  end

  def state_effect(effect)
    tempar = []
    case effect.code
    when 11
      temp = effect.value * 100
      if temp != 0
        temp = temp.to_i - 100
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Resist #{$data_system.elements[effect.data_id]} +#{temp}%"
        else
          temp = temp.to_s
          temp = "•Resist #{$data_system.elements[effect.data_id]} -#{temp}%"
        end
      else
        temp = "•Nullify #{$data_system.elements[effect.data_id]}"
      end
    when 13
      temp = effect.value * 100
      if temp != 0
        temp = temp.to_i - 100
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Resist #{$data_states[effect.data_id].name} +#{temp}%"
        else
          temp = temp.to_s
          temp = "•Resist #{$data_states[effect.data_id].name} -#{temp}%"
        end
      else
        temp = "•Nullify #{$data_states[effect.data_id].name}"
      end
      if effect.data_id >= 271 && effect.data_id <=276
        temp = nil
      end
    when 14
      temp = "•Nullify #{$data_states[effect.data_id].name}"
    when 22
      case effect.data_id
      when 0
        temp = effect.value * 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Accuracy -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Accuracy +" + temp + "%"
        end
      when 1
        temp = effect.value * 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Evasion -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Evasion +" + temp + "%"
        end
      when 2
        temp = effect.value * 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Critical Rate -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Critical Rate +" + temp + "%"
        end
      when 3
        temp = effect.value * 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Critical Avoid -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Critical Avoid +" + temp + "%"
        end
      when 4
        temp = effect.value * 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Magic Evasion -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Magic Evasion +" + temp + "%"
        end
      when 5
        temp = effect.value * 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Magic Reflection -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Magic Reflection +" + temp + "%"
        end
      when 6
        temp = effect.value * 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Counter Rate -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Counter Rate +" + temp + "%"
        end
      when 7
        temp = effect.value * 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "-" + temp + "% HP Per Turn"
        else
          temp = temp.to_s
          temp = "+" + temp + "% HP Per Turn"
        end
      when 8
        temp = effect.value * 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "-" + temp + "% MP Per Turn"
        else
          temp = temp.to_s
          temp = "+" + temp + "% MP Per Turn"
        end
      when 9
        temp = effect.value * 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "-" + temp + "% SP Per Turn"
        else
          temp = temp.to_s
          temp = "+" + temp + "% SP Per Turn"
        end
      end
    when 23
      case effect.data_id
      when 0
        temp = (effect.value * 100).to_i.to_s
        temp = "•Targeted Chance =" + temp + "%"
      when 4
        temp = (effect.value * 100).to_i.to_s
        temp = "•MP Cost = " + temp + "%"
      when 5
        temp = (effect.value).to_i.to_s
        temp = "•Attack SP Charge × " + temp + ""
      when 6
        temp = (effect.value * 100).to_i.to_s
        temp = "•Physical Damage Taken = " + temp + "%"
      when 7
        temp = (effect.value * 100).to_i.to_s
        temp = "•Magical Damage Taken = " + temp + "%"
      end
    when 31
      temp = "•" + $data_system.elements[effect.data_id] + " Strike"
    when 32
      temp = (effect.value * 100).to_i.to_s
      temp = "•#{$data_states[effect.data_id].name} Strike +#{temp}%"
    when 34
      temp = (effect.value).to_i.to_s
      temp = "•+#{temp} Normal Attacks"
      temp = effect.value == 1 ? temp + "" : temp
      temp = effect.value > 1 && effect.value < 1 ? temp + "&" : temp
      temp = temp + ""
    when 41
      temp = "•Enable " + State_Data::SEAL_TYPE[effect.data_id] + ""
    when 42
      temp = "•Seal " + State_Data::SEAL_TYPE[effect.data_id] + ""
    when 43
      temp = "•Unlock " + $data_skills[effect.data_id].name + ""
    when 61
      temp = effect.value
      if temp == temp.to_i
        temp = temp.to_i.to_s
        temp = "•Actions +" + temp + ""
      else
        temp = (temp * 100).to_i.to_s
        temp = "•" + temp + "% Extra Action Chance"
      end
    when 62
      temp = State_Data::FEATURE_TYPE[effect.data_id]
    when 67
      case effect.data_id
      when 10
        temp = (effect.value * 100).to_i.to_s
        temp = "•Gold Drop Rate +" + temp + "%"
      when 11
        temp = (effect.value * 100).to_i.to_s
        temp = "•Item Drop Rate +" + temp + "%"
      when 13
        temp = (effect.value * 100).to_i.to_s
        temp = "•Recruit Rate + " + temp + "%"
      end
    when 68
      case effect.data_id
      when 1
        temp = (effect.value * 100).to_i.to_s
        temp = "•Revive with #{temp}% HP"
      when 2
        temp = "•Heal Reversal"
      when 7
        temp = effect.value.to_s
        temp = "•Nullify Damage Less Than #{temp}"
      when 8
        temp = "•Substitute #{(effect.value * 100).to_i.to_s}% of Damage Taken with MP"
      when 9
        temp = "•Substitute #{(effect.value * 100).to_i.to_s}% of Damage Taken with Gold"
      when 10
        temp = "•Convert #{(effect.value * 100).to_i.to_s}% of Damage Taken into MP"
      when 11
        temp = "•Convert #{(effect.value * 100).to_i.to_s}% of Damage Taken into Gold"
      when 12
        temp = "•On Death: #{$data_skills[effect.value].name}"
      when 14
        temp = (effect.value[:per] * 100).to_i.to_s
        temp = "•Turn Start:  #{temp}% #{$data_skills[effect.value[:id]].name}"
      when 15
        temp = (effect.value[:per] * 100).to_i.to_s
        temp = "•End of Turn: #{temp}% #{$data_skills[effect.value[:id]].name}"
      when 19
        temp = (effect.value * 100).to_i.to_s
        temp = "•SP Cost = " + temp + "%"
      when 22
        temp = "•Маx SP "
        if effect.value[:plus]
          temp = temp + "+#{effect.value[:num]}#{effect.value[:per]?"%":"]"}"
        else
          temp = temp + "-#{effect.value[:num]}#{effect.value[:per]?"%":"]"}"
        end
      when 26
        temp = "•Normal Attack: #{$data_skills[effect.value].name}"
      when 27
        temp = "•Counter Physical with #{$data_skills[effect.value[:id]].name}"
      when 29
        temp = (effect.value * 100).to_i.to_s
        temp = "•Auto-Hit Counter Rate +#{temp}%"
      when 30
        temp = (effect.value * 100).to_i.to_s
        temp = "•Magic Counter Rate  +#{temp}%"
      when 31
        temp = (effect.value * 100).to_i.to_s
        temp = "•Physical Null+Counter Rate +#{temp}%"
      when 32
        temp = (effect.value * 100).to_i.to_s
        temp = "•Magical Null+Counter Rate +#{temp}%"
      when 33
        temp = (effect.value * 100).to_i.to_s
        temp = "•Auto-Hit Null+Counter Rate +#{temp}%"
      when 37
        i = 0
        effect.value.each{|att,val|
          temp = val.to_s
          temp = "•" + $data_system.skill_types[att] + " Skill ×" + temp + ""
          tempar[i] = temp
          i += 1
        }
      when 41
        temp = "•Full Recovery from Instant Death"
      when 45
        temp = (effect.value * 100).to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Physical Reflection -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Physical Reflection +" + temp + "%"
        end
      when 51
        temp = "•#{State_Data::SEAL_TYPE[effect.value]} Haste"
      when 53
        temp = (effect.value * 100).to_i.to_s
        temp = "•Auto-Hit Evasion +#{temp}%"
      when 54
        temp = (effect.value * 100).to_i.to_s
        temp = "•Auto-Hit Damage Taken = " + temp + "%"
      when 55
        temp = "•" + $data_system.elements[effect.value] + " Element Reflect"
      when 61
        temp = (effect.value * 100).to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Auto-Hit Reflection -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Auto-Hit Reflection +" + temp + "%"
        end
      when 62
        temp = (effect.value * 100).to_i.to_s
        temp = "•Experience Gained + " + temp + "%"
      when 63
        temp = (effect.value * 100).to_i.to_s
        temp = "•Job Experience Gained + " + temp + "%"
      when 64
        temp = "•Counter Magic With: #{$data_skills[effect.value[:id]].name}"
      when 65
        temp = "•Counter Auto-Hit With: #{$data_skills[effect.value[:id]].name}"
      when 66
        temp = "•Null+Counter Physical With: #{$data_skills[effect.value[:id]].name}"
      when 67
        temp = "•Null+Counter Magic With: #{$data_skills[effect.value[:id]].name}"
      when 68
        temp = "•Null+Counter Auto-Hit With: #{$data_skills[effect.value[:id]].name}"
      end
    when 69
      case effect.data_id
      when 0
        i = 0
        effect.value.each{|att,val|
          temp = (val * 100).to_i.to_s
          temp = "•" + $data_system.elements[att] + " Booster +" + temp + "%"
          tempar[i] = temp
          i += 1
        }
      when 4
        temp = "•Normal Attack Power +400%"
      when 7
        i = 0
        effect.value.each{|att,val|
          temp = (val * 100).to_i.to_s
          temp = "•#{State_Data::SEAL_TYPE[att]} Damage +#{temp}%"
          tempar[i] = temp
          i += 1
        }
      when 11
        temp = (effect.value * 100).to_i.to_s
        temp = "•Counter Damage +#{temp}%"
      when 15
        temp = (effect.value * 100).to_i.to_s
        temp = "•Critical Damage +#{temp}%"
      end
    when 76
      temp = "•#{$data_system.elements[effect.data_id]} Element on All Attacks"
    when 78
      temp = (effect.value * 100).to_i.to_s
      if effect.data_id-10 < State_Data::SLAYER.size
        temp = "•Damage to " + State_Data::SLAYER[effect.data_id-10] + " +" + temp + "%"
        #      else
        #        temp = "•Damage to ??? +" + temp + "%"
      end
    when 81
      temp = "•#{$data_skills[effect.data_id].name} Combos Into #{$data_skills[effect.value].name}"
    when 82
      temp = "•#{State_Data::SEAL_TYPE[effect.data_id]} Skills Combo Into #{$data_skills[effect.value].name}"
    when 86
      if effect.data_id == 6
        temp = "•All Multi-Hit Skills do +#{effect.value} Hits"
      end
    when 88
      temp = (effect.value * 100).to_i.to_s
      temp = "•Fixed #{$data_system.elements[effect.data_id]} Damage Taken = #{temp}%"
    when 94
      temp = "•#{$data_skills[effect.data_id].name} Hits All"
    when 95
      temp = "•ST #{State_Data::SEAL_TYPE[effect.data_id]} Skills Hit All"
    when 96
      tempar[0] = "•#{$data_skills[effect.data_id].name} Hits One"
      temp = (effect.value * 100).to_i.to_s
      tempar[1] = "•#{$data_skills[effect.data_id].name} Damage +#{temp}%"
    when 97
      tempar[0] = "•AT #{State_Data::SEAL_TYPE[effect.data_id]} Skills Hit One"
      temp = (effect.value * 100).to_i.to_s
      tempar[1] = "•AT #{State_Data::SEAL_TYPE[effect.data_id]} Skill Damage +#{temp}%"
    when 113
      case effect.data_id
      when 0
        temp = effect.value * 100 - 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Max HP -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Max HP +" + temp + "%"
        end
      when 1
        temp = effect.value * 100 - 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Max MP -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Max MP +" + temp + "%"
        end
      when 2
        temp = effect.value * 100 - 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Attack -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Attack +" + temp + "%"
        end
      when 3
        temp = effect.value * 100 - 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Defense -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Defense +" + temp + "%"
        end
      when 4
        temp = effect.value * 100 - 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Magic -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Magic +" + temp + "%"
        end
      when 5
        temp = effect.value * 100 - 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Willpower -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Willpower +" + temp + "%"
        end
      when 6
        temp = effect.value * 100 - 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Agility -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Agility +" + temp + "%"
        end
      when 7
        temp = effect.value * 100 - 100
        temp = temp.to_i
        if temp < 0
          temp = -temp
          temp = temp.to_s
          temp = "•Dexterity -" + temp + "%"
        else
          temp = temp.to_s
          temp = "•Dexterity +" + temp + "%"
        end
      end
    when 118
      temp = "•All Skills Haste"
    when 119
      temp = "•All Skills Delay"
    when 142
      temp = "•Absorb " + $data_system.elements[effect.data_id]
    when 143
      temp = "•Magic Critical Rate +" + (effect.value * 100).to_i.to_s + "%"
    when 153
      temp = "•Auto-Revive " + (effect.value).to_s + " Times" if effect.data_id == 0
    when 160
      temp = "•Single-Hit Skills +#{(effect.value * 100 - 100).to_i}% Damage"
    when 161
      temp = "•Counter #{State_Data::SEAL_TYPE[effect.data_id]} with #{$data_skills[effect.value].name}"
    when 162
      temp = "•#{$data_skills[effect.data_id].name} Haste"
    when 163
      temp = "•#{State_Data::SEAL_TYPE[effect.data_id]} Haste"
    when 164
      temp = "•#{$data_skills[effect.data_id].name} Delay"
    when 165
      temp = "•#{State_Data::SEAL_TYPE[effect.data_id]} Delay"
    when 169
      temp = "•Multi-Hit Skills do +#{(effect.value * 100 - 100).to_i}% Damage with Each Hit"
    end
    if tempar.size > 1
      return tempar
    else
      return temp
    end
  end

  def make_target(item)
    @item = item
  end

  def state_data_ex(item)
    temp = item.data_ex[:once_turn_end_state]
    if temp != nil
      temp = temp.flatten
      return ["•#{$data_states[temp[1]].name} After #{temp[0]} Turn(s)"]
    else
      return nil
    end
  end

  def get_description(index)
    @yy = 0
    xx = 0
    xmax = 1
    contents.clear
    state_name(index)
    state_timer(@item,index)
    @yy += 24
    if index.features != nil
      index.features.each{|effect|
      temp = state_effect(effect)
      if temp != nil
        if temp.is_a?( Array )
          xmax += temp.size
        else
          xmax += 1
        end
      end
      }
      xmax -= 1
    end
    if index.restriction != 0
      xmax += 1
      state_restrict(index)
    end
    xmax = (xmax / 14) + 1
    if index.features != nil
      index.features.each{|effect|
        temp = state_effect(effect)
        if temp != nil
          if temp.is_a?( Array )
#            xmax = (index.features.size + temp.size) / 14 + 1
            for i in 0...temp.size
              draw_text(xx,@yy,contents_width/xmax,24,temp[i])
              @yy +=24
              if @yy >= 360
                xx += contents_width/xmax
                @yy = 24
              end
            end
          else
            draw_text(xx,@yy,contents_width/xmax,24,temp)
            @yy +=24
            if @yy >= 360
              xx += contents_width/xmax
              @yy = 24
            end
          end
        end
      }
    end
    temp = state_data_ex(index)
    if temp != nil
      for i in 0...temp.size
        draw_text(xx,@yy,contents_width/xmax,24,temp[i])
        @yy +=24
        if @yy >= 360
          xx += contents_width/xmax
          @yy = 24
        end 
      end
    end
  end

  #
  # For statuses from the skill window
  #
  def state_timer_l(state)
    if state.auto_removal_timing != 0
      temp = state.min_turns.to_s + "~" + state.max_turns.to_s + " Turns"
    else
      temp = "∞ Turns"
    end
    temp = "#{temp}"
    draw_text(520,@yy,100,24,temp)
  end

  def get_description_l(index)
    @yy = 0
    xx = 0
    xmax = 1
    contents.clear
    state_name($data_states[index])
    state_timer_l($data_states[index])
    @yy += 24
    if $data_states[index].features != nil
      $data_states[index].features.each{|effect|
      temp = state_effect(effect)
      if temp != nil
        if temp.is_a?( Array )
          xmax += temp.size
        else
          xmax += 1
        end
      end
      }
      xmax -= 1
    end
    if $data_states[index].restriction != 0
      xmax += 1
      state_restrict($data_states[index])
    end
    xmax = (xmax / 14) + 1
    if $data_states[index].features != nil
      $data_states[index].features.each{|effect|
        temp = state_effect(effect)
        if temp != nil
          if temp.is_a?( Array )
#            xmax = ($data_states[index].features.size + temp.size) / 14 + 1
            for i in 0...temp.size
              draw_text(xx,@yy,contents_width/xmax,24,temp[i])
              @yy +=24
              if @yy >= 360
                xx += contents_width/xmax
                @yy = 24
              end
            end
          else
            draw_text(xx,@yy,contents_width/xmax,24,temp)
            @yy +=24
            if @yy >= 360
              xx += contents_width/xmax
              @yy = 24
            end
          end
        end
      }
    end
    temp = state_data_ex($data_states[index])
    if temp != nil
      for i in 0...temp.size
        draw_text(xx,@yy,contents_width/xmax,24,temp[i])
        @yy +=24
        if @yy >= 360
          xx += contents_width/xmax
          @yy = 24
        end 
      end
    end
  end
end

class Window_Wall_Description < Window_Base
  def initialize
    super(0,432,640,fitting_height(1))
    self.z = 400
    self.visible = false
  end

  def make_wall(item)
    temp = item.def_wall.to_s
    draw_text_ex(0,0,"\\c[4]Barrier:#{temp}\\c[0]")
    temp = item.d_skill.to_s
    draw_text_ex(184,0,"|  \\c[4]Death Skill:#{temp}\\c[0]")
    temp = item.a_stand.to_s
    draw_text_ex(416,0,"|  \\c[4]Endure:#{temp}\\c[0]")
  end

  def make_wall_l
    draw_text(436,0,600,24,"S:View State Info")
  end
end

class Window_States_Select < Window_Selectable
  def initialize
    super(0,0,Graphics.width,fitting_height(1)+1)
    self.z = 400
    refresh
    self.visible = false
    @itemx = 0
    @descst_window = Window_States_Description.new
    @wall_window = Window_Wall_Description.new
  end

  def get_selection(item)
    @descst_window.show.activate
    @descst_window.make_target(item)
    @itemx = item
    @wall_window.show.activate
    @wall_window.contents.clear
    @wall_window.make_wall(item)
    refresh
    if @itemx.states.size > 0
      select(0)
      @descst_window.get_description(@itemx.states[@index])
    else
      select(-1)
      @descst_window.contents.clear
      draw_text_ex(0,0,"No Status Changes")
    end
  end

  def col_max
    23
  end

  def spacing
    return 0
  end

  def item_height
    25
  end

  def process_cursor_move
    return unless cursor_movable?
    last_index = @index
    cursor_down (Input.trigger?(:DOWN))  if Input.repeat?(:DOWN)
    cursor_up   (Input.trigger?(:UP))    if Input.repeat?(:UP)
    cursor_right(Input.trigger?(:RIGHT)) if Input.repeat?(:RIGHT)
    cursor_left (Input.trigger?(:LEFT))  if Input.repeat?(:LEFT)
    cursor_pagedown   if !handle?(:pagedown) && Input.trigger?(:R)
    cursor_pageup     if !handle?(:pageup)   && Input.trigger?(:L)
    if @index != last_index
      Sound.play_cursor
      if @itemx.kind_of?(Array)
        @descst_window.get_description_l(@itemx[@index])
      else
        @descst_window.get_description(@itemx.states[@index])
      end
    end
  end

  def item_max
    if @itemx == nil
      temp = 0
    elsif @itemx.kind_of?(Array)
      temp = @itemx.size
    else
      temp = @itemx.states.size
    end
    return temp
  end

  def draw_item(index)
    rect = item_rect_for_text(index)
    if @itemx.kind_of?(Array)
      icon = $data_states[@itemx[index]].icon_index
    else
      icon = @itemx.states[index].icon_index
    end
    draw_icon(icon == 0 ? 299 : icon, rect.x-3, rect.y)
  end

  def hide
    @descst_window.hide
    @wall_window.hide
    self.visible = false
    self
  end

  #
  # For statuses from the skill window 2
  #

  def get_selection_l(item)
    @descst_window.show.activate
    @descst_window.make_target(item)
    @itemx = item
    @wall_window.show.activate
    @wall_window.contents.clear
    @wall_window.make_wall_l
    refresh
    select(0)
    @descst_window.get_description_l(@itemx[@index])
  end
end
#
# Call Log
#
$mod_log = []

class Window_BattleLog < Window_Selectable

  def initialize
    super(0, Graphics.height - window_height, window_width, window_height)
    self.z = 200
    @lines = []
    @num_wait = 0
    @popup = PopupResults.new
#    msgbox_p("done")
    refresh
  end

  def add_text(text)
    @lines.shift if max_line_number <= line_number
    @lines.push(text)
    if text != ""
      result = text.to_s.clone
      result.gsub!(/\\c\[(\d+)\]/i,"")
      result.gsub!(/\ei\[(\d+)\]/i,"")
      result.gsub!(/\\m\[(\d+)\]/i,"")
      n = $mod_log.size
      $mod_log[n] = result
    end
    refresh
  end

  def display_added_state(target, state)
    state_msg = target.actor? ? state.message1 : state.message2
    state_msg = Vocab::PleasureFinished if target.result.pleasure && (state.id == target.death_state_id)
    if target.enemy? && (state.id == target.death_state_id) && !target.enemy.defeat_message.empty?
      state_msg = target.enemy.defeat_message
    end
    case state.id
    when NWConst::State::INSTANT_DEAD
      Audio.se_play("Audio/SE/Darkness5")
    when NWConst::State::INSTA2
      Audio.se_play("Audio/SE/Saint7")
    when NWConst::State::INSTA3
      Audio.se_play("Audio/SE/Darkness2")
    end
    target.perform_collapse_effect if state.death?
    return if state_msg.empty?

    replace_text(target.name + state_msg)
    n = $mod_log.size
    $mod_log[n] = target.name + state_msg   
    wait
    wait_for_effect
  end

  def display_removed_stete(target, state)
    return if state.message4.empty?

    replace_text(target.name + state.message4)
    n = $mod_log.size
    $mod_log[n] = target.name + state.message4  
    wait
  end

  def ctext_clear
    $mod_log = []
  end
end


class Window_ModLog < Window_Selectable

  def initialize
    super(0, 0, Graphics.width, Graphics.height - 120)
    @text = []
    self.visible = false
    select(0)
    refresh
  end

  def item_max
    @text ? @text.size : 999
  end

  def item
    @text && index >= 0 ? @text[index] : nil
  end

  def draw_item(index)
    item = @text[index]
    if item
      draw_text(item_rect_for_text(index), item)
    end
  end

  def ctext_show_battlelog(temp)
    @text = temp
  end

end

class Scene_Battle < Scene_Base
  alias x_create_all_windows :create_all_windows
  def create_all_windows
    x_create_all_windows
    create_descstatus_window
    create_modlog_window
    create_description_window
  end

  
  def create_descstatus_window
    @selstate_window = Window_States_Select.new
    @selstate_window.set_handler(:cancel, method(:on_descstat_cancel))
  end

###NEW###
  
  def create_description_window
    @description_window = Window_Item_Description.new
    @description_window.z = 300
    @description_window.back_opacity = 192
    @description_window.hide
  end  

  alias x_create_skill_window :create_skill_window
  def create_skill_window
    x_create_skill_window
    @skill_window.set_handler(:expand, method(:on_skill_expand))
    @skill_window.set_handler(:statuspack,     method(:on_statuspack))
  end  
  
  def unexpand
    @description_window.hide
    @skill_window.activate
    @skill_window.visible = true
    @skill_window.cursor_fix = false
    @actor_command_window.visible = true
    @status_window.visible = true
  end

  alias x_on_skill_cancel :on_skill_cancel
  def on_skill_cancel
    if @selstate_window.active
      @selstate_window.hide
      @selstate_window.active = false
      @description_window.visible = true
      @help_window.show
    end
    if @description_window.visible
      @description_window.hide
      @skill_window.activate
      @skill_window.visible = true
      @skill_window.cursor_fix = false
      @actor_command_window.visible = true
      @status_window.visible = true
    else
      x_on_skill_cancel
    end
  end

  alias x_on_skill_ok :on_skill_ok
  def on_skill_ok
    if @selstate_window.active
      @selstate_window.hide
      @selstate_window.active = false
      @description_window.visible = true
      @help_window.show
    end
    if @description_window.visible
      @description_window.hide
      @skill_window.visible = true
      @skill_window.cursor_fix = false
      @actor_command_window.visible = true
      @status_window.visible = true
    end
    x_on_skill_ok
  end 

  def on_skill_expand
    if @selstate_window.active
      @selstate_window.hide
      @selstate_window.active = false
      @description_window.visible = true
      @help_window.show
    end
    if @description_window.visible
        if @description_window.close_page?
          @description_window.hide
          @skill_window.activate
          @skill_window.visible = true
          @skill_window.cursor_fix = false
          @actor_command_window.visible = true
          @status_window.visible = true
        else
          @description_window.next_page
          @description_window.show_description(@skill_window.item,BattleManager.actor)
        end
    else
      @description_window.show
      @skill_window.visible = false
      @skill_window.cursor_fix = true
      @actor_command_window.visible = false
      @status_window.visible = false
      @description_window.nul_page
      @description_window.show_description(@skill_window.item,BattleManager.actor)
    end
  end
  
  def on_statuspack
    if @description_window.get_state_pack_full(@skill_window.item,BattleManager.actor) != []
      if @description_window.visible && @selstate_window.visible == false
        temp = @description_window.get_state_pack_full(@skill_window.item,BattleManager.actor)
        @selstate_window.show.activate
        @selstate_window.get_selection_l(temp)
        @description_window.active = false
        @description_window.visible = false
        @help_window.hide
      elsif @selstate_window.visible == true
        @selstate_window.hide
        @selstate_window.active = false
        @description_window.active = true
        @description_window.visible = true
        @help_window.show
      end
    end
  end
###END###

  def create_modlog_window
    @modlog_window = Window_ModLog.new
    @modlog_window.set_handler(:cancel, method(:on_modlog_cancel))
  end

  def on_modlog_cancel
    @party_command_window.activate
    @modlog_window.hide.deactivate
  end
  
  def battle_start
    BattleManager.battle_start
    @log_window.ctext_clear
    process_event
    BattleManager.set_battle_start_skill
    @battle_actor_status_windows_show = true
    process_action while BattleManager.gm_exist? && !scene_changing?
    @battle_actor_status_windows_show = false
    BattleManager.judge_win_loss
    start_party_command_selection
  end

  def turn_start
    all_battle_members.each do |m|
      m.on_turn_start
    end
    ($game_party.all_members + $game_troop.members).each do |m|
      m.turn_hit_damage_count = 0
    end
    @info_viewport.visible = false
    @party_command_window.close
    @actor_command_window.close
    @status_window.unselect
    @subject = nil
    BattleManager.turn_start
    @log_window.ctext_clear
    @log_window.wait
    @log_window.clear
    BattleManager.set_turn_start_skill
    @battle_actor_status_windows_show = true
    process_action while BattleManager.gm_exist? && !scene_changing?
    @battle_actor_status_windows_show = false
    BattleManager.judge_win_loss
  end

  def command_battlelog
    @modlog_window.ctext_show_battlelog($mod_log)
    @modlog_window.show.activate
    @modlog_window.refresh
  end

  def create_party_command_window
    @party_command_window = Window_PartyCommand.new
    @party_command_window.viewport = @info_viewport
    @party_command_window.set_handler(:fight,  method(:command_fight))
    @party_command_window.set_handler(:escape, method(:command_escape))
    @party_command_window.set_handler(:auto_battle, method(:command_auto_battle))
    @party_command_window.set_handler(:xlog, method(:command_battlelog))
    @party_command_window.set_handler(:battle_states, method(:command_battle_states))
    @party_command_window.set_handler(:shift_change, method(:command_shift_change))
    @party_command_window.set_handler(:giveup, method(:command_giveup))
    @party_command_window.set_handler(:library, method(:command_library))
    @party_command_window.set_handler(:config, method(:command_config))
    @party_command_window.unselect
  end
end

class Window_PartyCommand < Window_Command
  def make_command_list
    add_command(Vocab.fight, :fight)
    add_command(Vocab.shift_change, :shift_change, can_shift_change?)
    add_command(Vocab::AUTOBATTLE, :auto_battle)
    if $game_system.conf[:mod_log] == 1 
      add_command("Log",        :xlog)
    end
    add_command(Vocab.giveup,      :giveup, BattleManager.can_giveup?)
    add_command(Vocab.escape,      :escape, BattleManager.can_escape?)
    add_command(Vocab::BATTLE_STATES, :battle_states)
    add_command(Vocab.library,     :library)
    add_command(Vocab.config,      :config)
  end
end
#===========================================
#Integration of new status window with TTR's
#===========================================
class Scene_Battle
  def create_battle_status_window
    @states_window = Window_BattlerStates.new
    @states_window.hide
    @states_window.set_handler(:ok, method(:command_battle_status_ok))
    @states_window.set_handler(:cancel, method(:command_battle_status_cancel))
    create_show_key_sprite
  end

  def command_battle_status_ok
    return if $game_system.conf[:mod_states] == 0
    @states_window.hide
    @selstate_window.show.activate
    @selstate_window.get_selection(@states_window.ret_index)
  end

  def on_descstat_cancel
    @states_window.activate.show
    @selstate_window.hide.deactivate
  end

  def command_battle_states
    @party_command_window.deactivate
    @info_viewport.visible = false
    @log_window.hide
    @states_window.activate.show
    @states_window.refresh
  end

  def command_battle_status_cancel
    @info_viewport.visible = true
    @log_window.show
    @states_window.deactivate.hide
    @party_command_window.activate.show
  end
end

class Window_BattlerStates < Window_Selectable
  class Draw < BasicObject
    def set(obj)
      @obj = obj
    end

    def name
      @obj.display_name
    end

    def method_missing(name, *args)
      @obj.send(name, *args)
    end

    def enchant_item?
      true
    end
  end

  def initialize
    super(0, 0, Graphics.width, Graphics.height)
    @obj = Draw.new
    if $game_system.conf[:mod_states] == 1 
      @index = 0
    else
      @index = -1
    end
  end

  def draw_battler(battler, x, y)
    reset_font_settings
    change_color(special_color)
    draw_text(x + 12, y, item_width, line_height, battler.name)
    y += line_height + 2
    draw_status_list(battler, x, y)
  end

  def draw_status_list(battler, x, y)
    if battler.states.empty?
      change_color(normal_color)
      draw_text(x, y, item_width, line_height, " None")
      return
    end

    m = 0
    battler.states.select(&:display?).each do |state|
      if m < 8
        str = ":#{battler.state_turns[state.id]}"
        @obj.set(state)
        draw_item_name(@obj, x, y, true, item_width - text_size(str).width)
        unless state.auto_removal_timing == 0
          draw_text(x, y, item_width, line_height, str, 2)
        end
        y += line_height
        m += 1
      end
    end
  end

  def item_width
    (contents.width + spacing) / 4 - spacing
  end

  def item_height
    Graphics.height / 2 - spacing * 4
  end

  def process_ok
    return if $game_system.conf[:mod_states] == 0
    if current_item_enabled?
      Sound.play_ok
      Input.update
      deactivate
      call_ok_handler
    else
      Sound.play_buzzer
    end
  end
  def spacing
    4
  end

  def item_max
    return 8
  end

  def col_max
    return 4
  end

  def row_max
    return 2
  end

  def ret_index
    if row == 0
      m = $game_party.battle_members
      return m[@index]
    else
      m = $game_troop.alive_members
      return m[@index-4]
    end
  end

  def cursor_right(wrap = false)
    return if $game_system.conf[:mod_states] == 0
    if row == 0
      if $game_party.battle_members[index + 1] != nil and index != 3
        select(index + 1)
      else
        select(0)
      end
    else
      if $game_troop.alive_members[index - 3] != nil and index != 7
        select(index + 1)
      else
        select(4)
      end
    end
  end

  def cursor_left(wrap = false)
    return if $game_system.conf[:mod_states] == 0
    if row == 0
      if $game_party.battle_members[index - 1] != nil and index != 0
        select(index - 1)
      else
        select($game_party.battle_members.size-1)
      end
    else
      if $game_troop.alive_members[index - 5] != nil and index != 4
        select(index - 1)
      else
        select($game_troop.alive_members.size + 3)
      end
    end
  end

  def cursor_up(wrap = false)
    return if $game_system.conf[:mod_states] == 0
    if row == 1
      if $game_party.battle_members[index - 4] != nil
        select(index - 4)
      else
        select($game_party.battle_members.size-1)
      end
    end
  end

  def cursor_down(wrap = false)
    return if $game_system.conf[:mod_states] == 0
    if row == 0
      if $game_troop.alive_members[index] != nil
        select(index + 4)
      else
        select($game_troop.alive_members.size + 3)
      end
    end
  end

  def draw_all_items
    draw_battlers
  end

  def update
    super
    return unless open? && active
  end

  def show_key_text
    return if $game_system.conf[:mod_states] == 0
    [" ↑↓:Allies/Enemies, ←→:Select Combatant, Z:Details, X:Exit"]
  end

  def draw_item_name(item, x, y, enabled = true, width = 236)
    return unless item

    draw_icon(item.icon_index, x, y, enabled)
    col = item.dis_color
    change_color(text_color(col), enabled)
    draw_text(x + 24, y, width - 24, line_height, item.name)
  end

  def draw_battlers
    x = 0
    y = spacing
    m = $game_party.battle_members
    m.each do |battler|
      draw_battler(battler, x, y)
      x += item_width + spacing
    end
    x = 0
    y = Graphics.height / 2 - spacing * 3
    m = $game_troop.alive_members
    m.each do |battler|
      draw_battler(battler, x, y)
      x += item_width + spacing
    end
  end
end


class Game_Party < Game_Unit
  def choice_stand_actor_on_member_full(actor_id, actor_name)
    battle_flag = !actor_name.nil?
    color_index  = 29 # tp_gauge_color2
    choice_index = 0
    actor_name   = $data_actors[actor_id].name unless battle_flag
    members = $game_party.all_members.reject { |actor| actor.luca? }
    choices = members.collect { |actor| actor.name }
    choices.insert(0,"\\C[#{color_index}]" + actor_name)
    choices.each { |name| $game_message.choices.push(name) }
    $game_message.choice_cancel_type = choices.size
    $game_message.choice_proc = proc { |n| choice_index = n }
    if battle_flag
      BattleManager.wait_for_message
    else
      Fiber.yield while $game_message.choice?
    end
    return members[choice_index-1] if choice_index !=0

    false
  end
end



class Window_AbilityXStatus < Window_ShopStatus
  def initialize
    super(0,120,Graphics.width,Graphics.height-120)
    hide
  end

  def refresh
    contents.clear
    return if @item.nil?

    return unless active
    return if @item.is_a?(RPG::Item)

    draw_button(0, contents.height - (line_height))

    return if page_max == 0

    method_name = draw_methods[@page_index][:name]
    index = draw_methods[@page_index][:index]
    send(method_name, 0, 0, index)
  end

  def draw_enchants(x, y, index)
    rect = Rect.new(x, y, contents.width, line_height)
    enchant_names = @item.enchant_names[index * 9, 9]
    change_color(system_color)
    draw_text(rect, "Special Effects")
    rect.y += line_height + 2
    change_color(normal_color)
    enchant_names.each do |name|
      if !name.include?("Sockets:")
        draw_text_plus(rect, name)
        rect.y += line_height
      end
    end
  end

  def draw_button(x, y)
    rect = Rect.new(x, y, contents.width, line_height)
    change_color(system_color)
    if 1 < page_max
      draw_text(rect, Help.shop_equip_change)
      draw_text(rect, "#{@page_index + 1}/#{page_max}", 2)
    end
  end
end
class Foo::Ability::Window_StandAbility < Window_Command
  def process_handling
    return unless open? && active
    return process_ok       if ok_enabled?        && Input.trigger?(:C)
    return process_cancel   if cancel_enabled?    && Input.trigger?(:B)
    return process_xstatus  if handle?(:xstatus)  && Input.trigger?(:X)
    return process_pagedown if handle?(:pagedown) && Input.trigger?(:R)
    return process_pageup   if handle?(:pageup)   && Input.trigger?(:L)
  end

  def process_ok
    if visible
      if current_item_enabled?
        Sound.play_ok
        Input.update
        deactivate
        call_ok_handler
      else
        Sound.play_buzzer
      end
    end
  end

  def process_cancel
    if visible
      Sound.play_cancel
      Input.update
      deactivate
      call_cancel_handler
    else
      call_handler(:xstatus)
    end
  end

  def process_xstatus
    call_handler(:xstatus)
  end
end

class Foo::Ability::Window_EquipAbility < Window_Command
  def process_handling
    return unless open? && active
    return process_ok       if ok_enabled?        && Input.trigger?(:C)
    return process_cancel   if cancel_enabled?    && Input.trigger?(:B)
    return process_extra    if handle?(:extra)    && Input.trigger?(:A)
    return process_xstatus  if handle?(:xstatus)  && Input.trigger?(:X)
    return process_pagedown if handle?(:pagedown) && Input.trigger?(:R)
    return process_pageup   if handle?(:pageup)   && Input.trigger?(:L)
  end

  def process_ok
    if visible
      if current_item_enabled?
        Sound.play_ok
        Input.update
        deactivate
        call_ok_handler
      else
        Sound.play_buzzer
      end
    end
  end

  def process_cancel
    if visible
      Sound.play_cancel
      Input.update
      deactivate
      call_cancel_handler
    else
      call_handler(:xstatus)
    end
  end

  def process_extra
    if visible
      Input.update
      NWConst::Ability::REMOVE_SE.play
      call_handler(:extra)
    end
  end

  def process_xstatus
    call_handler(:xstatus)
  end
end

class Scene_Ability < Scene_MenuBase
  def start
    super
    create_help_window
    create_stand_ability_window
    create_equip_ability_window
    create_ability_type_window
    create_saveload_select_window
    create_ability_xstatus_window
  end

  def create_equip_ability_window
    @equip_ability_window = Foo::Ability::Window_EquipAbility.new(@stand_ability_window)
    @equip_ability_window.set_handler(:ok, method(:process_equip_ability_ok))
    @equip_ability_window.set_handler(:cancel, method(:process_equip_ability_cancel))
    @equip_ability_window.set_handler(:extra, method(:process_equip_ability_remove))
    @equip_ability_window.set_handler(:xstatus, method(:process_equip_ability_xstatus))
    @equip_ability_window.actor = @actor
    @equip_ability_window.help_window = @help_window
  end

  def create_stand_ability_window
    @stand_ability_window = Foo::Ability::Window_StandAbility.new
    @stand_ability_window.set_handler(:ok, method(:process_stand_ability_ok))
    @stand_ability_window.set_handler(:cancel, method(:process_stand_ability_cancel))
    @stand_ability_window.set_handler(:xstatus, method(:process_stand_ability_xstatus))
    @stand_ability_window.actor = @actor
    @stand_ability_window.help_window = @help_window
  end

  def create_ability_xstatus_window
    @xstatus_ability_window = Window_AbilityXStatus.new
  end

  def process_stand_ability_xstatus
    if @xstatus_ability_window.visible
      @xstatus_ability_window.hide
      @ability_type_window.show
      @equip_ability_window.show
      @stand_ability_window.show
      @stand_ability_window.cursor_fix = false
    else
      ax = $data_skills[@stand_ability_window.command_name(@stand_ability_window.index)]
      if ax != nil
        ax = ax.data_ex[:passive_armors][0]
        @xstatus_ability_window.show
        @ability_type_window.hide
        @equip_ability_window.hide
        @stand_ability_window.hide
        @stand_ability_window.cursor_fix = true
        @xstatus_ability_window.item=$data_armors[ax]
      end
    end
  end

  def process_equip_ability_xstatus
    if @xstatus_ability_window.visible
      @xstatus_ability_window.hide
      @ability_type_window.show
      @equip_ability_window.show
      @stand_ability_window.show
      @equip_ability_window.cursor_fix = false
    else
      ax = $data_skills[@equip_ability_window.command_name(@equip_ability_window.index)]
      if ax != nil
        ax = ax.data_ex[:passive_armors][0]
        @xstatus_ability_window.show
        @ability_type_window.hide
        @equip_ability_window.hide
        @stand_ability_window.hide
        @equip_ability_window.cursor_fix = true
        @xstatus_ability_window.item=$data_armors[ax]
      end
    end
  end
end