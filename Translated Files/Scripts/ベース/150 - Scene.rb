class Scene_EquipStoneBase < Scene_MenuBase
  include EquipInfoScene

  include FavoriteItem

  def show_key_text
    result = super
    result += [ShowKey_Help.favorite_mode(favorite_window.favorite_mode)] if enable_change_favorite_mode?
    result += [ShowKey_Help.favorite_item(favorite_window.get_favorite_item_state)] if enable_set_favorite_item?
    result
  end

  def enable_change_favorite_mode?
    @stones_window.active
  end

  def enable_set_favorite_item?
    @stones_window.active
  end

  def off_favorite_mode?
    false
  end
  attr_reader :index

  def favorite_window
    @stones_window
  end

  def start
    super
    create_help_window
    create_socket_viewport
    create_socket_windows
    create_stones_window
    init_selection
  end

  def post_start
    @help_window.refresh
    super
  end

  def socket_window
    @socket_windows[index]
  end

  def create_help_window; end

  def create_socket_viewport
    @socket_viewport = Viewport.new
    @socket_viewport.rect.y = @help_window.height
    @socket_viewport.rect.height -= @help_window.height
  end

  def create_stones_window
    @stones_window = Window_AE_Stone_List.new
    @stones_window.height = @w0.height * (visible_max / 2)
    @stones_help_window = Window_Help.new
    @stones_window.help_window = @stones_help_window
    @stones_window.hide
    @stones_help_window.hide
    @stones_window.set_handler(:cancel, method(:on_stones_cancel))
    @stones_window.set_handler(:ok, method(:on_stones_ok))
  end

  def close_stones_window
    @socket_viewport.rect.y = @help_window.height
    @socket_viewport.rect.height = Graphics.height - @help_window.height
    self.top_index = @top_index
    @stones_help_window.hide
    @stones_window.hide.deactivate
    socket_window.activate
    @help_window.show
  end

  def on_stones_cancel
    close_stones_window
  end

  def on_stones_ok
    Sound.play_equip
    item.change_stone(socket_window.socket_id, @stones_window.item)
    refresh_socket_windows
    close_stones_window
  end

  def item_max
    2
  end

  def visible_max
    4
  end

  def help_item
    nil
  end

  def create_socket_windows
    @socket_windows = []
    item_max.times do |i|
      create_socket_window(i).show.activate.stone = :empty
    end
    @empty_window_flag = @socket_windows.empty?
    i = visible_max - @socket_windows.size
    i.times do
      create_socket_window(@socket_windows.size).stone = nil
    end
    refresh_socket_windows
  end

  def refresh_socket_windows
    @socket_windows.each(&:refresh)
  end

  def create_socket_window(window_id)
    w = instance_variable_get("@w#{window_id}")
    return @socket_windows[window_id] = w if w && !w.disposed?

    height = Graphics.height - @help_window.height
    window = Window_Socket.new(0, 0, Graphics.width, height / visible_max)
    window.y = window.height * window_id
    window.viewport = @socket_viewport
    window.index = window_id
    instance_variable_set("@w#{window_id}", window)
    @socket_windows[window_id] = window
    window.show.activate
    window
  end

  def update
    super
    update_socket_selection
  end

  def on_socket_cancel
    Sound.play_cancel
    return_scene
  end

  def update_socket_selection
    return if @stones_window.active || equip_info_window_visible

    return on_socket_cancel if Input.trigger?(:B)
    return if @empty_window_flag

    return on_socket_ok if Input.trigger?(:C)
    return on_socket_a if Input.trigger?(:A)

    update_cursor
  end

  def update_cursor
    return unless item_max > 1

    last_index = @index
    cursor_down(Input.trigger?(:DOWN)) if Input.repeat?(:DOWN)
    cursor_up(Input.trigger?(:UP)) if Input.repeat?(:UP)
    if @index != last_index
      Sound.play_cursor
      @socket_windows[last_index].selected = false
      @socket_windows[@index].selected = true
    end
  end

  def equip_info_hide?
    return true if super

    @stones_window.active || @empty_window_flag
  end

  def equip_info_select_item
    nil
  end

  def cursor_down(wrap)
    @index = (@index + 1) % item_max if @index < item_max - 1 || wrap
    ensure_cursor_visible
  end

  def cursor_up(wrap)
    @index = (@index - 1 + item_max) % item_max if @index > 0 || wrap
    ensure_cursor_visible
  end

  def cursor_pagedown
    if top_index + visible_max < item_max
      self.top_index += visible_max
      @index = [@index + visible_max, item_max - 1].min
    end
  end

  def cursor_pageup
    if top_index > 0
      self.top_index -= visible_max
      @index = [@index - visible_max, 0].max
    end
  end

  def ensure_cursor_visible
    self.top_index = index if index < top_index
    self.bottom_index = index if index > bottom_index
  end

  def top_index=(index)
    index = item_max - visible_max if index > item_max - visible_max
    index = 0 if index < 0
    @socket_viewport.oy = index * window_height
  end

  def top_index
    @socket_viewport.oy / window_height
  end

  def bottom_index
    top_index + visible_max - 1
  end

  def bottom_index=(index)
    self.top_index = index - (visible_max - 1)
  end

  def window_height
    @socket_viewport.rect.height / visible_max
  end

  def on_socket_ok
    @top_index = top_index
    
    @stones_window.refresh
    @stones_window.clamp_index
    Sound.play_ok
    if (index - top_index) >= (visible_max / 2)
      # 画面上表示
      @stones_window.y = @stones_help_window.height
      @socket_viewport.rect.y += @stones_window.height
      @socket_viewport.oy += @stones_window.height
    else
      @stones_window.y = Graphics.height - @stones_window.height
      @socket_viewport.rect.height -= @stones_window.height
    end
    @stones_window.show.activate
    @stones_help_window.show
    @help_window.hide
    socket_window.deactivate
  end

  def init_selection
    @index = 0
    self.top_index = @index
    @socket_windows[@index].selected = !@empty_window_flag
  end

  def on_socket_a
    return if socket_window.stone == :empty

    Sound.play_equip
    item.change_stone(socket_window.socket_id, nil)
    refresh_socket_windows
  end
end

class Scene_ParamSetting < Scene_MenuBase
  def start
    super
    create_setting_window
  end

  def create_setting_window
    @param_setting_window = ParamSetting::Window_Setting.new
    @param_setting_window.set_handler(:cancel, method(:return_scene))
    @param_setting_window.activate
  end
end

class Scene_ActorSelectBase < Scene_MenuBase
  ACTOR_SELECT_HELP_MESSAGE = "Please select a character"
  def start
    super
    create_all_window
    load_window_settings
  end

  def pre_terminate
    super
    save_window_settings
  end

  def load_window_settings
    return if @actors_window.nil? || @sort_eval_window.nil?

    @select_data ||= [0, 0]
    @actors_window.select(@select_data[1]) if @actors_window
    @sort_eval_window.eval_id = @select_data[0]
    @sort_eval_window.refresh
  end

  def save_window_settings
    return if @actors_window.nil? || @sort_eval_window.nil?

    @select_data = [
      @sort_eval_window.eval_id,
      @actors_window.index
    ]
  end

  def create_all_window
    create_information_window
    create_actor_status_window
    create_actors_window
    create_help_window
    create_sort_eval_window
  end

  def create_information_window
    @information_window = Foo::JobChange::Window_Information.new
  end

  def create_sort_eval_window
    @sort_eval_window = Foo::JobChange::Window_SortEval.new(@actors_window)
  end

  def create_help_window
    @help_window = Foo::JobChange::Window_Help.new
    @help_window.text = ACTOR_SELECT_HELP_MESSAGE
  end

  def create_actor_status_window
    @actor_status_window = Foo::JobChange::Window_ActorStatus.new
  end

  def create_actors_window
    @actors_window = Foo::JobChange::Window_Actors.new(@actor_status_window)
    @actors_window.set_handler(:cancel, method(:return_scene))
    @actors_window.set_handler(:ok, method(:process_actor_ok))
  end

  def actor
    $game_actors[@actors_window.select_actor_id]
  end
end

class Scene_Base
  #--------------------------------------------------------------------------
  # ● フレーム更新（基本）
  #--------------------------------------------------------------------------
  def update_basic
    # hover
    Graphics.update
    Audio.update
    Input.update
    update_all_windows
  end

  alias h_scene_base_start start
  def start
    CacheActorFeatures.start
    h_scene_base_start
  end

  alias h_scene_base_pre_terminate pre_terminate
  def pre_terminate
    SaveSystemData.auto_save
    h_scene_base_pre_terminate
  end

  alias h_scene_base_terminate terminate
  def terminate
    CacheActorFeatures.init
    CacheUniq.init
    h_scene_base_terminate
  end

  def all_windows
    ivers = instance_variables.map do |varname|
      instance_variable_get(varname)
    end
    ivers.select do |iver|
      iver.is_a?(Window) && !iver.disposed?
    end
  end

  def active_windows
    all_windows.select(&:active)
  end

  def update_all_windows
    all_windows.each(&:update)
  end

  def dispose_all_windows
    all_windows.each(&:dispose)
  end
end

