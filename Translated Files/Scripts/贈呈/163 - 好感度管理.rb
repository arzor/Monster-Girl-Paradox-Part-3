=begin
=贈呈/好感度管理 by Foo

プレゼントとアクター好感度を管理するクラス


==更新履歴
  Date     Version Author Comment

=end

#==============================================================================
# ■ NWConst::Present
#==============================================================================
module NWConst::Present
  LOVE_UP_SE = RPG::SE.new("Item1")
  LOVE_DOWN_SE = RPG::SE.new("Raise2")  
  RESULT_STR_UP = "%s's affection increased by %d points! (Affection:%d)"
  RESULT_STR_DOWN =  "%s's affection decreased by %d points... (Affection:%d)"
  RESULT_STR_INVARIANT = "%s's affection didn't change... (Affection:%d)"
end

#==============================================================================
# ■ RPG::Actor
#==============================================================================
class RPG::Actor < RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● 好感度の代入
  #--------------------------------------------------------------------------
  def love=(value)
    $game_variables[NWConst::Var::ACTOR_REL_BASE + self.id] = value
  end
  #--------------------------------------------------------------------------
  # ● 好感度の取得
  #--------------------------------------------------------------------------
  def love
    $game_variables[NWConst::Var::ACTOR_REL_BASE + self.id]
  end
end

#==============================================================================
# ■ Game_Temp
#==============================================================================
class Game_Temp
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor     :choice_present_id
  attr_accessor     :choice_present_index
end
  
#==============================================================================
# ■ Game_Message
#==============================================================================
class Game_Message
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :present_actor_id    # プレゼント対象のアクターID
  #--------------------------------------------------------------------------
  # ○ クリア
  #--------------------------------------------------------------------------
  alias nw_present_clear clear
  def clear
    nw_present_clear
    @present_actor_id = 0
  end
  #--------------------------------------------------------------------------
  # ● プレゼント選択モード判定
  #--------------------------------------------------------------------------
  def present_choice?
    @present_actor_id > 0
  end
  #--------------------------------------------------------------------------
  # ○ ビジー判定
  #--------------------------------------------------------------------------
  alias nw_present_busy? busy?
  def busy?
    nw_present_busy? || present_choice?
  end
end

#==============================================================================
# ■ Game_Actor
#==============================================================================
class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  # ● 好感度の代入
  #--------------------------------------------------------------------------
  def love=(value)
    actor.love = value
  end
  #--------------------------------------------------------------------------
  # ● 好感度の取得
  #--------------------------------------------------------------------------
  def love
    return actor.love
  end
  #--------------------------------------------------------------------------
  # ● プレゼント用データが存在する？
  #--------------------------------------------------------------------------
  def exist_present?(present_id)
    NWConst::Present::SETTINGS.key?(self.id) && present_data.key?(present_id)
  end
  #--------------------------------------------------------------------------
  # ● プレゼント用データの取得
  #--------------------------------------------------------------------------
  def present_data
    NWConst::Present::SETTINGS[self.id]
  end
  #--------------------------------------------------------------------------
  # ● プレゼントの好感度上昇値取得
  #--------------------------------------------------------------------------
  def present_loveup(present_id)
    present_data[present_id][:love]
  end  
  #--------------------------------------------------------------------------
  # ● プレゼントのセリフ配列取得
  #--------------------------------------------------------------------------
  def present_words(present_id)
    return [] unless exist_present?(present_id)
    
    (1..10).collect{|i| "word_#{i}".to_sym}.collect{|key|
      present_data[present_id][key]
    }.compact.collect{|w|
      Word.new(w[0], w[1], w[2])
    }
  end
end

