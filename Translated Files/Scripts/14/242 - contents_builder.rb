module Hima
  class ContentsBuilder
    def initialize
      @width = 1
      @height = 1
    end

    def draw_text(*args)
      x, y, width, height = nil
      if args[0].is_a?(Rect)
        x = args[0].x
        y = args[0].y
        width = args[0].width
        height = args[0].height
      else
        x = args[0]
        y = args[1]
        width = args[2]
        height = args[3]
      end
      @height = [y + height, @height].max
      @width = [x + width, @width].max
    end

    def contents
      Bitmap.new(@width, @height)
    end
  end
end