class Scene_Battle < Scene_Base
  class Dummy
    attr_reader :result_data
    attr_accessor :skip_mode

    def initialize
      clear_data
    end

    def method_missing(*args); end

    def display_action_results(target, item, user = nil)
      @result_data[[target, item, user]] ||= Game_ActionResult.new(target)
      r = @result_data[[target, item, user]]
      tr = target.result
      r.used = true
      unless target.result.hit?
        r.evaded = tr.evaded
        r.missed = tr.missed
        r.blocked = tr.blocked
        return
      end
      r.clear_hit_flags
      r.used = true
      r.success ||= tr.success
      r.hit_count += 1
      r.hp_damage += tr.hp_damage
      r.hp_damage += tr.hp_drain
      r.mp_damage += tr.mp_damage
      r.mp_damage += tr.mp_drain
      r.tp_damage += tr.tp_damage
      r.added_states.concat(tr.added_states).uniq!
      r.removed_states.concat(tr.removed_states).uniq
      r.damage_rate = tr.damage_rate if r.damage_rate > tr.damage_rate
      r.predation ||= tr.predation
      r.pleasure ||= tr.pleasure
      if (r.element_rate || 0) > tr.element_rate
        r.element_rate = tr.element_rate
        r.elements = tr.elements
      end
      r.state_boost.concat(tr.state_boost).uniq!
      r.ex_category_boost.concat(tr.ex_category_boost).uniq!
    end

    def clear_data
      @result_data = {}
      @skip_mode = 0
    end
  end
  include ShowKey_HelpWindow
  include FavoriteItem
  COST_NOT_PAY_MESSAGE = "Not enough %s to chain this skill unless it is\\nrecovered this turn. Chain this skill anyways?"
  alias h_scene_battle_start start
  def start
    h_scene_battle_start
    @speed = $game_system.conf[:bt_wait].to_f / 100.0
    @dummy = Dummy.new
  end

  def post_start
    super
    if $game_party.in_battle
      start_party_command_selection
    else
      battle_start
    end
  end

  def pre_terminate
    super
    Graphics.fadeout(Integer(30 * @speed)) if SceneManager.scene_is?(Scene_Map)
    Graphics.fadeout(Integer(60 * @speed)) if SceneManager.scene_is?(Scene_Title)
  end

  def terminate
    super
    @spriteset.dispose_enemies
    SceneManager.snapshot_for_background
    dispose_spriteset
    @info_viewport.dispose
    RPG::ME.stop unless BattleManager.memory_battle?
  end

  def update_basic
    super
    $game_timer.update
    $game_troop.update
    @spriteset.update
    update_info_viewport
    update_log_open
    update_actions_window
    @speed = $game_system.conf[:bt_wait].to_f / 100.0

    return unless $game_system.conf[:bt_show_actor_status]

    v = !$game_troop.interpreter.running? && !BattleManager.battle_end? && (@battle_actor_status_windows_show || BattleManager.in_turn?)
    @battle_actor_status_windows.each_with_index do |w, i|
      w.visible = v
      w.actor = $game_party.battle_members[i]
    end
  end

  #--------------------------------------------------------------------------
  # ● ログウィンドウの開閉管理更新処理
  #--------------------------------------------------------------------------
  def update_log_open
    if @message_window.open? || @info_viewport.visible
      @log_window.close if @log_window.open?
    elsif @log_window.close?
      @log_window.open
    end
  end

  def update_actions_window
    return unless @actions_window
    if @status_window.index < 0 || @actor_command_window.close? || @skill_window.visible || @item_window.visible
      return @actions_window.hide
    end

    @actions_window.show
  end

  #--------------------------------------------------------------------------
  # ○ 全ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_all_windows
    create_message_window
    create_scroll_text_window
    create_log_window
    create_status_window
    create_bench_window
    create_info_viewport
    create_party_command_window
    create_actor_command_window
    create_help_window
    create_skill_window
    create_item_window
    create_actor_window
    create_enemy_window
    create_simple_status_window
    create_skillname_window
    create_auto_battle_command_window
    create_battle_status_window
    create_battle_actor_status_window
    create_popup_window
    @actions_window = Window_Actor_Actions.new
    @actor_command_window.count_window = @actions_window
  end

  def create_message_window
    @message_window = Window_BattleMessage.new
  end

  def create_party_command_window
    @party_command_window = Window_PartyCommand.new
    @party_command_window.viewport = @info_viewport
    @party_command_window.set_handler(:ok, method(:command_ok))
    @party_command_window.set_handler(:fight,  method(:command_fight))
    @party_command_window.set_handler(:escape, method(:command_escape))
    @party_command_window.set_handler(:auto_battle, method(:command_auto_battle))
    @party_command_window.set_handler(:battle_states, method(:command_battle_states))
    @party_command_window.set_handler(:shift_change, method(:command_shift_change))
    @party_command_window.set_handler(:giveup, method(:command_giveup))
    @party_command_window.set_handler(:library, method(:command_library))
    @party_command_window.set_handler(:config, method(:command_config))
    @party_command_window.unselect
  end

  def command_ok
    @log_window.clear_popup
  end
  def create_auto_battle_command_window
    @auto_battle_command_window = Window_AutoBattleCommand.new
    @auto_battle_command_window.x = 0
    @auto_battle_command_window.viewport = @info_viewport
    @auto_battle_command_window.set_handler(:normal, proc { auto_battle :normal })
    @auto_battle_command_window.set_handler(:not_mp_skill, proc { auto_battle :not_mp_skill })
    @auto_battle_command_window.set_handler(:repeat, proc { auto_battle :repeat })
    @auto_battle_command_window.set_handler(:attack_only, proc { auto_battle :attack_only })
    @auto_battle_command_window.set_handler(:cancel, method(:auto_battle_cancel))
  end

  def auto_battle(type)
    $game_system.last_select_auto_battle_command = @auto_battle_command_window.index
    $game_party.members.each do |actor|
      actor.make_auto_battle_actions(type) if actor.inputable?
    end
    @info_viewport.visible = false
    @auto_battle_command_window.close
    @party_command_window.setup
    turn_start
  end

  def auto_battle_cancel
    @auto_battle_command_window.close
    @party_command_window.setup
  end

  #--------------------------------------------------------------------------
  # ○ ログウィンドウの作成
  #--------------------------------------------------------------------------
  def create_log_window
    @log_window = Window_BattleLog.new
    @log_window.method_wait = method(:wait)
    @log_window.method_wait_for_effect = method(:wait_for_effect)
    @log_window.method_process_down_word = method(:process_down_word)
  end

  #--------------------------------------------------------------------------
  # ○ ステータスウィンドウの作成
  #--------------------------------------------------------------------------
  def create_status_window
    @status_window = Window_BattleStatus.new
    @status_window.x = 200
    @status_window.set_handler(:ok, method(:battle_member_ok))
    @status_window.set_handler(:cancel, method(:battle_member_cancel))
  end

  #--------------------------------------------------------------------------
  # ○ 控えメンバーウィンドウの作成
  #--------------------------------------------------------------------------
  def create_bench_window
    @bench_window = Window_BenchStatus.new
    @bench_window.x = 200
    @bench_window.y = @status_window.height
    @bench_window.set_handler(:ok, method(:bench_member_ok))
    @bench_window.set_handler(:cancel, method(:bench_member_cancel))
  end

  #--------------------------------------------------------------------------
  # ○ 情報表示ビューポートの作成
  #--------------------------------------------------------------------------
  def create_info_viewport
    @info_viewport = Viewport.new
    @info_viewport.rect.y = Graphics.height - @status_window.height
    @info_viewport.rect.height = @status_window.height + @bench_window.height
    @info_viewport.z = 100
    @info_viewport.ox = 64
    @info_viewport.visible = false
    @status_window.viewport = @info_viewport
    @bench_window.viewport = @info_viewport
  end

  #--------------------------------------------------------------------------
  # ○ アクターコマンドウィンドウの作成
  #--------------------------------------------------------------------------
  def create_actor_command_window
    @actor_command_window = Window_ActorCommand.new
    @actor_command_window.viewport = @info_viewport
    @actor_command_window.set_handler(:attack, method(:command_attack))
    @actor_command_window.set_handler(:skill,  method(:command_skill))
    @actor_command_window.set_handler(:guard,  method(:command_guard))
    @actor_command_window.set_handler(:item,   method(:command_item))
    @actor_command_window.set_handler(:cancel, method(:prior_command))
    @actor_command_window.set_handler(:bind_resist, method(:command_bind_resist))
    @actor_command_window.set_handler(:mercy, method(:command_mercy))
    @actor_command_window.set_handler(:end_chain, method(:command_end_chain))
    @actor_command_window.x = Graphics.width
  end

  #--------------------------------------------------------------------------
  # ● 簡易ステータスウィンドウの作成
  #--------------------------------------------------------------------------
  def create_simple_status_window
    @simple_status_window = Window_SimpleStatus.new($game_actors[NWConst::Actor::LUCA])
    @simple_status_window.openness = 0
  end

  #--------------------------------------------------------------------------
  # ● スキル名ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_skillname_window
    @sname_window = Window_SkillName.new
  end

  def create_popup_window
    @popup_window = Window_PopupConfirm.new
    @popup_window.hide
    @popup_window.set_handler(:ok, method(:on_popup_ok))
    @popup_window.set_handler(:cancel, method(:on_popup_cancel))
    @popup_window.set_title(COST_NOT_PAY_MESSAGE)
  end

  #--------------------------------------------------------------------------
  # ○ ステータスウィンドウの情報を更新
  #--------------------------------------------------------------------------
  def refresh_status
    @status_window.refresh
    @bench_window.refresh
  end

  def create_battle_actor_status_window
    @battle_actor_status_windows = []
    x = 0
    4.times do |i|
      w = Window_BattleActorStatus.new(x, Graphics.height - @actor_command_window.height)
      instance_variable_set("@_b#{i}", w)
      x += w.width
      w.y -= w.height
      w.hide
      w.actor = $game_party.battle_members[i]
      @battle_actor_status_windows.push(w)
    end
  end

  #--------------------------------------------------------------------------
  # ○ 情報表示ビューポートの更新
  #--------------------------------------------------------------------------
  def update_info_viewport
    if @party_command_window.active
      move_info_viewport(0)
      move_info_viewport2(360)
    elsif @actor_command_window.active
      move_info_viewport(200)
      move_info_viewport2(360)
    elsif @bench_window.open?
      move_info_viewport(0)
      move_info_viewport2(360 - @bench_window.height)
    elsif BattleManager.in_turn?
      move_info_viewport(100)
      move_info_viewport2(360)
    end
  end

  #--------------------------------------------------------------------------
  # ● 情報表示ビューポートの移動（絶対座標）
  #--------------------------------------------------------------------------
  def move_info_viewport2(y)
    pos_y = @info_viewport.rect.y
    @info_viewport.rect.y = [y, pos_y + 16].min if pos_y < y
    @info_viewport.rect.y = [y, pos_y - 16].max if pos_y > y
  end

  #--------------------------------------------------------------------------
  # ○ パーティコマンド選択の開始
  #--------------------------------------------------------------------------
  def start_party_command_selection
    return if scene_changing?

    refresh_status
    @info_viewport.visible = true
    @status_window.unselect
    @status_window.open
    if BattleManager.input_start
      @actor_command_window.close
      @party_command_window.setup
    else
      @party_command_window.deactivate
      turn_start
    end
  end

  def command_auto_battle
    @party_command_window.close
    @auto_battle_command_window.open
    @auto_battle_command_window.select($game_system.last_select_auto_battle_command)
    @auto_battle_command_window.activate
  end

  def command_attack
    BattleManager.actor.input.set_attack
    if BattleManager.actor.bind_target?
      BattleManager.actor.input.target_index = BattleManager.bind_user_index
      next_command
    elsif BattleManager.actor.input.item.need_selection?
      select_enemy_selection
    else
      next_command
    end
  end

  def command_item
    @item_window.actor = BattleManager.actor
    @item_window.refresh
    @item_window.show.activate
  end

  def command_config
    SceneManager.snapshot_for_background
    SceneManager.call(Scene_Config)
  end

  def command_end_chain
    BattleManager.actor.end_chain_action
    next_command
  end

  alias h_scene_battle_command_skill command_skill
  def command_skill
    h_scene_battle_command_skill
    @actions_window.hide
  end

  def command_bind_resist
    BattleManager.actor.input.target_index = BattleManager.bind_user_index
    BattleManager.actor.input.set_bind_resist
    next_command
  end

  def command_mercy
    BattleManager.actor.input.set_mercy
    next_command
  end

  def command_giveup
    @info_viewport.visible = false
    BattleManager.giveup
    $game_temp.reserve_common_event(NWConst::Common::GIVEUP_START)
    process_event
    turn_start
  end

  def command_battle_states
    @party_command_window.deactivate
    @info_viewport.visible = false
    @log_window.hide
    @states_window.battlers = $game_party.battle_members
    @states_window2.battlers = $game_troop.members
    @states_window.activate.show
    @states_window2.show
    @states_window.refresh
    @states_window2.refresh
  end

  def command_battle_status_cancel
    @info_viewport.visible = true
    @log_window.show
    @states_window.deactivate.hide
    @states_window2.hide
    @party_command_window.activate.show
  end

  def command_escape
    @info_viewport.visible = false
    turn_start unless BattleManager.process_escape
  end

  def command_shift_change
    BattleManager.shift_change
    refresh_status
    @bench_window.open
    @status_window.activate.select(0)
  end

  def command_library
    SceneManager.snapshot_for_background
    SceneManager.call(Scene_Library)
    SceneManager.scene.play_bgm
  end

  def battle_member_ok
    @bench_window.activate.select(0)
  end

  def battle_member_cancel
    @status_window.unselect
    @bench_window.close
    BattleManager.init_phase
    refresh_status
    start_party_command_selection
  end

  #--------------------------------------------------------------------------
  # ● 控えメンバー：決定
  #--------------------------------------------------------------------------
  def bench_member_ok
    $game_party.sort_hidden_last
    $game_party.swap_order(@status_window.member_index, @bench_window.member_index)
    refresh_status
    bench_member_cancel
  end

  #--------------------------------------------------------------------------
  # ● 控えメンバー：キャンセル
  #--------------------------------------------------------------------------
  def bench_member_cancel
    @status_window.activate
    @bench_window.unselect
  end

  #--------------------------------------------------------------------------
  # ● アクターコマンド選択の開始
  #--------------------------------------------------------------------------
  def start_actor_command_selection
    @status_window.select(BattleManager.actor.index)
    @party_command_window.close
    @actor_command_window.setup(BattleManager.actor)
    @actor_command_window.select_last
  end

  #--------------------------------------------------------------------------
  # ● スキル［決定］
  #--------------------------------------------------------------------------
  def on_skill_ok
    actor = BattleManager.actor
    @skill = @skill_window.item.change(actor)
    return on_skill_ok_after unless actor.chain_input?

    temp_actor = Marshal.load(Marshal.dump(actor))
    temp_actor.extend OverrideSkillCost
    temp_actor.action_tree.each do |action|
      item = action.item
      break unless item

      temp_actor.pay_skill_cost(item)
      temp_actor.chain_boost_flag = true
    end
    return on_skill_ok_after if temp_actor.skill_cost_payable?(@skill)

    r = temp_actor.skill_not_pay_costs(@skill)
    @popup_window.set_name(r.keys.map { |s| s == :TP ? :SP : s }.join("・"))
    @popup_window.show.activate.select(0)
  end

  def on_popup_ok
    @popup_window.hide.deactivate
    Sound.play_ok
    on_skill_ok_after
  end

  def on_skill_ok_after
    actor = BattleManager.actor
    actor.input.set_skill(@skill.id)
    actor.set_last_skill(@actor_command_window.current_ext, @skill)
    if !@skill.need_selection?
      @skill_window.hide
      next_command
    elsif @skill.for_opponent?
      select_enemy_selection
    else
      select_actor_selection
    end
  end

  def on_popup_cancel
    @popup_window.hide.deactivate
    @skill_window.activate
  end

  module OverrideSkillCost
    attr_writer :chain_boost_flag

    def make_cost_value(skill)
      result = super(skill)
      result.delete_if { |key, _| ![:HP, :MP, :TP].include?(key) }
    end

    def cache_actor
      $game_actors[id]
    end

    def chain_boost?
      @chain_boost_flag
    end

    def skill_not_pay_costs(skill)
      values = make_cost_value(skill)
      result = {}
      result[:HP] = true if values[:HP] >= hp
      result[:MP] = true if values[:MP] > mp
      result[:TP] = true if values[:TP] > tp
      result
    end
  end

  #--------------------------------------------------------------------------
  # ○ 戦闘開始
  #--------------------------------------------------------------------------
  def battle_start
    BattleManager.battle_start
    process_event
    BattleManager.set_battle_start_skill
    log_skip($game_system.conf[:skip_battle_start_skill_effect] ? 2 : nil) do
      @battle_actor_status_windows_show = true unless skip_mode?
      process_action while BattleManager.gm_exist? && !scene_changing?
      @battle_actor_status_windows_show = false
    end
    BattleManager.judge_win_loss
    start_party_command_selection
  end

  #--------------------------------------------------------------------------
  # ○ ターン開始
  #--------------------------------------------------------------------------
  def turn_start
    all_battle_members.each do |m|
      m.on_turn_start
    end
    ($game_party.all_members + $game_troop.members).each do |m|
      m.turn_hit_damage_count = 0
    end
    @info_viewport.visible = false
    @party_command_window.close
    @actor_command_window.close
    @status_window.unselect
    @subject = nil
    BattleManager.turn_start
    @log_window.wait
    @log_window.clear
    BattleManager.set_turn_start_skill
    @battle_actor_status_windows_show = true
    process_action while BattleManager.gm_exist? && !scene_changing?
    @battle_actor_status_windows_show = false
    BattleManager.judge_win_loss
  end

  #--------------------------------------------------------------------------
  # ○ 敵キャラ選択の開始
  #--------------------------------------------------------------------------
  def select_enemy_selection
    skill = @skill_window.visible ? @skill_window.item : nil
    @enemy_window.friend_draw = skill ? skill.friend_draw? : false
    @enemy_window.refresh
    @enemy_window.show.activate
  end

  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの使用
  #--------------------------------------------------------------------------
  def use_item
    @log_window.clear_popup
    $game_temp.action_user   = @subject
    $game_temp.used_skill    = @subject.current_action.item
    if @subject.enemy?
      $game_temp.lose_event_id = @subject.enemy.lose_event_id
      $game_temp.lose_event_enemy_id = @subject.id
    end
    current_action = @subject.current_action
    base_item = @subject.current_action.item
    if base_item.nil?
      @log_window.display_target_empty(@subject)
      return true
    end
    use_items = @subject.current_action.use_items(true)
    display_item = use_items.size == 1 ? use_items[0] : base_item
    # 使用直前失敗判定
    return true if [:slot, :poker, :random, :mimic].include?(base_item.use_items_mode) && use_items.empty?

    # 【スキル名表示】
    process_skill_word(display_item, @subject.current_action)
    display_skill_name(display_item)
    # 使用直前失敗判定
    return true if [:multi, :normal].include?(base_item.use_items_mode) && process_skill_unusable(base_item, true)

    # アイテムの使用
    @subject.use_item(base_item)
    refresh_status
    # 使用直後メッセージ
    display_use_item(@subject.current_action, display_item)
    # 効果の発動
    process_invoke_item(@subject.current_action, use_items)
    close_skill_name

    BattleManager.interrupt_evasion_skill
    return unless current_action

    skill_combo(current_action)
    BattleManager.add_mimic_history(current_action)
    skill_chain(current_action)
    @subject.action_count += 1 if current_action.symbol == :count
  end

  def skill_chain(action)
    return unless action && action.item
    return if @subject.game_master?

    BattleManager.skill_chain(@subject, action)
  end

  def skill_combo(base_action)
    return unless base_action && base_action.item
    return if @subject.game_master?

    base_action.combo_history ||= []
    @subject.skill_combo(base_action.item).each do |skill_id|
      action = Game_Action.new(@subject)
      action.set_skill(skill_id)
      BattleManager.skill_combo(@subject, action, base_action)
    end
  end

  def process_use_items(mode, base_action, item, can_failure)
    close_skill_name
    process_skill_word(item, base_action)
    if can_failure && process_skill_unusable(item, false)
      display_skill_name(item)
      process_skill_unusable(item, true)
      @log_window.wait(40)
      return []
    end
    display_use_item(base_action, item)
    skills =
      case mode
      when :slot
        [process_slot]
      when :poker
        @subject.actor ? [process_poker] : []
      when :random
        @log_window.wait(40)
        [item.random_invoke.sample]
      end
    @log_window.clear
    skills.map { |s| $data_skills[s] }
  end

  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの使用メッセージ表示
  #--------------------------------------------------------------------------
  def display_use_item(action, display_item)
    display_action = Game_Action.new(@subject)
    display_action.send(display_item.is_skill? ? :set_skill : :set_item, display_item.id)
    display_action.target_index = action.target_index
    display_targets = display_action.make_targets.compact
    @log_window.display_use_item(@subject, display_targets, display_item)
  end

  #--------------------------------------------------------------------------
  # ○ スキル発動不可能の処理
  #--------------------------------------------------------------------------
  def process_skill_unusable(base_item, display_flag)
    if @subject.skill_unusable?(base_item)
      display_skill_unusable(base_item) if display_flag
      return true
    elsif @subject.eternal_bind_resist?(base_item)
      display_eternal_bind_resist if display_flag
      return true
    end
    false
  end

  #--------------------------------------------------------------------------
  # ● スキル使用失敗の表示
  #--------------------------------------------------------------------------
  def display_skill_unusable(item)
    @log_window.display_unusable(@subject, item)
    close_skill_name
  end

  #--------------------------------------------------------------------------
  # ● 永久拘束抵抗の表示
  #--------------------------------------------------------------------------
  def display_eternal_bind_resist
    bind_user = $game_troop.members[@subject.current_action.target_index]
    @log_window.display_eternal_bind_resist(bind_user)
    close_skill_name
  end

  #--------------------------------------------------------------------------
  # ● 使用者のフィードバックの適用
  #--------------------------------------------------------------------------
  def apply_user_feedback(user, item)
    return unless user.alive? && item.pay_life?

    if user.own_crush_resist?
      user.hp = 1
      @log_window.display_pay_life_failure(user)
    else
      user.add_state(user.death_state_id)
      @log_window.display_pay_life(user)
    end
  end

  #--------------------------------------------------------------------------
  # ○ スキル／アイテムの効果を適用
  #--------------------------------------------------------------------------
  def apply_item_effects(target, item, opt = nil)
    opt ||= {}
    target = target.observer if target.is_a?(Game_Master)
    target.item_apply(@subject, item, opt)
    refresh_status
    @log_window.display_action_results(target, item, @subject)
  end

  #--------------------------------------------------------------------------
  # ● 被ダメージ用セリフ処理
  #--------------------------------------------------------------------------
  def process_down_word(target, item)
    return if $game_system.conf[:bt_skip] == true
    return unless target.down_word_hash

    abs_wait_short
    if target.result.added_state_objects.any? { |state| state.death? }
      if target.result.predation
        target.predation_word.execute if target.predation_word
      elsif target.result.pleasure
        target.orgasm_word.execute if target.orgasm_word
        process_luca_orgasm if target.luca?
      elsif target.dead_word
        target.dead_word.execute
      end
      target.premortal_change
    elsif target.result.added_states.include?(NWConst::State::INCONTINENCE)
      target.incontinence_word.execute if target.incontinence_word
    end
    wait_for_message
  end

  #--------------------------------------------------------------------------
  # ● ルカの射精演出処理
  #--------------------------------------------------------------------------
  def process_luca_orgasm
    wait_for_message
    $game_troop.screen.pictures[10].show("sys_white", 0, 0, 0, 100, 100, 0, 0)
    $game_troop.screen.pictures[10].move(0, 0, 0, 100, 100, 255, 0, 20)
    wait(20)
    RPG::SE.new("mon_syasei", 100, 100).play
    $game_troop.screen.pictures[10].move(0, 0, 0, 100, 100, 0, 0, 25)
    wait(25)
    $game_troop.screen.pictures[10].move(0, 0, 0, 100, 100, 255, 0, 20)
    wait(20)
    $game_troop.screen.pictures[10].move(0, 0, 0, 100, 100, 0, 0, 25)
    wait(25)
    $game_troop.screen.pictures[10].move(0, 0, 0, 100, 100, 255, 0, 6)
    wait(6)
    $game_troop.screen.pictures[10].move(0, 0, 0, 100, 100, 0, 0, 60)
    wait(60)
    $game_troop.screen.pictures[10].erase
  end

  #--------------------------------------------------------------------------
  # ● スキル用セリフ処理
  #--------------------------------------------------------------------------
  def process_skill_word(item, action = nil)
    
    return if skip_mode?
    return unless item.is_skill?
    return unless @subject.exist_skill_word?(item.id)

    word = @subject.skill_word(item.id)
    action_symbols = [:event_interrupt, :skill_combo, :mimic, :interrupt]
    return if action && action_symbols.include?(action.symbol) && !word.common

    unless $game_system.conf[:bt_skip]
      word.execute
      wait_for_message
    end
    return if $game_system.conf[:bt_skip_cutin]
    return unless @subject.exist_cutin?(item.id)
    return if @subject.enemy? && $game_system.conf[:bt_skip_enemy_cutin]
    return if action && action.symbol == :chain_action && $game_system.conf[:bt_skip_chain_action_cutin]

    @subject.cutin(item.id).execute(method(:wait))
  end

  #--------------------------------------------------------------------------
  # ● スキル名を閉じる
  #--------------------------------------------------------------------------
  def close_skill_name
    $game_party.display_skill_name = nil
    $game_troop.screen.pictures.each { |pic| pic.erase }
  end

  #--------------------------------------------------------------------------
  # ● メンバー入れ替えでの全滅防止
  #--------------------------------------------------------------------------
  def no_change_all_dead_on_bench?
    $game_party.no_swap_all_dead?(@status_window.index, @bench_window.index + $game_party.max_battle_members)
  end

  #--------------------------------------------------------------------------
  # ● 戦闘終了後のイベント処理
  #--------------------------------------------------------------------------
  def process_event_on_battle_end(timing)
    m = @dummy.skip_mode
    end_log_skip
    display_result_skip_mode(m)
    return if $game_troop.interpreter.running?

    until scene_changing?
      $game_troop.interpreter.update
      $game_troop.setup_battle_event(timing)
      wait_for_message
      wait_for_effect if $game_troop.all_dead?
      process_forced_action
      break unless $game_troop.interpreter.running?

      update_for_wait
    end
  end

  #--------------------------------------------------------------------------
  # ● アニメと崩壊エフェクトのスキップ
  #--------------------------------------------------------------------------
  def battle_show_skip?
    Input.press?(:X)
  end

  #--------------------------------------------------------------------------
  # ● アニメーションの表示
  #--------------------------------------------------------------------------
  def show_animation(targets, animation_id)
    return if battle_show_skip?

    targets = targets.select { |target| target.battle_member? }
    if animation_id < 0
      show_attack_animation(targets)
    else
      show_normal_animation(targets, animation_id)
    end
    @log_window.wait
    wait_for_animation
  end

  def show_attack_animation(targets)
    if @subject.actor?
      mirror = false
      @subject.atk_animation_ids.each do |animation_id|
        show_normal_animation(targets, animation_id, mirror)
        mirror = !mirror
      end
    else
      Sound.play_enemy_attack
      abs_wait_short
    end
  end

  #--------------------------------------------------------------------------
  # ○ ウェイト
  #--------------------------------------------------------------------------
  def wait(duration)
    duration = Integer(duration * @speed)
    duration.times { |i| update_for_wait if i < duration / 2 || !show_fast? }
  end

  #--------------------------------------------------------------------------
  # ○ ウェイト（早送り無効）
  #--------------------------------------------------------------------------
  def abs_wait(duration)
    duration = Integer(duration * @speed)
    duration.times { |_i| update_for_wait }
  end

  def create_battle_status_window
    @states_window = Window_BattlerStates.new
    @states_window2 = Window_BattlerStates.new
    @states_window.hide
    @states_window2.hide
    @states_window2.y = @states_window.height
    @states_window.set_handler(:cancel, method(:command_battle_status_cancel))
  end

  def show_key_sprite_window
    @states_window
  end

  def show_key_text
    active_windows.map(&:show_key_text).flatten
  end

  def invoke_magic_reflection(target, item, opt)
    @subject.magic_reflection = true
    @log_window.display_reflection(target, item)
    apply_item_effects(@subject, item, opt.merge({ :ref => true }))
    @subject.magic_reflection = false
  end

  def display_skill_name(item, action = nil)
    return unless item.is_skill?
    return if skip_mode?

    $game_party.display_skill_name = item.visible? ? item.display_skill_name : nil
  end

  def enable_set_favorite_item?
    @item_window.active
  end

  def enable_change_favorite_mode?
    @item_window.active
  end
  def wait_for_effect
    update_for_wait
    while @spriteset.effect?
      update_for_wait 
    end
  end
  def turn_end
    $game_party.od_count
    members = all_battle_members.select(&:od_movable?)
    members.each do |battler|
      battler.on_turn_end
      refresh_status
      @log_window.display_auto_affected_status(battler)
      @log_window.wait_and_clear
    end
    BattleManager.turn_end
    process_event
    BattleManager.set_turn_end_skill
    @battle_actor_status_windows_show = true
    process_action while BattleManager.gm_exist? && !scene_changing?
    @battle_actor_status_windows_show = false
    BattleManager.judge_win_loss
    return if scene_changing?

    # 降参時はコマンド入力飛ばし
    if BattleManager.giveup?
      if BattleManager.giveup_count_down
        actor = $game_actors[NWConst::Actor::LUCA]
        actor.add_state(actor.death_state_id)
        actor.orgasm_word.execute
        process_luca_orgasm
        BattleManager.process_defeat
      else
        $game_troop.make_actions
        turn_start
      end
    else
      start_party_command_selection
    end
  end

  def process_event
    return if $game_party.in_over_drive?

    until scene_changing?

      $game_troop.interpreter.update
      $game_troop.setup_battle_event
      wait_for_message
      wait_for_effect if $game_troop.all_dead?
      process_forced_action
      BattleManager.judge_win_loss
      break unless $game_troop.interpreter.running?

      update_for_wait
    end
  end

  def process_action
    return if scene_changing?

    gm_exist = BattleManager.gm_exist?
    @subject = BattleManager.next_subject
    return gm_exist ? nil : turn_end unless @subject

    if @subject.current_action
      @subject.current_action.prepare
      if @subject.valid_select_action?
        execute_action
        BattleManager.judge_win_loss
      end
      @subject.remove_current_action
    end
    if @subject.action_end?
      process_action_end
      BattleManager.delete_action(@subject)
    end
  end

  def process_action_end
    @subject.on_action_end
    refresh_status
    @log_window.display_auto_affected_status(@subject)
    @log_window.wait_and_clear
    @log_window.display_current_state(@subject)
    @log_window.wait_and_clear
    if @subject.enemy? || !$game_system.conf[:bt_regenerate]
      @log_window.display_damage(@subject, nil)
      @log_window.wait_and_clear
    end
    BattleManager.judge_win_loss
  end

  def invoke_counter_attack(target, item, base_item)
    @log_window.clear_all
    @subject, target = target, @subject
    index = @subject.current_action_index
    action = @subject.skill_interrupt(base_item.id, nil)
    t = target
    return unless action

    if t.alive? #Code is modified to prevent a game crash that occurs when multiple counters are still queued up after all enemies are dead.
      action.target_index = target.index
      @subject.invoke_repeats(base_item).times do |repeat_time|
        use_items = @subject.current_action.use_items(false)
        display_item = use_items.size == 1 ? use_items[0] : base_item
        if repeat_time == 0
          process_skill_word(display_item)
          display_use_item(action, display_item)
        end
        display_skill_name(display_item)
        # @log_window.display_counter(@subject, display_item)
        use_items.each do |attack_skill|
          target = base_item.for_user? ? @subject : t
          action = Game_Action.new(@subject, true)
          action.object = attack_skill
          action.target_index = target.index
          targets = action.make_targets.compact

          show_animation_item(targets, attack_skill)
          log_skip(log_skip_mode(attack_skill)) do
            hit_count = {}
            targets.each do |target|
              hit_count[target] ||= 0
              hit_count[target] += 1
              apply_item_effects(apply_substitute(target, attack_skill), attack_skill,
                                { :cnt => true, :hit_count => hit_count })
            end
          end
          @subject.item_one_use_apply(attack_skill, [target], self)
        end
      end
      @log_window.clear
    end
    target = t
    refresh_status
    @subject.remove_current_action
    @subject.current_action_index = index
    @subject, target = target, @subject
  end

  def counter_ex(item, targets)
    @subject.opponents_unit.members.each do |member|
      next unless member.enable_counter?(@subject, item)
      next unless (counter_skill = member.skill_counter_ex(item))

      return [member, $data_skills[counter_skill]]
    end
    targets.uniq.each do |target|
      next unless (counter_skill = target.item_counter_ex_skill(@subject, item))

      return [target, $data_skills[counter_skill]]
    end
    nil
  end

  def log_skip_mode(item)
    return unless item
    return 1 if $game_system.conf[:skip_skill_effect] && item.exp_target_random?

    nil
  end

  def skip_mode?
    @log_window.is_a?(Dummy)
  end

  def end_log_skip
    return unless skip_mode?

    @log_window = @_l
    @_l = nil
    @dummy.skip_mode = nil
  end
  def log_skip(skip_mode)
    if skip_mode?
      yield @log_window.skip_mode
      return
    end
    if skip_mode
      @_l = @log_window
      @log_window = @dummy
      @dummy.skip_mode = skip_mode
    end
    yield skip_mode
    end_log_skip if skip_mode
    display_result_skip_mode(skip_mode)
    @dummy.clear_data
    @log_window.clear
  end

  def process_invoke_item(base_action, first_use_items)
    @log_window.clear_popup
    enable_counter = true
    base_item = base_action.item
    global = true
    @subject.invoke_repeats(base_item).times do |repeat_time|
      break unless global
      break unless @subject.current_action

      use_items = (repeat_time == 0 ? first_use_items : base_action.use_items(false))
      display_item = use_items.size == 1 ? use_items[0] : base_item
      # process_skill_word(display_item, base_action) if repeat_time != 0
      use_items.each_with_index do |item, item_time|
        break unless @subject.current_action

        if (repeat_time != 0) || (item_time != 0) # 反撃スキルから戻す
          display_skill_name(display_item)
          display_use_item(base_action, display_item)
        end

        enable_invoke = true
        action = Game_Action.new(@subject)
        action.object = item
        action.target_index = base_action.target_index
        targets = action.make_targets.compact
        targets.delete(@subject) if item.target_reject_user?

        show_animation_item(targets, item)
        if enable_counter # 拡張反撃
          user, skill = counter_ex(item, targets)
          if user && skill
            invoke_counter_attack(user, item, skill)
            global = false
            enable_invoke = false
          end
        end

        if enable_invoke # 効果の発動
          $game_temp.normal_invoke_start
          log_skip(log_skip_mode(item)) do
            hit_count = {}
            targets.each do |target|
              hit_count[target] ||= 0
              hit_count[target] += 1
              item.repeats.times do
                invoke_item(target, item, :hit_count => hit_count, :base_item => base_item,
                                          :evasion => base_action.symbol == :evasion)
              end
            end
          end
          @subject.item_one_use_apply(item, targets, self)
          $game_temp.normal_invoke_end

        end

        if enable_invoke && enable_counter # 通常反撃
          targets.uniq.each do |target|
            counter_skill = target.item_counter_skill(@subject, item)
            if counter_skill && $data_skills[counter_skill]
              invoke_counter_attack(target, item, $data_skills[counter_skill])
            end
          end
        end
        enable_counter = false

        @log_window.clear_all
      end # use_items.each
      @log_window.clear_all # 2行上のclearはbreakによって無視される可能性がある
      break if $game_troop.all_dead?
    end # invoke_repeats.times
    if global
      use_item_learning_skill(base_item)
      use_item_mimic(base_item)
      @subject.item_global_apply(base_item)
      apply_user_feedback(@subject.master_observer, base_item)
    end
  end

  def display_result_skip_mode(skip_mode)
    case skip_mode
    when 1
      @log_window.display_all_skip(@dummy.result_data)
    when 2
      @log_window.display_battle_start_skill(@dummy.result_data)
    end
    @log_window.clear
  end

  def invoke_item(target, item, opt = {})
    return unless @subject.alive? || @subject.skill_unstoppable?(item) || @subject.skill_unstoppable?(opt[:base_item])

    if target.item_reflection?(@subject, item)
      invoke_magic_reflection(target, item, opt)
    else
      apply_item_effects(apply_substitute(target, item), item, opt)
    end
    @subject.last_target_index = target.index
  end

  def use_item_mimic(item)
    BattleManager.interrupt_mimic(@subject) if item.mimic?
    BattleManager.interrupt_super_mimic(@subject) if item.super_mimic?
  end

  def use_item_learning_skill(item)
    mem = $game_party.movable_members.select do |member|
      member.learning_valid? && member.use_item_learning_skill(item)
    end
    texts = mem.map do |member|
      "#{member.name} has learned #{$data_skills[item.learning_skill].window_name}!"
    end
    return if texts.empty?

    wait(5)
    RPG::SE.new("Flash2").play
    texts.each { |text| $game_message.add(text) } unless skip_mode?
    wait_for_message
  end
