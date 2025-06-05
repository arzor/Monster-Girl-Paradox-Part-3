
=begin

もんむす・くえすと！ＲＰＧ
　トリス戦闘回想  ver10  2017/03/18

機能一覧　説明は下　このverで新規追加したものは●　変更したものは○
・戦闘回想
・戦闘勝利メッセージを4ボタンで自動スキップするかどうかコンフィグで設定
・「メモに <スキップ不能> がある敵」が所属する敵グループとの戦闘では
　敗北時に「今回の冒険」「全ての冒険」の全滅回数を増やさない
・IDが1001～2000のエネミーは「メモに<戦闘回想不可>が入っているのと同じ扱い」に
●勝利時の経験値、お金、ドロップアイテムのそれぞれを入手不能にするスイッチ

機能　説明
・戦闘回想
　イベントコマンドのスクリプト battle_memory で開始
　魔物図鑑と同様に情報を閲覧可能　敵を選択して決定ボタンで戦闘に入る

　戦闘回想可能な敵は「勝利済み」かつ「戦闘回想不可エネミーではない」敵のみ
　　戦闘回想不可エネミー：メモに<戦闘回想不可>と入っているか、IDが1001～2000
　選択した敵を含み、かつ「全ての敵が戦闘回想可能」な敵グループからランダムに戦闘
　そのような敵グループが１つもない敵は戦闘回想を開始できない

　逃走可能
　勝利時は「経験値、お金、ドロップアイテムの獲得」「仲間加入」はしない

・戦闘勝利メッセージを4ボタンで自動スキップするかどうかコンフィグで設定
　初期状態は「スキップしない」
　①スキップしない：スキップしない（v1.03.00と同じ）
　②低速スキップ：1文字ごとに少しウェイト　および「高速スキップ」と同様にウェイト
　③高速スキップ：経験値等の表示は1行ごとにウェイト　他の表示は１ページごとにウェイト
　④瞬間スキップ：一切ウェイトしない（v1.02.01以前と同じ）


=end

#==============================================================================
# ■ Scene_Library
#==============================================================================
class Scene_Library < Scene_MenuBase
  #--------------------------------------------------------------------------
  # ● 魔物図鑑/キャラ図鑑から開始するかどうか
  #--------------------------------------------------------------------------
  def ex_window_start?
    return false if $game_temp.in_memory_battle
    return $game_temp.lib_enemy_index != -1
  end
  #--------------------------------------------------------------------------
  # ● 魔物図鑑/キャラ図鑑から開始する時のカーソル位置
  #--------------------------------------------------------------------------
  def start_index
    return $game_temp.lib_enemy_index % 10000 if $game_temp.lib_enemy_index != -1
    return 0
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウの設定準備
  #--------------------------------------------------------------------------
  def window_setting
    if ex_window_start?
      $game_temp.in_memory_battle = false
      play_bgm_no_save
      @main_command_window.category = $game_temp.lib_enemy_index < 10000 ? 2 : 1
      @main_command_window.refresh
      @main_command_window.select(start_index)
      @main_command_window.activate
      $game_temp.lib_enemy_index = -1
    else
      @main_command_window.select(0)
      @main_command_window.activate
    end
  end
  #--------------------------------------------------------------------------
  # ● キャラ図鑑の決定
  #--------------------------------------------------------------------------
  def on_actor_ok
    @enemy_command_window.enemy_id = @main_contents_window.ext % 10000 + 10000
    @enemy_command_window.refresh
    @enemy_command_window.show.activate
    @enemy_command_window.select(0)
  end
  #--------------------------------------------------------------------------
  # ● 魔物図鑑の決定
  #--------------------------------------------------------------------------
  def on_enemy_ok
    @enemy_command_window.enemy_id = @main_contents_window.ext % 10000
    @enemy_command_window.refresh
    @enemy_command_window.show.activate
    @enemy_command_window.select(0)
  end
