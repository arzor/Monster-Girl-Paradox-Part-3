# =変数拡張
#
# ==更新履歴
#   Date     Version Author Comment
# ==15/09/03 2.0.2   トリス 統合J～U M T


#==============================================================================
# ■ Game_Temp
#==============================================================================
class Game_Temp
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :action_user
  attr_accessor :action_target
  attr_accessor :action_hit
  attr_accessor :used_skill
  attr_accessor :getup_enemy
  attr_accessor :lose_event_id
  attr_accessor :lose_event_enemy_id
  #--------------------------------------------------------------------------
  # ● 戦闘用一時変数の初期化
  #--------------------------------------------------------------------------
  def battle_init
    @action_user   = nil
    @action_target = nil
    @used_skill    = nil
    @getup_enemy   = nil
    @action_hit    = false
  end
end

#==============================================================================
# ■ Game_Switches
#==============================================================================
class Game_Switches
  include NWConst::Sw
  #--------------------------------------------------------------------------
  # ○ スイッチの取得
  #--------------------------------------------------------------------------
  alias nw_array_get []
  def [](switch_id)
    case switch_id
    when CUT_PREDATION
      return $game_system.conf[:ls_predation]
    when ADD_ACTOR_RANGE
      return $game_party.exist_all_persona_id?(switch_id - ADD_ACTOR_BASE)
    when CONFIG_DUNGEON_NAVI
      return $game_system.conf[:sw_dungeon_navigate]
    when CONFIG_AUTO_UNEQUIP_ACTOR
      return $game_system.conf[:sw_auto_unequip_actor]
    end
    nw_array_get(switch_id)
  end

  alias nw_array_set []=
  def []=(switch_id, value)
    if $game_map.sw_auto_bgm? && NWConst::Field::SW_BGM[$game_map.map_id].keys.include?(switch_id) && nw_array_get(switch_id) != value
      $game_map.need_refresh_autoplay_field = true
    end
    case switch_id
    when ENCHANT_OFF
      nw_array_set(switch_id, value)
      $game_party.enchant_unequip if value
    when ADD_ACTOR_RANGE
      actor_switch_set(switch_id, value)
    when NWConst::Sw::AWAKEN_ID..(NWConst::Sw::AWAKEN_ID + $data_actors.size)
      nw_array_set(switch_id, value)
      if $game_actors.exist?(switch_id - NWConst::Sw::AWAKEN_ID)
        $game_actors[switch_id - NWConst::Sw::AWAKEN_ID].refresh
      end
    when NWConst::Sw::EXTRA_ACCESSORY_SLOT
      return if nw_array_get(switch_id) == value
      nw_array_set(switch_id, value)
      $game_actors.each(&:change_slot)
    when CONFIG_DUNGEON_NAVI
      $game_system.conf[:sw_dungeon_navigate] = value
      return
    when CONFIG_AUTO_UNEQUIP_ACTOR
      $game_system.conf[:sw_auto_unequip_actor] = value
      return
    else
      nw_array_set(switch_id, value)
    end
  end
end

#==============================================================================
# ■ Game_Variables
#==============================================================================
class Game_Variables
  include NWConst::Var
  #--------------------------------------------------------------------------
  # ○ 変数の設定
  #--------------------------------------------------------------------------
  alias nw_array_set []=
  def []=(variable_id, value)
    variable_id = common_variable_id(variable_id)
    case variable_id
    when (ENEMY_REL_BASE...(ENEMY_REL_BASE + [$data_enemies.size, 1001].min))
      # ※[$data_enemies.size, 1001].min 最高で1001 → 2000...3001 ＝ 2000～3000
      # 友好度制限0～100
      value = [[value, 0].max, 100].min
    when (ACTOR_REL_BASE...(ACTOR_REL_BASE + $data_actors.size))
      $game_global_system.actor_love[variable_id - ACTOR_REL_BASE] = value
    end
    nw_array_set(variable_id, value)
  end
  #--------------------------------------------------------------------------
  # ○ 変数の取得
  #--------------------------------------------------------------------------
  alias nw_array_get []
  def [](variable_id)
    variable_id = common_variable_id(variable_id)
    case variable_id
    when ACTION_USER
      return $game_temp.action_user ? $game_temp.action_user.id : 0
    when ACTION_TARGET
      return $game_temp.action_target ? $game_temp.action_target.id : 0
    when STEPS
      return $game_party.steps
    when GOLD
      return $game_party.gold
    when USED_SKILL_ID
      return $game_temp.used_skill ? $game_temp.used_skill.id : 0
    when ACTION_HIT
      return $game_temp.action_hit ? 1 : 0
    when ACTION_TARGET_FRIEND
      return $game_temp.action_target && $game_temp.action_target.enemy? ? $game_temp.action_target.friend : 0
    when GET_UP
      return $game_temp.getup_enemy ? $game_temp.getup_enemy : 0
    when ACTION_USER_LEVEL
      return $game_temp.action_user && $game_temp.action_user.actor? ? $game_temp.action_user.base_level : 0
    when ACTION_TARGET_LEVEL
      return $game_temp.action_target && $game_temp.action_target.enemy? ? $game_temp.action_target.escape_level : 0
    when LOSE_EVENT_ENEMY_ID
      return $game_temp.lose_event_enemy_id
    when COIN
      return $game_party.coin
    when (ACTOR_REL_BASE...(ACTOR_REL_BASE + 1000))
      return $game_global_system.actor_love[variable_id - ACTOR_REL_BASE]
    when ENCHANT_WEAPON_ITEM_NUMBER
      return $game_party.enchant_weapons{ |e| e }.size
    when ENCHANT_ARMOR_ITEM_NUMBER
      return $game_party.enchant_armors{ |e| e }.size
    when LIBRARY_BGM_ID
      return $game_system.base_bgm.index || 0
    end
    nw_array_get(variable_id)
  end

  #--------------------------------------------------------------------------
  # ○ 共有変数IDの変換
  #--------------------------------------------------------------------------
  def common_variable_id(variable_id)
    NWConst::Var::COMMON_VARIABLE.each do |data|
      return data.min if data.include?(variable_id)
    end
    variable_id
  end
end