end

class Scene_Equip
  include EquipInfoScene
  include ShowKey_HelpWindow
  include FavoriteItem
  def prepare(item)
    return unless @select_data

    @select_data[:item][0] = item
  end

  def start
    super
    create_help_window
    create_status_window
    create_command_window
    create_slot_window
    create_item_window
    load_window_settings
  end

  def pre_terminate
    super
    save_window_settings
  end

  def load_window_settings
    return unless @select_data

    @command_window.deactivate
    case @select_data[:active]
    when :item
      @item_window.activate
    when :slot
      @slot_window.activate
    end

    @slot_window.select(@select_data[:slot])
    @item_window.slot_id = @select_data[:slot]
    @item_window.oy = @select_data[:item][1]
    @item_window.select_item(@select_data[:item][0])
  end

  def save_window_settings
    @select_data = {}
    @select_data[:active] = @item_window.active ? :item : :slot
    @select_data[:slot] = @slot_window.index
    @select_data[:item] = [@item_window.item, @item_window.oy]
  end

  def equip_info_hide?
    return true if super

    @item_window.active == false and @slot_window.active == false
  end

  def equip_info_select_item
    @item_window.active ? @item_window.item : @slot_window.item
  end

  def show_key_text
    return super if super && !super.empty?

    if @command_window.active
      [ShowKey_Help.lr_actor]
    elsif @slot_window.active
      [ShowKey_Help.equip_info,
       movable_equip_stone ? ShowKey_Help.equip_stone : nil,
       ShowKey_Help.equip_shift,
       ShowKey_Help.favorite_mode(@item_window.favorite_mode),
       ShowKey_Help.lr_actor]
    elsif @item_window.active
      [ShowKey_Help.equip_info,
       movable_equip_stone ? ShowKey_Help.equip_stone_a : nil,
       ShowKey_Help.favorite_item(@item_window.get_favorite_item_state),
       ShowKey_Help.favorite_mode(@item_window.favorite_mode),
       ShowKey_Help.lr_scroll].compact
    end
  end

  def equip_info_select_actor
    @actor
  end

  def update
    super
    @actor.show_param_rate_all if Input.trigger?(:CTRL)
  end

  #--------------------------------------------------------------------------
  # ● コマンドウィンドウの作成
  #--------------------------------------------------------------------------
  def create_command_window
    wx = @status_window.width
    wy = @help_window.height
    ww = Graphics.width - @status_window.width
    @command_window = Window_EquipCommand.new(wx, wy, ww)
    @command_window.viewport = @viewport
    @command_window.help_window = @help_window
    @command_window.set_handler(:equip,    method(:command_equip))
    @command_window.set_handler(:optimize, method(:command_optimize))
    @command_window.set_handler(:clear,    method(:command_clear))
    @command_window.set_handler(:cancel,   method(:return_scene))
    @command_window.set_handler(:pagedown, method(:next_actor))
    @command_window.set_handler(:pageup,   method(:prev_actor))
    @command_window.set_handler(:keep_on_actor_change, nil)
  end

  #--------------------------------------------------------------------------
  # ● スロットウィンドウの作成
  #--------------------------------------------------------------------------
  def create_slot_window
    wx = @status_window.width
    wy = @command_window.y + @command_window.height
    ww = Graphics.width - @status_window.width
    @slot_window = Window_EquipSlot.new(wx, wy, ww)
    @slot_window.viewport = @viewport
    @slot_window.help_window = @help_window
    @slot_window.status_window = @status_window
    @slot_window.actor = @actor
    @slot_window.set_handler(:ok,       method(:on_slot_ok))
    @slot_window.set_handler(:cancel,   method(:on_slot_cancel))
    @slot_window.set_handler(:pagedown, method(:next_actor))
    @slot_window.set_handler(:pageup,   method(:prev_actor))
    @slot_window.set_handler(:keep_on_actor_change, nil)
    @slot_window.set_handler(:A, method(:on_slot_A))
    @slot_window.set_handler(:Y, method(:on_slot_Y))
  end

  #--------------------------------------------------------------------------
  # ● アクターの切り替え
  #--------------------------------------------------------------------------
  def on_actor_change
    @status_window.actor = @actor
    @slot_window.actor = @actor
    @item_window.actor = @actor
    @status_window.refresh
    @slot_window.call_update_help
  end

  def on_slot_Y
    return unless movable_equip_stone

    Sound.play_ok
    SceneManager.call(Scene_EquipStoneItem)
    SceneManager.scene.prepare(@slot_window.item)
  end

  def on_item_A
    return unless movable_equip_stone

    Sound.play_ok
    SceneManager.call(Scene_EquipStoneItem)
    SceneManager.scene.prepare(@item_window.item)
  end

  def movable_equip_stone
    w = [@item_window, @slot_window].find(&:active)
    return unless w

    w.item && w.item.stones.size > 0 && @actor.equip_change_ok?(@slot_window.index)
  end

  #--------------------------------------------------------------------------
  # ● 装備を外す
  #--------------------------------------------------------------------------
  def on_slot_A
    return unless @actor.equip_change_ok?(@slot_window.index)

    Sound.play_equip
    @actor.change_equip(@slot_window.index, nil)
    @slot_window.refresh
    @item_window.refresh
    @status_window.refresh
    @slot_window.call_update_help
  end

  alias h_scene_equip_on_item_ok on_item_ok
  def on_item_ok
    h_scene_equip_on_item_ok
    @status_window.refresh
  end

  def enable_set_favorite_item?
    @item_window.active
  end

  def enable_change_favorite_mode?
    @item_window.active || @slot_window.active
  end

  def create_item_window
    wx = 0
    wy = @slot_window.y + @slot_window.height
    ww = Graphics.width
    wh = Graphics.height - wy
    @item_window = Window_EquipItem.new(wx, wy, ww, wh)
    @item_window.viewport = @viewport
    @item_window.help_window = @help_window
    @item_window.status_window = @status_window
    @item_window.actor = @actor
    @item_window.set_handler(:ok,     method(:on_item_ok))
    @item_window.set_handler(:cancel, method(:on_item_cancel))
    @item_window.set_handler(:A, method(:on_item_A))
    @slot_window.item_window = @item_window
  end
