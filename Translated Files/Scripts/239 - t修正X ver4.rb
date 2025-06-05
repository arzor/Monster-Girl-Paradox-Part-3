
=begin

もんむす・くえすと！ＲＰＧ
　トリス修正X  ver4  2017/06/11



機能一覧　説明は下　今回追加したものは●　今回更新したものは〇
・レベル上限を100以上にすることが可能に
・アクター加入時にエラーとなったのを修正
・キャラ図鑑の固有アビリティ説明の空行を除去
・キャラ図鑑の固有アビリティ説明を制御文字「{」と「}」で文字サイズを拡大・縮小
・魔物図鑑やキャラ図鑑でのＣＧ閲覧で、存在しないＣＧはエラー落ちせずスキップ
・魔物図鑑やキャラ図鑑でのＣＧ閲覧コマンドの文字色を、ＣＧの有無で変更
・ワープ時の船の位置を条件スクリプトによって切り替え
●乗船の途中にワープを行うとエラー落ちすることがあったのを修正
●乗船/下船の途中にワープを行うと移動できなくなったのを修正
●魔物図鑑1ページ目の能力値(8種)の表示に、特徴の「通常能力値」の倍率を反映
●図鑑の「全ての冒険」に転種回数が2つ記載されるのを修正
●同じ対象への連続攻撃(<敵単体連続:N>)では\Eの対象名表示に「達」が付かないように

機能　説明
・レベル上限を100以上にすることが可能に
　IDReserve.rb の MAX_BASE_LEVEL を100以上にすることが可能に
　100以上の必要経験値は、データベースの経験値曲線の設定によって計算
　100以上の能力値は、「99の能力値－98の能力値」ずつ増加

・アクター加入時にエラーとなったのを修正
　統合時のミスによりエラーが発生するようになっていたのを修正

・キャラ図鑑の固有アビリティ説明の空行を除去
　文字がウィンドウ右端に達した行では余分な空行が追加されたのを修正

・キャラ図鑑の固有アビリティ説明を制御文字「{」と「}」で文字サイズを拡大・縮小
　「{」で拡大し「}」で縮小する
　制御文字1つにつき1ピクセルずつ調整する
　（「文章の表示」の「\{」「\}」は8ピクセルずつ調整する）

・魔物図鑑やキャラ図鑑でのＣＧ閲覧で、存在しないＣＧはエラー落ちせずスキップ
　（暗号化アーカイブ外にあるファイルのみ存在すると扱う）
　CG_VIEW_IMAGE、ACTORCG_VIEW_IMAGEの:draw(:registのIDを1つ以上指定)について、
　　指定した:registの画像に1つでも存在しないものがあれば、
　　そのdrawはスキップする
　全てのdrawをスキップする場合、ＣＧ閲覧コマンドは選択不可にする

・魔物図鑑やキャラ図鑑でのＣＧ閲覧コマンドの文字色を、ＣＧの有無で変更
　ＣＧ閲覧設定(CG_VIEW_IMAGE、ACTORCG_VIEW_IMAGE)がある場合のみ、以下を適用する
　全てのdrawをスキップする場合、赤色
　一部のdrawをスキップする場合、青色

・ワープ時の船の位置を条件スクリプトによって切り替え
　・船(:v2location)のみが対象　プレイヤーと飛行船(:v3location)は対象外
　・条件スクリプトに合致するかによってワープ位置を切り替える
　　条件スクリプト中ではスイッチはs、変数はvと記述できる
　　例：「変数1001が30以上」は "v[1001]>=30"、「常に合致」は "true"
　・通常設定は :v2location => [マップID, X座標, Y座標] だが
　　切替設定は :v2location => [[マップID, X座標, Y座標, 条件], 
      [マップID, X座標, Y座標, 条件], ... ] と複数記述する
　・切替設定の中に、条件に合致する設定が
　　複数あれば「最初に合致した設定」を採用する
　　１つもなければ「最後に記述してある設定」を採用する

●乗船の途中にワープを行うとエラー落ちすることがあったのを修正
●乗船/下船の途中にワープを行うと移動できなくなったのを修正
　乗船・下船の歩行をしている間にメニューを開き、ワープを行うと発生
　各乗り物についてセーブデータ中最初の乗船ではエラー落ち、それ以外は移動不能

●魔物図鑑1ページ目の能力値(8種)の表示に、特徴の「通常能力値」の倍率を反映
　黒のアリス（第三形態）への対応

