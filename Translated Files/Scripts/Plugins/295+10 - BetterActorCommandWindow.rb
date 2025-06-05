#========================================#
# Better Actor Command Window v1.1       |
# By JoSmiHnTh                           |
#========================================#

NAME_TO_ICON = {'Attack' => 11, 'Sword' => 463, 'Katana' => 922, 'Spear' => 836,
                'Axe' => 972, 'Scythe' => 1182, 'Gun' => 1576, 'Unarmed' => 182,
                'Black Magic' => 206, 'Time Magic' => 208, 'Holy' => 171, 'Dark' => 177,
                'Piracy' => 221, 'EX-Item' => 2999, 'Singing' => 184, 'Talk' => 4,
                'Medicine' => 228, 'Heroism' => 215, 'Demon Arts' => 205, 'Special' => 300,
                'Wait' => 62, 'Defend' => 2270, 'Item' => 2675, 'Service' => 225,
                'Beast' => 3842, 'Wing' => 3761, 'Nature' => 157, 'Breath' => 144,
                'White Magic' => 207, 'Ninjutsu' => 1482, 'Dancing' => 176, 'Dagger' => 306,
                'Throwing' => 1485, 'Club' => 1056, 'Thievery' => 3009, 'Bow' => 1345,
                'Tentacle' => 3974, 'Corpse' => 1, 'Whip' => 1462, 'Multiweapon' => 476,
                'Rapier' => 697, 'Summoning' => 209, 'Alchemy' => 3574, 'Grimoire' => 183,
                'Magic Science' => 223, 'Makina' => 4066, 'Artificial' => 3829, 'Sorcery' => 210,
                'Slime' => 174, 'Flail' => 1505, 'Giant' => 287, 'Sexcraft' => 188,
                'Ocean' => 155, 'Spellblade' => 181, 'Oracle' => 220, 'Psychic' => 180,
                'Taoism' => 233, 'Justice' => 227, 'Mercantile' => 3444, 'Cooking' => 224,
                'Ruling' => 226, 'Snake' => 3973, 'Insect' => 3975, 'Plant' => 3355,
                'Struggle' => 32, 'Fan' => 1540}

module NWConst::Config
  CONTENTS.insert(-3, { :key => :actor_command, :name => "Actor Command Window", :sub => true,
                        :help => "[Мod]Change actor command window style. \r\n←/→ Select"})

  DATA[:actor_command] = [0, 1, 2, 3, 4]
  DATA_TEXT[:actor_command] = {0 => { :name => "4x1 (Classic)", :help => "Displays 4 items per page." },
                               1 => { :name => "4x2 (Standard)", :help => "Displays 8 items per page." },
                               2 => { :name => "3x3 (Modern)", :help => "Displays 9 items per page." },
                               3 => { :name => "4x3 (Compact)", :help => "Displays 12 items per page." },
                               4 => { :name => "4x6 (Iconic)", :help => "Displays 24 items per page." }}
  DEFAULT[:actor_command] = 3

end

