#
# もんむす・くえすと！ＲＰＧ
# 　拡張選択肢 ver2  2015/02/22
#
#
#
# 5行以上の選択肢や、スイッチと変数による選択肢の無効化が可能
# 選択項目の項目IDを変数に保存する　変数は IDReserve.rb の EX_CHOICE_RESULT で設定
#
# ●項目スクリプト　ex_choice_add(項目名, 項目ID, 有効条件, 無効時の挙動)
# 　例　ex_choice_add("項目１", 1)
# 　例　ex_choice_add("項目２", 2, "v[1] >= 100", 1)
# 　・項目名
# 　　　ウインドウに表示される文字列
# 　・項目ID
# 　　　変数に代入される値
# 　・有効条件
# 　　　""で挟んで文字列として記述
# 　　　・s[n]はスイッチn
# 　　　　"s[n]"  または "s[n] == true"  : スイッチnがオン
# 　　　　"!s[n]" または "s[n] == false" : スイッチnがオフ
# 　　　・v[n]は変数n
# 　　　　"v[n] == 100" : 変数nが100と同値
# 　　　　　比較は　同値(==)、以上(>=)、超(>)、以下(<=)、未満(<)、以外(!=)　がある
# 　　　・andとor　複数の条件を指定可能
# 　　　　"!s[a] and s[b]"      : スイッチaがオフかつスイッチbがオン
# 　　　　"s[a] or v[b] == 100" : スイッチaがオンまたは変数bが100と同値
# 　　　・()　条件をまとめる　andとorと併用
#         "s[a] and (s[b] or s[c])"    : 「aがオン」かつ「bがオンまたはcがオン」
#         "s[a] or (s[b] and s[c])"    : 「aがオン」または「bがオンかつcがオン」
# 　・無効時の挙動
# 　　　0:項目を非表示
# 　　　1:半透明の文字で表示して選択不可
# 　○省略可能な要素
# 　　　有効条件:常に有効
# 　　　無効時の挙動:0
# 　○注意
# 　　　項目名や有効条件が長くて「項目スクリプトの途中」で改行する場合、
# 　　　　文字列の途中などでは改行せず、必ず行末が「,」になるようにすること
#
# ●表示スクリプト　ex_choice_show(キャンセル時結果, 行数, 表示座標補正)
# 　例　ex_choice_show
# 　例　ex_choice_show(0, 4, [0, 0])
# 　項目スクリプトの後にこれを実行する
# 　・キャンセル時結果
# 　　　0以上:キャンセル時はこの値を変数に代入　マイナス:キャンセル不可
# 　・行数
# 　　　ウインドウの縦の行数
# 　・表示座標補正
# 　　　[x座標, y座標] を指定
# 　　　[0, 0]なら通常の選択肢イベントコマンドと同じ座標に表示
# 　○省略可能な要素
# 　　　キャンセル時ID:-1(キャンセル不可)
# 　　　縦の項目数:14(メッセージウインドウと合わせて画面いっぱいになる高さ)
# 　　　表示座標補正:[0, 0]
# 　○有効な項目が０個の場合
# 　　　表示スクリプトの実行時に有効な項目がない場合、
# 　　　　ウインドウを開かず、変数に -1 を代入する
#
# ●文章ウインドウとの同時表示
# 　通常の選択肢と同様、文章ウインドウとの同時表示が可能
# 　『文章の表示の実行時』に「表示スクリプトを実行」することで同時表示される
# 　・『文章の表示の実行時』とは
# 　　　基本的に「文章の表示」の実行後、文章の表示終了まで次のコマンドは実行しない
# 　　　ただし文章の次のコマンドが「選択肢、数値入力、アイテム選択」の場合のみ
# 　　　　表示終了を待たず同時に実行することで、それらは文章と同時表示される
# 　　　これと同様に、次のコマンドが『特定のスクリプト』ならば同時に実行する
# 　・同時に実行する『特定のスクリプト』とは
# 　　　次のスクリプトコマンドの１行目に ex_choice という文字列が含まれている時、
# 　　　　そのスクリプトコマンドを実行する
# 　　　また更にその次のコマンドがスクリプトなら、同様の条件でそれを実行する
# 　　　つまり「１行目にex_choiceが含まれる」スクリプトコマンドが続く限り実行する
# 　○注意
# 　　　デフォルトでは、文章の表示中にスクリプトコマンドを実行することはない
# 　　　余計なスクリプトを実行すると不具合が発生する可能性がある
# 　　　そのため、「文章の表示」の次に『特定のスクリプト』コマンドを配置する場合は
# 　　　　そのスクリプト中に ex_choice_add と ex_choice_show 以外を含めないこと
#

