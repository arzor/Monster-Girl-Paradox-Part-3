class PartyForm
  class Scene_PartyForm < Scene_File
    def create_savefile_windows
      @savefile_windows = Array.new(item_max) do |i|
        Window_PartyForm.new(savefile_height, i)
      end
      @savefile_windows.each { |window| window.viewport = @savefile_viewport }
    end

    def item_max
      3
    end
  end
end
