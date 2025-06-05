=begin #=======================================================================

◆◇ターゲット拡張 RGSS3◇◆

◆DEICIDE ALMA
◆レーネ　
◆http://blog.goo.ne.jp/exa_deicide_alma

◆機能/注意
スキルやアイテムにデータベースで設定できない効果範囲を設定できるようにします。
また、ランダム攻撃時の攻撃の重複回数の限界を設定することができます。

※効果範囲がランダムや全体の場合は
　データベースの効果範囲はタゲ選択不可のランダムか全体にしてください。

★スキルかアイテムのメモ欄に以下のワードを書いて使用します。
--------------------------------------------------------------------------------
◆重複回数の設定
<重複限界:n> ⇒ ランダム攻撃時の同じユニットへの重複回数の限界 

※制限超過分は拡散せずに消滅。
  敵３体にランダム８回攻撃を行った際に４、１、３回当たるとして
  <重複限界:2>の表記があった場合は２、１、２回になります。
  
◆重複アニメの設定
<重複アニメ無効> ⇒ 同じターゲットにアニメを１度しか再生しないようにする

※VXAでは、ランダムｎ体のときに同じタゲに何度もアニメを再生します。
(中心のアニメのみ？)
--------------------------------------------------------------------------------
◆ターゲット拡張用ワード(２つ以上書かないこと)
<敵単体連続:n> ⇒ 敵単体にｎ回効果
<敵全体連続:n> ⇒ 敵全体にｎ回効果
<敵ランダム:n> ⇒ 敵にｎ回効果(タゲは１回ごとにバラバラ、重複あり)
<敵ランダム連続:n> ⇒ ランダムな敵１体に対してｎ回効果(タゲ選択不可の敵単体連続)

<味方単体連続:n> ⇒ 味方単体にｎ回効果
<味方全体連続:n> ⇒ 味方全体にｎ回効果
<味方ランダム:n> ⇒ 味方にｎ回効果(タゲは１回ごとにバラバラ、重複あり)
<味方ランダム連続:n> ⇒ タゲ選択不可の味方単体連続

<敵味方全体>       ⇒ 敵味方全体に効果
<敵味方ランダム:n> ⇒ 敵味方にｎ回効果(タゲは１回ごとにバラバラ、重複あり)
--------------------------------------------------------------------------------
◆上記ワードと併用前提のワード(単独使用不可)
<追加ランダム:n> ⇒ 効果を０～ｎ回追加

<使用者除外:n> ※n は 0 か 1

0 ⇒ 最後に使用者を除外する
　　 (ランダム範囲の場合、使用者が選ばれた回数分、攻撃回数が減ります)

1 ⇒ 始めから使用者を除外しておく
     (ランダム範囲専用、使用者が選ばれることがないので回数分攻撃)

※ランダム範囲でない場合は 0 にしてください。 
--------------------------------------------------------------------------------
■例１：自分以外の味方全体
メモ欄記述は
<味方全体連続:1>
<使用者除外:0>

■例２：自分以外の敵味方ランダムで５～８回攻撃
メモ欄記述は
<敵味方ランダム:5>
<追加ランダム:3>
<使用者除外:1>    ※0 だと使用者が選ばれた回数分、攻撃回数が減ってしまいます。

--------------------------------------------------------------------------------
※ターゲットが誰もいなくなる場合は、自動的に使用者に効果になります。
　この場合、効果範囲の設定がおかしいので設定を見直してください。
　(味方ランダム＆使用者除外など)

◆導入箇所
▼素材のところ、mainより上

=end #=========================================================================
module RENNE ; module Target_Exp
  # 重複限界
  OVERLAP = /<重複限界[:：](\d+)>/
  
  # 重複アニメ無効
  NON_OL_ANIMA = "<重複アニメ無効>"
  
  # 敵のターゲット拡張
  Reg1 = /<敵単体連続:(\d+)>/
  Reg2 = /<敵全体連続:(\d+)>/
  Reg3 = /<敵ランダム:(\d+)>/
  
  # 味方のターゲット拡張
  Reg4 = /<味方単体連続:(\d+)>/
  Reg5 = /<味方全体連続:(\d+)>/
  Reg6 = /<味方ランダム:(\d+)>/
  
  # 敵味方など特殊なターゲット
  Reg7 = /<敵ランダム連続:(\d+)>/
  Reg8 = /<味方ランダム連続:(\d+)>/
  Reg9 = /<敵味方全体>/ 
  Reg10 = /<敵味方ランダム:(\d+)>/
  
  # 上記ワードとの併用ワード(単独使用不可)
  Add1 = /<追加ランダム:(\d+)>/
  Add2 = /<使用者除外>|<使用者除外:(\d+)>/
  
end ; end

$renne_rgss3 = {} if $renne_rgss3.nil?
$renne_rgss3[:target_exp] = true

