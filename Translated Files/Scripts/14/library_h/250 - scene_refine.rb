module LibraryH
  CALL_COMMAND_NAME = "Scene Recollection"
end

class Window_TitleCommand < Window_Command
  #--------------------------------------------------------------------------
  # ● コマンドリストの作成
  #--------------------------------------------------------------------------
  def make_command_list
    add_command(Vocab.new_game, :new_game)
    add_command(Vocab.continue, :continue, continue_enabled)
    add_command(SaveData::AutoCommandName, :auto_continue, auto_continue_enabled)
    add_command(LibraryH::CALL_COMMAND_NAME, :call_library_h, call_library_h_enable?)
    add_command(Vocab.shutdown, :shutdown)
  end

  def call_library_h_enable?
    DataManager.save_file_exists?
  end
end
