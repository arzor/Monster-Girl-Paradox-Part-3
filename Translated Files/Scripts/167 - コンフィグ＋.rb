# =コンフィグ＋
#
#
#
#
# ==更新履歴
#   Date     Version Author Comment
#

#==============================================================================
# ■ NWConst::Config
#==============================================================================
module NWConst::Config
  # 大項目のコンテンツ
  CONTENTS = [
    { :key => :window_tone,  :name => "Window Color", :sub => false,
      :help => "Change the Window Color"},  
    { :key => :sound_volume, :name => "Volume Settings", :sub => false,
      :help => "Change in-game volume."},
    { :key => :key_text,     :name => "Button Explanation", :sub => true,
      :help => "Change display of button help.\r\n←/→ Select"},
    { :key => :map_dash,     :name => "Auto Dash", :sub => true,
      :help => "【Map】Change whether you walk or dash by default.\r\n←/→ On/Off"},
    { :key => :map_speed,   :name => "Dash Speed", :sub => true,
      :help => "【Map】Change dash speed.\r\n←/→ Slower/Faster"},
    { :key => :bt_skip,      :name => "Skill Dialog", :sub => true,
      :help => "【Battle】Change display of skill dialog.\r\n←/→ Select"},
    { :key => :bt_skip_cutin, :name => "Skill Cut-ins", :sub => true,
      :help => "【Battle】Change display of skill cut-ins.\r\n←/→ Select"},
    { :key => :bt_skip_enemy_cutin, :name => "Enemy Cut-Ins", :sub => true,
      :help => "【Battle】Change display of enemy skill cut-ins.\r\n←/→ Select" },
    { :key => :bt_skip_chain_action_cutin, :name => "Skill Chain Cut-Ins", :sub => true,
      :help => "【Battle】Change display of cut-ins when using skills in a chain.\r\n←/→ Select"},
    { :key => :bt_auto,      :name => "Battle Log", :sub => true,
      :help => "【Battle】Change battle log display setting.\r\n←/→ Select"},
    { :key => :bt_wait,      :name => "Battle Wait", :sub => true,
      :help => "【Battle】Change battle wait settings.\r\n←/→ Select"},
    { :key => :bt_result,    :name => "Skip Battle Results", :sub => true,
      :help => "【Battle】Change speed at which pressing X skips battle\r\nresults.\r\n←/→Select" },
    { :key => :bt_stype,      :name => "Display Skill Types", :sub => true,
      :help => "【Battle】Change whether to display skill types in battle.\r\n←/→ Select"},
    { :key => :bt_regenerate, :name => "Skip Regeneration Message", :sub => true,
      :help => "【Battle】Change whether to automatically skip regeneration\r\nmessages each turn.\r\n←/→ Select" },
    { :key => :bt_show_actor_status, :name => "Simplified Combat Status Window", :sub => true,
      :help => "【Battle】Change whether to display simple status windows\r\nduring turns.\r\n←/→Select." },
    { :key => :ls_auto,      :name => "Auto Advance Mode", :sub => true,
      :help => "【Defeat Event】Enable/Disable Auto Mode in H-Scenes.\r\n←/→ On/Off"},
    { :key => :ls_wait,      :name => "Auto Wait", :sub => true,
      :help => "【Defeat Event】Change Auto Text Speed.\r\n←/→ Slower/Faster"},
    { :key => :ls_predation, :name => "Skip Vore Scenes", :sub => true,
      :help => "【Defeat Event】Choose whether to hide vore scenes.\r\n←/→ On/Off"},
    { :key => :ls_skip,      :name => "Loss Events Skip", :sub => true,
      :help => "Change settings for loss events\r\n←/→ Select"},
    { :key => :sw_dungeon_navigate, :name => "Dungeon Navi", :sub => true,
      :help => "Change whether to have the Dungeon Navigator appear.\r\n←/→ On/Off" },
    { :key => :sw_auto_unequip_actor, :name => "Unequip Leaving Party Members", :sub => true,
      :help => "Change whether party members are unequipped if they leave\r\nthe party.\r\n←/→ Select" },
    { :key => :skip_skill_effect, :name => "Condense Multi-Hit Skill Damage", :sub => true,
      :help => "Change whether how multi-hit skills is condensed\r\ninto a single total or displayed per hit.\r\n←/→Select" },
    { :key => :skip_battle_start_skill_effect, :name => "Start of Battle Skill Message", :sub => true,
      :help => "Change whether to skip displaying start of battle skills.\r\n←/→Select" },
    { :key => :default,      :name => "Defaults", :sub => false,
      :help => "Reset all settings to the default."},
    { :key => :return, :name => "Return", :sub => false,
      :help => "Return to Main Menu"},
  ]
  # 小項目のコンテンツ
  DATA = {
    :map_dash => [false, true],
    :map_speed => [0, 1, 2],
    :key_text => [:gamepad, :keyboard],
    :bt_skip => [false, true],
    :bt_skip_cutin => [false, true],
    :bt_skip_enemy_cutin => [false, true],
    :bt_skip_chain_action_cutin => [false, true],
    :bt_auto => [false, true],
    :bt_wait => [100, 50, 25],
    :bt_result => [0, 1, 2, nil],
    :bt_stype => [false, true],
    :bt_regenerate => [false, true],
    :bt_show_actor_status => [false, true],
    :ls_auto => [false, true],
    :ls_wait => [10, 5, 3],
    :ls_predation => [false, true],
    :ls_skip => [0, 1, 2],
    :sw_auto_unequip_actor => [false, true],
    :sw_dungeon_navigate => [false, true],
    :skip_skill_effect => [false, true],
    :skip_battle_start_skill_effect => [false, true]
  }
  # 色調ゲージ用の色データ
  TONE_COLOR = {
    :tone_r => Color.new(255, 0, 0),
    :tone_g => Color.new(0, 255, 0),
    :tone_b => Color.new(0, 0, 255)
  }
  # 音量ゲージ用データ
  SOUND_GAUGE = {
    :volume_bgm => { :name => "BGM", :color => Color.new(255, 32, 32) },
    :volume_bgs => { :name => "BGS", :color => Color.new(255, 192, 0) },
    :volume_me => { :name => " ME", :color => Color.new(0, 192, 255) },
    :volume_se => { :name => " SE", :color => Color.new(32, 32, 255) }
  }
  # 小項目のコンテンツ文章
  DATA_TEXT = {
    :key_text => {
      :gamepad => {:name => "Gamepad", :help => "Display help using gamepad keys"},
      :keyboard => {:name => "Keyboard", :help => "Display help using keyboard keys"},
    },
    :map_dash => {
      false => {:name => "Walk", :help => "Walk by default"},
      true  => {:name => "Dash", :help => "Dash by default"},
    },
    :map_speed => {
      0 => {:name => "Normal", :help => "Normal dash speed"},
      1 => {:name => "Fast", :help => "Fast dash speed"},
      2 => {:name => "Fastest", :help => "Fastest dash speed"},
    },
    :bt_skip => {
      false => {:name => "Display", :help => "Display skill dialog"},
      true  => {:name => "Omit", :help => "Skip skill dialog"},
    },
    :bt_skip_cutin => {
      false => { :name => "Display", :help => "Display skill cut-ins" },
      true => { :name => "Omit", :help => "Skip skill cut-ins" }
    },
    :bt_skip_enemy_cutin => {
      false => { :name => "Display", :help => "Display enemy skill cut-ins" },
      true => { :name => "Omit", :help => "Skip enemy skill cut-ins" }
    },
    :bt_skip_chain_action_cutin => {
      false => { :name => "Display", :help => "Display skill cut-ins for chained skills" },
      true => { :name => "Omit", :help => "Skip skill cut-ins for chained skills" }
    },
    :bt_auto => {
      false => {:name => "Manual", :help => "Manual advance for battle messages"},
      true  => {:name => "Auto", :help => "Automatic advance for battle messages"},
    },
    :bt_wait => {
      100 => {:name => "Normal", :help => "Default wait times in battle"},
      50 =>  {:name => "Fast", :help => "Half wait times in battle"},
      25 =>  {:name => "Fastest", :help => "Quarter wait times in battle"},
    },
    :bt_result => {
      0   => {:name => "No Skip", :help => "Do not skip"},
      1   => {:name => "Slow", :help => "Wait on each character"},
      2   => {:name => "Fast", :help => "Wait on each line or page"},
      nil => {:name => "Instant", :help => "Skip all at once"},
    },
    :bt_stype => {
      true => {:name => "Hide", :help => "Hide selected skill types in battle"},
      false  => {:name => "Show all", :help => "Display all skill types in battle"},
    },
    :bt_regenerate => {
      false => { :name => "Off", :help => "Do not skip regeneration messages in battles." },
      true => { :name => "On", :help => "Skip regeneration messages in battles." }
    },
    :bt_show_actor_status => {
      false => { :name => "Hide", :help => "Do not show  status windows during actions." },
      true => { :name => "Display", :help => "Show simplified status windows during actions." }
    },
    :ls_auto => {
      false => {:name => "Off", :help => "Do not use auto mode during scenes"},
      true  => {:name => "On", :help => "Use auto mode during scenes"},
    },
    :ls_wait => {
      10 => {:name => "Slow", :help => "Pause twice as long during scenes"},
      5 =>  {:name => "Normal", :help => "Use default timings during scenes"},
      3 =>  {:name => "Fast", :help => "Pause half as long during scenes"},
    },
    :ls_predation => {
      false => {:name => "Watch", :help => "Display vore scenes"},
      true  => {:name => "Skip", :help => "Skip vore scenes"},
    },
    :ls_skip => {
      0 => {:name => "Always View", :help => "Always show loss scenes"},
      1 => {:name => "Skip Already Seen", :help => "Only show new loss scenes"},
      2 => {:name => "Always Ask", :help => "Ask whether to show each loss scene"},
    },
    :sw_dungeon_navigate => {
      false => { :name => "Off", :help => "Dungeon Navi will not appear" },
      true => { :name => "On", :help => "Dungeon Navi will appear in difficult dungeons" }
    },
    :sw_auto_unequip_actor => {
      false => { :name => "Off", :help => "Leaving party members will keep their equipment" },
      true => { :name => "On", :help => "Leaving party members will be unequipped" }
    },
    :skip_skill_effect => {
      false => { :name => "Off", :help => "Damage from multi-hits will be displayed individually" },
      true => { :name => "On", :help => "Damage from multi-hits will be condensed into a single number" }
    },
    :skip_battle_start_skill_effect => {
      false => { :name => "Normal", :help => "Start of battle skill messsages will be shown" },
      true => { :name => "Skip", :help => "Start of battle skill messages will be skipped" }
    }
  }
  # 規定値
  DEFAULT = {
    :tone_r => -34,
    :tone_g => 0,
    :tone_b => 68,
    :volume_bgm => 70,
    :volume_bgs => 70,
    :volume_se => 70,
    :volume_me => 70,
    :key_text => :gamepad,
    :map_dash => false,
    :map_speed => 0,
    :bt_skip => false,
    :bt_skip_cutin => false,
    :bt_skip_enemy_cutin => false,
    :bt_skip_chain_action_cutin => false,
    :bt_auto => false,
    :bt_wait => 100,
    :bt_result => nil,
    :bt_stype => true,
    :bt_regenerate => false,
    :bt_show_actor_status => true,
    :ls_auto => false,
    :ls_wait => 5,
    :ls_predation => false,
    :ls_skip => 0,
    :sw_dungeon_navigate => false,
    :sw_auto_unequip_actor => false,
    :skip_skill_effect => false,
    :skip_battle_start_skill_effect => false
  }
