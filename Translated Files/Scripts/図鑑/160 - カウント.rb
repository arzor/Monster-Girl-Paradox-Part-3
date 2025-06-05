=begin
=図鑑/カウント




==更新履歴
  Date     Version Author Comment
==15/09/03 2.0.2   トリス 統合J～U N
==17/09/21 2.2.0   ひまわり　統合3 特徴追加による変更

=end

#==============================================================================
# ■ BattleManager
#==============================================================================
class << BattleManager
  #--------------------------------------------------------------------------
  # ○ 勝利の処理
  #--------------------------------------------------------------------------
  alias nw_count_process_victory process_victory
  def process_victory
    tmp = []
    $game_troop.members.each {|enemy|tmp.push(enemy.id) if enemy}
    $game_library.enemy.set_had(tmp) 
    $game_library.unlock_lib_enemy
    nw_count_process_victory
  end
  #--------------------------------------------------------------------------
  # ○ 中断の処理
  #--------------------------------------------------------------------------
  alias nw_count_process_abort process_abort
  def process_abort
    $game_library.enemy.set_discovery($game_troop.members.compact.map(&:id))
    if !$game_temp.event_abort && !$game_troop.members.compact.any?(&:escape_not_count?) && !$game_troop.challenge_battle?
      $game_library.count_up_party_escape
    end
    nw_count_process_abort
  end
  #--------------------------------------------------------------------------
  # ○ 敗北の処理
  #--------------------------------------------------------------------------
  alias nw_count_process_defeat process_defeat
  def process_defeat
    tmp = []
    $game_troop.members.each {|enemy| tmp.push(enemy.id) if enemy}
    tmp.uniq.each{|id| $game_library.count_up_enemy_victory(id)}
    $game_library.enemy.set_discovery(tmp)
    if enable_party_lose_count?
      $game_library.count_up_party_lose
      $game_system.party_lose_count += 1
    end
    nw_count_process_defeat
  end
  #--------------------------------------------------------------------------
  # ○ 戦闘終了
  #--------------------------------------------------------------------------
  alias nw_count_battle_end battle_end
  def battle_end(result)
    $game_system.battle_count += 1
    $game_library.count_up_party_battle
    $game_party.battle_members.each{|m|
      $game_library.count_up_actor_battle(m.id)
    }
    nw_count_battle_end(result)
  end
end

#==============================================================================
# ■ Game_Enemy
#==============================================================================
class Game_Enemy < Game_Battler
  #--------------------------------------------------------------------------
  # ● スキル／アイテムの使用
  #--------------------------------------------------------------------------
  # aliasを使うと冗長になるのでこのままでいいか
  def use_item(item)
    super
    $game_library.count_up_skill_use(self.id, item.id)
  end
end

#==============================================================================
# ■ Game_Party
#==============================================================================
class Game_Party < Game_Unit
  #--------------------------------------------------------------------------
  # ○ アクターを加える
  #--------------------------------------------------------------------------
  alias nw_count_add_stand_actor add_stand_actor
  def add_stand_actor(actor_id)
    nw_count_add_stand_actor(actor_id)
    nw_count_setup_actor(actor_id)
  end

  def nw_count_setup_actor(actor_id)
    $game_library.actor.set_had(actor_id)
    $game_library.unlock_lib_actor
    $game_actors[actor_id].equips.each do |item|
      next unless item
      $game_library.get_item(item)
      item.stones.each do |stone|
        $game_library.get_item(stone)
      end
    end
  end

  alias nw_count_set_temp_actors set_temp_actors
  def set_temp_actors(ary)
    nw_count_set_temp_actors(ary)
    all_members.each{ |actor| nw_count_setup_actor(actor.id) }
  end

  alias nw_count_add_temp_actors add_temp_actors
  def add_temp_actors(ary)
    nw_count_add_temp_actors(ary)
    ary.each{ |actor_id| nw_count_setup_actor(actor_id) }
  end

  #--------------------------------------------------------------------------
  # ○ 初期パーティのセットアップ
  #--------------------------------------------------------------------------
  alias nw_count_setup_starting_members setup_starting_members
  def setup_starting_members
    nw_count_setup_starting_members
    all_members.each{ |actor| nw_count_setup_actor(actor.id) }
  end
  #--------------------------------------------------------------------------
  # ○ アイテムの増加（減少）
  #--------------------------------------------------------------------------
  alias nw_count_gain_item gain_item
  def gain_item(item, amount, include_equip = false ,keep_flag = false)
    nw_count_gain_item(item, amount, include_equip, keep_flag)
    $game_library.get_item(item) if amount > 0
  end
end

#==============================================================================
# ■ Window_ShopBuy
#==============================================================================
class Window_ShopBuy < Window_Selectable
  #--------------------------------------------------------------------------
  # ○ アイテムリストの作成
  #--------------------------------------------------------------------------
  alias nw_count_make_item_list make_item_list
  def make_item_list
    nw_count_make_item_list
    @data.each { |item|
      if item.is_a?(RPG::Weapon) && !$game_library.weapon.discovery?(item.id)
        $game_library.weapon.set_discovery(item.id)
      elsif item.is_a?(RPG::Armor) && !item.is_accessory? && !$game_library.armor.discovery?(item.id)
        $game_library.armor.set_discovery(item.id)
      elsif item.is_a?(RPG::Armor) && item.is_accessory? && !$game_library.accessory.discovery?(item.id)
        $game_library.accessory.set_discovery(item.id)
      elsif item.is_a?(RPG::Item) && !$game_library.item.discovery?(item.id)
        $game_library.item.set_discovery(item.id)
      end
    }
  end
