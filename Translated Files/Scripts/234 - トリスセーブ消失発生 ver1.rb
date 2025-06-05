
=begin

もんむす・くえすと！ＲＰＧ
　セーブ消失任意発生 ver1  2015/03/14

設定の USE を true にすると、必ずセーブ失敗します。

=end

module MakeSaveError
  
  # true:有効　false:無効
  USE = false
  
end

if MakeSaveError::USE
#==============================================================================
# ■ Scene_Map
#==============================================================================
class Scene_Map < Scene_Base
  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  alias :make_save_error_start :start
  def start
    make_save_error_start
    msgbox "The Script 「MakeSaveError」 is Enabled. Disable for Commercial Use."
    $game_actors[1].instance_eval "@aaa = Bitmap.new(32, 32)"
  end
end
end