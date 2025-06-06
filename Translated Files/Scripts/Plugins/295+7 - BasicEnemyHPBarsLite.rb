#--# Basic Enemy HP Bars Lite v 1.1c
#
# Adds options for hp/mp bars, enemy name, state icons, and even targetting icon
#  to appear over the enemy in battle.
#
# Usage: Plug and play, customize as needed.
#       New Notetag: <BOSS> determines if enemy is a boss or not.
#                    <HIDE NAME> name displays as ???
#
#------#
#-- Script by: V.M of D.T
#
#- Questions or comments can be:
#    posted on the thread for the script
#    given by email: sumptuaryspade@live.ca
#    provided on facebook: http://www.facebook.com/DaimoniousTailsGames
#   All my other scripts and projects can be found here: http://daimonioustails.weebly.com/
#
#--- Free to use in any project, commercial or non-commercial, with credit given
#--Though a donation's always a nice way to say thank you~ (I also accept actual thank you's)

module NWConst::Config
  CONTENTS.insert(-3, {:key => :mod_hpgauge, :name => "Enemy HP Gauge", :sub => true,
                       :help => "[Моd]Change display setting for enemy HP gauges.\r\n←/→ Select"})

  DATA[:mod_hpgauge] = [0, 1]
  DATA_TEXT[:mod_hpgauge] = {0 => {:name => "Off", :help => "Do not display enemy HP gauges."},
                             1 => {:name => "On", :help => "Display HP gauges above enemy sprites."}}

  DEFAULT[:mod_hpgauge] = 0

end

module DTP_HP
  #Whether to include the hp bar or not
  USE_HP_BAR = true
  #Whether to include an mp bar or not
  USE_MP_BAR = false
  #Whether or not to include state icons
  USE_STATES = true
  #Whether to display enemy name or not
  USE_TEXT = false
  #Display HP numbers
  USE_HP_TEXT = false
  #Icon to be displayed over current target, set to 0 to disable
  DISPLAY_ICON = 0

  #Display hp bar above the enemy, false for below
  ABOVE_MONSTER = true
  #Offset the hp bar along the x-axis(left,right)
  BAR_OFFSET_X = 0
  #Offset the hp bar along the y-axis(up,down)
  BAR_OFFSET_Y = 0

  #First color for the mp bar gradient
  MP_COLOR_BAR_1 = Color.new(0,175,255)
  #Second color fot the mp bar gradient
  MP_COLOR_BAR_2 = Color.new(0,0,255)

  #Show bars only when specific actor in party. Array format. Example: [8,7]
  #Set to [] to not use actor only
  SPECIFIC_ACTOR = []
  #Show enemy hp bar only if certain state is applied (like a scan state)
  #Set to 0 to not use state only
  SCAN_STATE = 0
  #Enemies will show hp bar as long as they have been affected by scan state
  #at least once before
  SCAN_ONCE = false
  #Hp bars will only show when you are targetting a monster
  ONLY_ON_TARGET = false
end