#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ● 文章の表示
  #--------------------------------------------------------------------------
  def command_101
    wait_for_message
    $game_message.face_name = @params[0]
    $game_message.face_index = @params[1]
    $game_message.background = @params[2]
    $game_message.position = @params[3]
    $game_message.face_hue = 0

    while next_event_code == 401 # 文章データ
      @index += 1
      text = @list[@index].parameters[0]
      text = replace_ex_enemy_text(text) if replace_ex_enemy?
      $game_message.add(text)
    end
    case next_event_code
    when 102  # 選択肢の表示
      @index += 1
      setup_choices(@list[@index].parameters)
    when 103  # 数値入力の処理
      @index += 1
      setup_num_input(@list[@index].parameters)
    when 104  # アイテム選択の処理
      @index += 1
      setup_item_choice(@list[@index].parameters)
    when 355
      while next_command_ex_choice?
        @index += 1
        command_355
      end
    end
    wait_for_message
  end

  #--------------------------------------------------------------------------
  # ● 次が拡張選択肢かどうか
  #--------------------------------------------------------------------------
  def next_command_ex_choice?
    return false unless [355].include?(next_event_code)

    s = @list[@index + 1].parameters[0]
    return true if s =~ /ex_choice/

    false
  end

  #--------------------------------------------------------------------------
  # ● 選択肢の表示
  #--------------------------------------------------------------------------
  def ex_choice_add(name, id, e = "true", disable = 0)
    $game_message.ex_choice_item ||= []
    $game_message.ex_choice_item.push([name, id, e, disable])
  end

  #--------------------------------------------------------------------------
  # ● 選択肢の表示
  #--------------------------------------------------------------------------
  def ex_choice_show(cancel = -1, row_max = 14, pos = [0, 0])
    $game_message.ex_choice_setting = [cancel, row_max, pos]
    wait_for_message
  end
end

#==============================================================================
# ■ Game_Message
#==============================================================================
class Game_Message
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :ex_choice_item
  attr_accessor :ex_choice_setting

  #--------------------------------------------------------------------------
  # ○ 拡張選択肢のクリア
  #--------------------------------------------------------------------------
  def ex_choice_clear
    @ex_choice_item = []
    @ex_choice_setting = nil
  end

  #--------------------------------------------------------------------------
  # ● 拡張選択肢モード判定
  #--------------------------------------------------------------------------
  def ex_choice?
    @ex_choice_setting
  end
  #--------------------------------------------------------------------------
  # ○ ビジー判定
  #--------------------------------------------------------------------------
  alias nw_ex_choice_busy? busy?
  def busy?
    nw_ex_choice_busy? || ex_choice?
  end
end

#==============================================================================
# ■ Window_Message
#==============================================================================
class Window_Message < Window_Base
  #--------------------------------------------------------------------------
  # ● 全ウィンドウの作成
  #--------------------------------------------------------------------------
  alias nw_ex_choice_create_all_windows create_all_windows
  def create_all_windows
    nw_ex_choice_create_all_windows
    @ex_choice_window = Window_ExChoiceList.new(self)
  end
  #--------------------------------------------------------------------------
  # ● 全ウィンドウの解放
  #--------------------------------------------------------------------------
  alias nw_ex_choice_dispose_all_windows dispose_all_windows
  def dispose_all_windows
    nw_ex_choice_dispose_all_windows
    @ex_choice_window.dispose
  end
  #--------------------------------------------------------------------------
  # ● 全ウィンドウの更新
  #--------------------------------------------------------------------------
  alias nw_ex_choice_update_all_windows update_all_windows
  def update_all_windows
    nw_ex_choice_update_all_windows
    @ex_choice_window.update
  end
  #--------------------------------------------------------------------------
  # ● 全ウィンドウが完全に閉じているか判定
  #--------------------------------------------------------------------------
  alias nw_ex_choice_all_close? all_close?
  def all_close?
    nw_ex_choice_all_close? && @ex_choice_window.close?
  end
  #--------------------------------------------------------------------------
  # ● 入力処理
  #--------------------------------------------------------------------------
  alias nw_ex_choice_process_input process_input
  def process_input
    if $game_message.ex_choice?
      input_ex_choice
    else
      nw_ex_choice_process_input
    end
  end

  def input_choice
    @choice_window.start
    @choice_window.deactivate
    wait(10)
    @choice_window.activate
    Fiber.yield while @choice_window.active
  end

  #--------------------------------------------------------------------------
  # ● 選択肢の入力処理
  #--------------------------------------------------------------------------
  def input_ex_choice
    @ex_choice_window.start
    @ex_choice_window.deactivate
    wait(10)
    @ex_choice_window.activate
    Fiber.yield while @ex_choice_window.active
  end
