class Scene_Library_H < Scene_MenuBase
  include ShowKey_HelpWindow
  def start
    LibraryH::Manager.load
    super
    create_all_window
    load_scene

    $game_switches[NWConst::Sw::LIBRARY_H_MEMORY] = false
  end

  def show_key_text
    return [ShowKey_Help.lr_scroll] if @main_command_window.active

    []
  end

  def show_key_sprite_window
    @main_command_window
  end

  def load_scene
    data = LibraryH::Manager.return_scene_data
    return unless data

    @main_command_window.select_ext(data[0])
    @main_command_window.deactivate
    main_command_ok
    @sub_command_window.select_ext(data[1])
    LibraryH::Manager.return_scene_data = nil
    LibraryH::Manager.replay_bgm_and_bgs
  end

  def create_all_window
    @main_command_window = LibraryH::Window_MainCommand.new
    @page_window = Window_Page.new
    @page_window.show
    @main_command_window.help_window = @page_window
    @main_command_window.set_handler(:ok, method(:main_command_ok))
    @main_command_window.set_handler(:cancel, method(:main_command_cancel))
    @sub_command_window = LibraryH::Window_SubCommand.new
    @sub_command_window.set_handler(:ok, method(:sub_command_ok))
    @sub_command_window.set_handler(:cancel, method(:sub_command_cancel))
  end

  def item
    @main_command_window.item
  end

  def main_command_ok
    @main_command_window.deactivate
    @sub_command_window.show.activate.select(0)

    @sub_command_window.charactor = @main_command_window.item
  end

  def main_command_cancel
    return_scene
  end

  def sub_command_ok
    ext = @sub_command_window.current_ext
    ext.call(item)
    @sub_command_window.activate
  end

  def sub_command_cancel
    @sub_command_window.deactivate.hide
    @main_command_window.activate
  end
end
