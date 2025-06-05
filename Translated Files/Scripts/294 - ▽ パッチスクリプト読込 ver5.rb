
SCRIPT_UPDATE_ID = "qoiekacb"

=begin

もんむす・くえすと！ＲＰＧ
　パッチスクリプト読込 ver5  2017/06/10

「▼ メイン」のすぐ上に配置する

Patch/patch.rb がパッチファイル

パッチファイルの1～4行目は以下のようにする
  1:# 936188
  2:
  3:p_version = "v1.20"
  4:$patch_ver = "#{p_version}.00"

1行目は「# (認証番号)」
3行目は「p_version = "(本体バージョン)"」
4行目は「$patch_ver = "#{p_version}.(パッチバージョン)"」

3行目と4行目のバージョン番号は、タイトル画面左上やエラーメッセージに表示される

パッチ読み込み時、1行目の認証番号が「正常認証番号」と合致しなければ
・戦闘テスト以外ならエラー終了
・戦闘テストなら正常認証番号をメッセージボックスで表示し、その後に戦闘テスト開始

正常認証番号は「パッチファイルの２行目以降の全内容」から
　「改行コード、空白、数値」を除いた全文字に依存して決まる
バージョン番号の数値を書き変えただけでは、正常認証番号は変わらない
具体的には、上記全文字の文字コード番号(整数)の総和をnとして
　「n」×「nの平方根(小数)の右端の数を、1ケタの整数とした値」とする

=end

#==============================================================================
# ■ NWPatch
#==============================================================================
module NWPatch
  DIR_NAME  = "Patch"
  FILE_NAME = "Patch.rb"
  PATH      = DIR_NAME + "/" + FILE_NAME
  
  def self.included?
    return $patch_ver
  end
  def self.ver_str(t = "")
    return included? ? "#{$patch_ver}#{t}" : ""
  end
  def self.ver_name(t = "")
    return included? ? "Ver#{ver_str}#{t}" : ""
  end
end

if File.exist?(NWPatch::PATH)
  s = File.read(NWPatch::PATH)
  s1 = ""
  n = 0
  s.each_line do |line|
    if s1 == ""
      s1 = line
    else
      line.gsub(/\d|\s/, "").each_char {|c| n += c.unpack("U*")[0] }
    end
  end
  true_pass = n * Math.sqrt(n).to_s[-1].to_i
  if s1 =~ /^#\s*(\d+)/ and $1.to_i == true_pass
    if $TEST
      p "パッチの認証番号が正常です　パッチを読み込みました"
    end
  else
    if $BTEST
      mes  = "パッチの認証番号が不正ですが、テストプレイ中のため、パッチを読み込んで実行します"
      mes += "\n以下に正しい認証番号を表示します"
      mes += "\n\nPatch/Patch.rb の1行目を次のように変更してください"
      mes += "\n\n##{true_pass}"
      msgbox mes
    elsif Object.const_defined?(:PATCH_TEST)
      p "PatchError  - パッチの内容が不正です　ダウンロードし直してください"
      p "PatchError  - パッチの内容が不正です　ダウンロードし直してください"
      p "PatchError  - パッチの内容が不正です　ダウンロードし直してください"
      p "PatchError  - パッチの内容が不正です　ダウンロードし直してください"
      p "PatchError  - パッチの内容が不正です　ダウンロードし直してください"
      p "PatchError  - パッチの内容が不正です　ダウンロードし直してください"
      p "PatchError  - パッチの内容が不正です　ダウンロードし直してください"
      p "PatchError  - パッチの内容が不正です　ダウンロードし直してください"
      p "PatchError  - パッチの内容が不正です　ダウンロードし直してください"
      p "true_pass:#{true_pass}"
    else
      raise "PatchError  - パッチの内容が不正です　ダウンロードし直してください"
    end
  end
  eval(s)
end