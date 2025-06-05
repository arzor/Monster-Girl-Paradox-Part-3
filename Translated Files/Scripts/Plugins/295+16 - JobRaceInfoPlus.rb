# encoding: UTF-8
#===============================================================================
# Job/Race Info+
#
# Adds two new pages to the Library, which allow one to view the full learnsets
# for any jobs and races the player has unlocked.
#
# Plug-in by steveju
# Fixed by JoSmiHnTh, Dotsharkteeth
#===============================================================================

module NWConst::Config
  CONTENTS.insert(-3, {:key => :mod_library_traits, :name => "Expanded Library", :sub => true,
                       :help => "[Mod]Enable/Disable additional Character/Job/Race pages.\r\n←/→ Select"})

  DATA[:mod_library_traits] = [0, 1]
  DATA_TEXT[:mod_library_traits] = {0 => {:name => "Off", :help => "Disable expanded library features."},
                                    1 => {:name => "On", :help => "Enable expanded library features."}}

  DEFAULT[:mod_library_traits] = 0

end

module NWConst::Library
  INDEX_STRING[:lib_class_mod] = "Job Info+"
  INDEX_STRING[:lib_tribe_mod] = "Race Info+"
end

class Window_Library_MainCommand < Window_Command

  alias jobraceinfo_make_command_list make_command_list
  def make_command_list
    jobraceinfo_make_command_list
    if $game_system.conf[:mod_library_traits] == 1 && (!@category || !(@category >= 1 && @category <= 9))
      # delete last close command
      @list.pop()
      add_command(INDEX_STRING[:lib_class_mod], :lib_class_mod, !$game_party.temp_actors_use?, [11, 110000])
      add_command(INDEX_STRING[:lib_tribe_mod], :lib_tribe_mod, !$game_party.temp_actors_use?, [12, 120000])
      make_close_command
    end
  end
end

class Scene_Library < Scene_MenuBase

  alias jobraceinfo_create_left_column_window create_left_column_window
  def create_left_column_window
    jobraceinfo_create_left_column_window
    if $game_system.conf[:mod_library_traits] == 1
      @main_command_window.set_handler(:lib_class_mod,  method(:on_class_mod_index)) 
      @main_command_window.set_handler(:lib_tribe_mod,  method(:on_tribe_mod_index))
    end
  end

  def on_class_mod_index
    $game_temp.lib_class_type_id = 2
    SceneManager.call(Scene_JobShow)
  end
  def on_tribe_mod_index
    $game_temp.lib_class_type_id = 3
    SceneManager.call(Scene_JobShow)
  end
end

class Scene_JobShow < Scene_JobChange

  include ShowKey_HelpWindow

  #--------------------------------------------------------------------------
  # ● 全ウィンドウの作成
  #--------------------------------------------------------------------------

  def create_all_window
    @change_class_type_id = $game_temp.lib_class_type_id
    @change_class_type_id -= 2 if @change_class_type_id > 1
    create_help_window
    create_class_status_window
    create_class_name_window
    create_class_type_window
    create_result_popup_window

    class_type_name = ["Job", "Race", "Job", "Race"].at($game_temp.lib_class_type_id)
    unless $game_temp.lib_class_type_id > 1
      @help_window.text = "#{class_type_name} Info (Unlock Percentage Not Available)"
    else
      @help_window.text = "#{class_type_name} Learnable Skills/Abilities"
    end

    @class_status_window.show.activate
    @class_status_window.actor_id = @change_class_actor_id
    @class_status_window.original_class_id = $game_temp.lib_class_type_id
    @class_type_window.show.activate
    @class_type_window.class_type_id = @change_class_type_id
    @class_type_window.refresh
    @class_type_window.select(0)
    @class_name_window.show.activate
    @class_name_window.class_type_id = @change_class_type_id
    @class_name_window.actor_id = @change_class_actor_id
    @class_name_window.refresh
    @class_name_window.select(0)
  end

  alias jobraceinfo_create_class_name_window create_class_name_window

  def create_class_name_window
    jobraceinfo_create_class_name_window
    @class_name_window.set_handler(:ok, @class_status_window.method(:next_page))
  end

  alias jobraceinfo_show_key_text show_key_text
  def show_key_text
    if $game_temp.lib_class_type_id > 1
      if @class_status_window.max_page > 1
        return "#{Vocab.key_c}:Next Page (#{@class_status_window.page}/#{@class_status_window.max_page})" 
      else
        return ""
      end
    end
    return jobraceinfo_show_key_text
  end

end

class Foo::JobChange::Window_ClassStatus < Window_Base

  attr_writer :original_class_id

  def initialize
    super(160, fitting_height(1) * 2, Graphics.width - 160, Graphics.height - fitting_height(1) * 2)
    @actor_id = -1
    @class_id = -1
    @original_class_id = -1
    @page = 1
    @max_page = 2
    hide.deactivate
  end

  def max_page
    return @max_page
  end
  
  def page
    return @page
  end

  def next_page
    if @max_page > 1
      Sound.play_ok

      @page += 1
      @page = 1 if @page > @max_page

      refresh
    end
  end

  alias jobraceinfo_draw_status draw_status
  def draw_status
    unless @original_class_id > 1
      jobraceinfo_draw_status
      return
    end

    draw_skill_list
  end

  def draw_skill_list
    desc = []
    temp_desc = []
    items_per_page = 15.0
    $data_classes[@class_id].learnings.each_with_index  do |learn, i|
      if !temp_desc[learn.level]
        temp_desc[learn.level] = []
      end

      if $data_skills[learn.skill_id].name.include?("***ダミー".force_encoding('UTF-8').encode)
        temp_desc[learn.level].push("(SEALED)")
      else
        temp_desc[learn.level].push("\\*\\i[#{$data_skills[learn.skill_id].icon_index}]#{$data_skills[learn.skill_id].name}")
      end
    end
    
    temp_desc.each_with_index do |d,i| 
      unless d.nil? || d.empty?
        desc.push("Lv.#{i} " + d[0])
        if d.size > 1
          n = 1
          until n == d.size
            desc.push(i>9 ? " "*12+d[n] : " "*10+d[n])
            n += 1
          end
        end
      end
    end
    if desc.empty?
      desc.push("None")
    else
      desc = desc.flatten
    end
    @max_page = (desc.size / items_per_page).ceil
    @page = 1 if @page > @max_page
    desc = desc[(@page - 1) * items_per_page, items_per_page]
    rect = standard_rect(0, desc.size)
    r = Rect.new(rect.x, rect.y, rect.width, line_height)

    desc.each do |text|
      draw_text_job_desc(r, text, 24)
      r.y += line_height
    end
  end
end

class Foo::JobChange::LibWindow_ClassName < Foo::JobChange::Window_ClassName
  def process_ok
    if $game_temp.lib_class_type_id > 1 && current_item_enabled?
      Input.update
      call_ok_handler
    end
  end
end

