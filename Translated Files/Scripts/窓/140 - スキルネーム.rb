=begin
=窓/スキルネーム




==更新履歴
  Date     Version Author Comment

=end

#==============================================================================
# ■ Window_SkillName
#==============================================================================
class Window_SkillName < Window_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(line_number = 1)
    super(Graphics.width / 4, 0, Graphics.width / 2, fitting_height(line_number))
    self.z = 200
    self.openness = 0
    @text = nil
  end
  #--------------------------------------------------------------------------
  # ● 更新処理
  #--------------------------------------------------------------------------
  def update
    super
    if @text.nil? && $game_party.display_skill_name
      @text = $game_party.display_skill_name
      refresh
      open
    elsif $game_party.display_skill_name.nil? && @text
      close
      @text = nil
      contents.clear
    elsif @text && $game_party.display_skill_name && (@text != $game_party.display_skill_name)
      @text = $game_party.display_skill_name
      refresh
    end
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    draw_text(0, 0, contents_width, contents_height, @text, 1)
  end
end
