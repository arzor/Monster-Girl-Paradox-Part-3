
=begin

もんむす・くえすと！ＲＰＧ
　トリスイベント検索  ver5  2015/02/11



○テストプレイでのゲーム起動時、
　以下のものを検索してコンソールに表示
　　・全コモンイベントと全マップイベントの特定コマンドの各行
　　・データベースの特定要素
　　・SettingDataフォルダの全ファイルの各行
　　から、設定した文字列が含まれるもの
　　・全コモンイベントと全マップイベントの特定コマンドの各行
　　・全コモンイベントのトリガー(自動実行/並列処理)の条件スイッチ
　　・全マップイベントのページ出現条件
　　から、特定のスイッチID/変数IDに関するもの
　また表示した内容を search.txt に保存

検索対象とするイベント関連情報　　　　　　　　　　　↓コンソール表示の「種類」名
・スクリプト　　　　　　文字列：内容　　　　　　　　　スクリプト
・文章の表示　　　　　　文字列：内容　　　　　　　　　文章の表示
・スクロール文章の表示　文字列：内容　　　　　　　　　スクロール
・文章の表示　　　　　　文字列：顔グラファイル名　　　文章グラ名
・ピクチャの表示　　　　文字列：ピクチャファイル名　　ピクチャ名
●ラベル　　　　　　　　文字列：ラベル名　　　　　　　ﾗﾍﾞﾙ設定
●ラベルジャンプ　　　　文字列：ラベル名　　　　　　　ﾗﾍﾞﾙｼﾞｬﾝﾌﾟ
・条件分岐（スイッチ）　　　ID：比較される変数ID　　　ｽｲｯﾁで分岐
・条件分岐（変数）　　　　　ID：比較される変数ID　　　変数で分岐
・スイッチの操作　　　　　　ID：操作する変数ID　　　　ｽｲｯﾁの操作
・変数の操作　　　　　　　　ID：操作する変数ID　　　　変数の操作
・マップイベントのページ出現条件：スイッチ　　　　　　ﾍﾟｰｼﾞ:ｽｲｯﾁ
・マップイベントのページ出現条件：変数　　　　　　　　ﾍﾟｰｼﾞ:変数
・コモンイベントのトリガー条件スイッチ　　　　　　　　ﾄﾘｶﾞｰ:ｽｲｯﾁ


●ver5で追加した設定項目
　BY_EVENT内の :label :label_j


○設定の無効化
　一部設定は、行の左端に「#」を付けることで無効化できる
　行にカーソルを合わせて Ctrl + Q を押すと # のオンオフができる
　複数の行をドラッグで選択して Ctrl + Q を押すと、全ての行に効果が出る
　　無効化できる設定
　　　USE
　　　EVENT_STRING_LIST
　　　DATABASE_LIST
　　　SETTING_LIST
　　　BY_EVENT
　　　BY_DATA
　（USEとBY_EVENTは、無効化した行は false と同じになる）


=end

