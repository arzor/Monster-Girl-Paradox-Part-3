#==============================================================================
# ★ RGSS3_アイコンポップ Ver1.2
#==============================================================================
=begin

作者：tomoaky
webサイト：ひきも記 (http://hikimoki.sakura.ne.jp/)

イベントの頭上に任意のアイコンを表示することができます。

イベントコマンド『スクリプト』で以下を実行してください
  pop_icon(event_id, icon_id, duration)
  
  event_id 番のイベントの頭上に icon_id 番のアイコンが表示されます。
  event_id に 0 を指定すると実行中のイベント自身が対象となり、
  -1 を指定すればプレイヤーが対象となります。
  duration は省略することが可能です、その場合は 120 となります。
  
  例）pop_icon(-1, 17, 300)
  プレイヤーに戦闘不能アイコンを５秒間（300フレーム）表示します
  
  アイコン表示中に pop_icon コマンドを実行しても効果はありません。
  すぐに次のアイコンを表示したい場合は、delete_icon コマンドで
  アイコンを削除してから pop_icon コマンドを実行してください。
  
  例）delete_icon(-1)
  プレイヤーに表示中のアイコンを削除する
  
おまけとしてイベントコマンド『アイテムの増減』『武器の増減』『防具の増減』が
実行されたとき、自動でアイコンを表示する機能が付いています。
  アイコンを表示する対象はゲーム変数（初期設定では６番）で変更が可能です、
  値は pop_icon コマンドにおける event_id と同様ですが、-2 以下を指定することで
  機能をオフにすることができます。
  

使用するゲーム変数（初期設定）
  0006
  
2012.01.19  Ver1.2
　・表示中のアイコンポップを削除する delete_icon コマンドを追加
　・自律移動【カスタム】のスクリプトコマンドで
　　アイコンポップ機能が動作しない不具合を修正
  
2011.12.21  Ver1.11
　・並列処理で event_id に 0 を指定するとアイコンが表示されない不具合を修正
  
2011.12.17  Ver1.1
　・コマンドに表示時間を指定する機能を追加しました

2011.12.15  Ver1.0
  公開
 
=end

#==============================================================================
# □ 設定項目
#==============================================================================
module TMICPOP
  GRAVITY = 24              # アイコンにかかる重力
  SPEED   = -320            # アイコンの初速（Ｙ方向）
end

#==============================================================================
# □ コマンド
#==============================================================================
module TMICPOP
module Commands
  #--------------------------------------------------------------------------
  # ○ アイコンポップの開始
  #--------------------------------------------------------------------------
  def pop_icon(event_id, icon_id, duration = 120)
    target = get_character(event_id)
    return unless target
    target.icpop_id = icon_id
    target.icpop_duration = duration
  end
  #--------------------------------------------------------------------------
  # ○ アイコンポップの削除
  #--------------------------------------------------------------------------
  def delete_icon(event_id)
    target = get_character(event_id)
    return unless target
    target.icpop_delete_flag = true
  end
end
end # module TMICPOP

#==============================================================================
# ■ Game_CharacterBase
#==============================================================================
class Game_CharacterBase
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :icpop_id                 # アイコンポップ ID
  attr_accessor :icpop_duration           # アイコンポップ 表示時間
  attr_accessor :icpop_delete_flag        # アイコンポップ 削除フラグ
  #--------------------------------------------------------------------------
  # ● 公開メンバ変数の初期化
  #--------------------------------------------------------------------------
  alias tmicpop_game_characterbase_init_public_members init_public_members
  def init_public_members
    tmicpop_game_characterbase_init_public_members
    @icpop_id = 0
    @icpop_duration = 0
    @icpop_delete_flag = false
  end
end

#==============================================================================
# ■ Sprite_Character
#==============================================================================
class Sprite_Character
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #     character : Game_Character
  #--------------------------------------------------------------------------
  alias tmicpop_sprite_character_initialize initialize
  def initialize(viewport, character = nil)
    @icpop_duration = 0
    tmicpop_sprite_character_initialize(viewport, character)
  end
  #--------------------------------------------------------------------------
  # ● 解放
  #--------------------------------------------------------------------------
  alias tmicpop_sprite_character_dispose dispose
  def dispose
    dispose_icpop
    tmicpop_sprite_character_dispose
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  alias tmicpop_sprite_character_update update
  def update
    update_icpop
    tmicpop_sprite_character_update
  end
  #--------------------------------------------------------------------------
  # ● 新しいエフェクトの設定
  #--------------------------------------------------------------------------
  alias tmicpop_sprite_character_setup_new_effect setup_new_effect
  def setup_new_effect
    tmicpop_sprite_character_setup_new_effect
    if !@icpop_sprite && @character.icpop_id > 0
      @icpop_id = @character.icpop_id
      @character.icpop_id = 0
      start_icpop
    end
  end
  #--------------------------------------------------------------------------
  # ○ アイコンポップ表示の開始
  #--------------------------------------------------------------------------
  def start_icpop
    dispose_icpop
    @icpop_duration = @icpop_duration_max = @character.icpop_duration
    @icpop_sprite = ::Sprite.new(viewport)
    @icpop_sprite.bitmap = Cache.system("IconSet")
    @icpop_sprite.src_rect.set(@icpop_id % 16 * 24, @icpop_id / 16 * 24, 24, 24)
    @icpop_sprite.ox = 12
    @icpop_sprite.oy = 24
    @icpop_y_plus = 0
    @icpop_y_speed = TMICPOP::SPEED
    update_icpop
  end
  #--------------------------------------------------------------------------
  # ○ アイコンポップの解放
  #--------------------------------------------------------------------------
  def dispose_icpop
    @character.icpop_delete_flag = false
    if @icpop_sprite
      @icpop_sprite.dispose
      @icpop_sprite = nil
    end
  end
  #--------------------------------------------------------------------------
  # ○ アイコンポップの更新
  #--------------------------------------------------------------------------
  def update_icpop
    if @icpop_duration > 0
      @icpop_duration -= 1
      if @character.icpop_delete_flag
        @icpop_duration = 0
        dispose_icpop
      elsif @icpop_duration > 0
        @icpop_sprite.x = x
        @icpop_y_plus += @icpop_y_speed
        @icpop_y_speed += TMICPOP::GRAVITY
        if @icpop_y_plus > 0
          @icpop_y_plus = 0 - @icpop_y_plus
          @icpop_y_speed = 0 - @icpop_y_speed / 2
        end
        @icpop_sprite.y = y - height + (@icpop_y_plus / 256)
        @icpop_sprite.z = z + 200
        @icpop_sprite.opacity = (@icpop_duration < 16 ? @icpop_duration * 16 :
          (@icpop_duration_max - @icpop_duration) * 32)
      else
        dispose_icpop
        @character.icpop_id = 0
      end
    end
  end
end

#==============================================================================
# ■ Game_Event
#==============================================================================
class Game_Event
  include TMICPOP::Commands
  #--------------------------------------------------------------------------
  # ○ キャラクターの取得
  #     param : -1 ならプレイヤー、0 ならこのイベント、それ以外はイベント ID
  #--------------------------------------------------------------------------
  def get_character(param)
    if param < 0
     $game_player
    else
      $game_map.events[param > 0 ? param : @id]
    end
  end
end

#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  include TMICPOP::Commands
end


