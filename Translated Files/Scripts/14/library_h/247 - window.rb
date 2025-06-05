module LibraryH
  class Window_MainCommand < Window_Vertical_Command
    def initialize
      super(0, 0)
      @page = 0
      self.arrows_visible = false
    end

    def make_command_list
      Manager.h_scene_items.each.with_index do |item, index|
        next if item.hide?

        if item.show?
          add_command(item.name, index, true, item)
        else
          add_command("???", index, false, nil)
        end
      end
    end

    def item
      current_ext
    end

    def window_height
      Graphics.height - 56
    end

    def window_width
      Graphics.width
    end

    def update_help
      @help_window.page_index = current_page
      @help_window.page_max = page_max
    end

    def current_page
      index / page_item_max + 1
    end

    def page_max
      item_max / page_item_max + 1
    end

    def ensure_cursor_visible
      move_page
    end

    def move_page
      return if @page == current_page
      @page = current_page
      self.top_col = col.odd? ? col - 1 : col
    end
  end

  class Window_SubCommand < Window_Command
    def initialize
      super(0, 0)
      hide
    end

    def window_width
      Graphics.width / 2
    end

    def refresh
      super
      move((Graphics.width / 2) - (window_width / 2), (Graphics.height / 2) - (window_height / 2), window_width, window_height)
    end

    # @param charactor [Charactor]
    def charactor=(charactor)
      @charactor = charactor
      refresh
    end

    def make_command_list
      return unless @charactor

      add_command("View CG", :cg, @charactor.cgs.enable?, @charactor.cgs)
      @charactor.items.each.with_index do |item, index|
        if item.show?
          add_command(item.name, index, true, item)
        else
          add_command("???", index, false)
        end
      end
      self.height = window_height
    end
  end
end