end

#==============================================================================
# ■ Audio
#==============================================================================
class << Audio
  #--------------------------------------------------------------------------
  # ○ BGM再生
  #--------------------------------------------------------------------------
  alias nw_config_bgm_play bgm_play
  def bgm_play(filename, volume = 100, pitch = 100, pos = 0)
    v = (volume * ($game_system.conf[:volume_bgm].to_f / 100)).ceil
    nw_config_bgm_play(filename, v, pitch, pos)
  end
  #--------------------------------------------------------------------------
  # ○ BGS再生
  #--------------------------------------------------------------------------
  alias nw_config_bgs_play bgs_play
  def bgs_play(filename, volume = 100, pitch = 100, pos = 0)
    v = (volume * ($game_system.conf[:volume_bgs].to_f / 100)).ceil
    nw_config_bgs_play(filename, v, pitch, pos)
  end
  #--------------------------------------------------------------------------
  # ○ ME再生
  #--------------------------------------------------------------------------
  alias nw_config_me_play me_play
  def me_play(filename, volume = 100, pitch = 100)
    v = (volume * ($game_system.conf[:volume_me].to_f / 100)).ceil
    nw_config_me_play(filename, v, pitch)
  end
  #--------------------------------------------------------------------------
  # ○ SE再生
  #--------------------------------------------------------------------------
  alias nw_config_se_play se_play
  def se_play(filename, volume = 100, pitch = 100)
    v = (volume * ($game_system.conf[:volume_se].to_f / 100)).ceil
    nw_config_se_play(filename, v, pitch)
  end