●図鑑の「全ての冒険」に転種回数が2つ記載されるのを修正

●同じ対象への連続攻撃(<敵単体連続:N>)では\Eの対象名表示に「達」が付かないように
　

=end

#~ #==============================================================================
#~ # ■ Sprite_Picture
#~ #==============================================================================
#~ class Sprite_Picture < Sprite
#~   #--------------------------------------------------------------------------
#~   # ● 転送元ビットマップの更新
#~   #--------------------------------------------------------------------------
#~   def update_bitmap
#~     raise
#~     if @picture.name =~ /\.\.\/Battlers\/([\S\s]+)/
#~       self.bitmap = Cache.battler($1, 0)
#~     else
#~       self.bitmap = Cache.picture(@picture.name)
#~     end
#~   end
#~ end

#~ #==============================================================================
#~ # ■ RPG::BaseItem
#~ #==============================================================================
#~ class RPG::BaseItem
#~   #--------------------------------------------------------------------------
#~   # ● エンチャント名配列の取得
#~   #--------------------------------------------------------------------------  
#~   def enchant_names
#~     names = []
#~     
#~     method_table = {
#~       FEATURE_ELEMENT_RATE      => :element_rate_name,
#~       FEATURE_DEBUFF_RATE       => :debuff_rate_name,
#~       FEATURE_STATE_RATE        => :state_rate_name,
#~       FEATURE_STATE_RESIST      => :state_resist_name,
#~       FEATURE_PARAM             => :param_name,
#~       FEATURE_XPARAM            => :xparam_name,
#~       FEATURE_SPARAM            => :sparam_name,
#~       FEATURE_ATK_ELEMENT       => :atk_element_name,
#~       FEATURE_ATK_STATE         => :atk_state_name,
#~       FEATURE_ATK_SPEED         => :atk_speed_name,
#~       FEATURE_ATK_TIMES         => :atk_times_name,
#~       FEATURE_STYPE_ADD         => :stype_add_name,
#~       FEATURE_STYPE_SEAL        => :stype_seal_name,
#~       FEATURE_EQUIP_WTYPE       => :equip_wtype_name,
#~       FEATURE_EQUIP_ATYPE       => :equip_atype_name,
#~       FEATURE_EQUIP_FIX         => :equip_fix_name,
#~       FEATURE_EQUIP_SEAL        => :equip_seal_name,
#~       FEATURE_SLOT_TYPE         => :slot_type_name,
#~       FEATURE_ACTION_PLUS       => :action_plus_name,
#~       FEATURE_SPECIAL_FLAG      => :special_flag_name,
#~       FEATURE_COLLAPSE_TYPE     => :collaplse_type_name,
#~       FEATURE_PARTY_ABILITY     => :party_ability_name,
#~       FEATURE_XPARAM_EX         => :xparam_ex_name,
#~       FEATURE_PARTY_EX_ABILITY  => :party_ex_ability_name,
#~       FEATURE_BATTLER_ABILITY   => :battler_ability_name,
#~       FEATURE_MULTI_BOOSTER     => :multi_booster_name,
#~       FEATURE_DUMMY_ENCHANT     => :dummy_enchant_name,  
#~       FEATURE_TERRAIN_BOOSTER   => :terrain_booster_name,
#~       FEATURE_EQUIP_MASTERY     => :equip_mastery_name,
#~     }
#~     
#~     dummy = nil
#~     self.features.sort_by{|ft| [ft.code, ft.data_id]}.each{|ft|
#~       method_name = method_table[ft.code]
#~       if method_name == :dummy_enchant_name
#~         dummy ||= []
#~         dummy.push(send(method_name, ft))
#~       elsif method_name
#~         names.push(send(method_name, ft))
#~       end
#~     }
#~     names = dummy if dummy
#~     return names.flatten.compact.uniq
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● 拡張パーティアビリティ名の取得
#~   #--------------------------------------------------------------------------  
#~   def party_ex_ability_name(ft)
#~     method_table = {
#~       GET_GOLD_RATE   => :get_gold_rate_name,
#~       GET_ITEM_RATE   => :get_item_rate_name,
#~       ENCOUNTER_RATE  => :encounter_rate_name,
#~       COLLECT_RATE    => :collect_rate_name,
#~       SLOT_CHANCE     => :slot_chance_name,
#~       UNLOCK_LEVEL    => :unlock_level_name,
#~     }
#~     method_name = method_table[ft.data_id]
#~     return method_name ? send(method_name, ft) : "UNKNOWN:PartyExAbility #{ft.data_id}"
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● バトラーアビリティ名の取得
#~   #--------------------------------------------------------------------------  
#~   def battler_ability_name(ft)    
#~     method_table = {
#~       STEAL_SUCCESS           => :steal_success_name,
#~       AUTO_STAND              => :auto_stand_name,
#~       HEEL_REVERSE            => :heel_reverse_name,
#~       AUTO_STATE              => :auto_state_names,
#~       TRIGGER_STATE           => :trigger_state_name,
#~       METAL_BODY              => :metal_body_name,
#~       DEFENSE_WALL            => :defense_wall_name,
#~       INVALIDATE_WALL         => :invalidate_wall_name,
#~       DAMAGE_MP_CONVERT       => :damage_mp_convert_name,
#~       DAMAGE_GOLD_CONVERT     => :damage_gold_convert_name,
#~       DAMAGE_MP_DRAIN         => :damage_mp_drain_name,
#~       DAMAGE_GOLD_DRAIN       => :damage_gold_drain_name,
#~       DEAD_SKILL              => :dead_skill_name,
#~       BATTLE_START_SKILL      => :battle_start_skill_name,
#~       TURN_START_SKILL        => :turn_start_skill_name,
#~       TURN_END_SKILL          => :turn_end_skill_name,
#~       CHANGE_ACTION           => :change_action_names,
#~       STYPE_COST_RATE         => :stype_cost_rate_name,
#~       SKILL_COST_RATE         => :skill_cost_rate_name,
#~       TP_COST_RATE            => :tp_cost_rate_name,
#~       HP_COST_RATE            => :hp_cost_rate_name,
#~       GOLD_COST_RATE          => :gold_cost_rate_name,
#~       INCREASE_TP             => :increase_tp_name,
#~       START_TP_RATE           => :start_tp_rate_name,
#~       BATTLE_END_HEEL_HP      => :battle_end_heel_hp_name,
#~       BATTLE_END_HEEL_MP      => :battle_end_heel_mp_name,
#~       Battler::NORMAL_ATTACK  => :normal_attack_name,
#~       COUNTER_SKILL           => :counter_skill_names,
#~       FINAL_INVOKE            => :final_invoke_names,
#~       CERTAIN_COUNTER         => :certain_counter_name,
#~       MAGICAL_COUNTER         => :magical_counter_name,
#~       PHYSICAL_COUNTER_EX     => :physical_counter_ex_name,
#~       MAGICAL_COUNTER_EX      => :magical_counter_ex_name,
#~       CERTAIN_COUNTER_EX      => :certain_counter_ex_name,
#~       CONSIDERATE             => :considerate_name,
#~       GET_EXP_RATE            => :get_exp_rate_name,
#~       GET_CLASSEXP_RATE       => :get_classexp_rate_name,
#~       INVOKE_REPEATS_TYPE     => :invoke_repeats_type_names,
#~       INVOKE_REPEATS_SKILL    => :invoke_repeats_skill_names,
#~       OWN_CRUSH_RESIST        => :own_crush_resist_name,
#~       ELEMENT_DRAIN           => :element_drain_names,
#~       IGNORE_OVER_DRIVE       => :ignore_over_drive_name,
#~       INSTANT_DEAD_REVERSE    => :instant_dead_reverse_name,
#~       CHANGE_SKILL            => :change_skill_name,
#~       PHYSICAL_REFLECTION     => :physical_reclection_name,
#~       SLOT_CANNOT_DUAL_WIELD  => :slot_cannot_dual_wield_name,
#~     }
#~     method_name = method_table[ft.data_id]
#~     return method_name ? send(method_name, ft) : "UNKNOWN:BattlerAbility #{ft.data_id}"    
#~   end
#~   #--------------------------------------------------------------------------
#~   # ● マルチブースター名の取得
#~   #--------------------------------------------------------------------------  
#~   def multi_booster_name(ft)    
#~     method_table = {
#~       ELEMENT                => :booster_element_name,
#~       WEAPON_PHYSICAL        => :booster_weapon_physical_name,
#~       WEAPON_MAGICAL         => :booster_weapon_magical_name,
#~       WEAPON_CERTAIN         => :booster_weapon_certain_name,
#~       Booster::NORMAL_ATTACK => :booster_normal_attack_name,
#~       STATE_RATIO_TYPE       => :booster_state_ratio_type_name,
#~       STATE_FIX_TYPE         => :booster_state_fix_type_name,
#~       SKILL_TYPE             => :booster_skill_type_name,
#~       STATE_RATIO_SKILL      => :booster_state_ratio_skill_name,
#~       SKILL                  => :booster_skill_name,
#~       WTYPE_SKILL            => :booster_wtype_skill_name,
#~       COUNTER                => :booster_counter_name,
#~       FALL_HP                => :booster_fall_hp_name,
#~       OVER_SOUL              => :over_soul_name,
#~     }
#~     method_name = method_table[ft.data_id]
#~     return method_name ? send(method_name, ft) : "UNKNOWN:MultiBooster #{ft.data_id}"            
#~   end
#~ end