end

class Scene_EquipStone < Scene_Item
  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    create_stone_list_window
    create_equip_stone_window
  end

  def favorite_window
    return @stone_list_window if @stone_list_window.active

    super
  end

  def enable_change_favorite_mode?
    favorite_window.active
  end

  def enable_set_favorite_item?
    favorite_window.active
  end
  #--------------------------------------------------------------------------
  # ● 簡易操作説明テキスト
  #--------------------------------------------------------------------------
  def show_key_text
    if @category_window.active
      [ShowKey_Help.favorite_mode(@item_window.favorite_mode)]
    elsif @item_window.active
      [ShowKey_Help.stone_shift_all,
       ShowKey_Help.equip_info,
       ShowKey_Help.favorite_item(@item_window.get_favorite_item_state),
       ShowKey_Help.favorite_mode(@item_window.favorite_mode),
       ShowKey_Help.lr_scroll]
    elsif @equip_stone_window && @equip_stone_window.active
      [ShowKey_Help.stone_shift]
    elsif @stone_list_window && @stone_list_window.active
      [ShowKey_Help.favorite_item(@stone_list_window.get_favorite_item_state),
       ShowKey_Help.favorite_mode(@stone_list_window.favorite_mode),
       ShowKey_Help.lr_scroll]
    end
  end

  #--------------------------------------------------------------------------
  # ● 性能差比較ウィンドウを非表示にするか
  #--------------------------------------------------------------------------
  def equip_info_hide?
    @item_window.active == false
  end

  #--------------------------------------------------------------------------
  # ● カテゴリウィンドウの作成
  #--------------------------------------------------------------------------
  def create_category_window
    @category_window = Window_EquipItemCategory.new
    @category_window.viewport = @viewport
    @category_window.help_window = @help_window
    @category_window.y = @help_window.height
    @category_window.set_handler(:ok,     method(:on_category_ok))
    @category_window.set_handler(:cancel, method(:return_scene))
  end

  #--------------------------------------------------------------------------
  # ● アイテムウィンドウの生成
  #--------------------------------------------------------------------------
  def create_item_window
    @item_window = Window_EnchantItemList.new(0, @category_window.y + @category_window.height, Graphics.width,
                                              @category_window.fitting_height(5))
    @item_window.help_window = @help_window
    @item_window.set_handler(:ok,     method(:on_item_ok))
    @item_window.set_handler(:cancel, method(:on_item_cancel))
    @item_window.set_handler(:extra, method(:on_item_extra))
    @category_window.item_window = @item_window
  end

  #--------------------------------------------------------------------------
  # ● 秘石ウィンドウの生成
  #--------------------------------------------------------------------------
  def create_stone_list_window
    @stone_list_window = Window_StoneList.new
    @stone_list_window.help_window = @help_window
    @stone_list_window.set_handler(:ok,     method(:on_stone_list_ok))
    @stone_list_window.set_handler(:cancel, method(:on_stone_list_cancel))
    @item_window.stone_list_window = @stone_list_window
  end

  #--------------------------------------------------------------------------
  # ● 装備秘石ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_equip_stone_window
    @equip_stone_window = Window_EquipStone.new
    @equip_stone_window.help_window = @help_window
    @equip_stone_window.set_handler(:ok,     method(:on_equip_stone_ok))
    @equip_stone_window.set_handler(:cancel, method(:on_equip_stone_cancel))
    @equip_stone_window.set_handler(:extra, method(:on_equip_stone_extra))
    @item_window.equip_stone_window = @equip_stone_window
  end

  #--------------------------------------------------------------------------
  # ● itemハンドラ
  #--------------------------------------------------------------------------
  def on_item_ok
    @item_window.deactivate
    @equip_stone_window.activate
    @equip_stone_window.select(0)
  end

  def on_item_extra
    item = @item_window.item
    item.clear_stones
    item = $game_party.restore_socket_item(item)
    @item_window.refresh
    @item_window.select_item(item)
    @equip_stone_window.item = @item_window.item
    @equip_stone_window.refresh
    @stone_list_window.refresh
  end

  #--------------------------------------------------------------------------
  # ● stone_listハンドラ
  #--------------------------------------------------------------------------
  def on_stone_list_ok
    Sound.play_equip
    item = @item_window.item
    item = $game_party.create_socket_item(item) do |i|
      i.change_stone(@equip_stone_window.index, @stone_list_window.item)
    end
    @item_window.refresh
    @item_window.select_item(item)
    @stone_list_window.unselect
    @equip_stone_window.activate
    @stone_list_window.refresh
    @equip_stone_window.item = @item_window.item
    @equip_stone_window.refresh
    @equip_stone_window.update_help
  end

  def on_stone_list_cancel
    @stone_list_window.deactivate
    @stone_list_window.unselect
    @equip_stone_window.activate
  end

  #--------------------------------------------------------------------------
  # ● equip_stoneハンドラ
  #--------------------------------------------------------------------------
  def on_equip_stone_ok
    @equip_stone_window.deactivate
    @stone_list_window.activate
    @stone_list_window.select(0)
  end

  def on_equip_stone_cancel
    @equip_stone_window.deactivate
    @equip_stone_window.unselect
    @item_window.activate
  end

  def on_equip_stone_extra
    item = @item_window.item
    item.change_stone(@equip_stone_window.index, nil)
    item = $game_party.restore_socket_item(item)
    @item_window.refresh
    @item_window.select_item(item)
    @equip_stone_window.refresh
    @equip_stone_window.update_help
    @stone_list_window.refresh
  end