#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ● プレゼント
  #--------------------------------------------------------------------------
  def present_start(actor_id)
    loop do
      wait_for_message
      $game_message.present_actor_id = actor_id
      Fiber.yield while $game_message.present_choice?    
      # 受け取りセリフ
      actor = $game_actors[actor_id]
      actor.present_words($game_temp.choice_present_id).each{|word|
        word.execute
        wait_for_message
      }
      # 脱出判定
      if $game_temp.choice_present_id < 1
        $game_message.present_actor_id = 0
        return
      end
      love_result_message(actor_id, actor.present_loveup($game_temp.choice_present_id))
    end
  end
  #--------------------------------------------------------------------------
  # ● 好感度の結果表示
  #--------------------------------------------------------------------------    
  def love_result_message(actor_id, love)
    actor = $game_actors[actor_id]
    result = (0 < love) ? :up : (love < 0) ? :down : :invariant
    love = love.abs
    case result
    when :up
      NWConst::Present::LOVE_UP_SE.play
      $game_message.add(sprintf(NWConst::Present::RESULT_STR_UP, actor.name, love, actor.love))
    when :down
      NWConst::Present::LOVE_DOWN_SE.play
      $game_message.add(sprintf(NWConst::Present::RESULT_STR_DOWN, actor.name, love, actor.love))
    when :invariant
      $game_message.add(sprintf(NWConst::Present::RESULT_STR_INVARIANT, actor.name, actor.love))      
    end
    wait_for_message    
  end
end

#==============================================================================
# ■ Window_PresentItem
#==============================================================================
class Window_PresentItem < Window_KeyItem
  #--------------------------------------------------------------------------
  # ● 入力処理の開始
  #--------------------------------------------------------------------------
  def start
    update_placement
    refresh
    select((@data.size <= $game_temp.choice_present_index) ? 0 : $game_temp.choice_present_index)
    open
    activate
    present_impossible if @data.empty?
  end
  #--------------------------------------------------------------------------
  # ● 選択アクターの取得
  #--------------------------------------------------------------------------
  def actor
    $game_actors[$game_message.present_actor_id]
  end  
  #--------------------------------------------------------------------------
  # ● アイテムをリストに含めるかどうか
  #--------------------------------------------------------------------------
  def include?(item)
    item.is_a?(RPG::Item) && item.is_present? && actor.exist_present?(item.id)
  end
  #--------------------------------------------------------------------------
  # ● 選択可能なプレゼントが無い（無くなった場合）
  #--------------------------------------------------------------------------  
  def present_impossible
    $game_temp.choice_present_id = 0
    $game_temp.choice_present_index = 0
    deactivate
    close
  end
  #--------------------------------------------------------------------------
  # ● 決定時の処理
  #--------------------------------------------------------------------------
  def on_ok
    actor.love += actor.present_loveup(item.id)
    $game_party.lose_item(item, 1)
    $game_temp.choice_present_id = item.id
    $game_temp.choice_present_index = self.index
    close
  end
  #--------------------------------------------------------------------------
  # ● キャンセル時の処理
  #--------------------------------------------------------------------------
  def on_cancel
    $game_temp.choice_present_id = -1
    $game_temp.choice_present_index = 0
    close
  end
end

#==============================================================================
# ■ Window_Message
#==============================================================================
class Window_Message < Window_Base
  #--------------------------------------------------------------------------
  # ○ 全ウィンドウの作成
  #--------------------------------------------------------------------------
  alias nw_present_create_all_windows create_all_windows
  def create_all_windows
    nw_present_create_all_windows
    @present_window = Window_PresentItem.new(self)
  end
  #--------------------------------------------------------------------------
  # ○ 全ウィンドウの解放
  #--------------------------------------------------------------------------
  alias nw_present_dispose_all_windows dispose_all_windows
  def dispose_all_windows
    nw_present_dispose_all_windows
    @present_window.dispose
  end
  #--------------------------------------------------------------------------
  # ○ 全ウィンドウの更新
  #--------------------------------------------------------------------------
  alias nw_present_update_all_windows update_all_windows
  def update_all_windows
    nw_present_update_all_windows
    @present_window.update
  end
  #--------------------------------------------------------------------------
  # ○ 全ウィンドウが完全に閉じているか判定
  #--------------------------------------------------------------------------
  alias nw_present_all_close? all_close?
  def all_close?
    nw_present_all_close? && @present_window.close?
  end
  #--------------------------------------------------------------------------
  # ○ 入力処理
  #--------------------------------------------------------------------------
  alias nw_present_process_input process_input
  def process_input
    if $game_message.present_choice?
      input_present
    else
      nw_present_process_input
    end
  end
  #--------------------------------------------------------------------------
  # ● プレゼントの選択処理
  #--------------------------------------------------------------------------
  def input_present
    @present_window.start
    Fiber.yield while @present_window.active
  end
end