module Event_Search
  
  # この機能を使うかどうか　true:使う false:使わない
  USE_ALL = false
  
  # 有効設定  true:検索する false:しない
  USE = {
    :common    =>  true,  # コモンイベント
    :map       =>  true,  # マップイベント
    :database  =>  true,  # データベース
    :setting   =>  true,  # SettingDataフォルダ
  }
  
  # コモンイベントIDとマップIDの検索範囲　「a..b」の形式で指定
  #   1つのIDだけを検索したい場合は 1..1 のようにする
  COMMON_ID  = 1..9999  # コモンイベントID
  MAP_ID     = 1..1999  # マップID
  
  
  
  
  # イベント 文字列の検索パターン　//の間に文字列を指定　正規表現(後述)も使用可能
  EVENT_STRING_LIST = [/平行世界/

  ]
  
  # イベント　スイッチID/変数IDの検索対象
  # 　「1」のような単独指定か「2..4」のような一括指定
  EVENT_SWITCH_LIST   = [] # スイッチ
  EVENT_VARIABLE_LIST = [] # 変数
  
  # イベント　スイッチID/変数IDのコンソール表示
  EVENT_VAR_PUT_IF   = 0  # 条件分岐(変数/スイッチ)　比較式
                          #   0:"と同値" "以下"　1:"==" "<="
  EVENT_VAR_PUT_SET  = 0  # 変数の操作　　　計算式
                          #   0:"代入" "加算"　1:"=" "+="
  EVENT_VAR_NAME = 3  # 『変数/スイッチ』に名前を表示するかどうか
                          # 1～3は「変数の操作での一括操作」のみ違いがある
                          #   0:一括"[0006～0008"]"　単独"[0001]"  
                          #   1:一括"[0006～0008"]"　単独"[0001:ミス！修正しろ！]"
                          #   2:一括"[0006:アイテム汎用1～0008"]"
                          #   3:一括"[0006:アイテム汎用1～0008:アイテム汎用3"]"
  EVENT_VAR_PUT_PLUS = ["{", "}"]   # EVENT_VAR_PUT_IF と EVENT_VAR_PUT_SET が
                                    # 0の場合に前後に付ける文字
                                    # ["{", "}"]  だと  "{以上}"のようになる
                                    
  # イベント関連情報の種類ごとの有効設定　true:検索対象に含める false:含めない
  BY_EVENT = {
    :script   =>  true,   # コマンド:スクリプト　　　　　　文字列：内容
    :message  =>  true,   # コマンド:文章の表示　　　　　　文字列：内容
    :scroll   =>  true,   # コマンド:スクロール文章の表示　文字列：内容
    :mes_face =>  true,   # コマンド:文章の表示　　　　　　文字列：顔グラ名
    :picture  =>  true,   # コマンド:ピクチャの表示　　　　文字列：ピクチャ名
    
    :label    =>  true,   # コマンド:ラベル　　　　　　　　文字列：ラベル名
    :label_j  =>  true,   # コマンド:ラベルジャンプ　　　　文字列：ラベル名
    
    :var_if   =>  true,   # コマンド:条件分岐（変数）　　　ID：比較される変数ID
    :swi_if   =>  true,   # コマンド:条件分岐（スイッチ）　ID：比較されるｽｲｯﾁID
    :var_set  =>  true,   # コマンド:変数の操作　　　　　　ID：操作する変数ID
    :swi_set  =>  true,   # コマンド:スイッチの操作　　　　ID：操作するｽｲｯﾁID
    
    :map_var  =>  true,   # マップイベントのページ出現条件：変数
    :map_swi  =>  true,   # マップイベントのページ出現条件：スイッチ
    :com_swi  =>  true,   # コモンイベントの条件スイッチ
  }
  
  
  
  # データベース　文字列の検索パターン
  DATABASE_LIST = [
  ]
  
  # SettingDataフォルダ　文字列の検索パターン
  SETTING_LIST = [
  ]
    # 検索パターン  /【アリスフィーズ16世】.*"alice_fc2"/,
    # 「.」はあらゆる文字を表すので、「.*」はあらゆる文字列を表す
    # つまり「【アリスフィーズ16世】」と「"alice_fc2"」を含む行を検索する
  
  # データベースの要素ごとの有効設定
  #   BY_DATA.push [:グループ, :種類] で指定する
  #   :グループ は、アクターや職業など
  #   :種類 は、名前やメモなど　コンソール表示にはこの :name :note などを使う
  #   
  #   検索可能な全ての要素を、以下に示してある　つまり全て有効にしてある
  # 　各行を無効化(Ctrl + Q)することで、その要素は無効になる
  BY_DATA = []  # この行は変更しない
  BY_DATA.push [:actor , :name]           # アクター　名前
  BY_DATA.push [:class , :name]           # 職業　　　名前
  BY_DATA.push [:skill , :name]           # スキル　　名前
  BY_DATA.push [:item  , :name]           # アイテム　名前
  BY_DATA.push [:weapon, :name]           # 武器　　　名前
  BY_DATA.push [:armor , :name]           # 防具　　　名前
  BY_DATA.push [:enemy , :name]           # 敵キャラ　名前
  BY_DATA.push [:state , :name]           # ステート　名前
  
  BY_DATA.push [:actor , :note]           # アクター　メモ
  BY_DATA.push [:class , :note]           # 職業　　　メモ
  BY_DATA.push [:skill , :note]           # スキル　　メモ
  BY_DATA.push [:item  , :note]           # アイテム　メモ
  BY_DATA.push [:weapon, :note]           # 武器　　　メモ
  BY_DATA.push [:armor , :note]           # 防具　　　メモ
  BY_DATA.push [:enemy , :note]           # 敵キャラ　メモ
  BY_DATA.push [:state , :note]           # ステート　メモ
  
  BY_DATA.push [:actor , :description]    # アクター　説明
  BY_DATA.push [:skill , :description]    # スキル　　説明
  BY_DATA.push [:item  , :description]    # アイテム　説明
  BY_DATA.push [:weapon, :description]    # 武器　　　説明
  BY_DATA.push [:armor , :description]    # 防具　　　説明
  
  BY_DATA.push [:actor , :nickname]       # アクター　二つ名
  BY_DATA.push [:actor , :face_name]      # アクター　顔グラファイル名
  BY_DATA.push [:actor , :character_name] # アクター　歩行グラファイル名
  
  BY_DATA.push [:enemy , :battler_name]   # 敵キャラ　グラフィック名
  
  BY_DATA.push [:skill , :message1]       # スキル　　使用メッセージ１行目
  BY_DATA.push [:skill , :message2]       # スキル　　使用メッセージ２行目
  
  BY_DATA.push [:state , :message1]       # ステート　味方付加メッセージ
  BY_DATA.push [:state , :message2]       # ステート　敵付加メッセージ
  BY_DATA.push [:state , :message3]       # ステート　継続メッセージ
  BY_DATA.push [:state , :message4]       # ステート　解除メッセージ
  