end

class Scene_EquipStoneActor < Scene_EquipStoneBase
  include ShowKey_HelpWindow

  attr_reader :index

  def show_key_text
    if @stones_window.active
      super + [ShowKey_Help.lr_scroll]
    elsif @empty_window_flag
      super + [ShowKey_Help.stone_change_scene, ShowKey_Help.lr_actor]
    else
      super + [ShowKey_Help.stone_change_scene, ShowKey_Help.stone_shift, ShowKey_Help.equip_info, ShowKey_Help.lr_actor]
    end
  end

  def create_help_window
    @help_window = Window_Equip_Stone_Help_Actor.new
    @help_window.item = @actor
    @help_window.socket_num = item_max
  end

  def equip_info_select_item
    socket_window.equip
  end

  def refresh_socket_windows
    window_id = 0
    actor_stones.each.with_index do |stones, equip_id|
      stones.each.with_index do |stone, socket_id|
        stone ||= :empty
        @socket_windows[window_id].stone = stone
        @socket_windows[window_id].equip = @actor.equips[equip_id]
        @socket_windows[window_id].socket_id = socket_id
        @socket_windows[window_id].max_index = item_max
        window_id += 1
      end
    end
    super
  end

  def item_max
    actor_stones.map(&:size).inject(:+)
  end

  def visible_max
    4
  end

  def actor_stones
    @actor.equips.map.with_index { |equip, i| equip && @actor.equip_change_ok?(i) ? equip.stones : [] }
  end

  def update_socket_selection
    return if @stones_window.active || equip_info_window_visible

    return next_actor if Input.trigger?(:R)
    return prev_actor if Input.trigger?(:L)

    if Input.trigger?(:RIGHT) || Input.trigger?(:LEFT)
      Input.update
      SceneManager.call(Scene_EquipStone)
      return
    end
    return on_socket_cancel if Input.trigger?(:B)
    return if @empty_window_flag

    return on_socket_ok if Input.trigger?(:C)
    return on_socket_a if Input.trigger?(:A)

    update_cursor
  end

  def next_actor
    a = @actor
    super
    Sound.play_cursor if a != @actor
  end

  def prev_actor
    a = @actor
    super
    Sound.play_cursor if a != @actor
  end

  def on_actor_change
    init_selection
    @socket_windows.each do |w|
      w.selected = false
    end
    @socket_windows[0].selected = true
    create_socket_windows
    @help_window.item = @actor
    @help_window.socket_num = item_max
    @help_window.refresh
  end

  def item
    socket_window.equip
  end