class RPG::UsableItem < RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● インクルード
  #--------------------------------------------------------------------------
  include RENNE::Target_Exp
  #--------------------------------------------------------------------------
  # ● 拡張ターゲットの取得
  #--------------------------------------------------------------------------
  def exp_target
    if @exp_target.nil?
      @exp_target = []
      @exp_target[2] = -1
      note.each_line{|line|
      case line
      when Reg1 ; @exp_target[0] = [1,$1.to_i]
      when Reg2 ; @exp_target[0] = [2,$1.to_i]
      when Reg3 ; @exp_target[0] = [3,$1.to_i]
      when Reg4 ; @exp_target[0] = [4,$1.to_i]
      when Reg5 ; @exp_target[0] = [5,$1.to_i]
      when Reg6 ; @exp_target[0] = [6,$1.to_i]
      when Reg7 ; @exp_target[0] = [7,$1.to_i]
      when Reg8 ; @exp_target[0] = [8,$1.to_i]
      when Reg9 ; @exp_target[0] = [9, true]
      when Reg10; @exp_target[0] = [10,$1.to_i]
      when Add1 ; @exp_target[1] = $1.to_i + 1
      when Add2 ; @exp_target[2] = $1.nil? ? 0 :$1.to_i
      end
      }
      if @exp_target[0].nil?
        @exp_target = false
      end
    end
    return @exp_target
  end

  def exp_target?
    exp_target != false
  end

  def exp_target_random?
    exp_target? && [1, 2, 3].include?(exp_target[0][0])
  end
  #--------------------------------------------------------------------------
  # ● 重複限界スキルの設定を取得
  #--------------------------------------------------------------------------
  def overlap_limit
    if @overlap_limit.nil?
      @overlap_limit = note[OVERLAP,1].to_i
    end
    return @overlap_limit
  end
  #--------------------------------------------------------------------------
  # ● 重複アニメの無効化フラグの取得
  #--------------------------------------------------------------------------
  def non_overlap_anima?
    if @non_overlap_anima.nil?
      @non_overlap_anima = note.include?(NON_OL_ANIMA)
    end
    return @non_overlap_anima
  end
end

class Game_Unit
  #--------------------------------------------------------------------------
  # ● 拡張ランダムターゲットの取得
  #--------------------------------------------------------------------------
  def exp_ram_target(subject)
    tgr_rand = rand * (tgr_sum - subject.tgr)
    arr = alive_members - [subject]
    arr.each do |member| 
      tgr_rand -= member.tgr
      return member if tgr_rand < 0
    end
    return arr[0]
  end
end

class Game_Action
  #--------------------------------------------------------------------------
  # ● 制限ターゲットの作成
  #--------------------------------------------------------------------------
  def limit_targets(arr, max)
    result = []
    temp = {}
    arr.each{|obj|
      temp[obj] = temp[obj].to_i + 1
      result << obj unless temp[obj] > max
    }
    return result
  end
  #--------------------------------------------------------------------------
  # ● 拡張ターゲットの作成
  #--------------------------------------------------------------------------
  def make_exp_targets
    arr = []
    exp = item.exp_target
    exp_id = exp[0][0]
    num = exp[0][1]
    ram = exp[1] ? rand(exp[1]) : 0
    ex_remove = friends_unit.members.size == 1
    case exp_id
    when 1
      num += @subject.skill_plus_attack(item)
      arr << opponents_unit.smooth_target(@target_index)
      arr *= (num + ram)
    when 2
      num += @subject.skill_plus_attack(item)
      arr = opponents_unit.alive_members
      arr *= (num + ram)
    when 3
      num += @subject.skill_plus_attack(item)
      (num + ram).times { arr << opponents_unit.random_target }
    when 4
      arr << friends_unit.smooth_target(@target_index)
      arr *= (num + ram)
    when 5
      arr = item.for_dead_friend? ? friends_unit.dead_members : friends_unit.alive_members
      arr *= (num + ram)
    when 6
      if exp[2] == 1
        (num + ram).times { arr << friends_unit.exp_ram_target(@subject.master_observer) }
      else
        (num + ram).times { arr << friends_unit.random_target }
      end
    when 7
      arr << opponents_unit.random_target
      arr *= (num + ram)
    when 8
      arr << friends_unit.random_target
      arr *= (num + ram)
    when 9
      arr = opponents_unit.alive_members + friends_unit.alive_members
      arr *= (1 + ram)
    when 10
      if ex_remove
        (num + ram).times { arr << opponents_unit.random_target }
      else
        (num + ram).times do
          arr << if rand(2).zero?
                   opponents_unit.random_target
                 elsif exp[2] == 1
                   friends_unit.exp_ram_target(@subject.master_observer)
                 else
                   friends_unit.random_target
                 end
        end
      end
    end
    arr.delete(@subject.master_observer) if exp[2].zero?
    arr.compact!
    arr
  end
end

class Scene_Battle < Scene_Base
  #--------------------------------------------------------------------------
  # ● アニメーションの表示(エイリアス)
  #--------------------------------------------------------------------------
  def show_animation_item(targets, item)
    return if skip_mode?

    targets = targets.uniq if item.non_overlap_anima? || log_skip_mode(item) == 1
    show_animation(targets, item.animation_id)
    item.add_anime.each { |anime_id| show_animation(targets, anime_id) }
  end
end
