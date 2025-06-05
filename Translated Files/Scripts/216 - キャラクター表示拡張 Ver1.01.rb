#==============================================================================
# ★ RGSS3_キャラクター表示拡張 Ver1.01
#==============================================================================
=begin

作者：tomoaky
webサイト：ひきも記 (http://hikimoki.sakura.ne.jp/)

キャラクタースプライトに以下の機能を追加します。
  ・任意の拡大率に変更
  ・任意の回転角度に変更
  ・拡大縮小アニメーション
  ・ふらふらアニメーション
  ・円運動アニメーション

イベントコマンド『スクリプト』で以下のコマンドが使えるようになります。
  set_angle(event_id, angle)
    指定したIDのイベントの回転角度を angle に変更します（0 ～ 360）

  set_zoom(event_id, zoom_x, zoom_y)
    指定したIDのイベントの拡大率を zoom_x, zoom_y に変更します、
    zoom(1, 1.5, 3.0)　とした場合はイベントID1を横1.5倍、縦3倍。
    zoom_y を省略した場合は縦横ともに zoom_x の値に変更します
  
  set_zoom_anime(event_id, flag)
    指定したIDのイベントが拡大と縮小を繰り返すようになります。
    flag が true なら機能オン、false なら機能オフ
    
  set_swing_anime(event_id, angle)
    指定したIDのイベントがふらふらと揺れるようになります。
    angle には揺れ幅を指定してください（0 ～ 360）、省略すると止まります
  
  set_circle_anime(event_id, dist)
    指定したIDのイベントが円運動をするようになります。
    dist には半径を指定してください、省略すると止まります。
    移動するのはスプライトだけなので、イベントの位置は変化しません。
  
  set_cycle(event_id, cycle)
    指定したIDのイベントのアニメーション周期を cycle に変更します、
    対象となるのは拡大縮小アニメ、ふらふらアニメ、円運動アニメの３つです。
    初期値は 256

  event_id に 0 を指定すると実行中のイベント自身が対象となり、
  -1 を指定すればプレイヤーが対象となります。

スクリプトコマンドを使う方法以外に、イベント名や注釈コマンドを使って
設定することもできます。以下の文字列をイベント名か注釈に加えてください。
  <zm 1.5, 2.0>　…　拡大率の設定、横１．５倍、縦２倍
  <an 45>　…　回転角度の設定、半時計回りに４５度
  <za>　　 …　拡大縮小アニメーションを有効にする
  <sa 30>　…　ふらふらアニメーションを有効にする、揺れ幅３０度
  <ca 16>　…　円運動アニメーションを有効にする、半径１６ドット
  <cy 128> …　アニメーション周期の設定、１周１２８フレーム
  
  注釈コマンドを使う場合は必ずイベント実行内容の一番上で設定してください。
  
  
=== 注意 ===
　・設定したパラメータはイベントページの変更などによって初期化されます、
　　イベントコマンドとイベント名、注釈をうまく使い分けてください。


2011.12.21  Ver1.01
  ・並列処理で event_id に 0 を指定するとエラーが発生する不具合を修正
  
2011.12.15　Ver1.0
  公開
  
=end

#==============================================================================
# ■ Game_Character
#==============================================================================
class Game_CharacterBase
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor :zoom_x                   # ｘ方向の拡大率
  attr_accessor :zoom_y                   # ｙ方向の拡大率
  attr_accessor :angle                    # 回転角度
  attr_accessor :zoom_anime               # ズームアニメフラグ
  attr_accessor :swing_anime              # ふらふらフラグ
  attr_accessor :circle_anime             # 円運動フラグ
  attr_accessor :ex_count_max             # アニメーション周期
  #--------------------------------------------------------------------------
  # ● 公開メンバ変数の初期化
  #--------------------------------------------------------------------------
  alias tmsprex_game_character_init_public_members init_public_members
  def init_public_members
    tmsprex_game_character_init_public_members
    clear_ex_param
  end
  #--------------------------------------------------------------------------
  # ○ キャラクター拡張用パラメータの初期化
  #--------------------------------------------------------------------------
  def clear_ex_param
    @zoom_x = 1.0
    @zoom_y = 1.0
    @angle = 0
    @zoom_anime = false
    @swing_anime = nil
    @circle_anime = nil
    @ex_count_max = 256
  end
end

#==============================================================================
# ■ Game_Event
#==============================================================================
class Game_Event < Game_Character
  #--------------------------------------------------------------------------
  # ● イベントページの設定をセットアップ
  #--------------------------------------------------------------------------
  alias tmsprex_game_event_setup_page_settings setup_page_settings
  def setup_page_settings
    tmsprex_game_event_setup_page_settings
    clear_ex_param
    if @list
      if /<zm\s+(\d+(?:\.\d+)?)\s*\,\s*(\d+(?:\.\d+)?)>/i =~ @event.name
        @zoom_x, @zoom_y = $1.to_f, $2.to_f
      end
      @angle = $1.to_i if /<an\s*(\d+)>/i =~ @event.name
      @zoom_anime = true if /<za>/i =~ @event.name
      @swing_anime = $1.to_i if /<sa\s+(\d+)>/i =~ @event.name
      @circle_anime = $1.to_i if /<ca\s+(\d+)>/i =~ @event.name
      @ex_count_max = $1.to_i if /<cy\s+(\d+)>/i =~ @event.name
      @list.each do |list|
        if list.code == 108 || list.code == 408
          text = list.parameters[0]
          if /<zm\s+(\d+(?:\.\d+)?)\s*\,\s*(\d+(?:\.\d+)?)>/i =~ text
            @zoom_x, @zoom_y = $1.to_f, $2.to_f
          end
          @angle = $1.to_i if /<an\s*(\d+)>/i =~ text
          @zoom_anime = true if /<za>/i =~ text
          @swing_anime = $1.to_i if /<sa\s+(\d+)>/i =~ text
          @circle_anime = $1.to_i if /<ca\s+(\d+)>/i =~ text
          @ex_count_max = $1.to_i if /<cy\s+(\d+)>/i =~ text
        else
          break
        end
      end
    end
  end
end

#==============================================================================
# ■ Sprite_Character
#==============================================================================
class Sprite_Character < Sprite_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #     viewport  : ビューポート
  #     character : キャラクター (Game_Character)
  #--------------------------------------------------------------------------
  alias tmsprex_sprite_character_initialize initialize
  def initialize(viewport, character = nil)
    @ex_count = 0                         # 特殊演出用のカウンタ
    tmsprex_sprite_character_initialize(viewport, character)
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  alias tmsprex_sprite_character_update update
  def update
    tmsprex_sprite_character_update
    @ex_count = (@ex_count + 1) % @character.ex_count_max
    n = @character.ex_count_max / 2
    if @character.zoom_anime              # ズームアニメの更新
      self.zoom_x = Math.sin(Math::PI * @ex_count / n) * 0.5 + 1.5
      self.zoom_y = self.zoom_x
    else
      self.zoom_x, self.zoom_y = @character.zoom_x, @character.zoom_y
    end
    if @character.swing_anime             # ふらふら状態の更新
      self.angle = Math.sin(Math::PI * @ex_count / n) * @character.swing_anime
    else
      self.angle = @character.angle
    end
    if @character.circle_anime            # 円運動状態の更新
      a = Math::PI * @ex_count / n
      self.x += Math.sin(a) * @character.circle_anime
      self.y += Math.cos(a) * @character.circle_anime
    end
  end
end

#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ○ キャラクタースプライトの回転角度を変更
  #--------------------------------------------------------------------------
  def set_angle(id, n = 0)
    target = get_character(id)
    target.angle = n if target
  end
  #--------------------------------------------------------------------------
  # ○ キャラクタースプライトの拡大率を変更
  #--------------------------------------------------------------------------
  def set_zoom(id, zoom_x, zoom_y = nil)
    target = get_character(id)
    return unless target
    zoom_y ||= zoom_x
    target.zoom_x, target.zoom_y = zoom_x, zoom_y
  end
  #--------------------------------------------------------------------------
  # ○ キャラクタースプライトのズームアニメを変更
  #--------------------------------------------------------------------------
  def set_zoom_anime(id, flag = true)
    target = get_character(id)
    target.zoom_anime = flag if target
  end
  #--------------------------------------------------------------------------
  # ○ キャラクタースプライトのふらふら状態を変更
  #--------------------------------------------------------------------------
  def set_swing_anime(id, n = nil)
    target = get_character(id)
    return unless target
    target.swing_anime = n
    target.angle = 0 unless n
  end
  #--------------------------------------------------------------------------
  # ○ キャラクタースプライトの円運動状態を変更
  #--------------------------------------------------------------------------
  def set_circle_anime(id, n = nil)
    target = get_character(id)
    target.circle_anime = n if target
  end
  #--------------------------------------------------------------------------
  # ○ キャラクタースプライトの拡張アニメーション周期を変更
  #--------------------------------------------------------------------------
  def set_cycle(id, n = 256)
    target = get_character(id)
    target.ex_count_max = n if target
  end
end