end

#==============================================================================
# ■ Window_ExChoiceList
#==============================================================================
class Window_ExChoiceList < Window_ChoiceList
  #--------------------------------------------------------------------------
  # ● 入力処理の開始
  #--------------------------------------------------------------------------
  def start
    refresh
    return process_zero if max_choice_width.nil?

    update_placement
    refresh
    select(0)
    open
    activate
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウ位置の更新
  #--------------------------------------------------------------------------
  def update_placement
    self.width = [max_choice_width + 12, 96].max + padding * 2
    self.width = [width, Graphics.width].min
    self.height = fitting_height(page_row)
    self.x = Graphics.width - width
    self.y = if @message_window.y >= Graphics.height / 2
               @message_window.y - height
             else
               @message_window.y + @message_window.height
             end
    self.x += $game_message.ex_choice_setting[2][0]
    self.y += $game_message.ex_choice_setting[2][1]
  end

  #--------------------------------------------------------------------------
  # ● 選択肢の最大幅を取得
  #--------------------------------------------------------------------------
  def max_choice_width
    @list.collect { |item| text_size(item[:name]).width }.max
  end

  #--------------------------------------------------------------------------
  # ● 選択肢の最大幅を取得
  #--------------------------------------------------------------------------
  def page_row
    [item_max, $game_message.ex_choice_setting[1]].min
  end

  #--------------------------------------------------------------------------
  # ● コマンドリストの作成
  #--------------------------------------------------------------------------
  def make_command_list
    return unless $game_message.ex_choice?
    return unless $game_message.ex_choice_item

    s = $game_switches
    v = $game_variables
    $game_message.ex_choice_item.each do |item|
      enabled = eval(item[2])
      add_command(item[0], item[1], enabled) if enabled or item[3] == 1
    end
  end

  #--------------------------------------------------------------------------
  # ● 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    @enabled = command_enabled?(index)
    super(index)
  end

  #--------------------------------------------------------------------------
  # ● テキスト描画色の変更
  #--------------------------------------------------------------------------
  def change_color(color, enabled = @enabled)
    super(color, enabled)
  end

  #--------------------------------------------------------------------------
  # ● キャンセル処理の有効状態を取得
  #--------------------------------------------------------------------------
  def cancel_enabled?
    true
  end

  #--------------------------------------------------------------------------
  # ● キャンセルボタンが押されたときの処理
  #--------------------------------------------------------------------------
  def process_cancel
    if $game_message.ex_choice_setting[0] >= 0
      super
    else
      Sound.play_buzzer
      Input.update
    end
  end

  #--------------------------------------------------------------------------
  # ● 決定ハンドラの呼び出し
  #--------------------------------------------------------------------------
  def call_ok_handler
    process_end(current_symbol)
  end

  #--------------------------------------------------------------------------
  # ● キャンセルハンドラの呼び出し
  #--------------------------------------------------------------------------
  def call_cancel_handler
    process_end($game_message.ex_choice_setting[0])
  end

  #--------------------------------------------------------------------------
  # ● 選択肢が０個の時の処理
  #--------------------------------------------------------------------------
  def process_zero
    process_end(-1)
  end

  #--------------------------------------------------------------------------
  # ● 結果を保存して終了
  #--------------------------------------------------------------------------
  def process_end(n)
    $game_variables[NWConst::Var::EX_CHOICE_RESULT] = n
    close
    $game_message.ex_choice_clear
  end
end