class Sprite_Battler
  alias hpbar_update update
  alias hpbar_dispose dispose
  def update
    hpbar_update
    return unless @battler.is_a?(Game_Enemy)
    if @battler
      update_hp_bar
    end
  end
  def update_hp_bar
    setup_bar if @hp_bar.nil?
    if $game_temp.battler_graphic_hide != true
      determine_visible
    else
      @hp_bar.visible = false
    end
    return unless @hp_bar.visible
    @hp_bar.update
    if @hp_bar.contents_opacity != self.opacity
      @hp_bar.contents_opacity = self.opacity
    end
    @hp_bar.y = self.y + DTP_HP::BAR_OFFSET_Y - self.height - @hp_bar.height
    @hp_bar.y = self.y + DTP_HP::BAR_OFFSET_Y unless $game_system.conf[:mod_hpgauge] == 1 || $game_system.conf[:mod_hpgauge] == 3
    @hp_bar.y = 0 if @hp_bar.y < 0
    @hp_bar.y = 290 if @hp_bar.y > 290
    @hp_bar.y = -12 if @battler.boss?
    @hp_bar.contents.clear
    width = @hp_bar.contents.width - @hp_bar.padding
    hp_width = @battler.hp_rate
    yy = 0
    if DTP_HP::DISPLAY_ICON > 0
      if SceneManager.scene.is_a?(Scene_Battle) &&
        SceneManager.scene.enemy_window &&
        SceneManager.scene.enemy_window.active &&
        SceneManager.scene.target_window_index == @battler.index
        @hp_bar.draw_icon(DTP_HP::DISPLAY_ICON,@hp_bar.contents.width/2,yy)
      end
      yy += 24
    end
    if DTP_HP::USE_TEXT and !@battler.boss?
      if @battler.hide_name
        @hp_bar.draw_text(0,yy,width,24,"???",2)
      else
        @hp_bar.draw_text(0,yy,width,24,@battler.name,2)
      end
      yy += 24
    end
    if $game_system.conf[:mod_hpgauge] != 0 && $game_system.conf[:mod_hpgauge] != nil
      height = @battler.boss? ? 16 : 8
      #      yy -= 12 if !DTP_HP::USE_HP_TEXT
      yy += 12
      if @special
        @hp_bar.draw_enemy_hp(@battler, @hp_bar.padding/2, yy, width, height, $game_system.conf[:mod_hpgauge] != 3 && $game_system.conf[:mod_hpgauge] != 4)
      else
        if $game_system.conf[:mod_hpgauge] != 3 && $game_system.conf[:mod_hpgauge] != 4
          @hp_bar.draw_actor_hp_notext(@battler, @hp_bar.padding/2, yy, width)
        else
          @hp_bar.draw_enemy_hp(@battler, @hp_bar.padding/2, yy, width)
        end
      end
      yy += 12
    end
    if DTP_HP::USE_TEXT and @battler.boss?
      if @battler.hide_name
        @hp_bar.draw_text(0,12,width,24,"???",2)
      else
        @hp_bar.draw_text(0,12,width,24,@battler.name,2)
      end
      if @special
        @hp_bar.change_color(@hp_bar.system_color)
        @hp_bar.draw_text(0,24,width,24,Vocab::hp_a)
        @hp_bar.change_color(@hp_bar.normal_color)
      end
    end
    if DTP_HP::USE_MP_BAR and !@battler.boss?
      mp_width = @battler.mp_rate * width
      @gauge_hp_y_for_nothing_at_all = yy
      @hp_bar.draw_gauge(@hp_bar.padding/2,yy,width,@battler.mp_rate,DTP_HP::MP_COLOR_BAR_1,DTP_HP::MP_COLOR_BAR_2)
      yy += 24
    end
    if DTP_HP::USE_STATES
      #      xx = 29
      #      yy += 18 if @battler.boss?
      #      yy -= 20
      #      draw_actor_icons(@battler, xx, yy,72)
      #      @battler.states.each do |state|
      #        @hp_bar.draw_icon(state.icon_index,xx,yy)
      #        xx += 22
      #      end
    end
  end
  def setup_bar
    @special = Module.const_defined?(:SPECIAL_GAUGES)
    if @battler.boss?
      @hp_bar = Window_Base.new(0,-12,Graphics.width,96)
    else
      height = 36
      height += 24 if DTP_HP::DISPLAY_ICON > 0
      height += 24 if DTP_HP::USE_TEXT
      height += 24 if DTP_HP::USE_HP_BAR
      height += 24 if DTP_HP::USE_MP_BAR
      height += 24 if DTP_HP::USE_STATES
      @hp_bar = Window_Base.new(0,0,124,height)
      @hp_bar.x = self.x - @hp_bar.width / 2 + DTP_HP::BAR_OFFSET_X
      if @battler.lefx != 0 && $game_troop.members.size != 1
        @hp_bar.x = self.x - @hp_bar.width / 2 + DTP_HP::BAR_OFFSET_X + @battler.lefx - 300
      end
      @hp_bar.y = self.y + DTP_HP::BAR_OFFSET_Y - self.height - @hp_bar.height
      @hp_bar.y = self.y + DTP_HP::BAR_OFFSET_Y unless $game_system.conf[:mod_hpgauge] == 1 || $game_system.conf[:mod_hpgauge] == 3
      @hp_bar.x = 0 if @hp_bar.x < 0
      @hp_bar.y = 0 if @hp_bar.y < 0
      @hp_bar.y = 290 if @hp_bar.y > 290
    end
    @hp_bar.opacity = 0
    @hp_bar.z = self.z + 1
    @hp_bar.viewport = self.viewport
  end
  def determine_visible
    if !@battler.alive? && !@battler.hidden?
      if @special
        if @hp_bar.gauges[[@hp_bar.padding/2,@gauge_hp_y_for_nothing_at_all]]
          @hp_bar.visible = false if @hp_bar.gauges[[@hp_bar.padding/2,@gauge_hp_y_for_nothing_at_all]].cur_val == 0
        end
      else
        @hp_bar.visible = false
      end
      if DTP_HP::SCAN_ONCE and DTP_HP::SCAN_STATE == 1
        $game_party.monster_scans[@battler.enemy_id] = true
      end
      return if !@battler.alive?
    end
    @hp_bar.visible = true
    if DTP_HP::SCAN_STATE != 0
      @hp_bar.visible = false
      @hp_bar.visible = true if @battler.state?(DTP_HP::SCAN_STATE)
      if DTP_HP::SCAN_ONCE
        @hp_bar.visible = true if $game_party.monster_scans[@battler.enemy_id] == true
        $game_party.monster_scans[@battler.enemy_id] = true if @hp_bar.visible
      end
    end
    if !DTP_HP::SPECIFIC_ACTOR.empty?
      @hp_bar.visible = false unless DTP_HP::SCAN_STATE != 0
      DTP_HP::SPECIFIC_ACTOR.each do |i|
        next unless $game_party.battle_members.include?($game_actors[i])
        @hp_bar.visible = true
      end
    end
    if DTP_HP::ONLY_ON_TARGET
      return unless SceneManager.scene.is_a?(Scene_Battle)
      return unless SceneManager.scene.enemy_window
      @hp_bar.visible = SceneManager.scene.target_window_index == @battler.index
      @hp_bar.visible = false if !SceneManager.scene.enemy_window.active
    end
  end
  def dispose
    @hp_bar.dispose if @hp_bar
    hpbar_dispose
  end