end

#==============================================================================
# ■ Game_System
#----------------------------------------------------------------------------
# コンフィグデータはHashで扱います。
#==============================================================================
class Game_System
  #--------------------------------------------------------------------------
  # ● コンフィグ初期化
  #--------------------------------------------------------------------------
  def init_config
    @data_config = NWConst::Config::DEFAULT.dup
  end

  def update_config
    @data_config = NWConst::Config::DEFAULT.dup.merge(@data_config)
  end

  #--------------------------------------------------------------------------
  # ● 色調コンフィグ初期化
  #--------------------------------------------------------------------------
  def init_tone_config
    @data_config[:tone_r] = NWConst::Config::DEFAULT[:tone_r]
    @data_config[:tone_g] = NWConst::Config::DEFAULT[:tone_g]
    @data_config[:tone_b] = NWConst::Config::DEFAULT[:tone_b]
  end

  #--------------------------------------------------------------------------
  # ● 音量コンフィグ初期化
  #--------------------------------------------------------------------------
  def init_sound_config
    @data_config[:volume_bgm] = NWConst::Config::DEFAULT[:volume_bgm]
    @data_config[:volume_bgs] = NWConst::Config::DEFAULT[:volume_bgs]
    @data_config[:volume_me]  = NWConst::Config::DEFAULT[:volume_me]
    @data_config[:volume_se]  = NWConst::Config::DEFAULT[:volume_se]
  end

  #--------------------------------------------------------------------------
  # ● インスタンス変数data_configのゲッター
  #--------------------------------------------------------------------------
  def conf
    @data_config
  end