# 魔物図鑑やキャラ図鑑でのＣＧ閲覧で、存在しないＣＧはエラー落ちせずスキップ
# 魔物図鑑やキャラ図鑑でのＣＧ閲覧コマンドの文字色を、ＣＧの有無で変更
#==============================================================================
# ■ Window_Library_EnemyCommand
#==============================================================================
class Window_Library_EnemyCommand < Window_Command
  #--------------------------------------------------------------------------
  # ● コマンドリストの作成
  #--------------------------------------------------------------------------
  def make_command_list
    enable = !$game_party.in_battle
    if enemy?
      cg_exist_state = enemy_cg_exist_state
      enable &&= cg_view? && cg_exist_state[0]
      add_command("Replay Scene",   :memory_event, enable && memory_event?)
      add_command("View Images",   :cg_view, enable, cg_exist_state[1])
      add_command("Cancel", :cancel, true)
      self.height = fitting_height(3) unless disposed?
    else
      cg_exist_state = actor_cg_exist_state
      enable &&= actor_cg_view? && cg_exist_state[0]
      enable &&= $game_variables[NWConst::Var::ACTOR_REL_BASE + actor.id] >= 100
      add_command("View Images",   :actor_cg_view, enable, cg_exist_state[1])
      add_command("Cancel", :cancel, true)
      self.height = fitting_height(2) unless disposed?
    end
  end
  #--------------------------------------------------------------------------
  # ● 
  #--------------------------------------------------------------------------
  def draw_item(index)
    change_color(command_color(index), command_enabled?(index))
    draw_text(item_rect_for_text(index), command_name(index), alignment)
  end
  #--------------------------------------------------------------------------
  # ● 
  #--------------------------------------------------------------------------
  def command_color(index)
    return case @list[index][:ext]
    when :all_exist
      normal_color
    when :some_exist
      system_color
    when :none_exist
      bad_color
    else
      normal_color
    end
  end
  #--------------------------------------------------------------------------
  # ● 
  #--------------------------------------------------------------------------
  def enemy_cg_exist_state
    enemy_id = enemy.id
    cg_view_image = NWConst::Library::CG_VIEW_IMAGE[enemy_id]
    return cg_exist_state(cg_view_image)
  end
  #--------------------------------------------------------------------------
  # ● 
  #--------------------------------------------------------------------------
  def actor_cg_exist_state
    actor_id = actor.id
    cg_view_image = NWConst::Library::ACTOR_CG_VIEW_IMAGE[actor_id]
    return cg_exist_state(cg_view_image)
  end
  #--------------------------------------------------------------------------
  # ● 
  #--------------------------------------------------------------------------
  def cg_exist_state(cg_view_image)
    return [false, nil] if cg_view_image == nil
    regist = cg_view_image[:regist]
    draw = cg_view_image[:draw]
    cg_sprite_ids = Scene_CGViewer.create_cg_sprite_ids(regist)
    cg_draw_set = Scene_CGViewer.create_cg_draw_set(draw, cg_sprite_ids)
    regist_exist = regist.map {|id, data| NWSimpleFileTest.png_exist?(data[0], data[1])}
    state = [false, :some_exist]
    state[0] = true if !cg_draw_set.empty?
    state[1] = :all_exist if cg_draw_set == draw
    state[1] = :none_exist if cg_draw_set.empty?
    return state
  end
