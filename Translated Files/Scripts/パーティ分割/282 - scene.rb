class Scene_MultiPartyEdit < Scene_MenuBase
  ERROR_MESSAGE = "Please include %s in your party."
  CONFIRM_MESSAGE = "Confirm party formation?"
  CANCEL_MESSAGE = "Cancel party formation?"
  include ShowKey_HelpWindow
  def start
    super
    $game_party.multi_party_canceled = false
    @party_size ||= 3
    @member_size ||= 4
    @fix_members = case @party_size
                   when 2
                     [Game_Party::Member.new([5]), Game_Party::Member.new([26]), Game_Party::Member.new]
                   when 3
                     [Game_Party::Member.new([NWConst::Actor::LUCA]), Game_Party::Member.new([26]),
                      Game_Party::Member.new([5])]
                   end
    @start_members = $game_party.multi_party.load_history(-@party_size) || []
    @required_members = @party_size == 2 ? Game_Party::Member.new([NWConst::Actor::LUCA]) : Game_Party::Member.new
    create_all_window
    load_window_settings
  end

  def prepare(party_size, member_size = 4)
    @party_size = party_size
    @member_size = member_size
  end

  def create_all_window
    @confirm_window = MultiParty::Window_Confirm.new
    @popup_confirm_window = Window_PopupConfirm.new
    @popup_confirm_window.set_handler(:cancel, method(:popup_confirm_cancel))
    create_help_window
    create_sort_eval_window
    create_party_member_window
    create_wait_member_window
    create_actor_status_window
    create_popup_window
  end

  def create_help_window
    @help_window = MultiParty::Window_Help.new(@party_size)
  end

  def create_sort_eval_window
    @sort_eval_window = Foo::PTEdit::Window_SortEval.new
    @sort_eval_window.set_all_refresh_method(method(:refresh_windows))
    @sort_eval_window.set_disable_method(method(:disable_sort?))
  end

  def create_popup_window
    @popup_window = Window_Popup.new
    @popup_window.set_handler(:ok,	method(:close_popup_window))
    @popup_window.set_handler(:cancel,	method(:close_popup_window))
  end

  def show_key_text
    return [] if @popup_window.active

    result = []
    if @wait_member_window.active
      actor = @wait_member_window.select_actor
      flag = actor ? actor.favorite_edit? : false
      result += ["#{ShowKey_Help.favorite_actor(flag)}"]
    else
      result += ["#{Vocab.key_a}:Remove"]
    end

    result += ["#{Vocab.key_x}:Status", "#{Vocab.key_y}: Sort"]
    result
  end

  def disable_sort?
    false
  end

  def create_actor_status_window
    @actor_status_window = Foo::PTEdit::Window_ActorStatus.new(@party_member_windows, @wait_member_window)
  end

  def active_party_window
    @party_member_windows._data
  end

  def active_window
    @wait_member_window.active ? @wait_member_window : active_party_window
  end

  def create_party_member_window
    l = @help_window.line_height
    h = 0
    ws = []
    @party_size.times do |i|
      w = MultiParty::Window_MultiMember.new(0, l, i + 1, @fix_members[i], @start_members[i])
      ws.push(w)
      instance_variable_set("@_w#{i}", w)
    end
    @party_member_windows = MultiParty::Windows_MultiMember.new(ws, @member_size, @confirm_window)
    (@party_member_windows.to_a + [@confirm_window]).each_with_index do |w, _i|
      w.set_handler(:cancel, method(:cancel_scene))
      w.set_handler(:ok, method(:select_party_to_wait))
      w.set_handler(:cursor_down, proc do
        @party_member_windows.id += 1
        active_party_window.select([1,active_party_window.item_max - 1].min)
        Input.update
      end)
      w.set_handler(:cursor_up, proc do
        @party_member_windows.id -= 1
        active_party_window.select(active_party_window.item_max - 1)
        Input.update
      end)
      w.set_handler(:call_status, method(:call_scene_status))
      w.set_handler(:move_member, method(:move_member))
    end
    @confirm_window.set_handler(:ok, method(:confirm_ok))
    @party_member_windows.refresh
  end

  def confirm_ok
    unless @required_members.all? { |m| @party_member_windows.to_a.any? { |w| w.actors.include?(m) } }
      return open_popup_window
    end
    active_party_window.deactivate
    @popup_confirm_window.set_title(CONFIRM_MESSAGE)
    @popup_confirm_window.set_handler(:ok, method(:popup_confirm_ok))
    @popup_confirm_window.show.activate.select(0)
  end

  def popup_confirm_ok
    Sound.play_ok
    $game_party.setup_multipartymember(@party_member_windows.to_a.map(&:actors).map(&:to_a))
    return_scene
  end

  def cancel_scene
    active_party_window.deactivate
    @popup_confirm_window.set_title(CANCEL_MESSAGE)
    @popup_confirm_window.set_handler(:ok, proc do 
      Sound.play_ok
      $game_party.multi_party_canceled = true
      return_scene
    end)
    @popup_confirm_window.show.activate.select(0)
  end

  def move_member
    party = active_party_window
    party.actors.delete_at(party.index - 1)
    refresh_windows
  end

  def create_wait_member_window
    @wait_member_window = MultiParty::Window_WaitMember.new(@sort_eval_window, @party_member_windows.to_a)
    @wait_member_window.set_handler(:cancel, method(:select_wait_to_party))
    @wait_member_window.set_handler(:ok, method(:swap_member))
    @wait_member_window.set_handler(:call_status, method(:call_scene_status))
    @wait_member_window.set_handler(:call_extra, method(:on_wait_member_extra))
  end

  def on_wait_member_extra
    actor = @wait_member_window.select_actor
    actor.favorite_edit_flag = !actor.favorite_edit_flag
    @wait_member_window.refresh
  end

  def swap_member
    party = active_party_window
    wait = @wait_member_window
    if party.no_actor?
      party.actors.push(wait.actors[wait.index])
    else
      party.actors[party.index - 1] = wait.actors[wait.index]
    end
    refresh_windows
    select_wait_to_party
  end

  def load_window_settings
    @select_data ||= {
      :eval_id => 0,
      :party => [0, 1],
      :wait => [false, -1],
      :parties => []
    }

    @sort_eval_window.eval_id = @select_data[:eval_id]
    @party_member_windows.id = @select_data[:party][0]
    active_party_window.select(@select_data[:party][1])
    active_party_window.deactivate
    w = @select_data[:wait][0] ? @wait_member_window : active_party_window
    @party_member_windows.to_a.each_with_index do |w, i|
      w.actors = @select_data[:parties][i] if @select_data[:parties][i]
      w.refresh
    end

    @wait_member_window.refresh
    @wait_member_window.select(@select_data[:wait][1])
    @actor_status_window.refresh
    w.activate
  end

  def save_window_settings
    @select_data = {
      :eval_id => @sort_eval_window.eval_id,
      :party => [@party_member_windows.id, active_party_window.index],
      :wait => [@wait_member_window.active, @wait_member_window.index],
      :parties => @party_member_windows.to_a.map { |w| w.actors }
    }
  end

  def select_party_to_wait
    active_party_window.deactivate
    @wait_member_window.activate
    @wait_member_window.select(0)
  end

  def select_wait_to_party
    active_party_window.activate
    @wait_member_window.deactivate
    @wait_member_window.unselect
  end

  def refresh_windows
    @sort_eval_window.refresh
    @party_member_windows.to_a.each(&:refresh)
    @wait_member_window.refresh
    @actor_status_window.refresh
  end

  def call_scene_status
    save_window_settings
    $game_party.menu_actor = active_window.select_actor
    $game_party.set_menu_actors(active_window.actors)
    SceneManager.call(Scene_Status)
  end




  def popup_confirm_cancel
    @popup_confirm_window.hide.deactivate
    active_party_window.activate
  end

  def return_scene
    $game_party.clear_menu_actors
    super
  end

  def open_popup_window
    active_party_window.deactivate
    members = @required_members.select { |m| @party_member_windows.to_a.none? { |w| w.actors.include?(m) } }
    @popup_window.set_text(format(ERROR_MESSAGE, members.map { |m| $game_actors[m].name(&:name) }.join("、")))
    @popup_window.refresh
    @popup_window.open.activate
  end

  def close_popup_window
    @popup_window.close.deactivate
    active_party_window.activate
  end
end