end

class Scene_EquipStoneItem < Scene_EquipStoneBase
  include ShowKey_HelpWindow
  attr_reader :item

  def prepare(item)
    @item = item
  end

  def show_key_tex
    if @stones_window.active
      super + [ShowKey_Help.lr_scroll]
    else
      super + [ShowKey_Help.stone_shift, ShowKey_Help.equip_info]
    end
  end

  def refresh_socket_windows
    @item.stones.each.with_index do |stone, window_id|
      @socket_windows[window_id].stone = stone || :empty
      @socket_windows[window_id].socket_id = window_id
      @socket_windows[window_id].max_index = item_max
    end
    super
  end

  def create_help_window
    @help_window = Window_Equip_Stone_Help_Item.new
    @help_window.item = @item
  end

  def equip_info_select_item
    @item
  end

  def item_max
    @item.stones.size
  end

  def visible_max
    4
  end

  def on_stones_ok
    @item = $game_party.create_socket_item(@item) do |i|
      @item = i
      super
    end
  end

  def pre_terminate
    super
    SceneManager.scene.prepare(@item) if SceneManager.scene_is?(Scene_Equip)
  end

  def on_socket_a
    return if socket_window.stone == :empty

    Sound.play_equip
    item.change_stone(socket_window.socket_id, nil)
    @item = $game_party.restore_socket_item(@item)
    refresh_socket_windows
  end
