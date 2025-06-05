class PartyForm
  class Window_PartyForm < Window_Base
    attr_reader :selected

    def initialize(height, index)
      super(0, index * height, Graphics.width, height)
      @file_index = index
      refresh
      @selected = false
    end

    def selected=(selected)
      @selected = selected
      update_cursor
    end

    def update_cursor
      if @selected
        cursor_rect.set(0, 0, @name_width + 8, line_height)
      else
        cursor_rect.empty
      end
    end

    def draw_filename(x, y)
      change_color(normal_color)
      name = "Party" + " #{@file_index + 1}"
      draw_text(x, y, 200, line_height, name)
      @name_width = text_size(name).width
    end

    def refresh
      contents.clear
      draw_filename(4, 0)
      draw_party_characters(42, contents.height - line_height - 4)
    end

    def draw_party_characters(x, y)
      members = $game_system.party_form.load(@file_index)
      return unless members

      members.each do |member_id|
        character_name = $game_actors[member_id].character_name
        n = $game_actors[member_id].character_index
        bitmap = Cache.character(character_name)
        sign = character_name[/^[\!\$]./]
        if sign && sign.include?("$")
          cw = bitmap.width / 3
          ch = bitmap.height / 4
        else
          cw = bitmap.width / 12
          ch = bitmap.height / 8
        end
        src_rect = Rect.new((n % 4 * 3 + 1) * cw, (n / 4 * 4) * ch, cw, ch)
        contents.blt(x, y - ch, bitmap, src_rect)
        x += cw
      end
    end
  end
end
