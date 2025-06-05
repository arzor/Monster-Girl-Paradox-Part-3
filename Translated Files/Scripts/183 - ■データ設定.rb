=begin
=データ設定 by Foo

開発中の間、設定データファイルを読み込むための一時セクションです


==更新履歴
  Date     Version Author Comment


=end

#==============================================================================
# ■ NWConst::Data
#==============================================================================
module NWConst::Data
  DIRECTORY_PATH = "SettingData"
end

if Dir.exist?(NWConst::Data::DIRECTORY_PATH)

Dir.entries(NWConst::Data::DIRECTORY_PATH).each{|file_name|
  next if file_name == "." || file_name == ".."
  begin
    eval File.read(sprintf("%s\/%s", NWConst::Data::DIRECTORY_PATH, file_name))
  rescue Exception => exc
    p "【Failed!】#{file_name}で異常が発生しました"
    p exc
  else
    p "【Success】#{file_name}を正常に読み込みました"
  end
}

end