end

=begin

正規表現：「特定の文字」ではなく「数値文字(0～9)のどれか」などを表す表現
　　　　　検索パターンの中にこれを指定することで、柔軟な検索が可能
  \d : 数値文字
  \S : 空白ではない文字
  .  : あらゆる文字
  +  : 直前のものの1回以上の繰り返し（「文字 \d \S .」の直後に置く）
  *  : 直前のものの0回以上の繰り返し（「文字 \d \S .」の直後に置く）
  
  以下の記号は「普通の文字」ではなく「正規表現の特別な意味を持つ文字」である
    ( ) [ ] { } . ? + * | \ /
  文字列中からこれらの記号を「普通の文字」として検索したい場合、
  　検索パターン内で \\ \+ \] のように「\を付ける」ことでその文字に合致する
  　例： /1\+2/ とすると "1+2" に合致する
  　例： /\\V\[\d+\]/ とすると "\V[1]" "\V[10]" などに合致する
  
    
例　×は検索パターンに合致しない文字列、○は検索パターンに合致する文字列
・検索パターン /あ+い/
　×　"xxxいxxx"
　○　"xxxあいxxx"
　○　"xxxあああああいxxx"
・検索パターン /あ\dい/
　×　"あい"
　○　"あ1い"
　×　"あ12い"
・検索パターン /あ\d\S\d\dい/
　×　"あ123い"
　○　"あ1234い"
　○　"あ1A43い"
　×　"あ12345い"
・検索パターン /あ\d+い/
　×　"あい"
　○　"あ1い"
　○　"あ123456い"
・検索パターン /あ\d*い/
　○　"あい"
　○　"あ1い"
　○　"あ123456い"
・検索パターン /all_\S+_had/
　×　"all__had/"
　×　"all_ _had/"
　○　"all_actor_had"
　○　"all_clear_actor_had"
・検索パターン /all_.+_had
　×　"all__had/"
　○　"all_ _had/"
　○　"all_actor_had"
　○　"all_clear_actor_had"

=end