end

class Window_Base
  def draw_actor_hp_notext(actor, x, y, width = 124)
    if actor.id != 150 && actor.id != 499
      draw_gauge(x, y, width, actor.hp_rate, hp_gauge_color1, hp_gauge_color2)
    else
      draw_gauge(x, y, width, 1, hp_gauge_color1, hp_gauge_color2)
    end
    change_color(system_color)
    draw_text(x, y, 30, line_height, Vocab::hp_a)
    change_color(normal_color)
    draw_actor_icons(actor, x+21, y+22,72)
  end
end

class Scene_Battle
  attr_reader  :enemy_window
  def target_window_index
    begin
      @enemy_window.enemy.index
    rescue
      return -1
    end
  end
end

class Game_Party
  alias hp_bar_init initialize
  attr_accessor  :monster_scans
  def initialize
    hp_bar_init
    @monster_scans = []
  end
end

class Game_Enemy
  def boss?
    self.enemy.note =~ /<BOSS>/
  end
  def lefx
    if self.enemy.note =~ /<SHIFT\s?(\d+)>/i
      return $1.to_i
    else
      return 0
    end
  end
  def hide_name
    self.enemy.note =~ /<HIDE NAME>/
  end
end

def convert_to_short (value)
  result = value
  if value.is_a? Numeric
    value = value / 1.0 #просто чтобы не было неожиданностей
    if value >= 1e6
      i = 0
      value /= 1e6
      while value > 1e3 do
        value /= 1e3
        i+=1
      end

      numsDG = ["МЛН","МЛРД","ТРЛН","КВДР","КВНТ","СКСТ","СПТЛ","ОКТЛ","НОНЛ","ДЦЛН"]
      result = (((value*1e3).round)/1e3).to_s.slice(0,7)
      if i<=numsDG.size-1
        result += numsDG[i]
      else
        i-=numsDG.size.to_f
        i+=1
        enm = ""
        begin
          enm = (97+(i%26-1).round).chr + enm
          i -= i%26
          i /= 26
        end while i>=1
        result += enm
      end
    end
  end
  return result.to_s.strip
end

class Window_Base < Window
  def draw_enemy_hp(actor, x, y, width = 124)
    if actor.id != 150 && actor.id != 499 && actor.mhp != 1
      draw_gauge(x, y, width, actor.hp_rate, hp_gauge_color1, hp_gauge_color2)
      change_color(system_color)
      draw_text(x, y, 30, line_height, Vocab::hp_a)
      draw_current_and_max_values_enemy(x, y, width, actor.hp, actor.mhp, hp_color(actor), normal_color)
      draw_actor_icons(actor, x+21, y+22,72)
    else
      draw_gauge(x, y, width, 1, hp_gauge_color1, hp_gauge_color2)
      change_color(system_color)
      draw_text(x, y, 30, line_height, Vocab::hp_a)
      change_color(normal_color)
      draw_text(x + 64, y, 68, line_height, "???")
      draw_actor_icons(actor, x+21, y+22,72)
    end
  end
  #---тут рисуем состояние группы в главном меню
  def draw_current_and_max_values_enemy(x, y, width, current, max, color1, color2)
    change_color(color1)
    xr = x + width
    draw_text(xr - 65, y, 68, line_height, convert_to_short(current), 2)
  end
end