end

#==============================================================================
# ■ Game_Player
#==============================================================================
class Game_Player < Game_Character
  #--------------------------------------------------------------------------
  # ● 移動速度の取得（ダッシュを考慮）【オーバーライド】
  #--------------------------------------------------------------------------
  def real_move_speed
    spd = 1 + $game_system.conf[:map_speed].to_i
    @move_speed + (dash? ? spd : 0)
  end
  #--------------------------------------------------------------------------
  # ○ ダッシュ状態判定
  #--------------------------------------------------------------------------
  alias nw_config_dash? dash?
  def dash?
    (nw_config_dash? ^ $game_system.conf[:map_dash]) && vehicle.nil?
  end
end

#==============================================================================
# ■ Sprite_Battler
#==============================================================================
class Sprite_Battler < Sprite_Base
  #--------------------------------------------------------------------------
  # ○ エフェクトの開始
  #--------------------------------------------------------------------------
  def start_effect(effect_type)
    @effect_type = effect_type
    speed = $game_system.conf[:bt_wait].to_f / 100.0
    case @effect_type
    when :appear
      @effect_duration = Integer(16 * speed)
      @battler_visible = true
    when :disappear
      @effect_duration = Integer(32 * speed)
      @battler_visible = false
    when :whiten
      @effect_duration = Integer(16 * speed)
      @battler_visible = true
    when :blink
      @effect_duration = Integer(20 * speed)
      @battler_visible = true
    when :collapse
      @effect_duration = Integer(48 * speed)
      @battler_visible = false
    when :boss_collapse
      @effect_duration = Integer(bitmap.height * speed)
      @battler_visible = false
    when :instant_collapse
      @effect_duration = Integer(16 * speed)
      @battler_visible = false
    end
    revert_to_normal
  end
end