end

class Scene_Item
  include ShowKey_HelpWindow
  include FavoriteItem
  include EquipInfoScene

  def show_key_text
    if @category_window.active
      [ShowKey_Help.favorite_mode(@item_window.favorite_mode)]
    elsif @item_window.active && ![1, 2].include?(@category_window.index)
      [ShowKey_Help.favorite_item(@item_window.get_favorite_item_state),
       ShowKey_Help.favorite_mode(@item_window.favorite_mode),
       ShowKey_Help.lr_scroll]
    elsif @item_window.active
      [ShowKey_Help.equip_info,
       ShowKey_Help.favorite_item(@item_window.get_favorite_item_state),
       ShowKey_Help.favorite_mode(@item_window.favorite_mode),
       ShowKey_Help.lr_scroll]
    end
  end

  def enable_set_favorite_item?
    @item_window.active
  end

  def enable_change_favorite_mode?
    @item_window.active || @category_window.active
  end

  def equip_info_hide?
    return true if super

    super || ![1, 2].include?(@category_window.index) || !@item_window.active
  end

  def equip_info_select_item
    @item_window.item
  end
end

class Scene_ItemBase < Scene_MenuBase
  #--------------------------------------------------------------------------
  # ● アイテムの使用
  #--------------------------------------------------------------------------
  def use_item
    if item.warp_item?
      SceneManager.goto(Scene_Warp)
      SceneManager.scene.prepare(item)
    else
      play_se_for_item
      user.use_item(item)
      use_item_to_actors
      user.item_one_use_apply(item, item_target_actors, self)
      check_common_event
      check_gameover
      @actor_window.refresh
    end
  end

  alias h_scene_itembase_start start
  def start
    h_scene_itembase_start
    create_popup_window
  end

  def create_popup_window
    @popup_window = Window_Popup.new
    @popup_window.set_handler(:ok,	method(:close_popup_window))
    @popup_window.set_handler(:cancel,	method(:close_popup_window))
  end

  def on_actor_ok
    if item_usable?
      use_item
    else
      Sound.play_buzzer
      e = nil
      grow_effects = item.effects.select do |effect|
        effect.code == 42 # EFFECT_GROW
      end.uniq  do |effect|
        effect.data_id
      end.sort  do |a, b|
        a.data_id <=> b.data_id
      end
      grow_popup(grow_effects) if grow_effects.size >= 1 && !item_effects_valid?
    end
  end

  def grow_popup(effects)
    param_name = $data_system.terms.params[effects[0].data_id]
    actor_name = item_target_actors[0].name
    actor_name += "達" if item_target_actors.size > 1
    open_popup_window("#{actor_name}の#{param_name}はこれ以上成長しない…")
  end

  def open_popup_window(text)
    @actor_window.deactivate
    @popup_window.set_text(text)
    @popup_window.refresh
    @popup_window.open.activate
  end

  def close_popup_window
    @popup_window.close.deactivate
    @actor_window.activate
  end
end

class Scene_Load < Scene_File
  #--------------------------------------------------------------------------
  # ● ロード成功時の処理
  #--------------------------------------------------------------------------
  def on_load_success
    Sound.play_load
    fadeout_all
    $game_system.on_after_load
    $game_switches[NWConst::Sw::ON_GAME_START] = true
    SceneManager.goto(Scene_Map)
  end
end
class Scene_Map < Scene_Base
  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  alias h_scene_map_start start
  def start
    return process_trial_error if $game_system.party_lose_count.nil?

    h_scene_map_start
    $game_map.scene_start
    $game_temp.event_abort = false
  end

  #--------------------------------------------------------------------------
  # ● 引継ぎ不能時の処理
  #--------------------------------------------------------------------------
  def process_trial_error
    text = "このセーブデータは、引継ぎ不能な体験版で作成されたものです"
    text += "\n製品版では使用できないので、ニューゲームから開始してください"
    msgbox text
    SceneManager.exit
  end

  #--------------------------------------------------------------------------
  # ○ 全ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_all_windows
    create_message_window
    create_scroll_text_window
    create_location_window
    create_simple_status_window
    create_gain_medal_window
    create_skillname_window
  end

  #--------------------------------------------------------------------------
  # ● 簡易ステータスウィンドウの作成
  #--------------------------------------------------------------------------
  def create_simple_status_window
    @simple_status_window = Window_SimpleStatus.new($game_actors[NWConst::Actor::LUCA])
    @simple_status_window.openness = 0
  end

  #--------------------------------------------------------------------------
  # ● スキル名ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_skillname_window
    @sname_window = Window_SkillName.new
  end

  #--------------------------------------------------------------------------
  # ● 獲得メダルウィンドウの作成
  #--------------------------------------------------------------------------
  def create_gain_medal_window
    @gain_medal_window = Window_GainMedal.new
  end

  #--------------------------------------------------------------------------
  # ● メニュー画面の呼び出し
  #--------------------------------------------------------------------------
  def call_menu
    DataManager.auto_save_game
    Sound.play_ok
    SceneManager.call(Scene_Menu)
    Window_MenuCommand.init_command_position
  end

  #--------------------------------------------------------------------------
  # ○ シーン遷移に関連する更新
  #--------------------------------------------------------------------------
  alias h_scene_map_update_scene update_scene
  def update_scene
    h_scene_map_update_scene
    return if scene_changing?
    return if $game_map.interpreter.running?
    return if $game_player.moving?

    update_change_party
    update_draw_map
    update_call_castle
    update_button_event
  end

  #--------------------------------------------------------------------------
  # ● 地図の表示
  #--------------------------------------------------------------------------
  def update_draw_map
    return unless Input.trigger?(:L)
    return unless $game_map.field?
    return if $game_map.interpreter.running?

    Input.update
    $game_temp.reserve_common_event(NWConst::Common::MAP_DRAW)
  end

  #--------------------------------------------------------------------------
  # ● ポケット魔王城のショートカット
  #--------------------------------------------------------------------------
  def update_call_castle
    return unless Input.trigger?(:Y) || Input.trigger?(:Z)
    return unless $game_map.field?
    return unless $game_party.has_item?($data_items[NWConst::Item::POCKET_CASTLE])
    Input.update
    $game_temp.reserve_common_event(NWConst::Common::CALL_CASTLE)
  end
  #--------------------------------------------------------------------------
  # ○ 場所移動後の処理
  #--------------------------------------------------------------------------
  alias h_scene_map_post_transfer post_transfer
  def post_transfer
    @spriteset.refresh_characters if $game_map.field?
    if $game_party.reserve_member
      $game_party.set_temp_actors($game_party.reserve_member)
      $game_party.reserve_member = nil
      @spriteset.refresh_characters
    end
    h_scene_map_post_transfer
  end
  #--------------------------------------------------------------------------
  # ○ バトル画面遷移の前処理
  #--------------------------------------------------------------------------
  alias h_scene_map_pre_battle_scene pre_battle_scene
  def pre_battle_scene
    Audio.battle_prepare
    h_scene_map_pre_battle_scene
  end

  def update_change_party
    return unless Input.trigger?(:Y) || Input.trigger?(:Z)
    return if $game_player.moving?
    return if $game_map.field?
    return unless $game_party.multi_party?
    return if $game_map.interpreter.running?

    Input.update
    $game_party.next_multi_party
  end

  def update_button_event
    return unless Input.trigger?(:R)

    Input.update
    $game_map.start_button_event
  end

  def scene_change_ok?
    !$game_message.busy? && !$game_message.visible && !$game_map.busy?
  end
end

