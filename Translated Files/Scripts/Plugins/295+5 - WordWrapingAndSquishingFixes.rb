#========================================#
# Word Wrapping and Squishing Fixes v1.0 |
# By JoSmiHnTh                           |
#========================================#

class Window_Message < Window_Base

  alias_method :original_process_normal_character, :process_normal_character
  def process_normal_character(c, pos)
    @reduce_flag = false
    original_process_normal_character(c, pos)
  end

end

class Window_Help < Window_Base

  def refresh
    contents.clear
    counter = -1
    #@lines.size.times {|i|
    @text.lines.each_with_index {|line, index|
      text = reformat_wrapped(line)
      txt_array = text.split("\n")
      if txt_array.size <= 1
        counter += 1
        #draw_line(index)
        draw_line_ex(counter, text)
      else
        txt_array.each{|new_line|
          counter += 1
          draw_line_ex(counter, new_line)
        }
      end
    }
  end

  def draw_line_ex(line_number, text)
    rect = rect = Rect.new(4, 0 + (line_number * line_height), contents.width - 4, line_height)
    contents.clear_rect(rect)
    draw_text_ex(rect.x, rect.y, text)
  end

  def reformat_wrapped(s, width=60)
    lines = []
    line = ""
    s.split(/\s+/).each do |word|
      if line.size + word.size >= width
        lines << line
        line = word
      elsif line.empty?
        line = word
      else
        line << " " << word
      end
    end
    lines << line if line
    return lines.join "\n"
  end
end