#==============================================================================
# ■ Window_BattleMessage
#==============================================================================
class Window_BattleMessage < Window_Message
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super
    self.opacity = 0
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウを開く
  #--------------------------------------------------------------------------
  def open
    self.openness = 255
  end

  #--------------------------------------------------------------------------
  # ● ウィンドウを閉じる
  #--------------------------------------------------------------------------
  def close
    self.openness = 0
  end

  #--------------------------------------------------------------------------
  # ● 入力待ち処理
  #--------------------------------------------------------------------------
  def input_pause
    if $game_system.conf[:bt_auto]
      speed = $game_system.conf[:bt_wait].to_f * 0.01
      wait(Integer(30 * speed))
    else
      super
    end
  end
end

#==============================================================================
# ■ Window_Config
#==============================================================================
class Window_Config < Window_Selectable
  include NWConst::Config
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #-------------------------------------------------------------------------
  def initialize
    super(0, 120, Graphics.width, Graphics.height - 120)
    refresh
  end

  #--------------------------------------------------------------------------
  # ● 項目数の取得
  #--------------------------------------------------------------------------
  def item_max
    CONTENTS.size
  end

  #--------------------------------------------------------------------------
  # ● 項目のキー値を取得
  #--------------------------------------------------------------------------
  def key(index)
    CONTENTS[index][:key]
  end

  #--------------------------------------------------------------------------
  # ● 項目の名前を取得
  #--------------------------------------------------------------------------
  def name(index)
    CONTENTS[index][:name]
  end

  #--------------------------------------------------------------------------
  # ● 副項目の名前を取得
  #--------------------------------------------------------------------------
  def sub_name(index)
    DATA_TEXT[key(index)][$game_system.conf[key(index)]][:name]
  end

  #--------------------------------------------------------------------------
  # ● 項目のヘルプ文章を取得
  #--------------------------------------------------------------------------
  def help_text(index)
    text = CONTENTS[index][:help]
    text += "\r\n#{sub_help_text(index)}" if sub_exist?(index)
    text.gsub(/eval<(\S+)>/) { eval(::Regexp.last_match(1)) }
  end

  #--------------------------------------------------------------------------
  # ● 副項目のヘルプ文章を取得
  #--------------------------------------------------------------------------
  def sub_help_text(index)
    DATA_TEXT[key(index)][$game_system.conf[key(index)]][:help]
  end

  #--------------------------------------------------------------------------
  # ● 項目にサブ項目が存在する？
  #--------------------------------------------------------------------------
  def sub_exist?(index)
    CONTENTS[index][:sub]
  end

  #--------------------------------------------------------------------------
  # ● 項目の幅を取得
  #--------------------------------------------------------------------------
  def item_width
    320
  end

  #--------------------------------------------------------------------------
  # ● 副項目の幅を取得
  #--------------------------------------------------------------------------
  def item_sub_width
    160
  end

  #--------------------------------------------------------------------------
  # ● 項目を描画する矩形の取得
  #--------------------------------------------------------------------------
  def item_rect(index)
    rect = Rect.new
    rect.width = item_width
    rect.height = item_height
    rect.x = 40
    rect.y = index * item_height
    rect
  end

  #--------------------------------------------------------------------------
  # ● 副項目を描画する矩形の取得
  #--------------------------------------------------------------------------
  def item_sub_rect(index)
    rect = Rect.new
    rect.width = item_width
    rect.height = item_height
    rect.x = 380
    rect.y = index * item_height
    rect
  end

  #--------------------------------------------------------------------------
  # ● カーソルを右に移動
  #--------------------------------------------------------------------------
  def cursor_right(wrap = false)
    return unless sub_exist?(index)

    k = key(index)
    index = DATA[k].index($game_system.conf[k])
    index = (index + 1) % DATA[k].size
    $game_system.conf[k] = DATA[k][index]
    Sound.play_cursor
    refresh
  end

  #--------------------------------------------------------------------------
  # ● カーソルを左に移動
  #--------------------------------------------------------------------------
  def cursor_left(wrap = false)
    return unless sub_exist?(index)

    k = key(index)
    index = DATA[k].index($game_system.conf[k])
    index -= 1
    $game_system.conf[k] = DATA[k][index]
    Sound.play_cursor
    refresh
  end

  #--------------------------------------------------------------------------
  # ● 決定処理の有効状態を取得
  #--------------------------------------------------------------------------
  def ok_enabled?
    !sub_exist?(index)
  end

  #--------------------------------------------------------------------------
  # ● 決定ボタンが押されたときの処理
  #--------------------------------------------------------------------------
  def process_ok
    Sound.play_ok
    Input.update
    call_handler(key(index))
  end

  #--------------------------------------------------------------------------
  # ● 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    rect = item_rect(index)
    rect.x += 20
    rect.width -= 20
    draw_text(rect, name(index))
    return unless sub_exist?(index)

    value = $game_system.conf[key(index)]
    draw_text(item_sub_rect(index), DATA_TEXT[key(index)][value][:name])
  end

  #--------------------------------------------------------------------------
  # ● ヘルプウィンドウの更新
  #--------------------------------------------------------------------------
  def update_help
    super
    @help_window.set_text(help_text(index))
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    super
    call_update_help
  end
