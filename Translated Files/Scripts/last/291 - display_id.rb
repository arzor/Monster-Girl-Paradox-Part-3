module NWConst::LibraryManager
  def get_valid_objects(objects)
    objects.compact.reject(&:lib_exclude?).sort_by(&:sort_obj).map(&:id)
  end

  def get_valid_actors
    get_valid_objects $data_actors
  end

  def get_valid_enemies
    get_valid_objects $data_enemies
  end

  def get_valid_weapons
    get_valid_objects $data_weapons
  end

  def get_valid_armors
    get_valid_objects($data_armors.compact.reject(&:is_accessory?))
  end

  def get_valid_accessories
    get_valid_objects($data_armors.compact.select(&:is_accessory?))
  end

  def get_valid_items
    get_valid_objects $data_items.compact.reject(&:enchant_stone?)
  end

  def get_valid_stones
    get_valid_objects $data_items.compact.select(&:enchant_stone?)
  end

  def get_valid_jobs
    get_valid_objects $data_classes.compact.select(&:job?)
  end

  def get_valid_tribes
    get_valid_objects $data_classes.compact.select(&:tribe?)
  end
end

def sort_plus(klass)
  return unless klass.method_defined?(:make_item_list)
  return if klass.method_defined?(:sort_item_list)

  klass.instance_eval do
    send :alias_method, :__make_item_list, :make_item_list
    define_method(:sort_item_list) do
      @data.sort_by! { |item| item ? item.sort_obj : [Float::INFINITY, Float::INFINITY, Float::INFINITY, Float::INFINITY] }
    end
    define_method(:make_item_list) do
      __make_item_list
      sort_item_list
    end
  end
end

Window_Base.subclasses_deep.each do |klass|
  sort_plus(klass)
end