#==============================================================================
# ■ USE_SEARCH
#==============================================================================
module Event_Search
  
  def self.search
    @data_system = load_data("Data/System.rvdata2")
    clear_text
    hit1 = 0
    hit2 = 0
    hit3 = 0
    hit4 = 0
    hit5 = 0
    hit6 = 0
    putex ""
    putex "★「トリスイベント検索」検索開始"
    putex ""
    if USE[:common]
      putex "☆コモンイベント検索開始"
      puts "＜コモンイベントデータの読み込み開始＞"
      commondata = load_data("Data/CommonEvents.rvdata2")
      puts "＜コモンイベントデータの読み込み完了＞"
      search_report_flag = false
      for event_index in COMMON_ID
        if (event_index - 1) % 2000 == 0 and search_report_flag
          puts sprintf("＜コモン%dまで検索終了＞", event_index - 1)
          search_report_flag = false
        end
        event = commondata[event_index]
        next unless event
        search_report_flag = true
        f = "○コモンイベント%d"
        m = sprintf(f, event_index)
        hit5 += self.common_event_trigger_search(m, event.trigger, event.switch_id)
        hit1 += self.event_page_list_search(m, event.list)
      end
      putex ""
    end
    if USE[:map]
      putex "☆マップイベント検索開始"
      mapinfodata = MapInfos.new
      search_report_flag = false
      for map_id in MAP_ID
        if (map_id - 1) % 100 == 0 and search_report_flag
          puts sprintf("＜マップ%dまで検索終了＞", map_id - 1)
          search_report_flag = false
        end
        filename = DataManager.map_file_name(map_id)
        next unless File.exist?(filename)
        next unless mapinfodata[map_id]

        search_report_flag = true
        mapdata = load_data(filename)
        mapname = mapinfodata[map_id].name
        mapdata.events.each_value do |event|
          next unless event
          event.pages.each_with_index do |page, page_index|
            f = "○マップ%d(%s)\n　イベント%d(x%d y%d) ページ番号%d"
            m = sprintf(f, map_id, mapname, event.id, event.x, event.y, page_index+1)
            hit6 += self.map_event_page_condition_search(m, page.condition)
            hit2 += self.event_page_list_search(m, page.list)
          end
        end
      end
      putex ""
    end
    if USE[:database]
      putex "☆データベース検索開始"
      data_kind.each do |kind|
        message = sprintf("○%s", database_name(kind))
        hit3 += database_search(message, load_database(kind), data_methods(kind))
      end
      putex ""
    end
    if USE[:setting] and Dir.exist?(NWConst::Data::DIRECTORY_PATH)
      putex "☆SettingData検索開始"
      Dir.entries(NWConst::Data::DIRECTORY_PATH).each do |file_name|
        next if file_name == "." || file_name == ".."
        path = sprintf("%s\/%s", NWConst::Data::DIRECTORY_PATH, file_name)
        File.open(path) do |file|
          file.each_with_index do |s, index|
            SETTING_LIST.each do |pattern|
              if s =~ pattern
                putex sprintf("○%s　行番号:%d\n　　内容: %s", path, index+1, s)
                hit4 += 1
              end
            end
          end
        end
      end
      putex ""
    end
    putex "★「トリスイベント検索」検索終了"
    putex sprintf("　コモンイベント 条件     のヒット数:%d", hit5) if USE[:common]
    putex sprintf("　コモンイベント コマンド のヒット数:%d", hit1) if USE[:common]
    putex sprintf("　マップイベント 条件     のヒット数:%d", hit6) if USE[:map]
    putex sprintf("　マップイベント コマンド のヒット数:%d", hit2) if USE[:map]
    putex sprintf("　データベース            のヒット数:%d", hit3) if USE[:database]
    putex sprintf("　SettingData             のヒット数:%d", hit4) if USE[:setting]
    save_text
    putex ""
  end
  
  def self.common_event_trigger_search(message, trigger, switch_id)
    hit = 0
    if BY_EVENT[:com_swi] and trigger != 0
      hit += 1
      f = "　種類:#{DATA_EVENT_SYMBOL[:map_swi][1][0]}\n　　ﾄﾘｶﾞｰ: %s"
      m = ["", "自動実行", "並列処理"]
      name = sprintf("ｽｲｯﾁ[%s] が ON の時 <%s>", swi_name(switch_id), m[trigger])
      putex message + sprintf(f, name)
    end
    return hit
  end
  def self.map_event_page_condition_search(message, c)
    hit = 0
    if BY_EVENT[:map_swi] and c.switch1_valid and swi_id_include?(c.switch1_id)
      hit += 1
      f = "　種類:#{DATA_EVENT_SYMBOL[:map_swi][1][0]}\n　　ﾍﾟｰｼﾞ: %s"
      name = sprintf("ｽｲｯﾁ[%s] が ON", swi_name(c.switch1_id))
      putex message + sprintf(f, name)
    end
    if BY_EVENT[:map_swi] and c.switch2_valid and swi_id_include?(c.switch2_id)
      hit += 1
      f = "　種類:#{DATA_EVENT_SYMBOL[:map_swi][1][0]}\n　　ﾍﾟｰｼﾞ: %s"
      name = sprintf("ｽｲｯﾁ[%s] が ON", swi_name(c.switch2_id))
      putex message + sprintf(f, name)
    end
    if BY_EVENT[:map_var] and c.variable_valid and var_id_include?(c.variable_id)
      hit += 1
      f = "　種類:#{DATA_EVENT_SYMBOL[:map_var][1][0]}\n　　ﾍﾟｰｼﾞ: %s"
      name = sprintf("変数[%s] が %d 以上", var_name(c.variable_id), c.variable_value)
      putex message + sprintf(f, name)
    end
    return hit
  end
  def self.event_page_list_search(message, list)
    hit = 0
    list.each_with_index do |command, command_index|
      if search_codes.include?(command.code)
        param = command.parameters
        kind = code_kind(command.code)
        f = "　行番号#{command_index+1}　種類:#{kind[0]}\n　　%s: %s"
        case kind[2]
        when :string
          EVENT_STRING_LIST.each do |pattern|
            if param[kind[3]] =~ pattern
              str = param[kind[3]]
              hit += 1
              putex message + sprintf(f, kind[1], str)
              break
            end
          end
        when :if
          if param[0] == 0 and swi_id_include?(param[1])
            if param[2] == 0
              k1 = "ON"
            else
              k1 = "OFF"
            end
            case EVENT_VAR_PUT_IF
            when 0
              m = "ｽｲｯﾁ[%s]  #{var_plus("が")}  #{k1}"
            when 1
              m = "ｽｲｯﾁ[%s]  ==  #{k1}"
            end
            str = sprintf(m, swi_name(param[1]))
            hit += 1
            f = "　行番号#{command_index+1}　#{"ｽｲｯﾁで" + kind[0]}\n　　%s: %s"
            putex message + sprintf(f, kind[1], str)
          end
          if param[0] == 1 and var_id_include?(param[1])
            if param[2] == 0
              k1 = sprintf("定数%d", param[3])
            else
              k1 = sprintf("変数[%s]", var_name(param[3]))
            end
            k2 = var_if_type(param[4])
            case EVENT_VAR_PUT_IF
            when 0
              m = "変数[%s]  #{var_plus("が")}  #{k1}  #{k2}"
            when 1
              m = "変数[%s]  #{k2}  #{k1}"
            end
            str = sprintf(m, var_name(param[1]))
            hit += 1
            f = "　行番号#{command_index+1}　#{"変数で" + kind[0]}\n　　%s: %s"
            putex message + sprintf(f, kind[1], str)
          end
        when :swi_set
          if swi_id_include?(param[0]..param[1])
            k  = EVENT_VAR_PUT_SET ? "=" : "が"
            k += param[2] == 0 ? "  ON" : "  OFF"
            if param[0] == param[1]
              str = sprintf("ｽｲｯﾁ[%s]  #{k}", swi_name(param[0]))
            else
              case EVENT_VAR_NAME
              when 0..1
                str = sprintf("ｽｲｯﾁ[%04d～%04d]  #{k}", param[0], param[1])
              when 2
                str = sprintf("ｽｲｯﾁ[%s～%04d]  #{k}", swi_name(param[0]), param[1])
              when 3
                str = sprintf("ｽｲｯﾁ[%s～%s]  #{k}", swi_name(param[0]), swi_name(param[1]))
              end
            end
            hit += 1
            putex message + sprintf(f, kind[1], str)
          end
        when :var_set
          if var_id_include?(param[0]..param[1])
            k = var_set_type(param)
            if param[0] == param[1]
              str = sprintf("変数[%s]  #{k}", var_name(param[0]))
            else
              case EVENT_VAR_NAME
              when 0..1
                str = sprintf("変数[%04d～%04d]  #{k}", param[0], param[1])
              when 2
                str = sprintf("変数[%s～%04d]  #{k}", var_name(param[0]), param[1])
              when 3
                str = sprintf("変数[%s～%s]  #{k}", var_name(param[0]), var_name(param[1]))
              end
              str.gsub!("<<<<<<>>>>>>=") { "%=" }
            end
            hit += 1
            putex message + sprintf(f, kind[1], str)
          end
        end
      end
    end
    return hit
  end
  
  def self.database_search(message, database, methods)
    hit = 0
    database.each_with_index do |item, item_index|
      next unless item
      methods.each do |method|
        DATABASE_LIST.each do |pattern|
          param = item.send(method)
          if param =~ pattern
            hit += 1
            f = "%d(%s)　種類:%s"
            putex message + sprintf(f, item_index, item.send(:name), method)
            if method == :note
              putex "    内容: " + param.gsub(/\n/) {|matched| matched + "    内容: " }
            else
              putex "    内容: " + param
            end
          end
        end
      end
    end
    return hit
  end
  
  def self.setting_search(file_name)
  end



  DATA_EVENT_SYMBOL = {
    :script   =>  [[355, 655], ["スクリプト", "文章", :string, 0]],
    :message  =>  [[     401], ["文章の表示", "文章", :string, 0]],
    :scroll   =>  [[     405], ["スクロール", "文章", :string, 0]],
    :mes_face =>  [[101     ], ["文章グラ名", "名前", :string, 0]],
    :picture  =>  [[231     ], ["ピクチャ名", "名前", :string, 1]],
    
    :label    =>  [[118     ], ["ﾗﾍﾞﾙ設定　", "ﾗﾍﾞﾙ", :string, 0]],
    :label_j  =>  [[119     ], ["ﾗﾍﾞﾙｼﾞｬﾝﾌﾟ", "ﾗﾍﾞﾙ", :string, 0]],
    
    :swi_if   =>  [[111     ], ["分岐", "分岐", :if]],
    :var_if   =>  [[111     ], ["分岐", "分岐", :if]],
    :swi_set  =>  [[121     ], ["ｽｲｯﾁの操作", "操作", :swi_set]],
    :var_set  =>  [[122     ], ["変数の操作", "操作", :var_set]],
    
    :map_swi  =>  [[], ["ﾍﾟｰｼﾞ:変数", nil, nil]],
    :map_var  =>  [[], ["ﾍﾟｰｼﾞ:ｽｲｯﾁ", nil, nil]],
    :com_swi  =>  [[], ["ﾄﾘｶﾞｰ:ｽｲｯﾁ", nil, nil]],
  }
  DATA_EVENT_KIND = {}
  DATA_EVENT_CODE = []
  DATA_EVENT_SYMBOL.each do |key, data|
    next unless BY_EVENT[key]
    DATA_EVENT_CODE += data[0]
    data[0].each do |code|
      DATA_EVENT_KIND[code] = data[1]
    end
  end
  def self.search_codes
    return DATA_EVENT_CODE
  end
  def self.code_kind(code)
    return DATA_EVENT_KIND[code]
  end
  
  DATA_EVENT_SWI_ID = []
  DATA_EVENT_VAR_ID = []
  EVENT_SWITCH_LIST.each do |d|
    d = d..d if d.is_a?(Integer)
    d.each {|id| DATA_EVENT_SWI_ID.push(id) }
  end
  EVENT_VARIABLE_LIST.each do |d|
    d = d..d if d.is_a?(Integer)
    d.each {|id| DATA_EVENT_VAR_ID.push(id) }
  end
  def self.swi_id_include?(d)
    d = d..d if d.is_a?(Integer)
    d.any? {|id| DATA_EVENT_SWI_ID.include?(id) }
  end
  def self.var_id_include?(d)
    d = d..d if d.is_a?(Integer)
    d.any? {|id| DATA_EVENT_VAR_ID.include?(id) }
  end
  def self.swi_name(id)
    if EVENT_VAR_NAME == 0
      sprintf("%04d", id)
    else
      sprintf("%04d:%s", id, @data_system.switches[id])
    end
  end
  def self.var_name(id)
    if EVENT_VAR_NAME == 0
      sprintf("%04d", id)
    else
      sprintf("%04d:%s", id, @data_system.variables[id])
    end
  end
  
  def self.var_plus(s)
    return "#{EVENT_VAR_PUT_PLUS[0]}#{s}#{EVENT_VAR_PUT_PLUS[1]}"
  end
  def self.var_if_type(param4)
    if EVENT_VAR_PUT_IF == 1
      case param4
      when 0; c = "=="
      when 1; c = ">="
      when 2; c = "<="
      when 3; c = ">"
      when 4; c = "<"
      when 5; c = "!="
      end
    else
      case param4
      when 0; c = var_plus("と同値")
      when 1; c = var_plus("以上")
      when 2; c = var_plus("以下")
      when 3; c = var_plus("超")
      when 4; c = var_plus("未満")
      when 5; c = var_plus("以外")
      end
    end
    return c
  end
  def self.var_set_type(params)
    if EVENT_VAR_PUT_SET == 1
      case params[2]
      when 0; c = "="
      when 1; c = "+="
      when 2; c = "-="
      when 3; c = "*="
      when 4; c = "/="
      when 5; c = "<<<<<<>>>>>>="
      end
    else
      case params[2]
      when 0; c = var_plus("代入")
      when 1; c = var_plus("加算")
      when 2; c = var_plus("減算")
      when 3; c = var_plus("乗算")
      when 4; c = var_plus("除算")
      when 5; c = var_plus("剰余")
      end
    end
    case params[3]
    when 0; t = "定数#{params[4]}"
    when 1; t = "変数[%s]" % var_name(params[4])
    when 2; t = "乱数#{params[4]}～#{params[5]}"
    when 3; t = "ゲームデータ(要確認)"
      # value = game_data_operand(@params[4], @params[5], @params[6])
    when 4; t = "スクリプト:#{params[4]}"
    end
    return "#{c}  #{t}"
  end
  
  def self.data_kind
    return BY_DATA.inject([]) {|kind, data| kind.push(data[0]) }.uniq
  end
  def self.data_methods(kind)
    return BY_DATA.select {|data| data[0] == kind }.map {|data| data[1] }
  end
  def self.load_database(kind)
    case kind
    when :actor  ; load_data("Data/Actors.rvdata2")
    when :class  ; load_data("Data/Classes.rvdata2")
    when :skill  ; load_data("Data/Skills.rvdata2")
    when :item   ; load_data("Data/Items.rvdata2")
    when :weapon ; load_data("Data/Weapons.rvdata2")
    when :armor  ; load_data("Data/Armors.rvdata2")
    when :enemy  ; load_data("Data/Enemies.rvdata2")
    when :state  ; load_data("Data/States.rvdata2")
    end
  end
  def self.database_name(kind)
    case kind
    when :actor  ; "アクター"
    when :class  ; "職業"
    when :skill  ; "スキル"
    when :item   ; "アイテム"
    when :weapon ; "武器"
    when :armor  ; "防具"
    when :enemy  ; "敵キャラ"
    when :state  ; "ステート"
    end
  end
  
  def self.putex(mes)
    puts(mes)
    @@text += mes.gsub(/\n$/) { "" }
    @@text += "\n"
  end
  def self.clear_text
    @@text = ""
  end
  def self.save_text
    File.open("search.txt", "w") {|f| f.write @@text }
  end
  
end

Event_Search.search if $TEST and !$BTEST and Event_Search::USE_ALL