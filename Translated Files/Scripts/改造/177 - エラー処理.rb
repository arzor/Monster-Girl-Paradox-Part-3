=begin
=Mod/Error Handling




==Changelog
  Date     Version Author Comment
==15/09/03 2.0.2   トリス 統合J～U L移植

=end

# ---------------------------------------------------------------------------
# ◆ モジュール ErrorLogWriter
# ---------------------------------------------------------------------------
module ErrorLogWriter
  # -------------------------------------------------------------------------
  # ◆ エラー情報を記録 ( DEBUG のみ ⇒ デバッグ以外でも)
  # -------------------------------------------------------------------------
  def self.write( errobj )
    begin
      begin
        Graphics.safe_update
      rescue SecurityHazard
      end
      sleep(0.1)
      File.open("errors.txt","a") do | file |
        file.write("*Error - " + NWPatch.ver_str(" - ") +
                  (Time.now).strftime("%Y-%m-%d %H:%M:%S (%A)") + "\n")
        file.write( "Exception : #{errobj.class}\n" )
        file.write( errobj.message )
        unless $@.nil? and $@.empty?
          backtrace = ""
          for str in $@.dup
            unless (str[ERROR_SECTION_NUM]).nil?
              extra = $RGSS_SCRIPTS.at($1.to_i).at(1)
              str.gsub!(ERROR_SECTION) { "( " + extra + " )：" } 
            end
            backtrace += str
           end
          file.write( "\ntrace:\n" + $@.inspect + "\n" )
        end
      end
    rescue Exception => errs
      raise( errs , 
      errs.message + "\n (" + (errobj.class).to_s + " )\n" + errobj.message )
    end
  end
end
module MessageBox
  # ---------------------------------------------------------------------------
  # ◆ 異常終了のメッセージを整形
  # ---------------------------------------------------------------------------
  def self.error_message_setup( errobj )
    Graphics.freeze
    begin
      Graphics.safe_update
    rescue SecurityHazard
    end
    _message = ""
    # バックトレースを記憶する
    unless $@.nil? or ($@.at(0)).nil?
      tracer =  ($@.at(0)).dup
      # バックトレースを解析する
      backtrace = ""
      i = 0
      for str in $@.dup
        unless (str[ERROR_SECTION_NUM]).nil?
          extra = $RGSS_SCRIPTS.at($1.to_i).at(1)
          str.gsub!(ERROR_SECTION) { "( " + extra + " )：" } 
        end
        backtrace += str
      end
      unless errobj.is_a?(SystemStackError)
        if rpgvxace?
          _message = errobj.message.dup.force_encoding("UTF-8") + 
                     "\n** backtrace：\n" + backtrace
        else
          _message = errobj.message + "\n** backtrace：\n" + backtrace
        end
      end
    else
      tracer = "" # バックトレース取得失敗
      if rpgvxace?
        _message = errobj.message.force_encoding("UTF-8")
      else
        _message = errobj.message
      end
    end    
    until (_message[DOUBLE_CRLF]).nil?
      _message.gsub!(DOUBLE_CRLF){ "\n" }
    end
    _message = NWPatch.ver_name("\n") + 
               "Due to error " + (errobj.class).inspect +
               "this program is unable to continue processing.\n" +
               "If this bug has not been detailed on the official" + 
               "website [Patch Support], please report it.\n" + 
               "We apologize for any inconvenience this has caused.\n" +
               "\n" + 
               "Details:\n" +
               _message
    return _message, tracer
  end
end