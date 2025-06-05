class String
  def width
    length + chars.reject { |i| i.bytesize == 1 }.length
  end
end

class Array
  def to_nested_hash
    return {} if length == 0

    head, *tail = self
    { head => tail.to_nested_hash }
  end

  def include_any?(array)
    i = 0
    while i < size
      return true if array.include?(self[i])

      i += 1
    end
    false
  end

  def include_all?(array)
    i = 0
    while i < size
      return false unless array.include?(self[i])

      i += 1
    end
    true
  end

  def swap!(a, b)
    self[a], self[b] = self[b], self[a]

    self
  end
end

class Class
  def subclasses_deep
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def subclasses
    ObjectSpace.each_object(Class).select { |klass| klass.superclass == self }
  end
end

class Integer
  UNIT = ["", "万", "億", "兆", "京", "垓", "予", "穣", "溝", "澗", "正", "載", "極", "恒河沙", "阿僧祇", "那由多", "不可思議", "無量大数"]
  def give_unit
    return "0" if zero?

    if unit_over?
      o = (self / (limit_size / 10**4)).give_unit
      u = (self % (limit_size / 10**4))
      u = u.zero? ? "" : u.give_unit
      return o + Integer.units.last + u
    end
    sign = self < 0 ? "-" : ""
    numbers = []
    unit_value = ""
    abs.to_s.each_char { |num| numbers << num }
    numberblocks = numbers.reverse.each_slice(4).to_a
    numberblocks.each_with_index do |block, index|
      str = ""
      block.reverse.each do |num|
        str += num if num != "0" || str != ""
      end
      str += Integer.units[index] if str != ""
      unit_value = str + unit_value
    end
    sign + unit_value
  end

  def give_unit_floor(digit)
    if unit_over?
      return (self / (limit_size / 10**4)).give_unit_floor(digit - Integer.units_last_width) + Integer.units.last
    end

    data = give_unit.scan(/(\d+(?:\W+|$))/).flatten
    digit -= data[0].width
    data.inject do |s, unit|
      digit -= unit.size
      break s if digit <= 0

      s += unit
      s
    end
  end

  def unit_over?
    self >= limit_size
  end

  def limit_size
    10**(Integer.units.size * 4)
  end

  def anybits?(mask)
    self & mask != 0
  end

  def digit
    Math.log10(abs)
  end

  class << self
    def units
      @units ||= UNIT + NWConst::Numeric::ADD_UNIT
    end

    def units_last_width
      @units_last_width ||= units.last.width
    end
  end
end

class Object
  def to_a
    [self]
  end

  def instance_variable_set_in_hash(hash)
    hash.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
    self
  end

  def itself
    self
  end
end

class Hash
  def transform_values
    return to_enum(:transform_values) { size } unless block_given?

    h = {}
    each do |key, value|
      h[key] = yield value
    end
    h
  end

  def dig(key, *rest)
    val = self[key]
    return val if rest.empty? || val.nil?
    raise TypeError, "#{val.class} does not have #dig method" unless val.respond_to? :dig

    val.dig(*rest)
  end

  def deep_merge(other_hash)
    merge(other_hash) do |_key, old_val, new_val|
      if old_val.is_a?(Hash) && new_val.is_a?(Hash)
        old_val.deep_merge(new_val)
      else
        new_val
      end
    end
  end
end

module Comparable
  def clamp(min, max)
    return min if (self <=> min) < 0
    return max if (self <=> max) > 0

    self
  end

  def reverse_clamp(min, max)
    return max if (self <=> min) < 0
    return min if (self <=> max) > 0

    self
  end
end