end
#==============================================================================
# ■ Scene_CGViewer
#==============================================================================
class Scene_CGViewer < Scene_Base
  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    @select = 0
    create_background_sprite
    create_cg_sprites
    create_cg_sprite_ids
    create_cg_draw_set
    refresh_cg_sprites(true)
  end
  #--------------------------------------------------------------------------
  # ● ＣＧスプライトの生成
  #--------------------------------------------------------------------------
  def create_cg_sprites
    @cg_sprites = []
    cg_view_image[:regist].each{|id, data| # 後でregisterに
      if NWSimpleFileTest.png_exist?(data[0], data[1])
        @cg_sprites.push(Sprite_CGViewer.new(id, data))
      end
    }
  end
  #--------------------------------------------------------------------------
  # ● ＣＧスプライトの生成
  #--------------------------------------------------------------------------
  def create_cg_sprite_ids
    @cg_sprite_ids = self.class.create_cg_sprite_ids(cg_view_image[:regist])
  end
  def self.create_cg_sprite_ids(regist)
    cg_sprite_ids = []
    regist.each{|id, data| # 後でregisterに
      if NWSimpleFileTest.png_exist?(data[0], data[1])
        cg_sprite_ids.push(id)
      end
    }
    return cg_sprite_ids
  end
  #--------------------------------------------------------------------------
  # ● 
  #--------------------------------------------------------------------------
  def create_cg_draw_set
    @cg_draw_set = self.class.create_cg_draw_set(cg_view_image[:draw], @cg_sprite_ids)
  end
  def self.create_cg_draw_set(draw, cg_sprite_ids)
    cg_draw_set = draw.select {|draw_sprite_ids|
      draw_sprite_ids.all?{|sprite_id| cg_sprite_ids.include?(sprite_id)}
    }
    return cg_draw_set
  end
  #--------------------------------------------------------------------------
  # ● ＣＧスプライトのリフレッシュ
  #--------------------------------------------------------------------------
  def refresh_cg_sprites(forced = false)
    @cg_sprites.each{|sprite|
      sprite.refresh(@cg_draw_set[@select], forced)
    }
  end
  #--------------------------------------------------------------------------
  # ● ＣＧの変更
  #--------------------------------------------------------------------------
  def process_cg_change
    return unless current_cg_sprites.first.full_view?
    if Input.trigger?(:RIGHT) || Input.trigger?(:C)
      max = @cg_draw_set.size
      if @select + 1 == max
        return_scene
      else
        @select = @select + 1
      end
    elsif Input.trigger?(:LEFT)
      if @select == 0
        
      else
        @select = @select - 1
      end
    end
    refresh_cg_sprites
  end