end
#==============================================================================
# ■ Scene_BattleLibrary
#==============================================================================
class Scene_BattleLibrary < Scene_Library
  #--------------------------------------------------------------------------
  # ● 魔物図鑑/キャラ図鑑から開始するかどうか
  #--------------------------------------------------------------------------
  def ex_window_start?
    true
  end
  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    save_bgm
    $game_party.all_members.each {|actor| actor.recover_all }
    $game_player.refresh
  end
  #--------------------------------------------------------------------------
  # ● BGMの保存
  #--------------------------------------------------------------------------
  def save_bgm
    @prev_bgm = RPG::BGM.last
    @prev_bgs = RPG::BGS.last
  end
  #--------------------------------------------------------------------------
  # ● BGM と BGS の再開
  #--------------------------------------------------------------------------  
  def replay_bgm_and_bgs
  end
  #--------------------------------------------------------------------------
  # ● BGMの演奏　戦闘回想からの復帰用
  #--------------------------------------------------------------------------
  def play_bgm_no_save
    return unless @prev_bgm
    @prev_bgm.replay
    @prev_bgs.replay
  end
  #--------------------------------------------------------------------------
  # ● 左カラムウィンドウの作成
  #--------------------------------------------------------------------------
  def create_left_column_window
    @main_command_window = Window_BattleLibrary_MainCommand.new
    @main_command_window.set_handler(:lib_close,  method(:return_scene))
    @main_command_window.set_handler(:cancel,     method(:return_scene))
    @main_command_window.set_handler(:input_right, method(:on_next_page))
    @main_command_window.set_handler(:input_left,  method(:on_previous_page))
    @main_command_window.set_handler(:scrolldown,   method(:on_scroll_down))
    @main_command_window.set_handler(:scrollup,     method(:on_scroll_up))
    @main_command_window.set_handler(:on_enemy,     method(:on_enemy_ok))
    @main_command_window.index_window = @header_nav_window
    @main_command_window.contents_window = @main_contents_window      
    @main_command_window.help_window  = @footer_help_window
    on_enemy_index
  end
  #--------------------------------------------------------------------------
  # ● エネミー選択ウィンドウの作成
  #--------------------------------------------------------------------------
  def create_enemy_command_window
    @enemy_command_window = Window_BattleLibrary_EnemyCommand.new
    @enemy_command_window.set_handler(:memory_battle, method(:on_memory_battle))
    @enemy_command_window.set_handler(:cancel, method(:on_enemy_cancel))
  end
  #--------------------------------------------------------------------------
  # ● 魔物：戦闘回想
  #--------------------------------------------------------------------------
  def on_memory_battle
    $game_temp.in_memory_battle = true
    $game_temp.lib_enemy_index = @main_command_window.index
    troop_id = $game_temp.select_memory_battle_troop(@enemy_command_window.enemy.id)
    RPG::ME.stop
    BattleManager.setup(troop_id, true, false)
    BattleManager.save_bgm_and_bgs
    BattleManager.play_battle_bgm
    Sound.play_battle_start
    SceneManager.call(Scene_Battle)
  end
end
#==============================================================================
# ■ NWConst::Library
#----------------------------------------------------------------------------
# 図鑑に関するウィンドウにmixinして使用します。
#==============================================================================
module NWConst::Library
  #--------------------------------------------------------------------------
  # ● 定数
  #--------------------------------------------------------------------------
  INDEX_STRING = {
    :lib_top        => "Library",
    :lib_return     => "Return to Top",
    :lib_close      => "Close Library",
    :memory_close   => "End Scene",
    :lib_actor      => "Character Book",
    :lib_enemy      => "Monster Book",
    :lib_weapon     => "Weapon Book",
    :lib_armor      => "Armor Book",
    :lib_stone      => "Gem Book",
    :lib_accessory  => "Accessory Book",
    :lib_item       => "Item Book",
    :lib_record     => "Adventure Log",
    :lib_medal      => "Achievements",
    :lib_class      => "Job Info",
    :lib_tribe      => "Race Info",
  }
end
#==============================================================================
# ■ Window_BattleLibrary_MainCommand
#==============================================================================
class Window_BattleLibrary_MainCommand < Window_Library_MainCommand
  #--------------------------------------------------------------------------
  # ● インデックスウィンドウの更新
  #--------------------------------------------------------------------------
  def update_index
    @index_window.set_text("#{INDEX_STRING[:lib_enemy]}(Combat Replayer)\r\nPercent Complete:" + sprintf("%3d", collect_per_enemy) + "%")
  end
  #--------------------------------------------------------------------------
  # ● トップに戻る(表示種別選択に戻る)コマンド
  #--------------------------------------------------------------------------
  def make_return_command
  end
  #--------------------------------------------------------------------------
  # ● 図鑑を閉じる(元のシーンに戻る)コマンド
  #--------------------------------------------------------------------------
  def make_close_command
    add_command(INDEX_STRING[:memory_close], :lib_close, true, [-2, -20000])
  end
end
#==============================================================================
# ■ Window_BattleLibrary_EnemyCommand
#==============================================================================
class Window_BattleLibrary_EnemyCommand < Window_Library_EnemyCommand
  #--------------------------------------------------------------------------
  # ● コマンドリストの作成
  #--------------------------------------------------------------------------
  def make_command_list
    return if disposed? or self.active
    add_command("Battle Scene",   :memory_battle, battle_memory?)
    add_command("Cancel", :cancel, true)
    self.height = fitting_height(2) unless disposed?
  end
  #--------------------------------------------------------------------------
  # ● 回想イベントに対応している？
  #--------------------------------------------------------------------------  
  def battle_memory?
    return $game_temp.select_memory_battle_troop(enemy.id)
  end
