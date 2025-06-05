#===============================#
# Large Numbers Conversion v1.0 |
# By JoSmiHnTh                  |
#===============================#

class Integer
  UNIT = ["Mil.", "Bil.", "Trl.", "Qdr.", "Qnt..", "Sxt.", "Spt.", "Oct.", "N", "D", "U", "Do", "Tre", "Qd", "Qit", "Sx", "Sp", "O", "N", "V"]
  UNIT_LAST_WIDTH = UNIT.last.width
  def give_unit

    if self.abs < 10**6
      return self.to_s
    end

    sign = self < 0 ? "-" : ""

    p = 10**9
    UNIT.each do |u|

      if self.abs <= p
        return sign + ('%.3f' % (self / (p / 10**3.to_f))) + u
      end

      p *= 10**3
    end

  end

  def give_unit_floor(digit)
    give_unit
  end

end