end
#==============================================================================
# ■ NWSimpleFileTest
#----------------------------------------------------------------------------
# ファイルの存在判定を行うためのモジュールです
# NWFileTestと違い、暗号化アーカイブ内は調査しません
#==============================================================================
module NWSimpleFileTest
  #--------------------------------------------------------------------------
  # ● ファイルの存在判定
  #--------------------------------------------------------------------------
  def filepath_exist?(path)
    if File.exist?(path)
      #print "File exists - \"#{path}\"\n" if $TEST
      return true
    else
      #print "File does not exist - \"#{path}\"\n" if $TEST
      return false
    end
  end
  #--------------------------------------------------------------------------
  # ● ファイルの存在判定
  #--------------------------------------------------------------------------
  def file_exist?(path, filename)
    return filepath_exist?(path + filename)
  end
  #--------------------------------------------------------------------------
  # ● ファイルの存在判定
  #--------------------------------------------------------------------------
  def png_exist?(path, filename)
    return file_exist?(path, filename + ".png")
  end
  module_function :filepath_exist?, :file_exist?
  module_function :png_exist?
end

# ワープ時の船の位置を条件スクリプトによって切り替え
#==============================================================================
# ■ Scene_Warp
#==============================================================================

# 乗船の途中にワープを行うとエラー落ちすることがあったのを修正
# 乗船/下船の途中にワープを行うと移動できなくなったのを修正



# 魔物図鑑1ページ目の能力値(8種)の表示に、特徴の「通常能力値」の倍率を反映
#==============================================================================
# ■ Window_Library_RightMain
#==============================================================================
class Window_Library_RightMain < Window_Selectable
  #--------------------------------------------------------------------------
  # ● エネミーオブジェクトの特徴値の総乗計算
  #--------------------------------------------------------------------------
  def enemy_features_pi(enemy, code, id)
    all_features = enemy.features
    features_with_id = all_features.select {|ft| ft.code == code && ft.data_id == id }
    features_pi = features_with_id.inject(1.0) {|r, ft| r *= ft.value }
    return features_pi
  end
end