end

#==============================================================================
# ■ Window_ToneConfig
#==============================================================================
class Window_ToneConfig < Window_Selectable
  include NWConst::Config
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #-------------------------------------------------------------------------
  def initialize
    super(160, 120, 320, fitting_height(5))
    refresh
  end

  #--------------------------------------------------------------------------
  # ● 項目数の取得
  #--------------------------------------------------------------------------
  def item_max
    5
  end

  #--------------------------------------------------------------------------
  # ● カーソルを右に移動
  #--------------------------------------------------------------------------
  def cursor_right(wrap = false)
    return unless (0..2).include?(index)

    key = [:tone_r, :tone_g, :tone_b][index]
    return if $game_system.conf[key] == 255

    $game_system.conf[key] = [$game_system.conf[key] + 5, 255].min
    Sound.play_cursor
    refresh
  end

  #--------------------------------------------------------------------------
  # ● カーソルを左に移動
  #--------------------------------------------------------------------------
  def cursor_left(wrap = false)
    return unless (0..2).include?(index)

    key = [:tone_r, :tone_g, :tone_b][index]
    return if $game_system.conf[key] == -255

    $game_system.conf[key] = [$game_system.conf[key] - 5, -255].max
    Sound.play_cursor
    refresh
  end

  #--------------------------------------------------------------------------
  # ● カーソルを 1 ページ後ろに移動
  #--------------------------------------------------------------------------
  def cursor_pagedown
    return unless (0..2).include?(index)

    key = [:tone_r, :tone_g, :tone_b][index]
    return if $game_system.conf[key] == 255

    $game_system.conf[key] = [$game_system.conf[key] + 50, 255].min
    Sound.play_cursor
    refresh
  end

  #--------------------------------------------------------------------------
  # ● カーソルを 1 ページ前に移動
  #--------------------------------------------------------------------------
  def cursor_pageup
    return unless (0..2).include?(index)

    key = [:tone_r, :tone_g, :tone_b][index]
    return if $game_system.conf[key] == -255

    $game_system.conf[key] = [$game_system.conf[key] - 50, -255].max
    Sound.play_cursor
    refresh
  end

  #--------------------------------------------------------------------------
  # ● 決定処理の有効状態を取得
  #--------------------------------------------------------------------------
  def ok_enabled?
    !(0..2).include?(index)
  end

  #--------------------------------------------------------------------------
  # ● 決定ボタンが押されたときの処理
  #--------------------------------------------------------------------------
  def process_ok
    Sound.play_ok
    Input.update
    case index
    when 3 then call_handler(:default)
    when 4 then call_handler(:return)
    end
  end

  #--------------------------------------------------------------------------
  # ● 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    rect = item_rect(index)
    case index
    when 0..2
      draw_tone_gauge(rect, [:tone_r, :tone_g, :tone_b][index])
    when 3
      draw_text(rect, "Default", 1)
    when 4
      draw_text(rect, "Return", 1)
    end
  end

  #--------------------------------------------------------------------------
  # ● ゲージ項目の描画
  #--------------------------------------------------------------------------
  def draw_tone_gauge(rect, key)
    color1 = gauge_back_color
    color2 = TONE_COLOR[key]
    tone   = $game_system.conf[key]
    rate   = (tone + 255) * 0.002
    draw_gauge(rect.x, rect.y, rect.width, rate, color1, color2)
  end

  #--------------------------------------------------------------------------
  # ● ヘルプウィンドウの更新
  #--------------------------------------------------------------------------
  def update_help
    super
    @help_window.set_text(Help.config_tone[index])
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    super
    call_update_help
    call_handler(:refresh) if handle?(:refresh)
  end