class Window_ActorCommand < Window_Command

  alias original_initialize :initialize
  def initialize
    original_initialize
    @previous_time = Time.now
    @icon_page = 0
  end

  alias original_update :update
  def update
    original_update

    if [0, 4].include?($game_system.conf[:actor_command]) && cursor_movable?

      unless Time.now - @previous_time >= 0.5
        return
      end

      @previous_time = Time.now
      weapon_stype = @list.each_with_index.select { |stype, i| stype[:ext] == 64}

      unless weapon_stype.empty?
        redraw_item(weapon_stype[0][1])
      end

    end

  end

  def col_max

    case $game_system.conf[:actor_command]
    when 0
      1
    when 1
      2
    when 2, 3
      3
    else
      6
    end

  end

  def spacing

    case $game_system.conf[:actor_command]
    when 0, 1
      4
    else
      2
    end

  end

  alias original_item_height :item_height
  def item_height

    case $game_system.conf[:actor_command]
    when 0, 1, 3
      original_item_height
    when 2
      32
    else
      24
    end

  end

  def alignment
    1
  end

  alias original_item_rect_for_text :item_rect_for_text
  def item_rect_for_text(index)

    case $game_system.conf[:actor_command]
    when 0
      rect = item_rect(index)
      rect.x -= 8
      rect.width += 16
      rect

    when 1, 2, 3
      rect = item_rect(index)
      rect.x -= 2
      rect.width += 4
      rect

    else
      rect = item_rect(index)
      rect.x += 2
      rect.width -= 4
      rect
    end

  end

  def draw_icon_flipped(icon_index, x, y, enabled = true)
    bitmap = Cache.system("Iconset")
    rect = Rect.new((icon_index % 16 * 24) + 24, icon_index / 16 * 24, -24, 24)
    contents.blt(x, y, bitmap, rect, enabled ? 255 : translucent_alpha)
  end

  def draw_actor_weapons(rect)
    item_icons = []
    @actor.equips.each do |e|
      next if e.nil?

      added_skills = e.features.each.select { |f| f.code == 43}
      unless added_skills.empty?
        item_icons.push(e.icon_index)
      end

    end

    case item_icons.length
    when 1
      draw_icon(item_icons[0], rect.x, rect.y)

    when 2
      offset = (rect.width / 2) - 12
      draw_icon(item_icons[0], rect.x - offset, rect.y)
      draw_icon_flipped(item_icons[1], rect.x + offset, rect.y)

    else

      if @icon_page == item_icons.length - 1
        @icon_page = 1
      else
        @icon_page += 1
      end

      offset = (rect.width / 2) - 12

      if @icon_page == 1
        draw_icon(item_icons[0], rect.x - offset, rect.y)
        draw_icon_flipped(item_icons[1], rect.x + offset, rect.y)

      else
        draw_icon(item_icons[@icon_page], rect.x, rect.y)

      end

    end

  end

  alias original_draw_item :draw_item
  def draw_item(index)

    case $game_system.conf[:actor_command]
    when 0
      original_draw_item(index)
      rect = item_rect_for_text(index)
      name = command_name(index)

      if NAME_TO_ICON.include?(name)
        draw_icon(NAME_TO_ICON[name], rect.x + 10, rect.y)

      elsif name == 'Weapon'
        icon_rect = Rect.new(rect.x + 12, rect.y, 24, 24)
        draw_actor_weapons(icon_rect)

      end

    when 1
      original_draw_item(index)

    when 2
      cflag = @actor.chain_input? ? @actor.next_chain_action? && command_ext(index) : !@actor.skill_type_id_chain(command_ext(index)).empty?
      color = cflag ? tp_gauge_color2 : normal_color

      change_color(color, command_enabled?(index))

      rect = item_rect_for_text(index)
      contents.font.size = 18

      lines = command_name(index).gsub('Multiweapon', 'Multi Weapon').split(" ")
      if lines.length > 1
        rect.y -= 7

        lines.each do |line|
          draw_text(rect, line, alignment)
          rect.y += 15
        end

      else
        draw_text(rect, lines[0], alignment)
      end

    when 3
      cflag = @actor.chain_input? ? @actor.next_chain_action? && command_ext(index) : !@actor.skill_type_id_chain(command_ext(index)).empty?
      color = cflag ? tp_gauge_color2 : normal_color

      change_color(color, command_enabled?(index))

      rect = item_rect_for_text(index)
      contents.font.size = 18

      lines = command_name(index).gsub('Multiweapon', 'Multi Weapon').split(" ")
      if lines.length > 1
        line = "#{lines[0]} #{lines[1][0]}."
        draw_text(rect, line, alignment)

      else
        draw_text(rect, lines[0], alignment)
      end

    else
      rect = item_rect_for_text(index)
      name = command_name(index)

      if NAME_TO_ICON.include?(name)
        draw_icon(NAME_TO_ICON[name], rect.x, rect.y)

      elsif name == 'Weapon'
        draw_actor_weapons(rect)

      else
        original_draw_item(index)

      end

    end

  end

end

