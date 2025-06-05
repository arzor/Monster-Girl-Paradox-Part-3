
=begin

もんむす・くえすと！ＲＰＧ
　トリスパーティ人数検索  ver1  2016/01/05



テストプレイでのゲーム起動時、
　以下のものを検索してコンソールに表示
　　・全コモンイベントと全マップイベントの特定コマンドの各行
　　から、パーティ人数を使用しているもの
　また表示した内容を search_party_size.txt に保存

イベント検索
・イベントコマンド　　　　　　　　　　　　　　　　　↓コンソール表示の「種類」名
　　変数の操作　　ｹﾞｰﾑﾃﾞｰﾀ　その他　ﾊﾟｰﾃｨ人数　 　　変数の操作
　　変数の操作　　ｽｸﾘﾌﾟﾄ　　文字列(STRING_LIST)　 　変数ｽｸﾘﾌﾟﾄ
　　スクリプト　　　　　　　文字列(STRING_LIST)　 　スクリプト


○設定の無効化
　一部設定は、行の左端に「#」を付けることで無効化できる
　行にカーソルを合わせて Ctrl + Q を押すと # のオンオフができる
　複数の行をドラッグで選択して Ctrl + Q を押すと、全ての行に効果が出る
　　無効化できる設定
　　　USE
　　　STRING_LIST
　　　BY_EVENT
　（USEとBY_EVENTは、無効化した行は false と同じになる）


=end

module PartySize_Search
  
  # この機能を使うかどうか　true:使う false:使わない
  USE_ALL = false
  
  # 有効設定  true:検索する false:しない
  USE = {
    :common    =>  true,  # コモンイベント
    :map       =>  true,  # マップイベント
  }
  
  # コモンイベントIDとマップIDの検索範囲　「a..b」の形式で指定
  #   1つのIDだけを検索したい場合は 1..1 のようにする
  COMMON_ID  = 1..9999  # コモンイベントID
  MAP_ID     = 1..999   # マップID
  
  
  
  # イベント 文字列の検索パターン　//の間に文字列を指定　正規表現(後述)も使用可能
  STRING_LIST = [
    /members\.size/ # 正規表現中では「. は任意の一文字」「\. は .」を表す
  ]
  
  
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
    :script   =>  true,   # コマンド:スクリプト
    :var_set  =>  true,   # コマンド:変数の操作
  }
  
  
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
module PartySize_Search
  
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
    putex "★「トリスパーティ人数検索」検索開始"
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
        hit1 += self.event_page_list_search(m, event.list)
      end
      putex ""
    end
    if USE[:map]
      putex "☆マップイベント検索開始"
      mapinfodata = load_data("Data/MapInfos.rvdata2")
      search_report_flag = false
      for map_id in MAP_ID
        if (map_id - 1) % 100 == 0 and search_report_flag
          puts sprintf("＜マップ%dまで検索終了＞", map_id - 1)
          search_report_flag = false
        end
        filename = sprintf("Data/Map%03d.rvdata2", map_id)
        next unless File.exist?(filename)
        search_report_flag = true
        mapdata = load_data(filename)
        mapname = mapinfodata[map_id].name
        mapdata.events.each_value do |event|
          next unless event
          event.pages.each_with_index do |page, page_index|
            f = "○マップ%d(%s)\n　イベント%d(x%d y%d) ページ番号%d"
            m = sprintf(f, map_id, mapname, event.id, event.x, event.y, page_index+1)
            hit2 += self.event_page_list_search(m, page.list)
          end
        end
      end
      putex ""
    end
    putex "★「トリスパーティ人数検索」検索終了"
    putex sprintf("　コモンイベント コマンド のヒット数:%d", hit1) if USE[:common]
    putex sprintf("　マップイベント コマンド のヒット数:%d", hit2) if USE[:map]
    save_text
    putex ""
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
          STRING_LIST.each do |pattern|
            if param[kind[3]] =~ pattern
              str = param[kind[3]]
              hit += 1
              putex message + sprintf(f, kind[1], str)
              break
            end
          end
        when :variable
          if param[3] == 4
            kind_s = "変数ｽｸﾘﾌﾟﾄ"
            f = "　行番号#{command_index+1}　種類:#{kind_s}\n　　%s: %s"
            STRING_LIST.each do |pattern|
              if param[4] =~ pattern
                str = param[4]
                hit += 1
                putex message + sprintf(f, "文章", str)
                break
              end
            end
          end
          if [param[3], param[4], param[5]] == [3, 7, 1]
            kind_s = "変数の操作"
            f = "　行番号#{command_index+1}　種類:#{kind_s}\n　　%s: %s"
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
            putex message + sprintf(f, "操作", str)
          end
        end
      end
    end
    return hit
  end
  


  DATA_EVENT_SYMBOL = {
    :script   =>  [[355, 655], ["スクリプト", "文章",  :string, 0]],
    :var_set  =>  [[122     ], ["error",      "error", :variable]],
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
  def self.var_id_include?(d)
    true
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
    when 3; t = [params[4], params[5]] == [7, 1] ? "パーティ人数" : "ゲームデータ"
    when 4; t = "スクリプト:#{params[4]}"
    end
    return "#{c}  #{t}"
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
    File.open("search_party_size.txt", "w") {|f| f.write @@text }
  end
  
end

PartySize_Search.search if $TEST and !$BTEST and PartySize_Search::USE_ALL