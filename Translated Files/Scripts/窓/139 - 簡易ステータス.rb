=begin
=窓/簡易ステータス




==更新履歴
  Date     Version Author Comment

=end

#==============================================================================
# ■ Window_SimpleStatus
#==============================================================================
class Window_SimpleStatus < Window_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(actor)
    super(480, 0, 160, fitting_height(2))
    self.z = 200
    @actor = actor
    refresh
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    open  if close? && $game_switches[NWConst::Sw::SIMPLE_STATUS]
    close if open? && !$game_switches[NWConst::Sw::SIMPLE_STATUS]
    refresh if @actor_hp != @actor.hp
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    @actor_hp = @actor.hp
    contents.clear
    rect = Rect.new(0, 0, contents.rect.width, contents.rect.height / 2)
    change_color(normal_color)
    draw_text(rect, @actor.name, 1)
    rect.y += rect.height
    draw_actor_hp(@actor, rect.x, rect.y, rect.width)
  end
end

