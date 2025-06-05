#==============================================================================
# ■ Enchant_Item_List
#------------------------------------------------------------------------------
# 　Game_Partyの全アイテムリスト用のクラス
#==============================================================================
class Enchant_Item_List < Array
  alias _i []

  def [](index)
    super(index) || Item_Data.new
  end

  def exist?(item)
    _i(item.index) && _i(item.index).item_object == item
  end

  def add_item(item)
    data = Item_Data.new
    data.item_object = item
    insert(item.index, data)
    compact!
    refresh
    item
  end

  def delete_item(item)
    delete_if { |e| e.item_object == item }
    refresh
  end

  def refresh
    each_with_index { |e, i| e.item_object.id = i }
  end

  def pre_update
    refresh
    each { |e| e.item_object.reset_data }
  end

  def items(&block)
    item_data(&block).map(&:item_object).compact
  end

  def item_data(&block)
    return item_data { |data| data.item_number > 0 } unless block_given?

    select do |data|
      data && block.call(data)
    end
  end

  def storehouse_items
    items { |data| data.storehouse_item_number > 0 }
  end
end

module RPG
  module Uniq_Item
  end
end

module Enchant_Item
  include RPG::Uniq_Item
  attr_accessor :enchants # 付与されたエンチャントID配列
  attr_accessor :params_variance # 分散値から取得した値　パラメータ用
  attr_accessor :rarity_num # レア数値
  attr_accessor :prefix # 接頭
  attr_accessor :enchant_variance_base # エンチャント用分散値
  attr_accessor :enchants_variance # 分散値から取得した数値　エンチャント用
  attr_reader :plus_num # 強化値
  attr_reader :socket_num # 　ソケット数
  attr_accessor :max_sp # 最大SP補正
  attr_reader :feature_data
  attr_reader :set_effects
  attr_reader :params

  def initialize(item)
    super(item)
    @rarity_num = $game_variables[NWConst::Var::ENCHANT_RARELITY_ID]
  end

  #--------------------------------------------------------------------------
  # ● 再設定　ロード時に呼ばれる
  #--------------------------------------------------------------------------
  def reset_data
    set_param_variance unless @params_variance
    set_enchant_variance unless @enchants_variance
    set_data_ex
    set_features
    set_params
    set_bonus_max_sp
    reset_stones
    set_set_effects
  end

  def reset_stones
    ss, over = @stones.partition.with_index { |_s, i| i < @socket_num }
    @stones = ss
    over.each do |s|
      $game_party.gain_item($data_items[s], 1) if s
    end
  end

  def set_data
    set_param_variance
    set_enchant_variance
    set_data_ex
    set_enchants_fast
    set_features
    set_plus_num
    set_params
    set_prefix
    set_socket_num
    set_bonus_max_sp
    set_set_effects
    @stones = [nil] * socket_num
  end

  #--------------------------------------------------------------------------
  # ● 付与されているエンチャントオブジェクトの配列
  #--------------------------------------------------------------------------
  def enchants
    @enchants.map do |id|
      $data_classes[id]
    end
  end

  def feature_objects
    [base_data] + enchants
  end

  def set_features
    @features = feature_objects.map do |obj|
      obj.features.map do |feature|
        calc_feature(feature)
      end
    end.flatten
    setting_feature_data
  end

  def set_set_effects
    @set_effects = enchants.map do |e|
      e.set_effect
    end.compact
  end

  def features
    @features || []
  end

  #--------------------------------------------------------------------------
  # ● dataexを取得
  #--------------------------------------------------------------------------
  def set_data_ex
    @data_ex = {}
  end

  def calc_feature(feature)
    temp = Marshal.load(Marshal.dump(feature))
    temp.value = set_value(temp.value, feature.enchant_id)
    # temp.enchant_id = enchant_id
    temp
  end

  def set_value(data, enchant_id = -1)
    case data
    when Array
      data.map { |d| set_value(d, enchant_id) }
    when Hash
      data.inject({}) do |a, (k, v)|
        a[k] = set_value(v, enchant_id)
        a
      end
    when Enchant_Value
      v = @enchant_variance_base
      @enchants_variance[enchant_id] ||= {}
      @enchants_variance[enchant_id][data.calc_id] ||= {}
      @enchants_variance[enchant_id][data.calc_id][data.variance_id] ||= (100 + (-v..v).to_a.sample) * 0.01
      v = @enchants_variance[enchant_id][data.calc_id][data.variance_id]
      data.calculation(rarity_num.to_f, v)
    else
      data
    end
  end

  def enchantment_data
    enchantment.each do |id, data|
      case id
      when Range
        return data if id.include?(@base_id)
      when Numeric
        return data if id == @base_id
      end
    end
    nil
  end

  def plus_num=(value)
    @plus_num = value
    set_params
  end

  #--------------------------------------------------------------------------
  # ● 表示色
  #--------------------------------------------------------------------------
  def display_color
    e = enchantment_data
    id = e.key?(:display_color) ? e[:display_color] : 0
    NWConst::Enchantment.display_color(id)
  end

  #--------------------------------------------------------------------------
  # ● 接頭無視
  #--------------------------------------------------------------------------
  def not_prefix?
    e = enchantment_data
    e.key?(:not_prefix) ? e[:not_prefix] == 1 : false
  end

  #--------------------------------------------------------------------------
  # ● エンチャントを付与する？
  #--------------------------------------------------------------------------
  def need_enchant?
    false
  end

  #--------------------------------------------------------------------------
  # ● エンチャントが付与された装備かどうか
  #--------------------------------------------------------------------------
  def enchant_item?
    true
  end


  #--------------------------------------------------------------------------
  # ● 強化値を設定
  #--------------------------------------------------------------------------
  def set_plus_num
    @plus_num = NWConst::Enchantment::PLUS_NUM_DATA.select do |k, _v|
                  k.include?(rarity_num)
                end.map { |_k, v| v }.sample.inject([]) { |arr, (key, val)| arr + [key] * val }.sample
  end

  #--------------------------------------------------------------------------
  # ● ソケット数を設定
  #--------------------------------------------------------------------------
  def set_socket_num
    @socket_num = enchantment_data.select do |k, _v|
                    k.is_a?(Range) && k.include?(rarity_num)
                  end.map { |_k, v| v }.sample[:socket].inject([]) { |arr, (key, val)| arr + [key] * val }.sample
  end

  #--------------------------------------------------------------------------
  # ● 分散値を設定
  #--------------------------------------------------------------------------
  def	set_param_variance
    v = NWConst::Enchantment::VARIANCE
    @params_variance = [0] * 8
    @params_variance.map! { |_param| (100 + (-v..v).to_a.sample) * 0.01 }
  end

  def	set_enchant_variance
    v = NWConst::Enchantment::FEATURE_CALCULATION[:variance]
    @enchant_variance_base = v
    @enchants_variance = {}
  end

  #--------------------------------------------------------------------------
  # ● 接頭詞を設定
  #--------------------------------------------------------------------------
  def set_prefix
    prefixs = enchants.map { |e| e.prefix.sample }.compact
    rare_prefix = enchants.map { |e| e.rare_prefix.sample }.compact
    @prefix = rare_prefix.empty? ? prefixs.sample : rare_prefix.sample
    @prefix ||= ""
  end

  #--------------------------------------------------------------------------
  # ● 能力値を設定
  #--------------------------------------------------------------------------
  def set_params
    @params = base_data.params.map.with_index do |param, index|
      n = param.to_f
      r = @rarity_num
      eval(NWConst::Enchantment::BASE_PARAM).ceil * @params_variance[index]
    end.zip(bonus_params).map(&:max).map { |param| (param * get_final_bonus * (1 + 0.2 * plus_num)).to_i }
  end

  #--------------------------------------------------------------------------
  # ● 最終ボーナス
  #--------------------------------------------------------------------------
  def get_final_bonus
    set_value([final_bonus] + enchants.map(&:final_bonus)).max
  end

  #--------------------------------------------------------------------------
  # ● ボーナス能力値
  #--------------------------------------------------------------------------
  def bonus_params
    enchants.inject([0] * 8)  do |data, enchant|
      data.zip(set_value(enchant.bonus_params)).map(&:max)
    end
  end

  #--------------------------------------------------------------------------
  # ● ボーナスspの設定
  #--------------------------------------------------------------------------
  def set_bonus_max_sp
    @max_sp =
      enchants.map do |enchant|
        set_value(enchant.bonus_max_sp)
      end.max
  end

  #--------------------------------------------------------------------------
  # ● 付与されるエンチャントを設定
  #--------------------------------------------------------------------------
  def set_enchants
    @enchants = []
    count = enchantment_data[:enchant_count].to_a.sample
    enchant_data = enchantment_data.select do |k, _v|
      k.is_a?(Range) && k.include?(@rarity_num)
    end.map { |_k, v| v }.sample[:enchants].map do |id|
      NWConst::Enchantment::ENCHANTS[id]
    end.inject({}) do |h, d|
      h.merge(d) do |_key, o, n|
        o + n
      end
    end
    count.times do
      @enchants << set_enchant(enchant_data)
    end
  end

  def set_enchant(enchant_data)
    enchant_data = enchant_data.select { |id, _par| can_enchant?(id, enchant_data) }
    enchant_data.inject([]) { |arr, (key, val)| arr + [key] * val }.sample
  end

  def can_enchant?(id, enchant_data)
    return false if @enchants.include?(id)
    return false if not_enchant_id.include?(id)
    return false if @enchants.any? { |id| $data_classes[id].both_disable.include?(id) }
    return false if @enchants.any? do |id|
                      enchant_data.any? do |key, _value|
                        $data_classes[key].both_disable.include?(id)
                      end
                    end

    true
  end

  def set_enchants_fast
    # 処理軽減用
    @enchants = []
    count = enchantment_data[:enchant_count].to_a.sample
    enchant_data = enchantment_data.select do |k, _v|
      k.is_a?(Range) && k.include?(@rarity_num)
    end.map { |_k, v| v }.sample[:enchants].map do |id|
      NWConst::Enchantment::ENCHANTS[id]
    end.inject({}) do |h, d|
      h.merge(d) do |_key, o, n|
        o + n
      end
    end
    enchant_data.reject! { |id, _par| not_enchant_id.include?(id) }
    set_enchant_fast(enchant_data, count)
  end

  def set_enchant_fast(enchant_data, count)
    return if count == 0
    return if enchant_data.empty?

    enchant_id = enchant_data.inject([]) { |arr, (key, val)| arr + [key] * val }.sample
    add_enchant = $data_classes[enchant_id]
    enchant_data.reject! do |key, _val|
      enchant = $data_classes[key]
      add_enchant.both_disable.include?(key) || enchant.both_disable.include?(enchant_id) || key == enchant_id || (!enchant.rare_prefix.empty? && !add_enchant.rare_prefix.empty?)
    end
    @enchants << enchant_id
    set_enchant_fast(enchant_data, count - 1)
  end

  #--------------------------------------------------------------------------
  # ○ アイテム名(0は非表示)
  #--------------------------------------------------------------------------
  def name
    pre = not_prefix? ? "" : @prefix
    pre + base_data.name + plus_num_to_s
  end

  #--------------------------------------------------------------------------
  # ● 強化値を表示(0は非表示)
  #--------------------------------------------------------------------------
  def plus_num_to_s
    plus_num > 0 ? "+#{plus_num}" : ""
  end

  #--------------------------------------------------------------------------
  # ● 強化値
  #--------------------------------------------------------------------------
  def plus_num
    [@plus_num, plus_num_max].min
  end

  #--------------------------------------------------------------------------
  # ● 強化値の最大値
  #--------------------------------------------------------------------------
  def plus_num_max
    NWConst::Enchantment::MAX_PLUS_NUM
  end
end

class RPG::EnchantWeapon < RPG::Weapon
  include Enchant_Item

  def enchantment
    NWConst::Weapon::ENCAHNT_DATA
  end

  def sort_id
    -@id
  end

  def id
    @id + $data_weapons.size
  end

  def wtype_id
    base_data.wtype_id
  end

  def animation_id
    base_data.animation_id
  end

  #--------------------------------------------------------------------------
  # ● 元装備のデータ取得
  #--------------------------------------------------------------------------
  def base_data
    $data_weapons[@base_id]
  end
end

class RPG::EnchantArmor < RPG::Armor
  include Enchant_Item
  def enchantment
    NWConst::Armor::ENCAHNT_DATA
  end

  def sort_id
    -@id
  end

  def id
    @id + $data_armors.size
  end

  # 単に元のデータを持ってくるだけの物
  def atype_id
    base_data.atype_id
  end

  #--------------------------------------------------------------------------
  # ● 元装備のデータ取得
  #--------------------------------------------------------------------------
  def base_data
    $data_armors[@base_id]
  end
end