end

#==============================================================================
# ■ Foo::JobChange::Window_ClassName
#==============================================================================
class Foo::JobChange::Window_ClassName < Window_Command
  #--------------------------------------------------------------------------
  # ○ コマンドリストの作成（オーバーライド）
  #--------------------------------------------------------------------------
  alias nw_count_make_command_list make_command_list
  def make_command_list
    nw_count_make_command_list
    return unless @actor_id != -1 && @class_type_id != -1
    self.class_id.select{|id| class_change_enable?(id)}.each{|id|
      $game_library.check_open_class(id) if NWConst::Class::JOB_RANGE.include?(id)
      $game_library.check_open_tribe(id) if NWConst::Class::TRIBE_RANGE.include?(id)
    }
  end
end

#==============================================================================
# ■ Window_SynthesizeLineUp
#==============================================================================
class Window_SynthesizeLineUp < Window_Selectable
  #--------------------------------------------------------------------------
  # ○ アイテムリストの作成
  #--------------------------------------------------------------------------
  alias nw_count_make_item_list make_item_list
  def make_item_list
    nw_count_make_item_list
    @data.each { |item|
      if item.is_a?(RPG::Weapon) && !$game_library.weapon.discovery?(item.id)
        $game_library.weapon.set_discovery(item.id)
      elsif item.is_a?(RPG::Armor) && !item.is_accessory? && !$game_library.armor.discovery?(item.id)
        $game_library.armor.set_discovery(item.id)
      elsif item.is_a?(RPG::Armor) && item.is_accessory? && !$game_library.accessory.discovery?(item.id)
        $game_library.accessory.set_discovery(item.id)
      elsif item.is_a?(RPG::Item) && !$game_library.item.discovery?(item.id)
        $game_library.item.set_discovery(item.id)
      end
    }
  end
end

#==============================================================================
# ■ Scene_JobChange
#==============================================================================
class Scene_JobChange
  #--------------------------------------------------------------------------
  # ○ 選択クラスの決定
  #--------------------------------------------------------------------------
  alias nw_count_process_class_ok process_class_ok
  def process_class_ok
    nw_count_process_class_ok
    if @change_class_type_id == 0
      $game_library.count_up_party_class_change
    elsif @change_class_type_id == 1
      $game_library.count_up_party_tribe_change
    end
  end
end

#==============================================================================
# ■ Scene_Shop
#==============================================================================
class Scene_Shop < Scene_MenuBase
  #--------------------------------------------------------------------------
  # ○ 購入の実行
  #--------------------------------------------------------------------------
  alias nw_count_do_buy do_buy
  def do_buy(number)
    nw_count_do_buy(number)
    $game_library.addition_purchase_gold(number * buying_price)
  end
end

#==============================================================================
# ■ Scene_Synthesize
#==============================================================================
class Scene_Synthesize < Scene_MenuBase
  #--------------------------------------------------------------------------
  # ○ 確認：決定
  #--------------------------------------------------------------------------  
  alias nw_count_confirm_ok confirm_ok
  def confirm_ok
    nw_count_confirm_ok
    $game_library.count_up_party_synthesize
  end
end

#==============================================================================
# ■ Scene_Battle
#==============================================================================
class Scene_Battle < Scene_Base
  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの効果を適用
  #--------------------------------------------------------------------------
  alias nw_count_apply_item_effects apply_item_effects
  def apply_item_effects(target, item, opt = nil)
    opt ||= {}
    nw_count_apply_item_effects(target, item, opt)
    count_up_defeat(@subject, target, item)
  end
  #--------------------------------------------------------------------------
  # ● 撃破に関するカウントアップ処理
  #--------------------------------------------------------------------------
  def count_up_defeat(subject, target, item)
    return unless target.result.death_state_added?
    
    if NWConst::Elem.pleasure?(subject.item_final_elements(item))
      target.result.death_pleasure_state_added?
      $game_library.count_up_actor_carry(subject.id) if subject.actor?
      $game_library.count_up_actor_orgasm(target.id) if target.actor?
      $game_library.count_up_enemy_orgasm(target.id) if target.enemy?
      $game_library.count_up_friendly_orgasm if subject.actor? && target.luca?
    else
      $game_library.count_up_actor_defeat(subject.id) if subject.actor? && target.enemy?
      $game_library.count_up_actor_down(target.id) if target.actor?
      $game_library.count_up_enemy_down(target.id) if target.enemy?
    end
  end
end

#==============================================================================
# ■ Scene_Novel
#==============================================================================
class Scene_Novel < Scene_Base
  #--------------------------------------------------------------------------
  # ○ 終了処理
  #--------------------------------------------------------------------------
  alias nw_count_terminate terminate
  def terminate
    $game_library.count_up_lose_event($game_novel.event_id)
    nw_count_terminate
  end
end

class Game_Battler < Game_BattlerBase  
  #--------------------------------------------------------------------------
  # ○ ダメージ計算
  #--------------------------------------------------------------------------
	alias hima_count_make_damage_value make_damage_value
  def make_damage_value(user, item, opt = {})
		hima_count_make_damage_value(user, item, opt)
		if user.actor? && self.enemy? && item.damage.to_hp?
			$game_library.set_party_damage_record_actor(@result.hp_damage) 
		elsif user.enemy? && self.actor? && item.damage.to_hp?
			$game_library.set_party_damage_record_enemy(@result.hp_damage) 
		end
  end
end






