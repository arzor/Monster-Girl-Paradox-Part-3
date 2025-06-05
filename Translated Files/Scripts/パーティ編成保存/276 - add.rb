

class PartyForm
  attr_reader :last_save_index
  def initialize
    @data = {}
    @last_save_index = 0
  end

  def save(index, members)
    @data[index] = members
    @last_save_index = index
  end

  def load(index)
    @data[index]
  end
end
