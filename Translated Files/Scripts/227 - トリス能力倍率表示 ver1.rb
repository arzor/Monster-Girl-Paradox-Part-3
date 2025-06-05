
=begin

もんむす・くえすと！ＲＰＧ
　トリス能力倍率表示  ver1  2017/03/24



機能一覧　説明は下　このverで新規追加したものは●　変更したものは○
●装備画面でCTRLキーを押すと、そのアクターの能力値倍率をコンソールに表示


機能　説明
●装備画面でCTRLキーを押すと、そのアクターの能力値倍率をコンソールに表示
　通常能力値（最大HP～器用さの8つ）について、以下の倍率を表示
　　・各特徴オブジェクトについて、特徴「通常能力値 * 〇〇%」があればその倍率
　　　特徴オブジェクト(区別表示)：
　　　　ステート(State)、アクター(Actor)、職業,種族(Class)、装備(Weapon,Armor)
　　　　人間時追加特徴(Class)、アビリティ(Armor ※パッシブ能力防具)
　　・能力強化/弱体があればその倍率
　以下のものによる倍率は表示しない
　　・装備品の変化量にのみ適用する<武器マスタリー><防具マスタリー>
　　・戦闘中のみ有効な<HP減少時強化><オーバーソウル><地形強化>
　

=end

#==============================================================================
# ■ Game_Actor
#==============================================================================
class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  # ● 能力値倍率の表示
  #--------------------------------------------------------------------------
  def show_param_rate_all
    puts ""
    puts "#{self.name}　Summary of status changes"
    (0..7).each do |param_id|
      show_param_rate_id_result(param_id)
      show_param_rate_id_normal(param_id)
      show_param_rate_id_buff(param_id)
    end
    puts ""
  end
  #--------------------------------------------------------------------------
  # ● 能力値倍率の表示：結果
  #--------------------------------------------------------------------------
  def show_param_rate_id_result(param_id)
    result = param_rate(param_id) * param_buff_rate(param_id)
    puts "#{Vocab::param(param_id)}　Total:#{result}"
  end
  #--------------------------------------------------------------------------
  # ● 能力値倍率の表示：
  #--------------------------------------------------------------------------
  def show_param_rate_id_normal(param_id)
    feature_objects.each do |obj|
      obj.features.each do |ft|
        next unless (ft.code == FEATURE_PARAM && ft.data_id == param_id)
        print "  "
        p [obj.class, obj.name, ft.value]
      end
    end
  end
  #--------------------------------------------------------------------------
  # ● 能力値倍率の表示：
  #--------------------------------------------------------------------------
  def show_param_rate_id_buff(param_id)
    buff_rate = param_buff_rate(param_id)
    if buff_rate != 1.0
      print "  "
      p ["Buff/Debuff", buff_rate]
    end
  end
end