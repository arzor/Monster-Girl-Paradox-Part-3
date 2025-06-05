class AbilityForm
  attr_reader :last_save_index

  def initialize
    @data = {}
    @last_save_index = 0
  end

  def save(index, abilities)
    @data[index] = Marshal.dump(abilities.select { |k, _v| NWConst::Ability::ABILITY_SKILL_TYPE.include?(k) })
    @last_save_index = index
  end

  def load(index)
    return nil unless @data[index]

    Marshal.load(@data[index])
  end

  def exist?(index)
    !@data[index].nil?
  end
end
