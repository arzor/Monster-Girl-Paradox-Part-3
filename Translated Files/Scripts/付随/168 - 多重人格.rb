=begin
= 基盤システム/多重人格

複数のRPG::Actorクラスを切り替えるアクターを作ります


==更新履歴
  Date     Version Author Comment
==17/05/16 2.0.4   トリス 統合V～W W

=end

#==============================================================================
# ■ Game_Actor
#==============================================================================
class Game_Actor < Game_Battler  
  #--------------------------------------------------------------------------
  # ● 人格の変更
  #--------------------------------------------------------------------------
  def persona_change(persona_id)
    return if $data_actors[persona_id].persona_kind == :none
    @actor_id = persona_id
    init_name
    init_nickname
    init_graphics
    refresh
  end
end


#==============================================================================
# ■ Game_Party
#==============================================================================
# パーティに登録するアクターIDは人格アクターに統一しています
class Game_Party
  #--------------------------------------------------------------------------
  # ● 人格の変更
  #--------------------------------------------------------------------------
  def persona_change(persona_id)
    actor = $data_actors[persona_id]
    return unless actor
    return if actor.persona_kind == :none

    actor_id = actor.original_persona_id
    $game_actors[actor_id].persona_change(persona_id)
    refresh_persona(actor_id, persona_id)
    $game_player.refresh
    $game_map.need_refresh = true
  end
  #--------------------------------------------------------------------------
  # ● 変更した人格アクターがパーティに存在する場合リフレッシュ
  #--------------------------------------------------------------------------
  def refresh_persona(actor_id, persona_id)
    $game_library.actor.set_had(persona_id) 
  end
end

#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ● 人格の変更
  #--------------------------------------------------------------------------
  def persona_change(persona_id)
    $game_party.persona_change(persona_id)
  end
end

