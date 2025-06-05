# =Foo_公開スクリプトコマンド
#
#
#
#
# ==更新履歴
#   Date     Version Author Comment
# ==15/09/03 2.0.2   トリス 統合J～U J O Q
# ==17/05/16 2.0.4   トリス 統合V～W V W
#

#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  include NWConst::LibraryManager
  include NWConst::PartyManager
  #--------------------------------------------------------------------------
  # ● 現在行動者にスキル割り込み
  #--------------------------------------------------------------------------
  def interrupt_skill(skill_id, symbol = :interrupt)
    battler = $game_actors[v(NWConst::Var::ACTION_USER)]
    return if !$game_party.in_battle || $data_skills[skill_id].nil? || battler.nil?

    BattleManager.skill_interrupt(battler, skill_id, symbol)
  end

  #--------------------------------------------------------------------------
  # ● 選択肢呼び出し
  #--------------------------------------------------------------------------
  def unlimited_choices(var_id, names)
    return if names.empty? || var_id <= 0

    names.each { |name| $game_message.choices.push(name.to_s) }
    $game_message.choice_cancel_type = names.size + 1
    $game_message.choice_proc = proc { |n| $game_variables[var_id] = n }
    Fiber.yield while $game_message.choice?
  end

  #--------------------------------------------------------------------------
  # ● 強制的にボートに乗る
  #--------------------------------------------------------------------------
  def forced_get_on_boat
    $game_player.forced_get_on_vehicle(:boat)
  end

  #--------------------------------------------------------------------------
  # ● 強制的に大型船に乗る
  #--------------------------------------------------------------------------
  def forced_get_on_ship
    $game_player.forced_get_on_vehicle(:ship)
  end

  #--------------------------------------------------------------------------
  # ● 強制的に飛行船に乗る
  #--------------------------------------------------------------------------
  def forced_get_on_airship
    $game_player.forced_get_on_vehicle(:airship)
  end

  #--------------------------------------------------------------------------
  # ● 強制的に乗り物から降りる
  #--------------------------------------------------------------------------
  def forced_get_off_vehicle
    $game_player.forced_get_off_vehicle
  end

  #--------------------------------------------------------------------------
  # ● スキル名を表示する
  #--------------------------------------------------------------------------
  def display_skill_name(text)
    $game_party.display_skill_name = text
  end

  #--------------------------------------------------------------------------
  # ● スキル名を非表示にする
  #--------------------------------------------------------------------------
  def clear_skill_name
    $game_party.display_skill_name = nil
  end

  #--------------------------------------------------------------------------
  # ● キーを入力する
  #--------------------------------------------------------------------------
  def input_keys(duration)
    $game_temp.keys_stack = []
    duration.times do
      Fiber.yield
      if Input.trigger?(:UP)
        $game_temp.keys_stack.push(:U)
      elsif Input.trigger?(:DOWN)
        $game_temp.keys_stack.push(:D)
      elsif Input.trigger?(:LEFT)
        $game_temp.keys_stack.push(:L)
      elsif Input.trigger?(:RIGHT)
        $game_temp.keys_stack.push(:R)
      elsif Input.trigger?(:A)
        $game_temp.keys_stack.push(:B1)
      elsif Input.trigger?(:B)
        $game_temp.keys_stack.push(:B2)
      elsif Input.trigger?(:C)
        $game_temp.keys_stack.push(:B3)
      elsif Input.trigger?(:X)
        $game_temp.keys_stack.push(:B4)
      elsif Input.trigger?(:Y)
        $game_temp.keys_stack.push(:B5)
      elsif Input.trigger?(:Z)
        $game_temp.keys_stack.push(:B6)
      elsif Input.trigger?(:L)
        $game_temp.keys_stack.push(:B7)
      elsif Input.trigger?(:R)
        $game_temp.keys_stack.push(:B8)
      end
    end
  end

  #--------------------------------------------------------------------------
  # ● 入力キースタックの取得
  #--------------------------------------------------------------------------
  def keys_stack
    $game_temp.keys_stack
  end

  #--------------------------------------------------------------------------
  # ● 解錠レベルの取得
  #--------------------------------------------------------------------------
  def unlock_level
    $game_party.unlock_level
  end

  def set_actors(*args)
    $game_party.set_actors(args)
  end

  #--------------------------------------------------------------------------
  # ● 一時メンバーのセット
  #--------------------------------------------------------------------------
  def set_temp_actors(*args)
    args.each { |i| $game_actors[i].recover_all if $game_actors.exist?(i) }
    $game_party.set_temp_actors(args)
  end

  def add_temp_actors(*args)
    args.each { |i| $game_actors[i].recover_all if $game_actors.exist?(i) }
    $game_party.add_temp_actors(args)
  end

  def remove_temp_actors(*args)
    $game_party.remove_temp_actors(args)
  end

  #--------------------------------------------------------------------------
  # ● 一時メンバーの解放
  #--------------------------------------------------------------------------
  def release_temp_actors
    $game_party.release_temp_actors
  end

  #--------------------------------------------------------------------------
  # ● 拡張アクター加入
  #--------------------------------------------------------------------------
  def add_actor_ex(actor_id)
    $game_party.persona_change(actor_id)
    return if $game_party.exist_party_actor_id?(actor_id)

    $game_actors[actor_id].recover_all if $game_actors.exist?(actor_id)
    if $game_party.party_member_full?
      $game_message.add("The party is full.")
      $game_message.add("Who will you remove from the party?")
      stand_actor = $game_party.choice_stand_actor_on_member_full(actor_id, nil)
      move_stand_actor(stand_actor.id) if stand_actor
    end
    $game_party.add_actor(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● 拡張アクター移動
  #--------------------------------------------------------------------------
  def move_actor_ex(actor_id)
    if $game_party.party_member_full?
      $game_message.add("The party is full.")
      $game_message.add("Who will you remove from the party?")
      stand_actor = $game_party.choice_stand_actor_on_member_full(actor_id, nil)
      move_stand_actor(stand_actor.id) if stand_actor
      return unless stand_actor
    end

    move_actor(actor_id)
  end

  def add_actor_ex_nc(actor_id)
    $game_party.persona_change(actor_id)
    return if $game_party.exist_party_actor_id?(actor_id)

    $game_actors[actor_id].recover_all if $game_actors.exist?(actor_id)
    $game_party.add_actor(actor_id)
  end

  def keep_all_item
    $game_party.items.reject(&:key_item?).each do |item|
      $game_party.item_keep(item, NWConst::Storehouse::MAX_ITEM_NUMBER)
      $game_party.lose_item(item, NWConst::Storehouse::MAX_ITEM_NUMBER, false, true)
    end
  end

  def keep_all_equip
    $game_party.equip_items.each do |item|
      $game_party.item_keep(item, NWConst::Storehouse::MAX_ITEM_NUMBER)
      $game_party.lose_item(item, NWConst::Storehouse::MAX_ITEM_NUMBER, false, true)
    end
  end

  def keep_all_item_over?
    ($game_party.equip_items + $game_party.items.reject(&:key_item?)).any? do |item|
      $game_party.item_number(item) + $game_party.storehouse_item_number(item) > NWConst::Storehouse::MAX_ITEM_NUMBER
    end
  end

  def keep_all_normal_equip
    $game_party.equip_items.reject(&:enchant_item?).each do |item|
      $game_party.item_keep(item, NWConst::Storehouse::MAX_ITEM_NUMBER)
      $game_party.lose_item(item, NWConst::Storehouse::MAX_ITEM_NUMBER, false, true)
    end
  end

  def keep_all_enchant_equip
    $game_party.equip_items.select(&:enchant_item?).each do |item|
      $game_party.item_keep(item, NWConst::Storehouse::MAX_ITEM_NUMBER)
      $game_party.lose_item(item, NWConst::Storehouse::MAX_ITEM_NUMBER, false, true)
    end
  end

  def take_all_item
    $game_party.storehouse_all_items.each do |item|
      $game_party.item_keep(item, -NWConst::Storehouse::MAX_ITEM_NUMBER)
    end
  end

  def take_all_enchant_equip
    $game_party.storehouse_equip_items.select(&:enchant_item?).each do |item|
      $game_party.item_keep(item, -NWConst::Storehouse::MAX_ITEM_NUMBER)
    end
  end

  def take_all_normal_equip
    $game_party.storehouse_equip_items.reject(&:enchant_item?).each do |item|
      $game_party.item_keep(item, -NWConst::Storehouse::MAX_ITEM_NUMBER)
    end
  end

  def force_change_equip(actor_id, slot_id, equip_type, item_id)
    return if slot_id == 6 && !$game_switches[NWConst::Sw::EXTRA_ACCESSORY_SLOT]

    items = case equip_type
            when 1
              $data_weapons
            when 2
              $data_armors
            end
    $game_party.gain_item(items[item_id], 1)
    return unless (1..6).include?(slot_id) && (1..2).include?(equip_type)

    $game_actors[actor_id].change_equip(slot_id - 1, items[item_id])
  end

  def erase_background
    return unless $game_party.in_novel

    SceneManager.scene.erase_background
  end

  #--------------------------------------------------------------------------
  # ● ルカ以外を城待機に
  #--------------------------------------------------------------------------
  def move_stand_actors_except_luca
    party_members.each do |actor|
      move_stand_actor(actor.id) unless actor.luca?
    end
  end

  #--------------------------------------------------------------------------
  # ● パーティに指定のアクターがいる場合ラベルにジャンプ
  #--------------------------------------------------------------------------
  def actor_label_jump
    labels = $game_party.all_members.collect { |actor| actor.id.to_s }
    index = []
    @list.each_with_index do |command, i|
      next unless command.code == 118 && labels.include?(command.parameters[0])

      index.push(i)
    end
    return if index.empty?

    @index = index.sample
  end

  #--------------------------------------------------------------------------
  # ● 指定のエネミーの友好度変化
  #--------------------------------------------------------------------------
  def change_friend(value)
    return unless $data_enemies[$game_variables[51]]
    return if value == 0

    enemy = $data_enemies[$game_variables[51]]
    se = RPG::SE.new(value > 0 ? "Raise3" : "Down3", 100, 100)
    text = format("%s's Affinity went %s%d!", enemy.name, 0 < value ? "up by " : "down by ", value.abs,)
    enemy.friend += value
    se.play
    $game_message.add(text)
    wait_for_message
  end

  def change_friend_n(value)
    return unless $data_enemies[$game_variables[51]]

    enemy = $data_enemies[$game_variables[51]]
    enemy.friend += value
  end

  #--------------------------------------------------------------------------
  # ● 職業（種族）レベルの変更
  #--------------------------------------------------------------------------
  def set_class_level(actor_id, class_id, level, show = false, change = false)
    return unless $game_actors.exist?(actor_id)

    actor = $game_actors[actor_id]
    f = actor.equip_fixed?
    actor.equip_fix_flag = true
    kind = NWConst::Class::JOB_RANGE.include?(class_id) ? :class : :tribe
    temp_class_id = kind == :class ? actor.class_id : actor.tribe_id
    tab = Marshal.load(Marshal.dump(actor.equip_abilities))
    actor.change_class(class_id, kind)
    actor.change_level(level, show, kind) if level > actor.level[kind]
    unless change
      actor.change_class(temp_class_id, kind)
      actor.equip_abilities = tab
    end
    actor.equip_fix_flag = f
    actor.refresh
  end

  def level_round_down(level)
    $game_party.level_round_down(level)
  end

  #--------------------------------------------------------------------------
  # ● アクターID:Nが職業ID:Mだったならば
  #--------------------------------------------------------------------------
  def actor_class?(actor_id, class_id)
    return false unless $game_actors.exist?(actor_id)

    actor = $game_actors[actor_id]
    [actor.class_id, actor.tribe_id].include?(class_id)
  end

  #--------------------------------------------------------------------------
  # ● アクターID:Nの職業ID:MがL以上だったならば
  #--------------------------------------------------------------------------
  def actor_class_level_over?(actor_id, class_id, level)
    return false unless $game_actors.exist?(actor_id)

    actor = $game_actors[actor_id]
    return false if actor.level_list[class_id].nil?

    level <= actor.level_list[class_id]
  end

  #--------------------------------------------------------------------------
  # ● パーティ編成画面の呼び出し
  #--------------------------------------------------------------------------
  def call_party_edit
    # 隊列集合
    $game_player.followers.gather
    Fiber.yield until $game_player.followers.gather?
    # ルカの戦闘不能の解除
    $game_actors[NWConst::Actor::LUCA].remove_state(1)
    SceneManager.call(Scene_PartyEdit)
    Fiber.yield
  end

  #--------------------------------------------------------------------------
  # ● バトラー画像非表示オン
  #--------------------------------------------------------------------------
  def battler_graphic_hide
    $game_temp.battler_graphic_hide = true
  end

  #--------------------------------------------------------------------------
  # ● バトラー画像非表示オフ
  #--------------------------------------------------------------------------
  def battler_graphic_show
    $game_temp.battler_graphic_hide = false
  end

  #--------------------------------------------------------------------------
  # ● 指定アクターの経験値増加
  #--------------------------------------------------------------------------
  def gain_actor_exp(actor_id, kind, n, rate, show = true)
    actor = $game_actors[actor_id]
    case kind
    when :base
      now  = actor.base_exp
      plus = n
      plus = (n * actor.final_exp_rate).ceil if rate
    when :class
      now  = actor.class_exp
      plus = n
      plus = (n * actor.final_cexp_rate).ceil if rate
    when :tribe
      now  = actor.tribe_exp
      plus = n
      plus = (n * actor.final_cexp_rate).ceil if rate
    end
    actor.change_exp(now + plus, show, kind)
  end

  #--------------------------------------------------------------------------
  # ○ ピクチャが存在するかどうか（暗号化アーカイブ内は無視）をスイッチに代入
  #--------------------------------------------------------------------------
  def check_picture_exist(filename, switch_id)
    path = "Graphics/Pictures/#{filename}"
    result = File.exist?(path)
    $game_switches[switch_id] = result
    result
  end

  #--------------------------------------------------------------------------
  # ○ マップ指定エンカウント禁止
  #--------------------------------------------------------------------------
  def no_enemy_map_on(*map_ids)
    $game_system.no_enemy_map_on(*map_ids)
  end

  def no_enemy_map_off(*map_ids)
    $game_system.no_enemy_map_off(*map_ids)
  end

  def no_enemy_map_clear
    $game_system.no_enemy_map_clear
  end

  def no_enemy_map_show
    $game_system.no_enemy_map_show
  end

  #--------------------------------------------------------------------------
  # ○ 「全戦闘メンバーが、指定カテゴリーを1つ以上持っている」かをスイッチに代入
  #--------------------------------------------------------------------------
  def check_party_category(switch_id, *categories)
    result = $game_party.battle_members.all? do |actor|
      actor.is_include_categories?(*categories.map(&:to_sym))
    end
    $game_switches[switch_id] = result
    result
  end

  #--------------------------------------------------------------------------
  # ○ 「全メンバーが、指定カテゴリーを1つ以上持っている」かをスイッチに代入
  #--------------------------------------------------------------------------
  def check_all_party_category(switch_id, *categories)
    result = $game_party.all_members.all? do |actor|
      actor.is_include_categories?(*categories.map(&:to_sym))
    end
    $game_switches[switch_id] = result
    result
  end

  #--------------------------------------------------------------------------
  # ● 職業（種族）を忘れる
  #--------------------------------------------------------------------------
  def erase_class_level(actor_id, class_id)
    return unless $game_actors.exist?(actor_id)

    $game_actors[actor_id].erase_class(class_id)
  end

  def actor_skill_have?(actor_id, skill_id)
    skill = $data_skills[skill_id]
    return false if skill.nil?
    return false unless $game_actors.exist?(actor_id)

    $game_actors[actor_id].skill_learn?(skill) || $game_actors[actor_id].all_abilities.include?(skill_id)
  end

  def actor_set_ability?(actor_id, skill_id)
    skill = $data_skills[skill_id]
    return false if skill.nil?
    return false unless $game_actors.exist?(actor_id)

    $game_actors[actor_id].all_equip_abilities.include?(skill_id)
  end

  def all_members_add_state(state_id)
    $game_party.all_members.each do |actor|
      actor.add_state(state_id)
    end
  end

  def clear_actor_ex(actor_id)
    return unless $game_actors.exist?(actor_id)

    change_id = $game_actors[actor_id].id
    $game_actors[actor_id].clear_equipments
    $game_actors[actor_id].clear
    $game_actors[actor_id].persona_change(change_id)
  end

  def reset_actor(actor_id)
    return unless $game_actors.exist?(actor_id)

    oid = $game_actors.original_id(actor_id)
    $game_actors[oid].reset(actor_id)
  end

  def gain_party_exp(exp, show = false)
    $game_party.all_members.each do |actor|
      actor.change_exp(actor.base_exp + exp, show, :base)
    end
  end

  def gain_party_class_exp(exp, show = false)
    $game_party.all_members.each do |actor|
      actor.change_exp(actor.class_exp + exp, show, :class)
    end
  end

  def gain_party_tribe_exp(exp, show = false)
    $game_party.all_members.each do |actor|
      actor.change_exp(actor.tribe_exp + exp, show, :tribe)
    end
  end

  def gain_party_friend(love)
    $game_party.all_members.each do |actor|
      actor.love = actor.love + love
    end
  end

  def reset_selfswitch_map(*map_ids)
    $game_self_switches.delete(map_ids)
  end

  def sell_item(item)
    $game_party.lose_item(item, 1)
    $game_party.gain_gold(item.price / 2)
  end

  def sell_enchant_weapons
    sell_items = $game_party.enchant_weapons.reject { |item| $game_party.favorite_item?(item) }
    sell_items.each do |item|
      sell_item(item)
    end
  end

  def sell_enchant_armors
    sell_items = $game_party.enchant_armors.reject { |item| $game_party.favorite_item?(item) }
    sell_items.each do |item|
      sell_item(item)
    end
  end

  def delete_actor_ex(actor_id)
    $game_party.remove_actor(actor_id)
  end

  def actor_copy(copy_id, paste_id)
    $game_actors[copy_id].copy_all(paste_id)
  end

  def actor_equip_lock(actor_id)
    $game_actors[actor_id].equip_fix_flag = true
  end

  def actor_equip_unlock(actor_id)
    $game_actors[actor_id].equip_fix_flag = false
  end

  def change_region(map_id, bregion, aregion)
    $game_system.encount_region[map_id, bregion] = aregion
  end

  def start_multiparty(*arg)
    $game_party.start_multiparty(*arg.each_slice(4).to_a)
  end

  def end_multiparty
    $game_party.end_multiparty
  end

  def edit_multiparty(party_size = 3, member_size = 8)
    SceneManager.call(Scene_MultiPartyEdit)
    SceneManager.scene.prepare(party_size, member_size)
    Fiber.yield
  end

  def edit_multiparty_cancel?
    $game_party.multi_party_canceled
  end

  def exist_party?(map_id, x, y, dir = 0)
    $game_party.exist_multiparties(map_id, x, y, dir)
  end

  def all_member_set_actor_had
    set_actor_had(*$game_party.include_actors.to_a)
  end

  def move_party(party_id, map_id, x, y, dir = 0)
    return unless $game_party.multi_party?

    if $game_party.multi_party.id == party_id - 1
      $game_player.reserve_transfer(map_id, x, y, dir)

      return
    end

    $game_party.multi_party.setup(party_id - 1, [map_id, x, y, dir])
    $game_party.multi_party.refresh_characters
  end

  def exist_party_in_map?(party_id, map_id)
    return unless $game_party.multi_party?

    $game_party.multi_party.exist_in_map?(party_id - 1, map_id)
  end

  def set_title_bg(file_name)
    $game_temp.title_bg = file_name
  end

  def set_title_bgm(file_name)
    $game_temp.title_bgm = file_name
  end

  def set_airship_bgm(file_name)
    $game_map.airship.bgm = RPG::BGM.new(file_name)
  end

  def change_actor_equip_stone(actor_id, equip_slot_id, *stone_ids)
    return if equip_slot_id == 5 && !$game_switches[NWConst::Sw::EXTRA_ACCESSORY_SLOT]

    stone_ids.each_with_index do |stone_id, stone_slot_id|
      stone = $data_items[stone_id]
      equip = $game_actors[actor_id].base_equips[equip_slot_id]
      $game_party.gain_item(stone, 1)
      next unless equip

      equip.change_stone(stone_slot_id, stone)
    end
  end

  def change_actor_ability(actor_id, *ability_ids)
    actor = $game_actors[actor_id]
    actor.remove_ability_all
    actor.add_ability(*ability_ids)
  end

  def all_member_remove_equip(type, id, count = nil)
    container = Container.get(type)
    return unless container

    Array(id).each do |item_id|
      i = 0
      data = nil
      item = container[item_id]
      case item
      when RPG::Item
        data ||= $game_party.enchant_weapons { |e| e } +
                 $game_party.enchant_armors { |e| e } +
                 $game_party.socket_weapons { |e| e } +
                 $game_party.socket_armors { |e| e }
        data.each do |equip|
          slot_id = equip.stones.index(item)
          next unless slot_id

          equip.change_stone(slot_id, nil)
          $game_party.restore_socket_item(equip)
          i += 1
          return if count && i >= count

          redo
        end
      else
        $game_actors.each do |actor|
          next if count && i >= count

          if actor.remove_equip(item)
            i += 1
            redo
          end
        end
      end
    end
  end

  def play_base_bgm
    bgm = $game_system.base_bgm.object
    bgm.play if bgm
  end

  def level_adjust(actor_id, level = nil)
    return unless $game_actors.exist?(actor_id)

    level ||= $game_actors[NWConst::Actor::LUCA].base_level
    actor = $game_actors[actor_id]
    return if actor.base_level >= level

    actor.change_level(level, false, :base)
  end

  def add_encounter_airship(map_id, troop_id, encount_step)
    $game_system.encount_region.add_encounter_airship(map_id, troop_id, encount_step)
    $game_player.make_encounter_count if $game_player.in_airship?
  end

  def delete_encounter_airship(map_id, troop_id = nil)
    $game_system.encount_region.delete_encounter_airship(map_id)
    $game_player.make_encounter_count if $game_player.in_airship?
  end

  def refresh_ability; end

  def storehouse_has_item?(type, item_id)
    $game_party.storehouse_has_item?(Container.item(type, item_id))
  end

  def storehouse_gain_item(type, item_id, amount)
    $game_party.storehouse_gain_item(Container.item(type, item_id), amount)
  end

  def storehouse_take_items(type, item_ids)
    Array(item_ids).each do |id|
      item = Container.item(type, id)
      num = $game_party.storehouse_item_number(item)
      $game_party.gain_item(item, num)
      $game_party.storehouse_gain_item(item, -NWConst::Storehouse::MAX_ITEM_NUMBER)
    end
  end

  def storehouse_get_item_number(type, item_id, var_id)
    $game_variables[var_id] = $game_party.storehouse_item_number(Container.item(type, item_id))
  end

  def shop_item_add(type, item_id, price, condition_text = "true")
    $game_system.temp_add_shop_items.push([type, item_id, price, condition_text])
  end

  def clear_actor_equip(actor_id)
    $game_actors[actor_id].clear_equipments
  end

  def clear_stone_no_actor_equip
    no_actor_equip_items = $game_party.uniq_items { |e| e.item_number + e.storehouse_item_number > 0 }
    no_actor_equip_items.each do |e|
      e.clear_stones
      $game_party.restore_socket_item(e)
    end
  end

  def setup_enchant_shop(shop_id)
    $game_system.enchant_shop_id = shop_id
  end

  def delete_enchant_shop(shop_id)
    $game_party.delete_shop_enchant_item(shop_id)
  end
end
