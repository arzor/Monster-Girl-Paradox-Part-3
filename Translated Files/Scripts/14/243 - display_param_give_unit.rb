class Bitmap
  def drawable_digit(width)
    h = [font, width]
    self.cache_digit ||= {}
    return cache_digit[h] if cache_digit[h]

    i = 1
    loop do
      if text_size(i).width * 0.6 >= width
        self.cache_digit[h] = i.digit - 1
        break
      end

      i *= 10
    end
    cache_digit[h]
  end

  def cache_digit
    self.class.cache_digit
  end

  def cache_digit=(other)
    self.class.cache_digit = other
  end
  class << self
    attr_accessor :cache_digit
  end
end

class Font
  def hash
    name.hash ^ size.hash
  end

  def eql?(other)
    self.class == other.class && name == other.name && size == other.size
  end
end
