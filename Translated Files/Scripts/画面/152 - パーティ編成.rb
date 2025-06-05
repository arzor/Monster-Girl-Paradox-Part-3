# =パーティ編成画面
#
#
#
#
# ==更新履歴
#   Date     Version Author Comment
# ==15/09/03 2.0.2   トリス 統合J～U Q
# ==17/05/16 2.0.4   トリス 統合V～W W
#

#==============================================================================
# ■ NWConst::PTEdit
#==============================================================================
module NWConst::PTEdit
  # カテゴリー優先順位
  CATEGORY_PRIORITY = [
    :メイン,
    :魔王,
    :邪神,
    :女神,
    :人間,
    :妖魔,
    :亜人,
    :淫魔,
    :吸血鬼,
    :人魚,
    :エルフ,
    :妖精,
    :スライム,
    :魔獣,
    :妖狐,
    :ラミア,
    :スキュラ,
    :鳥,
    :竜,
    :陸棲種,
    :海棲種,
    :虫,
    :植物,
    :ゾンビ,
    :ゴースト,
    :ドール,
    :キメラ,
    :ロイド,
    :天使,
    :アポトーシス,
    :その他,
    :コラボ
  ]
  CONFIRM_TEXT = "Teleport to %s?"
end

# 重複防止用ネームスペース
module Foo; module PTEdit; end; end