class Scene_Menu < Scene_MenuBase
  def start
    super
    create_command_window
    create_gold_window
    create_status_window
    create_party_recover_window
  end

  def create_party_recover_window
    @party_recover_window = Window_PartyRecover.new
    @party_recover_window.y = Graphics.height - @gold_window.height - @party_recover_window.height
  end

  #--------------------------------------------------------------------------
  # ○ コマンドウィンドウの作成
  #--------------------------------------------------------------------------
  def create_command_window
    @command_window = Window_MenuCommand.new
    @command_window.set_handler(:item,      method(:command_item))
    @command_window.set_handler(:skill,     method(:command_personal))
    @command_window.set_handler(:equip,     method(:command_personal))
    @command_window.set_handler(:status,    method(:command_personal))
    @command_window.set_handler(:formation, method(:command_formation))
    @command_window.set_handler(:save,      method(:command_save))
    @command_window.set_handler(:game_end,  method(:command_game_end))
    @command_window.set_handler(:cancel,    method(:return_scene))
    @command_window.set_handler(:ability, method(:command_personal))
    @command_window.set_handler(:library, method(:command_library))
    @command_window.set_handler(:config, method(:command_config))
    @command_window.set_handler(:stone,  method(:command_personal))
    @command_window.set_handler(:extra,  method(:command_extra))
  end

  #--------------------------------------------------------------------------
  # ○ コマンド［スキル］［装備］［ステータス］
  #--------------------------------------------------------------------------
  def command_personal
    @status_window.select(0)
    @status_window.activate
    @status_window.set_handler(:ok,     method(:on_personal_ok))
    @status_window.set_handler(:cancel, method(:on_personal_cancel))
  end

  #--------------------------------------------------------------------------
  # ○ コマンド［並び替え］
  #--------------------------------------------------------------------------
  def command_formation
    @status_window.select(0)
    @status_window.activate
    @status_window.set_handler(:ok,     method(:on_formation_ok))
    @status_window.set_handler(:cancel, method(:on_formation_cancel))
  end

  #--------------------------------------------------------------------------
  # ○ 個人コマンド［決定］
  #--------------------------------------------------------------------------
  def on_personal_ok
    Sound.play_ok
    case @command_window.current_symbol
    when :skill
      SceneManager.call(Scene_Skill)
    when :equip
      SceneManager.call(Scene_Equip)
    when :status
      SceneManager.call(Scene_Status)
    when :ability
      SceneManager.call(Scene_Ability)
    when :stone
      SceneManager.call(Scene_EquipStoneActor)
    end
  end

  #--------------------------------------------------------------------------
  # ○ 並び替え［決定］
  #--------------------------------------------------------------------------
  def on_formation_ok
    if @status_window.pending_index >= 0
      Sound.play_ok
      $game_party.swap_order(@status_window.index, @status_window.pending_index)
      @status_window.pending_index = -1
      @status_window.redraw_item(@status_window.index)
    else
      Sound.play_ok
      @status_window.pending_index = @status_window.index
    end
    @status_window.activate
  end

  #--------------------------------------------------------------------------
  # ○ 並び替え［キャンセル］
  #--------------------------------------------------------------------------
  def on_formation_cancel
    Sound.play_cancel
    if @status_window.pending_index >= 0
      @status_window.pending_index = -1
      @status_window.activate
    else
      @status_window.unselect
      @command_window.activate
    end
  end

  def command_config
    SceneManager.call(Scene_Config)
  end

  def command_library
    SceneManager.call(Scene_Library)
    SceneManager.scene.play_bgm
  end

  def command_extra
    @party_recover_window.recover
    SceneManager.goto(Scene_Map) if $game_temp.common_event_reserved?
    check_gameover
    @status_window.refresh
    @party_recover_window.refresh
    @gold_window.refresh
  end
end

class Scene_Skill < Scene_ItemBase
  include ShowKey_HelpWindow
  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    create_help_window
    create_command_window
    create_status_window
    create_item_window
    create_key_help_window
  end

  #--------------------------------------------------------------------------
  # ● 操作ヘルプウィンドウの生成
  #--------------------------------------------------------------------------
  def create_key_help_window
    @key_help_window = Window_Help_Color.new(2)
    @key_help_window.y = Graphics.height - @key_help_window.height
    @key_help_window.viewport = @viewport
    @key_help_window.set_text(Help.skill_type_key)
  end

  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    @key_help_window.set_text(Help.skill_type_key)
  end

  #--------------------------------------------------------------------------
  # ● コマンド［スキル］
  #--------------------------------------------------------------------------
  def command_skill
    @actor.set_last_stype(@command_window.current_ext)
    @item_window.activate
    @item_window.select_last
    @key_help_window.hide
  end

  #--------------------------------------------------------------------------
  # ● アイテム［決定］
  #--------------------------------------------------------------------------
  def on_item_ok
    @actor.set_last_skill(@command_window.current_ext, item)
    $game_system.party_recover.setup(@actor, item)
    determine_item
  end

  #--------------------------------------------------------------------------
  # ● アイテム［キャンセル］
  #--------------------------------------------------------------------------
  def on_item_cancel
    @item_window.unselect
    @command_window.activate
    @key_help_window.show
  end

  def show_key_text
    if @command_window.active
      [ShowKey_Help.stype_move, ShowKey_Help.stype_disable, ShowKey_Help.lr_actor]
    elsif @item_window.active
      [ShowKey_Help.lr_scroll]
    end
  end
end

class Scene_Status
  include ShowKey_HelpWindow
  include EquipInfoScene
  #--------------------------------------------------------------------------
  # ○ 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    create_main_status_window
    create_simple_status_window
    create_root_command_window
    create_now_class_window
  end

  def create_now_class_window
    @now_class_window = Foo::JobChange::Window_ClassStatusEx.new
    @main_status_window.now_class_window = @now_class_window
  end

  def update
    super
    if @main_status_window.active and @root_command_window.index == 0 and
       [1, 2].include?(@main_status_window.now_class_state)
      @now_class_window.show
      @viewport.rect.width = 160
    else
      @now_class_window.hide
      @viewport.rect.width = Graphics.width
    end
  end

  #--------------------------------------------------------------------------
  # ● メインステータスウィンドウの生成
  #--------------------------------------------------------------------------
  def create_main_status_window
    @main_status_window = Foo::Status::Window_MainStatus.new
    @main_status_window.viewport = @viewport
    @main_status_window.set_handler(:cancel, method(:process_main_status_cancel))
    @main_status_window.set_handler(:pagedown, method(:next_actor))
    @main_status_window.set_handler(:pageup, method(:prev_actor))
    @main_status_window.set_handler(:keep_on_actor_change, nil)
    @main_status_window.actor = @actor
  end

  #--------------------------------------------------------------------------
  # ● メインステータスのキャンセル
  #--------------------------------------------------------------------------
  def process_main_status_cancel
    @main_status_window.deactivate
    @root_command_window.activate
  end

  #--------------------------------------------------------------------------
  # ● シンプルステータスウィンドウの生成
  #--------------------------------------------------------------------------
  def create_simple_status_window
    @simple_status_window = Foo::Status::Window_SimpleStatus.new
    @simple_status_window.viewport = @viewport
    @simple_status_window.actor = @actor
    @simple_status_window.refresh
  end

  #--------------------------------------------------------------------------
  # ● ルートコマンドウィンドウの生成
  #--------------------------------------------------------------------------
  def create_root_command_window
    @root_command_window = Foo::Status::Window_RootCommand.new(@main_status_window)
    @root_command_window.set_handler(:ok, method(:process_root_command_ok))
    @root_command_window.set_handler(:cancel, method(:return_scene))
    @root_command_window.set_handler(:pagedown, method(:next_actor))
    @root_command_window.set_handler(:pageup, method(:prev_actor))
    @root_command_window.set_handler(:keep_on_actor_change, nil)
  end

  #--------------------------------------------------------------------------
  # ● ルートコマンドの決定
  #--------------------------------------------------------------------------
  def process_root_command_ok
    @root_command_window.deactivate
    @main_status_window.activate
  end

  #--------------------------------------------------------------------------
  # ● アクターの切り替え
  #--------------------------------------------------------------------------
  def on_actor_change
    @main_status_window.actor   = @actor
    @simple_status_window.actor = @actor
    @main_status_window.refresh
    @simple_status_window.refresh
  end

  def show_key_sprite_window
    @simple_status_window
  end

  def show_key_text
    if @root_command_window.active
      [ShowKey_Help.lr_actor]
    elsif @main_status_window.active && @root_command_window.index == 1
      [ShowKey_Help.equip_info,ShowKey_Help.lr_actor]
    elsif @main_status_window.active
      [ShowKey_Help.lr_actor]
    else
      []
    end
  end

  def equip_info_hide?
    super || !@main_status_window.active || @main_status_window.root_index != 1
  end

  def equip_info_select_item
    @actor.equips[@main_status_window.index]
  end

  def equip_info_select_actor
    @actor
  end
end

class Scene_Title < Scene_Base
  #--------------------------------------------------------------------------
  # ● コマンド［ニューゲーム］
  #--------------------------------------------------------------------------
  def command_new_game
    DataManager.setup_new_game
    close_command_window
    fadeout_all
    $game_map.autoplay
    $game_switches[NWConst::Sw::ON_GAME_START] = true
    SceneManager.goto(Scene_Map)
  end

  def start
    $game_temp.clear_bugfix_flag
    super
    SceneManager.clear
    Graphics.freeze
    call_title_common
    create_background
    create_foreground
    create_command_window
    play_title_music
  end

  def call_title_common
    $game_temp.title_bg = nil
    $game_temp.title_bgm = nil
    $game_message.clear
    interpreter = Game_Interpreter.new
    interpreter.setup($data_common_events[1].list)
    interpreter.update while interpreter.running?
  end

  def create_background
    @sprite1 = Sprite.new
    title_background_bitmap =
      if $game_temp.title_bg
        Cache.load_bitmap("#{File.dirname($game_temp.title_bg)}/", File.basename($game_temp.title_bg))
      else
        Cache.title1($data_system.title1_name)
      end
    @sprite1.bitmap = title_background_bitmap
    @sprite2 = Sprite.new
    @sprite2.bitmap = Cache.title2($data_system.title2_name)
    center_sprite(@sprite1)
    center_sprite(@sprite2)
  end

  def play_title_music
    if $game_temp.title_bgm
      RPG::BGM.new($game_temp.title_bgm,100,100,true).play
    else
      $data_system.title_bgm.play
    end
    RPG::BGS.stop
    RPG::ME.stop
  end

  def create_foreground
    @foreground_sprite = Sprite.new
    @foreground_sprite.bitmap = Bitmap.new(Graphics.width, Graphics.height)
    @foreground_sprite.z = 100
    draw_game_title if $data_system.opt_draw_title
    @foreground_sprite.bitmap.font.size = 24
    rect = Rect.new(4, 0, Graphics.width, @foreground_sprite.bitmap.font.size)
    @foreground_sprite.bitmap.draw_text(rect, NWPatch.ver_str)
  end

  def create_command_window
    @command_window = Window_TitleCommand.new
    @command_window.set_handler(:new_game, method(:command_new_game))
    @command_window.set_handler(:continue, method(:command_continue))
    @command_window.set_handler(:auto_continue, method(:command_auto_continue))
    @command_window.set_handler(:shutdown, method(:command_shutdown))
    @command_window.set_handler(:call_library_h, method(:command_call_library_h))
  end

  def command_call_library_h
    DataManager.load_game(DataManager.latest_savefile_index)
    interpreter = Game_Interpreter.new
    interpreter.setup($data_common_events[119].list)
    interpreter.update while interpreter.running?
    SceneManager.call(Scene_Library_H)
  end

  def command_auto_continue
    close_command_window
    SceneManager.call(Scene_AutoSave_Load)
  end
end