end

#==============================================================================
# ■ Game_Temp
#==============================================================================
class Game_Temp
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :in_memory_battle
  attr_accessor :in_victory_message
  #--------------------------------------------------------------------------
  # ○ 戦闘回想グループの初期化
  #--------------------------------------------------------------------------
  def clear_memory_battle_troop
    @memory_battle_troop = []
  end
  #--------------------------------------------------------------------------
  # ○ 戦闘回想グループの選択
  #--------------------------------------------------------------------------
  def select_memory_battle_troop(enemy_id)
    setup_memory_battle_troop(enemy_id)
    return @memory_battle_troop[enemy_id].sample
  end
  #--------------------------------------------------------------------------
  # ○ 戦闘回想グループの作成
  #--------------------------------------------------------------------------
  def setup_memory_battle_troop(enemy_id)
    @memory_battle_troop[enemy_id] ||= make_memory_battle_troop(enemy_id)
  end
  #--------------------------------------------------------------------------
  # ○ 戦闘回想グループの作成
  #--------------------------------------------------------------------------
  def make_memory_battle_troop(enemy_id)
    return [] if no_memory_battle_1(enemy_id)
    return [] if no_memory_battle_2(enemy_id)
    troops = $data_troops.compact.select do |t|
      t.members.any? {|m| m.enemy_id == enemy_id }
    end
    troops.reject! {|t| t.members.any? {|m| no_memory_battle_1(m.enemy_id) } }
    troops.reject! {|t| t.members.any? {|m| no_memory_battle_2(m.enemy_id) } }
    return troops.map {|t| t.id }
  end
  #--------------------------------------------------------------------------
  # ○ 戦闘回想不可エネミーか
  #--------------------------------------------------------------------------
  def no_memory_battle_1(enemy_id)
    $data_enemies[enemy_id].no_memory_battle? ? true : false
  end
  #--------------------------------------------------------------------------
  # ○ 戦闘回想不可エネミーか
  #--------------------------------------------------------------------------
  def no_memory_battle_2(enemy_id)
    !$data_library.enemy_had?(enemy_id)
  end
end
#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ● 戦闘回想の開始
  #--------------------------------------------------------------------------  
  def battle_memory
    $game_temp.clear_memory_battle_troop
    SceneManager.call(Scene_BattleLibrary)
    wait(1)
  end
  #--------------------------------------------------------------------------
  # ● 回想なら中断
  #--------------------------------------------------------------------------
  def memory_interruption
    #return if $game_temp.lib_enemy_index == -1  # 「図鑑からではない戦闘」は無効
    #return if BattleManager.memory_battle?      # 「戦闘回想(図鑑)の戦闘」は無効
    return unless $game_switches[NWConst::Sw::LIBRARY_H_MEMORY]
    # それ以外（＝図鑑からの敗北回想）の時のみ実行しイベント中断
    @index = @list.size
  end
end

#==============================================================================
# ■ Window_Message
#==============================================================================
class Window_Message < Window_Base
  #--------------------------------------------------------------------------
  # ○ スキップモード
  #--------------------------------------------------------------------------
  def message_skip_mode
    #     0: スキップしない
    #     1: 低速スキップ
    #     2: 高速スキップ
    # nil 3: 瞬間スキップ（通常時）
    return 3 if !$game_temp.in_victory_message
    return $game_system.conf[:bt_result] || 3
  end
  #--------------------------------------------------------------------------
  # ○ input_pauseのwait(10)後の文字送り入力
  #--------------------------------------------------------------------------
  def message_pause_input
    input_x = Input.trigger?(:X)
    input_x = Input.press?(:X) if message_skip_mode >= 1
    return Input.trigger?(:B) || Input.trigger?(:C) || input_x
  end
  #--------------------------------------------------------------------------
  # ○ ウェイト
  #--------------------------------------------------------------------------
  def wait(duration)
    return if Input.press?(:X) and message_skip_mode >= 3
    duration.times { Fiber.yield }
  end
  #--------------------------------------------------------------------------
  # ○ 一文字出力後のウェイト
  #--------------------------------------------------------------------------
  def wait_for_one_character
    return if Input.press?(:X) and message_skip_mode >= 2
    update_show_fast
    Fiber.yield unless @show_fast || @line_show_fast
  end
  #--------------------------------------------------------------------------
  # ○ 入力待ち処理
  #--------------------------------------------------------------------------
  def input_pause
    return if Input.press?(:X) and message_skip_mode >= 3
    self.pause = true
    wait(10)
    Fiber.yield until message_pause_input
    Input.update
    self.pause = false
  end
end
