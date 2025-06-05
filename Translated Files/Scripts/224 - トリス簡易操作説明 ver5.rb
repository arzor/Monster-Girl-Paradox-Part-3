#
# もんむす・くえすと！ＲＰＧ
# 　トリス簡易操作説明  ver5  2015/04/18
#   2017/10/21 バグ修正
#
# 機能一覧　説明は下　このverで新規追加したものは●　変更したものは○
# ○各画面の右下に簡易操作説明を表示
#
#
# 機能　説明
# ・各画面の上部ウィンドウ右下に簡易操作説明を表示
# 　有効な画面
# 　・アイテム、装備、スキル、アビリティ、ステータス
# 　・ショップ、合成、コイン景品交換
#
#
#

#==============================================================================
# ■ Sprite_ShowKey
#==============================================================================
class Sprite_ShowKey < Sprite_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(window)
    super(nil)
    set_window(window)
    self.bitmap = Bitmap.new(Graphics.width, Graphics.height)
    bitmap.font.size = 14
    bitmap.font.outline = false
    set_text("")
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウ設定
  #--------------------------------------------------------------------------
  def set_window(window)
    self.viewport = window.viewport
    self.z = window.z + 1
    # @pos = [window.x + window.width, window.y + window.height]
    @pos = [Graphics.width, Graphics.height]
  end

  #--------------------------------------------------------------------------
  # ● テキスト設定
  #--------------------------------------------------------------------------
  def set_text(text)
    text ||= ""
    if @text != text
      @text = text
      refresh
    end
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    bitmap.clear
    str = if @text.is_a?(Array)
            @text.compact.inject("") { |r, s| r += " " + s + " " }
          else
            " " + @text + " "
          end
    return if (str.gsub(/ /) { "" }).empty?

    pw = bitmap.text_size(str).width + 0
    px = @pos[0] - pw
    ph = bitmap.font.size + 0
    py = @pos[1] - ph
    rect = Rect.new(px, py, pw, ph)
    bitmap.fill_rect(rect, Color.new(0, 0, 0, 192))
    bitmap.draw_text(rect, str, 1)
  end
end

#==============================================================================
# ■ Scene_Ability
#==============================================================================
class Scene_Ability < Scene_MenuBase
  include ShowKey_HelpWindow
  #--------------------------------------------------------------------------
  # ● 簡易操作説明テキスト
  #--------------------------------------------------------------------------
  def show_key_text
    if @ability_type_window.active
      [ShowKey_Help.ability_shift_all, ShowKey_Help.ability_form_call, ShowKey_Help.lr_actor]
    elsif @equip_ability_window.active
      [ShowKey_Help.ability_shift, ShowKey_Help.lr_scroll]
    elsif @stand_ability_window.active
      [ShowKey_Help.lr_scroll]
    end
  end
end

#==============================================================================
# ■ Scene_Shop
#==============================================================================
class Scene_Shop < Scene_MenuBase
  include ShowKey_HelpWindow
  #--------------------------------------------------------------------------
  # ● 簡易操作説明テキスト
  #--------------------------------------------------------------------------
  def show_key_text
    if @sell_window.active
      (@sell_window.item.is_a?(RPG::EquipItem) ? [ShowKey_Help.equip_info] : []) + [ShowKey_Help.lr_scroll]
    elsif @buy_window.active
      equip = @buy_window.item.is_a?(RPG::EquipItem)
      @buy_window.active
      page = equip && @status_window.page_max >= 2
      result = []
      result += [ShowKey_Help.shop_equip_change] if equip && page
      result += [ShowKey_Help.shop_param_compare] if equip
      result += [ShowKey_Help.lr_scroll]
      result
    elsif @number_window.visible
      @number_window.item.is_a?(RPG::EquipItem) ? [ShowKey_Help.equip_info] : []
    end
  end
end

#==============================================================================
# ■ Scene_Synthesize
#==============================================================================
class Scene_Synthesize < Scene_MenuBase
  include ShowKey_HelpWindow
  #--------------------------------------------------------------------------
  # ● 簡易操作説明テキスト
  #--------------------------------------------------------------------------
  def show_key_text
    if @lineup_window.active
      equip = @lineup_window.item.is_a?(RPG::EquipItem)
      page = equip && @status_window.page_max >= 2
      result = []
      result += [ShowKey_Help.shop_equip_change] if equip && page
      result += [ShowKey_Help.shop_param_compare] if equip
      result += [ShowKey_Help.lr_scroll]
      result
    elsif !equip_info_hide? && !equip_info_window_visible
      [ShowKey_Help.shop_param_compare]
    end
  end
end

#==============================================================================
# ■ Scene_CasinoPrize
#==============================================================================
class Scene_CasinoPrize < Scene_MenuBase
  include ShowKey_HelpWindow
  #--------------------------------------------------------------------------
  # ● 簡易操作説明テキスト
  #--------------------------------------------------------------------------
  def show_key_text
    return unless @lineup_window.active

    equip = @lineup_window.item.is_a?(RPG::EquipItem)
    page = equip && @status_window.page_max >= 2
    result = []
    result += [ShowKey_Help.shop_equip_change] if equip && page
    result += [ShowKey_Help.shop_param_compare] if equip
    result += [ShowKey_Help.lr_scroll]
    result
  end
end

class Scene_JobChange
  include ShowKey_HelpWindow
  def show_key_text
    return unless @class_name_window.active

    "#{Vocab.key_a}:Use EXP Items"
  end
end