#==============================================================================
# ■ NWConst::PartyManager（nwapeg）
#----------------------------------------------------------------------------
# パーティーを管理するメソッドの集合です。
#==============================================================================
module NWConst::PartyManager
  #--------------------------------------------------------------------------
  # ● パーティメンバーの取得
  #--------------------------------------------------------------------------
  def party_members
    $game_party.all_members
  end

  #--------------------------------------------------------------------------
  # ● 城待機メンバーの取得
  #--------------------------------------------------------------------------
  def stand_members
    $game_party.stand_members
  end

  #--------------------------------------------------------------------------
  # ● パーティメンバー　指定アクターがいずれかの人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_party_actor_id?(actor_id)
    $game_party.exist_party_actor_id?(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● 城待機メンバー　　指定アクターがいずれかの人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_stand_actor_id?(actor_id)
    $game_party.exist_stand_actor_id?(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● 全てのメンバー　　指定アクターがいずれかの人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_all_actor_id?(actor_id)
    $game_party.exist_all_actor_id?(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● パーティメンバー　指定アクターが指定人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_party_persona_id?(persona_id)
    $game_party.exist_party_persona_id?(persona_id)
  end

  #--------------------------------------------------------------------------
  # ● 城待機メンバー　　指定アクターが指定人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_stand_persona_id?(persona_id)
    $game_party.exist_stand_persona_id?(persona_id)
  end

  #--------------------------------------------------------------------------
  # ● 全てのメンバー　　指定アクターが指定人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_all_persona_id?(persona_id)
    $game_party.exist_all_persona_id?(persona_id)
  end

  #--------------------------------------------------------------------------
  # ● 城待機メンバーを加える
  #--------------------------------------------------------------------------
  def add_stand_actor(actor_id)
    $game_party.add_stand_actor(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● 城待機アクターを外す
  #--------------------------------------------------------------------------
  def remove_stand_actor(actor_id)
    $game_party.remove_stand_actor(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● アクターを城待機から変更する
  #--------------------------------------------------------------------------
  def move_actor(actor_id)
    $game_party.move_actor(actor_id)
  end

  def remove_actor(actor_id)
    $game_party.remove_actor(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● アクターを城待機に変更する
  #--------------------------------------------------------------------------
  def move_stand_actor(actor_id)
    $game_party.move_stand_actor(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● メンバーを城待機に変更する
  #--------------------------------------------------------------------------
  def move_stand_member(index)
    actor = $game_party.all_members[index]
    $game_party.move_stand_actor(actor.id) unless actor.nil?
  end
end

#==============================================================================
# ■ Game_Party（nwapeg）
#==============================================================================
class Game_Party < Game_Unit
  #--------------------------------------------------------------------------
  # ○ オブジェクト初期化
  #--------------------------------------------------------------------------
  alias nw_override_initialize initialize
  def initialize
    nw_override_initialize
    @include_actors = Member.new
  end

  def stand_actors
    Member.new(include_actors.to_a - actors.to_a)
  end

  def include_actors
    return @temp_actors if temp_actors_use?

    @include_actors
  end

  def include_members
    include_actors.map { |v| $game_actors[v] }
  end

  #--------------------------------------------------------------------------
  # ● 城待機メンバーの取得
  #--------------------------------------------------------------------------
  def stand_members
    stand_actors.map { |v| $game_actors[v] }
  end

  #--------------------------------------------------------------------------
  # ● パーティメンバー　指定アクターが指定人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_party_persona_id?(persona_id)
    actors.include?(persona_id) && $game_actors[persona_id].id == persona_id
  end

  #--------------------------------------------------------------------------
  # ● 城待機メンバー　　指定アクターが指定人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_stand_persona_id?(persona_id)
    stand_actors.include?(persona_id) && $game_actors[persona_id].id == persona_id
  end

  #--------------------------------------------------------------------------
  # ● 全てのメンバー　　指定アクターが指定人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_all_persona_id?(persona_id)
    include_actors.include?(persona_id) && $game_actors[persona_id].id == persona_id
  end

  #--------------------------------------------------------------------------
  # ● パーティメンバー　指定アクターがいずれかの人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_party_actor_id?(actor_id)
    actors.include?(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● 城待機メンバー　　指定アクターがいずれかの人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_stand_actor_id?(actor_id)
    stand_actors.include?(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● 全てのメンバー　　指定アクターがいずれかの人格で存在するか？
  #--------------------------------------------------------------------------
  def exist_all_actor_id?(actor_id)
    include_actors.include?(actor_id)
  end

  # 仲間化可能？
  def followable?(enemy)
    enemy.follower? && !follow?(enemy.follower_actor_id)
  end

  # 仲間化フラグ
  def follow?(actor_id)
    @include_actors.include?(actor_id)
  end

  def set_actors(actors)
    @actors.set(actors)
    @include_actors.push(*actors)
  end

  #--------------------------------------------------------------------------
  # ○ アクターを加える  addStand/move/add
  #--------------------------------------------------------------------------
  def add_actor(actor_id)
    add_stand_actor(actor_id)
    @actors.push(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● 城待機メンバーを加える
  #--------------------------------------------------------------------------
  def add_stand_actor(actor_id)
    @include_actors.push(actor_id)
  end

  #--------------------------------------------------------------------------
  # ○ アクターを外す
  #--------------------------------------------------------------------------
  def remove_actor(actor_id)
    @include_actors.delete(actor_id)
    @actors.delete(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● 城待機アクターを外す
  #--------------------------------------------------------------------------
  def remove_stand_actor(actor_id)
    remove_actor(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● アクターを城待機から変更する
  #--------------------------------------------------------------------------
  def move_actor(actor_id)
    return unless exist_stand_actor_id?(actor_id)

    @actors.push(actor_id)
  end

  #--------------------------------------------------------------------------
  # ● アクターを城待機に変更する
  #--------------------------------------------------------------------------
  def move_stand_actor(actor_id)
    @actors.delete(actor_id)
  end
end

#==============================================================================
# ■ Game_Party
#==============================================================================
class Game_Party
  #--------------------------------------------------------------------------
  # ○ オブジェクト初期化
  #--------------------------------------------------------------------------
  alias nw_pt_edit_initialize initialize
  def initialize
    nw_pt_edit_initialize
    clear_menu_actors
  end

  #--------------------------------------------------------------------------
  # ● メニュー用アクター配列の設定（新規）
  #--------------------------------------------------------------------------
  def set_menu_actors(actors)
    @menu_actors = actors
  end

  #--------------------------------------------------------------------------
  # ● メニュー用アクター配列の消去（新規）
  #--------------------------------------------------------------------------
  def clear_menu_actors
    @menu_actors = nil
  end
  #--------------------------------------------------------------------------
  # ○ メニュー画面で次のアクターを選択
  #--------------------------------------------------------------------------
  alias nw_pt_edit_menu_actor_next menu_actor_next
  def menu_actor_next
    if @menu_actors.nil?
      nw_pt_edit_menu_actor_next
    else
      index = @menu_actors.index(menu_actor.id) || -1
      index = (index + 1) % @menu_actors.size
      self.menu_actor = $game_actors[@menu_actors[index]]
    end
  end
  #--------------------------------------------------------------------------
  # ○ メニュー画面で前のアクターを選択
  #--------------------------------------------------------------------------
  alias nw_pt_edit_menu_actor_prev menu_actor_prev
  def menu_actor_prev
    if @menu_actors.nil?
      nw_pt_edit_menu_actor_prev
    else
      index = @menu_actors.index(menu_actor.id) || 1
      index = (index + @menu_actors.size - 1) % @menu_actors.size
      self.menu_actor = $game_actors[@menu_actors[index]]
    end
  end

  #--------------------------------------------------------------------------
  # ● パーティメンバーの最大数を取得（新規）
  #--------------------------------------------------------------------------
  def party_member_max
    8 + $game_variables[NWConst::Var::PARTY_MAX_PLUS]
  end

  #--------------------------------------------------------------------------
  # ● パーティメンバー数が最大数かどうか toris
  #--------------------------------------------------------------------------
  def party_member_full?
    party_member_max <= all_members.size
  end
end

#==============================================================================
# ■ Game_Map
#==============================================================================
class Game_Map
  #--------------------------------------------------------------------------
  # ● ポケット魔王城？
  #--------------------------------------------------------------------------
  def pocket_castle?
    @map_id == 228 || ($data_mapinfos[@map_id].parent_id == 228)
  end
end

#==============================================================================
# ■ Foo::PTEdit::Window_Information
#==============================================================================
class Foo::PTEdit::Window_Information < Window_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super(0, 480 - fitting_height(4), 160, fitting_height(4))
    refresh
    activate
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    draw_information
  end

  #--------------------------------------------------------------------------
  # ● 情報の表示
  #--------------------------------------------------------------------------
  def draw_information
    change_color(normal_color)
    rect = Rect.new(0, 0, contents.width, line_height)

    texts = Help.party_edit
    texts.pop unless $game_map.pocket_castle?
    texts.each do |text|
      draw_text(rect, text)
      rect.y += line_height
    end
  end
end

#==============================================================================
# ■ Foo::PTEdit::Window_SortEval
#==============================================================================
class Foo::PTEdit::Window_SortEval < Window_Base
  attr_accessor :eval_id

  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super(480, 0, 160, fitting_height(1))
    self.z = 101
    @eval_id = 0
    @all_refresh_method = nil
    make_actor_categories
    refresh
    activate
  end

  #--------------------------------------------------------------------------
  # ● 標準パディングサイズの取得
  #--------------------------------------------------------------------------
  def standard_padding
    6
  end

  #--------------------------------------------------------------------------
  # ● 評価方法の取得
  #--------------------------------------------------------------------------
  def eval
    eval_array[@eval_id]
  end

  #--------------------------------------------------------------------------
  # ● 評価方法配列の取得
  #--------------------------------------------------------------------------
  def eval_array
    default_eval_array + @actor_categories
  end

  #--------------------------------------------------------------------------
  # ● 基本評価方法配列の取得
  #--------------------------------------------------------------------------
  def default_eval_array
    [:id, :name, :base_level, :favorite]
  end

  #--------------------------------------------------------------------------
  # ● 基本評価方法配列の取得
  #--------------------------------------------------------------------------
  def make_actor_categories
    @actor_categories = $game_party.include_members.collect { |m| m.actor.actor_categories }.flatten.uniq
    @actor_categories.sort_by! { |a| NWConst::PTEdit::CATEGORY_PRIORITY.index(a) }
  end

  #--------------------------------------------------------------------------
  # ● 現在の評価値はカテゴリータグか？
  #--------------------------------------------------------------------------
  def category_tag?
    default_eval_array.size <= @eval_id
  end

  #--------------------------------------------------------------------------
  # ● オールリフレッシュメソッドの設定
  #--------------------------------------------------------------------------
  def set_all_refresh_method(method)
    @all_refresh_method = method
  end

  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    process_eval
  end

  #--------------------------------------------------------------------------
  # ● 無効メソッドの設定
  #--------------------------------------------------------------------------
  def set_disable_method(method)
    @disable_method = method
  end

  #--------------------------------------------------------------------------
  # ● ソート方法の切り替え
  #--------------------------------------------------------------------------
  def process_eval
    return unless Input.trigger?(:Y)
    return if @disable_method.call

    Input.update
    Sound.play_ok
    @eval_id = (@eval_id + 1) % eval_array.size
    @all_refresh_method.call unless @all_refresh_method.nil?
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    draw_eval
  end

  #--------------------------------------------------------------------------
  # ● ソート方法の表示
  #--------------------------------------------------------------------------
  def draw_eval
    texts = {
      :id => "ID Order",
      :name => "By Name",
      :base_level => "By Base Level",
      :favorite => "Favorite"
    }
    text = texts.include?(eval) ? texts[eval] : eval.to_s
    change_color(system_color)
    rect = Rect.new(0, 0, contents.width, line_height)
    draw_text(rect, text, 1)
  end
end

#==============================================================================
# ■ Foo::PTEdit::Window_PartyMember
#==============================================================================
class Foo::PTEdit::Window_PartyMember < Window_Command
  #------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #------------------------------------------------------------------------
  attr_reader :actors

  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    make_id_list
    super(0, 0)
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得
  #--------------------------------------------------------------------------
  def window_width
    160
  end

  #--------------------------------------------------------------------------
  # ● 表示行数の取得
  #--------------------------------------------------------------------------
  def visible_line_number
    $game_party.party_member_max.clamp(8, 14)
  end

  #--------------------------------------------------------------------------
  # ● アクター無しを表す文字列
  #--------------------------------------------------------------------------
  def no_actor_name
    "【Empty】"
  end

  #--------------------------------------------------------------------------
  # ● 選択中のアクターはいない？
  #--------------------------------------------------------------------------
  def no_actor?
    @actors.size <= index
  end

  #--------------------------------------------------------------------------
  # ● 選択中のパーティアクター取得
  #--------------------------------------------------------------------------
  def select_actor
    no_actor? ? nil : $game_actors[@actors[index]]
  end

  #--------------------------------------------------------------------------
  # ● コマンドリストの作成
  #--------------------------------------------------------------------------
  def make_command_list
    @actors.each { |id| add_command($game_actors[id].name, :ok) }
    ($game_party.party_member_max - @actors.size).times { add_command(no_actor_name, :ok) }
    # ルカの固定
    @actors.each_with_index do |id, i|
      continue if id.nil?
      @list[i][:enabled] = false if $game_actors[id].luca?
    end
  end

  #--------------------------------------------------------------------------
  # ● パーティメンバーIDリストの作成
  #--------------------------------------------------------------------------
  def make_id_list
    @actors = $game_party.all_members.collect { |member| member.id }
  end

  #--------------------------------------------------------------------------
  # ● 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    color = index < 4 ? normal_color : system_color
    change_color(color, command_enabled?(index))
    draw_text(item_rect_for_text(index), command_name(index), alignment)
  end

  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    process_call_status
    process_move_member
  end

  #--------------------------------------------------------------------------
  # ● ステータス画面を呼び出す
  #--------------------------------------------------------------------------
  def process_call_status
    return unless cursor_movable?

    return unless Input.trigger?(:X)

    Input.update
    if no_actor?
      Sound.play_buzzer
    else
      Sound.play_ok
      call_handler(:call_status)
    end
  end

  #--------------------------------------------------------------------------
  # ● メンバーを待機状態に
  #--------------------------------------------------------------------------
  def process_move_member
    return unless cursor_movable?

    return unless Input.trigger?(:A)

    Input.update
    if @actors.size > 1 && !no_actor? && !select_actor.luca?
      Sound.play_equip
      call_handler(:move_member)
      select(0)
    else
      Sound.play_buzzer
    end
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    super
  end
end

#==============================================================================
# ■ Foo::PTEdit::Window_WaitMember
#==============================================================================
class Foo::PTEdit::Window_WaitMember < Window_Command
  #------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #------------------------------------------------------------------------
  attr_reader :actors

  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(sort, party)
    @sort = sort
    @party = party
    make_id_list
    super(160, line_height)
    unselect
    deactivate
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得
  #--------------------------------------------------------------------------
  def window_width
    480
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウ高さの取得
  #--------------------------------------------------------------------------
  def window_height
    360 - line_height
  end

  #--------------------------------------------------------------------------
  # ● 桁数の取得
  #--------------------------------------------------------------------------
  def col_max
    3
  end

  #--------------------------------------------------------------------------
  # ● 横に項目が並ぶときの空白の幅を取得
  #--------------------------------------------------------------------------
  def spacing
    8
  end

  #--------------------------------------------------------------------------
  # ● 選択中のアクターはいない？
  #--------------------------------------------------------------------------
  def no_actor?
    index == -1 || index >= item_max
  end

  #--------------------------------------------------------------------------
  # ● 選択中の待機アクター取得
  #--------------------------------------------------------------------------
  def select_actor
    no_actor? ? nil : $game_actors[@actors[index]]
  end

  #--------------------------------------------------------------------------
  # ● コマンドリストの作成【オーバーライド】
  #--------------------------------------------------------------------------
  def make_command_list
    @actors.each do |id|
      enabled = !@party.actors.include?(id)
      add_command($game_actors[id].name, :ok, enabled)
    end
  end

  #--------------------------------------------------------------------------
  # ● 待機メンバーIDリストの作成
  #--------------------------------------------------------------------------
  def make_id_list(category = :all_category)
    result = $game_party.include_members
    result.select! { |a| a.actor.actor_categories.include?(category) } if category != :all_category
    @actors = result.map(&:id)
  end


  def command_color(index)
    return super if index == -1 || actors[index].nil?
    return tp_gauge_color2 if $game_actors[actors[index]].favorite_edit?

    super
  end

  def process_handling
    return unless open? && active

    return process_extra if handle?(:call_extra) && Input.trigger?(:A)
    return process_call_status if Input.trigger?(:X)
    return process_move_best_place if Input.trigger?(:Z)

    super
  end

  def process_extra
    unless select_actor
      Sound.play_buzzer
      return
    end

    Input.update
    Sound.play_ok
    call_handler(:call_extra)
  end

  #--------------------------------------------------------------------------
  # ● ステータス画面を呼び出す
  #--------------------------------------------------------------------------
  def process_call_status
    unless select_actor
      Sound.play_buzzer
      return
    end
    Input.update
    Sound.play_ok
    call_handler(:call_status)
  end

  #--------------------------------------------------------------------------
  # ● 仲間のナワバリに移動する
  #--------------------------------------------------------------------------
  def process_move_best_place
    return unless $game_map.pocket_castle?

    Input.update
    if current_item_enabled? && select_actor.actor.best_place
      Sound.play_ok
      call_handler(:move_best_place)
    else
      Sound.play_buzzer
    end
  end

  #--------------------------------------------------------------------------
  # ● ソート
  #--------------------------------------------------------------------------
  def sort
    if @sort.category_tag?
      make_id_list(@sort.eval)
    else
      make_id_list
      method = "sort_by_#{@sort.eval}".to_sym
      send(method)
    end
  end

  #--------------------------------------------------------------------------
  # ● ソート（ID順）
  #--------------------------------------------------------------------------
  def sort_by_id
    @actors.sort_by! { |id| $game_actors[id].sort_obj }
  end

  #--------------------------------------------------------------------------
  # ● ソート（名前５０音順）
  #--------------------------------------------------------------------------
  def sort_by_name
    @actors.sort_by! { |id| $game_actors[id].name }
  end

  def sort_by_base_level
    @actors.sort_by! { |id| -$game_actors[id].base_level }
  end

  def sort_by_favorite
    @actors.select! { |id| $game_actors[id].favorite_edit? }
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    sort
    super
    clamp_index unless index == -1
  end
end

#==============================================================================
# ■ Foo::PTEdit::Window_ActorStatus
#==============================================================================
class Foo::PTEdit::Window_ActorStatus < Window_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(party, wait)
    @party = party
    @wait = wait
    super(160, 360, 480, 120)
    @old_party_member_id = @party.select_actor ? @party.select_actor.id : nil
    @old_wait_member_id = nil
    refresh
  end

  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    if @party.no_actor?
      unless @old_party_member_id.nil?
        @old_party_member_id = nil
        refresh
      end
    elsif @old_party_member_id != @party.select_actor.id
      @old_party_member_id = @party.select_actor.id
      refresh
    end

    if @wait.no_actor?
      unless @old_wait_member_id.nil?
        @old_wait_member_id = nil
        refresh
      end
    elsif @old_wait_member_id != @wait.select_actor.id
      @old_wait_member_id = @wait.select_actor.id
      refresh
    end
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    draw_party_actor_status unless @party.no_actor?
    draw_wait_actor_status unless @wait.no_actor?
  end

  #--------------------------------------------------------------------------
  # ● パーティアクターのステータス表示
  #--------------------------------------------------------------------------
  def draw_party_actor_status
    draw_actor_status(@party.select_actor, 0)
  end

  #--------------------------------------------------------------------------
  # ● 待機アクターのステータス表示
  #--------------------------------------------------------------------------
  def draw_wait_actor_status
    draw_actor_status(@wait.select_actor, 228)
  end

  #--------------------------------------------------------------------------
  # ● アクターのステータス表示
  #--------------------------------------------------------------------------
  def draw_actor_status(actor, x)
    draw_actor_face(actor, x, 0)

    # 残りWIDTH領域132
    rect1 = Rect.new(x + 96, 0, 84, line_height)
    rect2 = Rect.new(rect1.x + rect1.width, rect1.y, 48, rect1.height)

    change_color(normal_color)
    draw_text(rect1, actor.name) # 名前だけ少し大きく
    temp_font_size = contents.font.size
    contents.font.size = 22
    draw_actor_level(actor, rect2.x, rect2.y, :base)

    rect1.y += line_height + 4
    rect2.y += line_height + 4
    change_color(tp_gauge_color2)
    draw_text(rect1, actor.class.name)
    draw_actor_level(actor, rect2.x, rect2.y, :class)

    rect1.y += line_height
    rect2.y += line_height
    change_color(mp_gauge_color2)
    draw_text(rect1, actor.tribe.name)
    draw_actor_level(actor, rect2.x, rect2.y, :tribe)

    rect1.y += line_height
    rect2.y += line_height
    change_color(normal_color)
    draw_text(rect1, "Affection")
    draw_text(rect2, actor.luca? ? "-----" : "#{actor.love}")

    contents.font.size = temp_font_size
  end
end

#==============================================================================
# ■ Scene_PartyEdit
#==============================================================================
class Scene_PartyEdit < Scene_MenuBase
  include ShowKey_HelpWindow
  def show_key_sprite_window
    @information_window
  end

  def show_key_text
    return [] if @popup_confirm_window.active

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

  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    create_all_window
    $game_party.clear_menu_actors
    @party_member_window.deactivate
    load_window_settings
  end

  def load_window_settings
    @select_data ||= {
      :eval_id => 0,
      :party => 0,
      :wait => [false, -1]
    }

    @sort_eval_window.eval_id = @select_data[:eval_id]
    @party_member_window.select(@select_data[:party])
    w = @select_data[:wait][0] ? @wait_member_window : @party_member_window
    refresh_windows
    @wait_member_window.select(@select_data[:wait][1])
    w.activate
  end

  def save_window_settings
    @select_data = {
      :eval_id => @sort_eval_window.eval_id,
      :party => @party_member_window.index,
      :wait => [@wait_member_window.active, @wait_member_window.index]
    }
  end

  #--------------------------------------------------------------------------
  # ● 全ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_all_window
    create_information_window
    create_sort_eval_window
    create_party_member_window
    create_wait_member_window
    create_actor_status_window
    create_popup_confirm_window
  end

  #--------------------------------------------------------------------------
  # ● 情報ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_information_window
    @information_window = Foo::PTEdit::Window_Information.new
  end

  #--------------------------------------------------------------------------
  # ● ソート表示ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_sort_eval_window
    @sort_eval_window = Foo::PTEdit::Window_SortEval.new
    @sort_eval_window.set_all_refresh_method(method(:refresh_windows))
    @sort_eval_window.set_disable_method(method(:disable_sort?))
  end

  #--------------------------------------------------------------------------
  # ● パーティメンバーウィンドウの作成
  #--------------------------------------------------------------------------
  def create_party_member_window
    @party_member_window = Foo::PTEdit::Window_PartyMember.new
    @party_member_window.set_handler(:cancel, method(:return_scene))
    @party_member_window.set_handler(:ok, method(:select_party_to_wait))
    @party_member_window.set_handler(:call_status, method(:call_scene_status))
    @party_member_window.set_handler(:move_member, method(:move_member))
  end

  #--------------------------------------------------------------------------
  # ● 待機メンバーウィンドウの作成
  #--------------------------------------------------------------------------
  def create_wait_member_window
    @wait_member_window = Foo::PTEdit::Window_WaitMember.new(@sort_eval_window, @party_member_window)
    @wait_member_window.set_handler(:cancel, method(:select_wait_to_party))
    @wait_member_window.set_handler(:ok, method(:swap_member))
    @wait_member_window.set_handler(:call_status, method(:call_scene_status))
    @wait_member_window.set_handler(:move_best_place, method(:move_best_place))
    @wait_member_window.set_handler(:call_extra, method(:on_wait_member_extra))
  end

  #--------------------------------------------------------------------------
  # ● アクターステータスウィンドウの作成
  #--------------------------------------------------------------------------
  def create_actor_status_window
    @actor_status_window = Foo::PTEdit::Window_ActorStatus.new(@party_member_window, @wait_member_window)
  end

  #--------------------------------------------------------------------------
  # ● 確認ポップアップウィンドウの作成
  #--------------------------------------------------------------------------
  def create_popup_confirm_window
    @popup_confirm_window = Window_PopupConfirm.new
    @popup_confirm_window.viewport = @viewport
    @popup_confirm_window.hide
    @popup_confirm_window.set_title(NWConst::PTEdit::CONFIRM_TEXT)
    @popup_confirm_window.set_handler(:ok, method(:confirm_ok))
    @popup_confirm_window.set_handler(:cancel, method(:confirm_cancel))
  end

  #--------------------------------------------------------------------------
  # ● 選択をパーティメンバーからウェイトメンバーへ
  #--------------------------------------------------------------------------
  def select_party_to_wait
    @party_member_window.deactivate
    @wait_member_window.activate
    @wait_member_window.select(0)
  end

  #--------------------------------------------------------------------------
  # ● 選択をウェイトメンバーからパーティメンバーへ
  #--------------------------------------------------------------------------
  def select_wait_to_party
    @party_member_window.activate
    @wait_member_window.deactivate
    @wait_member_window.unselect
  end

  #--------------------------------------------------------------------------
  # ● 全てのウィンドウをリフレッシュ
  #--------------------------------------------------------------------------
  def refresh_windows
    @information_window.refresh
    @sort_eval_window.refresh
    @party_member_window.refresh
    @wait_member_window.refresh
    @actor_status_window.refresh
  end

  def on_wait_member_extra
    actor = @wait_member_window.select_actor
    actor.favorite_edit_flag = !actor.favorite_edit_flag
    @wait_member_window.refresh
  end

  #--------------------------------------------------------------------------
  # ● 選択した待機メンバーとパーティメンバーを入れ替える
  #--------------------------------------------------------------------------
  def swap_member
    party = @party_member_window
    wait = @wait_member_window
    if party.no_actor?
      party.actors.push(wait.actors[wait.index])
    else
      party.actors[party.index] = wait.actors[wait.index]
    end
    refresh_windows
    select_wait_to_party
  end

  #--------------------------------------------------------------------------
  # ● 選択したパーティメンバーを待機メンバーに移動する
  #--------------------------------------------------------------------------
  def move_member
    party = @party_member_window
    party.actors.delete_at(party.index)
    refresh_windows
  end

  #--------------------------------------------------------------------------
  # ● パーティ編成完了
  #--------------------------------------------------------------------------
  def edit_completion
    $game_party.actors.set(@party_member_window.actors)
  end

  #--------------------------------------------------------------------------
  # ● 呼び出し元のシーンへ戻る（オーバーライド）
  #--------------------------------------------------------------------------
  def return_scene
    edit_completion
    $game_party.clear_menu_actors
    $game_player.refresh
    super
  end

  #--------------------------------------------------------------------------
  # ● ステータス画面の呼び出し
  #--------------------------------------------------------------------------
  def call_scene_status
    edit_completion
    save_window_settings
    $game_party.menu_actor = select_actor
    $game_party.set_menu_actors(@wait_member_window.actors) if @wait_member_window.active
    SceneManager.call(Scene_Status)
  end

  #--------------------------------------------------------------------------
  # ● 選択中のアクターを取得
  #--------------------------------------------------------------------------
  def select_actor
    @party_member_window.active ? @party_member_window.select_actor : @wait_member_window.select_actor
  end

  #--------------------------------------------------------------------------
  # ● アクターの近くに移動する
  #--------------------------------------------------------------------------
  def move_best_place
    @wait_member_window.deactivate
    @popup_confirm_window.refresh
    @popup_confirm_window.show.activate
    @popup_confirm_window.set_name(select_actor.name)
    @popup_confirm_window.select(0)
  end

  #--------------------------------------------------------------------------
  # ● ソート表示ウィンドウの作成
  #--------------------------------------------------------------------------
  def disable_sort?
    @popup_confirm_window.active
  end

  #--------------------------------------------------------------------------
  # ● 確認：決定
  #--------------------------------------------------------------------------
  def confirm_ok
    NWConst::Warp::MOVE_SE.play
    fadeout(30)
    place = select_actor.actor.best_place
    $game_player.reserve_transfer(place[:map_id], place[:x], place[:y])
    $game_player.perform_transfer
    $game_map.screen.clear
    return_scene
  end

  #--------------------------------------------------------------------------
  # ● 確認：キャンセル
  #--------------------------------------------------------------------------
  def confirm_cancel
    @popup_confirm_window.hide
    @wait_member_window.activate
  end

  #--------------------------------------------------------------------------
  # ● フレーム更新（フェード用）
  #--------------------------------------------------------------------------
  def update_for_fade
    update_basic
    $game_map.update(false)
    $game_player.update
  end

  #--------------------------------------------------------------------------
  # ● 汎用フェード処理
  #--------------------------------------------------------------------------
  def fade_loop(duration)
    duration.times do |i|
      yield 255 * (i + 1) / duration
      update_for_fade
    end
  end

  #--------------------------------------------------------------------------
  # ● 画面のフェードアウト
  #--------------------------------------------------------------------------
  def fadeout(duration)
    fade_loop(duration) { |v| Graphics.brightness = 255 - v }
  end
end