end

#==============================================================================
# ■ Window_SoundConfig
#==============================================================================
class Window_SoundConfig < Window_Selectable
  include NWConst::Config
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #-------------------------------------------------------------------------
  def initialize
    super(160, 120, 320, fitting_height(6))
    refresh
  end

  #--------------------------------------------------------------------------
  # ● 項目数の取得
  #--------------------------------------------------------------------------
  def item_max
    6
  end

  #--------------------------------------------------------------------------
  # ● カーソルを右に移動
  #--------------------------------------------------------------------------
  def cursor_right(wrap = false)
    return unless (0..3).include?(index)

    key = [:volume_bgm, :volume_bgs, :volume_me, :volume_se][index]
    return if $game_system.conf[key] == 100

    $game_system.conf[key] += 1
    Sound.play_cursor
    refresh
  end

  #--------------------------------------------------------------------------
  # ● カーソルを左に移動
  #--------------------------------------------------------------------------
  def cursor_left(wrap = false)
    return unless (0..3).include?(index)

    key = [:volume_bgm, :volume_bgs, :volume_me, :volume_se][index]
    return if $game_system.conf[key] == 0

    $game_system.conf[key] -= 1
    Sound.play_cursor
    refresh
  end

  #--------------------------------------------------------------------------
  # ● カーソルを 1 ページ後ろに移動
  #--------------------------------------------------------------------------
  def cursor_pagedown
    return unless (0..3).include?(index)

    key = [:volume_bgm, :volume_bgs, :volume_me, :volume_se][index]
    return if $game_system.conf[key] == 100

    $game_system.conf[key] = [$game_system.conf[key] + 10, 100].min
    Sound.play_cursor
    refresh
  end

  #--------------------------------------------------------------------------
  # ● カーソルを 1 ページ前に移動
  #--------------------------------------------------------------------------
  def cursor_pageup
    return unless (0..3).include?(index)

    key = [:volume_bgm, :volume_bgs, :volume_me, :volume_se][index]
    return if $game_system.conf[key] == 0

    $game_system.conf[key] = [$game_system.conf[key] - 10, 0].max
    Sound.play_cursor
    refresh
  end

  #--------------------------------------------------------------------------
  # ● 決定処理の有効状態を取得
  #--------------------------------------------------------------------------
  def ok_enabled?
    !(0..3).include?(index)
  end

  #--------------------------------------------------------------------------
  # ● 決定ボタンが押されたときの処理
  #--------------------------------------------------------------------------
  def process_ok
    Sound.play_ok
    Input.update
    case index
    when 4 then call_handler(:default)
    when 5 then call_handler(:return)
    end
  end

  #--------------------------------------------------------------------------
  # ● 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    rect = item_rect(index)
    case index
    when 0..3
      draw_tone_gauge(rect, [:volume_bgm, :volume_bgs, :volume_me, :volume_se][index])
    when 4
      draw_text(rect, "Default", 1)
    when 5
      draw_text(rect, "Return", 1)
    end
  end

  #--------------------------------------------------------------------------
  # ● ゲージ項目の描画
  #--------------------------------------------------------------------------
  def draw_tone_gauge(rect, key)
    color1 = gauge_back_color
    color2 = SOUND_GAUGE[key][:color]
    name   = SOUND_GAUGE[key][:name]
    tone   = $game_system.conf[key]
    draw_gauge(rect.x + 40, rect.y, rect.width - 40, tone * 0.01, color1, color2)
    draw_text(rect, name)
  end

  #--------------------------------------------------------------------------
  # ● ヘルプウィンドウの更新
  #--------------------------------------------------------------------------
  def update_help
    super
    @help_window.set_text(Help.config_sound[index])
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    super
    call_update_help
  end
end

