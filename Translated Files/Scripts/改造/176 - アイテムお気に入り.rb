# =改造/エラー処理
#
#
#
#
# ==更新履歴
#   Date     Version Author Comment
# ==15/09/03 2.0.2   トリス 統合J～U R移植
# ==17/10/21 2.2.0   ひまわり　バグ修正

#==============================================================================
# ■ Game_Party
#==============================================================================
class Game_Party < Game_Unit
  #--------------------------------------------------------------------------
  # ○ アイテムのお気に入り状態を変更
  #--------------------------------------------------------------------------
  def set_favorite_item(item)
    return nil if item.nil?

    container = item_container(item)
    container[item.index].favorite_flag = !container[item.index].favorite_flag
  end

  #--------------------------------------------------------------------------
  # ○ お気に入りかどうか
  #--------------------------------------------------------------------------
  def favorite_item?(item)
    return nil if item.nil?

    container = item_container(item)
    return unless container

    container[item.index].favorite_flag
  end
end