#==============================================================================
# ■ Scene_Config
#==============================================================================
class Scene_Config < Scene_MenuBase
  include NWConst::Config
  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    create_help_window
    create_config_window
    create_tone_config_window
    create_sound_config_window
  end

  #--------------------------------------------------------------------------
  # ● コンフィグウィンドウの作成
  #--------------------------------------------------------------------------
  def create_config_window
    @config_window = Window_Config.new
    @config_window.help_window = @help_window
    @config_window.viewport = @viewport
    @config_window.activate
    @config_window.select(0)
    @config_window.set_handler(:window_tone, method(:start_tone_config))
    @config_window.set_handler(:sound_volume, method(:start_sound_config))
    @config_window.set_handler(:default, method(:set_default))
    @config_window.set_handler(:return, method(:return_scene))
    @config_window.set_handler(:cancel, method(:return_scene))
  end

  #--------------------------------------------------------------------------
  # ● 色調コンフィグの開始
  #--------------------------------------------------------------------------
  def start_tone_config
    @config_window.deactivate
    @tone_config_window.activate.show
    @tone_config_window.select(0)
  end

  #--------------------------------------------------------------------------
  # ● 音量コンフィグの開始
  #--------------------------------------------------------------------------
  def start_sound_config
    @config_window.deactivate
    @sound_config_window.activate.show
    @sound_config_window.select(0)
  end

  #--------------------------------------------------------------------------
  # ● デフォルト値に設定
  #--------------------------------------------------------------------------
  def set_default
    $game_system.init_config
    all_window_refresh
    tone_refresh
    sound_volume_refresh
  end

  #--------------------------------------------------------------------------
  # ● 色調コンフィグウィンドウの作成
  #--------------------------------------------------------------------------
  def create_tone_config_window
    @tone_config_window = Window_ToneConfig.new
    @tone_config_window.help_window = @help_window
    @tone_config_window.viewport = @viewport
    @tone_config_window.deactivate.hide
    @tone_config_window.set_handler(:default, method(:set_tone_default))
    @tone_config_window.set_handler(:return, method(:end_tone_config))
    @tone_config_window.set_handler(:cancel, method(:end_tone_config))
    @tone_config_window.set_handler(:refresh, method(:tone_refresh))
  end

  #--------------------------------------------------------------------------
  # ● 色調値をデフォルトに設定
  #--------------------------------------------------------------------------
  def set_tone_default
    $game_system.init_tone_config
    all_window_refresh
  end

  #--------------------------------------------------------------------------
  # ● 色調のリフレッシュ
  #--------------------------------------------------------------------------
  def tone_refresh
    r = $game_system.conf[:tone_r]
    g = $game_system.conf[:tone_g]
    b = $game_system.conf[:tone_b]
    $game_system.window_tone = Tone.new(r, g, b)
  end

  #--------------------------------------------------------------------------
  # ● 色調コンフィグを終える
  #--------------------------------------------------------------------------
  def end_tone_config
    @tone_config_window.deactivate.hide
    @config_window.activate
    tone_refresh
  end

  #--------------------------------------------------------------------------
  # ● 音声コンフィグウィンドウの作成
  #--------------------------------------------------------------------------
  def create_sound_config_window
    @sound_config_window = Window_SoundConfig.new
    @sound_config_window.help_window = @help_window
    @sound_config_window.viewport = @viewport
    @sound_config_window.deactivate.hide
    @sound_config_window.set_handler(:default, method(:set_sound_default))
    @sound_config_window.set_handler(:return, method(:end_sound_config))
    @sound_config_window.set_handler(:cancel, method(:end_sound_config))
  end

  #--------------------------------------------------------------------------
  # ● 音量をデフォルトに設定
  #--------------------------------------------------------------------------
  def set_sound_default
    $game_system.init_sound_config
    all_window_refresh
  end

  #--------------------------------------------------------------------------
  # ● 音量のリフレッシュ
  #--------------------------------------------------------------------------
  def sound_volume_refresh
    bgm = RPG::BGM.last
    bgs = RPG::BGS.last
    RPG::BGM.stop
    RPG::BGS.stop
    bgm.replay
    bgs.replay
  end

  #--------------------------------------------------------------------------
  # ● 音量コンフィグを終える
  #--------------------------------------------------------------------------
  def end_sound_config
    @sound_config_window.deactivate.hide
    @config_window.activate
    sound_volume_refresh
  end

  #--------------------------------------------------------------------------
  # ● 全てのウィンドウをリフレッシュ
  #--------------------------------------------------------------------------
  def all_window_refresh
    @help_window.refresh
    @config_window.refresh
    @tone_config_window.refresh
    @sound_config_window.refresh
  end
end
