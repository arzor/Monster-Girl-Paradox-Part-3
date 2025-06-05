=begin
=娯楽/景品交換

CasinoPrize


==更新履歴
  Date     Version Author Comment

=end

#==============================================================================
# ■ NWConst::Casino
#==============================================================================
module NWConst::Casino
  CONFIRM_TEXT = "Exchange coins for %s. Are you sure?"
end

#==============================================================================
# ■ Game_Interpreter
#==============================================================================
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ● 所持コインの増加（減少）
  #--------------------------------------------------------------------------
  def gain_coin(amount)
    $game_party.gain_coin(amount)
  end
  #--------------------------------------------------------------------------
  # ● 所持コインの減少
  #--------------------------------------------------------------------------
  def lose_coin(amount)
    $game_party.lose_coin(amount)
  end
  #--------------------------------------------------------------------------
  # ● 景品交換の呼び出し
  #--------------------------------------------------------------------------
  def call_casino_prize(goods)
    SceneManager.call(Scene_CasinoPrize)
    SceneManager.scene.prepare(goods)
    Fiber.yield
  end
end

#==============================================================================
# ■ Window_CasinoPrizeCommand
#==============================================================================
class Window_CasinoPrizeCommand < Window_HorzCommand
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super(0, 0)
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得
  #--------------------------------------------------------------------------
  def window_width
    480
  end
  #--------------------------------------------------------------------------
  # ● 桁数の取得
  #--------------------------------------------------------------------------
  def col_max
    return 2
  end
  #--------------------------------------------------------------------------
  # ● コマンドリストの作成
  #--------------------------------------------------------------------------
  def make_command_list
    add_command("Exchange", :prize)
    add_command("Exit", :cancel)
  end  
end

#==============================================================================
# ■ Window_CasinoPrizeStatus
#==============================================================================
class Window_CasinoPrizeStatus < Window_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super(304, 120, window_width, 360)
    @item = nil
    @page_index = 0
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得
  #--------------------------------------------------------------------------
  def window_width
    return 336
  end
  #--------------------------------------------------------------------------
  # ● アイテムのセット
  #--------------------------------------------------------------------------
  def set_item(after_item)
    @item = after_item
    @page_index = 0
    refresh
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    return if @item.nil?
    draw_possession(4, 0)
    return if @item.is_a?(RPG::Item)
    draw_button(0, contents.height - (line_height * 2))
    return if page_max == 0
    
    method_name = draw_methods[@page_index][:name]
    index = draw_methods[@page_index][:index]
    send(method_name, 0, 28, index)    
  end
  #--------------------------------------------------------------------------
  # ● 描画命令メソッド配列の取得
  #--------------------------------------------------------------------------
  def draw_methods
    methods = []
    param_page_max.times{|i| methods.push({:name => :draw_params, :index => i})}
    enchant_page_max.times{|i| methods.push({:name => :draw_enchants, :index => i})}    
    return methods
  end  
  #--------------------------------------------------------------------------
  # ● 所持数の描画
  #--------------------------------------------------------------------------
  def draw_possession(x, y)
    rect = Rect.new(x, y, contents.width - 4 - x, line_height)
    change_color(system_color)
    draw_text(rect, Vocab::Possession)
    change_color(normal_color)
    draw_text(rect, $game_party.item_number(@item), 2)
  end  
  #--------------------------------------------------------------------------
  # ● ボタン説明の描画
  #--------------------------------------------------------------------------
  def draw_button(x, y)
    rect = Rect.new(x, y, contents.width, line_height)
    change_color(system_color)
    if 1 < page_max
      draw_text(rect, Help.shop_equip_change)      
      draw_text(rect, "#{@page_index + 1}/#{page_max}", 2)      
    end
    rect.y += line_height
    draw_text(rect, Help.shop_param_compare)
  end
  #--------------------------------------------------------------------------
  # ● 基礎性能の描画
  #--------------------------------------------------------------------------
  def draw_params(x, y, index)
    rect = Rect.new(x, y, contents.width, line_height)
    param_names = @item.param_names[index * NWConst::Shop::STATUS_MAX, NWConst::Shop::STATUS_MAX]
    change_color(system_color)
    draw_text(rect, "Basic Stats")
    rect.y += line_height + 2
    change_color(normal_color)
    param_names.each{|name|
      draw_text(rect, name)
      rect.y += line_height
    }
  end
  #--------------------------------------------------------------------------
  # ● 特殊効果の描画
  #--------------------------------------------------------------------------
  def draw_enchants(x, y, index)
    rect = Rect.new(x, y, contents.width, line_height)
    enchant_names = @item.enchant_names[index * NWConst::Shop::STATUS_MAX, NWConst::Shop::STATUS_MAX]
    change_color(system_color)
    draw_text(rect, "Special Effects")
    rect.y += line_height + 2
    change_color(normal_color)
    enchant_names.each{|name|
      draw_text_plus(rect, name)
      rect.y += line_height
    }
  end
  #--------------------------------------------------------------------------
  # ● 基礎性能最大ページ数の取得
  #--------------------------------------------------------------------------
  def param_page_max
    return (@item.param_names.size - 1) / NWConst::Shop::STATUS_MAX + 1
  end  
  #--------------------------------------------------------------------------
  # ● 特殊効果最大ページ数の取得
  #--------------------------------------------------------------------------
  def enchant_page_max
    return (@item.enchant_names.size - 1) / NWConst::Shop::STATUS_MAX + 1
  end  
  #--------------------------------------------------------------------------
  # ● 最大ページ数の取得
  #--------------------------------------------------------------------------
  def page_max
    return param_page_max + enchant_page_max
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    update_page
  end
  #--------------------------------------------------------------------------
  # ● ページの更新
  #--------------------------------------------------------------------------
  def update_page
    if visible && @item.is_a?(RPG::EquipItem) && page_max > 1
      if Input.trigger?(:RIGHT)
        @page_index = (@page_index + 1) % page_max
        refresh
      elsif Input.trigger?(:LEFT)
        @page_index = ((@page_index - 1) + page_max) % page_max
        refresh
      end
    end
  end
end

#==============================================================================
# ■ Window_CasinoPrizeLineUp
#==============================================================================
class Window_CasinoPrizeLineUp < Window_Selectable
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_reader   :status_window            # ステータスウィンドウ
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize(goods)
    super(0, 120, window_width, 360)
    @goods = goods
    @money = 0
    refresh
    select(0)
  end
  #--------------------------------------------------------------------------
  # ● ウィンドウ幅の取得
  #--------------------------------------------------------------------------
  def window_width
    return 304
  end
  #--------------------------------------------------------------------------
  # ● 項目数の取得
  #--------------------------------------------------------------------------
  def item_max
    @data ? @data.size : 1
  end
  #--------------------------------------------------------------------------
  # ● アイテムの取得
  #--------------------------------------------------------------------------
  def item
    @data[index]
  end
  #--------------------------------------------------------------------------
  # ● 商品の値段を取得
  #--------------------------------------------------------------------------
  def price(item)
    @price[item]
  end
  #--------------------------------------------------------------------------
  # ● 所持金の設定
  #--------------------------------------------------------------------------
  def money=(money)
    @money = money
    refresh
  end
  #--------------------------------------------------------------------------
  # ● 選択項目の有効状態を取得
  #--------------------------------------------------------------------------
  def current_item_enabled?
    enable?(@data[index])
  end
  #--------------------------------------------------------------------------
  # ● アイテムを許可状態で表示するかどうか
  #--------------------------------------------------------------------------
  def enable?(item)
    item && price(item) <= @money && !$game_party.item_max?(item)
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    make_item_list
    create_contents
    draw_all_items
  end
  #--------------------------------------------------------------------------
  # ● アイテムリストの作成
  #--------------------------------------------------------------------------
  def make_item_list
    @data = []
    @price = {}
    @goods.each do |data|
      item = Container.item(data[1], data[2])
      if item
        @data.push(item)
        @price[item] = data[0]
      end
    end
  end

  def sort_item_list ;end
  #--------------------------------------------------------------------------
  # ● 項目の描画
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    rect = item_rect(index)
    name_width = rect.width - text_size(price(item)).width - 24
    draw_item_name(item, rect.x, rect.y, enable?(item), name_width)
    rect.width -= 4
    draw_text(rect, price(item), 2)
  end
  #--------------------------------------------------------------------------
  # ● ステータスウィンドウの設定
  #--------------------------------------------------------------------------
  def status_window=(status_window)
    @status_window = status_window
    call_update_help
  end

  #--------------------------------------------------------------------------
  # ● ヘルプテキスト更新
  #--------------------------------------------------------------------------
  def update_help
    @help_window.set_item(item) if @help_window
    @status_window.set_item(item) if @status_window
  end
end

#==============================================================================
# ■ Window_CoinSimple
#==============================================================================
class Window_CoinSimple < Window_Gold
  #--------------------------------------------------------------------------
  # ● 所持金の取得
  #--------------------------------------------------------------------------
  def value
    $game_party.coin
  end
  #--------------------------------------------------------------------------
  # ● 通貨単位の取得
  #--------------------------------------------------------------------------
  def currency_unit
    "　Coins"
  end
end

#==============================================================================
# ■ Scene_CasinoPrize
#==============================================================================
class Scene_CasinoPrize < Scene_MenuBase
  #--------------------------------------------------------------------------
  # ● 準備
  #--------------------------------------------------------------------------
  def prepare(goods)
    @goods = goods
  end  
  #--------------------------------------------------------------------------
  # ● 開始処理
  #--------------------------------------------------------------------------
  def start
    super
    create_help_window
    create_gold_window
    create_command_window
    create_dummy_window
    create_status_window
    create_lineup_window
    create_popup_confirm_window
  end  
  #--------------------------------------------------------------------------
  # ● ゴールドウィンドウの作成
  #--------------------------------------------------------------------------
  def create_gold_window
    @gold_window = Window_CoinSimple.new
    @gold_window.viewport = @viewport
    @gold_window.x = Graphics.width - @gold_window.width
    @gold_window.y = @help_window.height
  end
  #--------------------------------------------------------------------------
  # ● コマンドウィンドウの作成
  #--------------------------------------------------------------------------
  def create_command_window
    @command_window = Window_CasinoPrizeCommand.new
    @command_window.viewport = @viewport
    @command_window.y = @help_window.height
    @command_window.set_handler(:prize, method(:command_prize))
    @command_window.set_handler(:cancel, method(:return_scene))
  end
  #--------------------------------------------------------------------------
  # ● コマンド：交換
  #--------------------------------------------------------------------------
  def command_prize
    @lineup_window.money = money
    @dummy_window.hide
    @lineup_window.show
    @status_window.show
    @lineup_window.activate
  end
  #--------------------------------------------------------------------------
  # ● ダミーウィンドウの作成
  #--------------------------------------------------------------------------
  def create_dummy_window
    wy = @command_window.y + @command_window.height
    wh = Graphics.height - wy
    @dummy_window = Window_Base.new(0, wy, Graphics.width, wh)
    @dummy_window.viewport = @viewport
  end
  #--------------------------------------------------------------------------
  # ● ステータスウィンドウの作成
  #--------------------------------------------------------------------------
  def create_status_window
    @status_window = Window_CasinoPrizeStatus.new
    @status_window.viewport = @viewport
    @status_window.hide
  end    
  #--------------------------------------------------------------------------
  # ● ラインナップウィンドウの作成
  #--------------------------------------------------------------------------
  def create_lineup_window
    @lineup_window = Window_CasinoPrizeLineUp.new(@goods)
    @lineup_window.viewport = @viewport
    @lineup_window.hide
    @lineup_window.set_handler(:ok, method(:prize_ok))
    @lineup_window.set_handler(:cancel, method(:prize_cancel))
    @lineup_window.help_window = @help_window
    @lineup_window.status_window = @status_window
  end  
  #--------------------------------------------------------------------------
  # ● 交換：決定
  #--------------------------------------------------------------------------
  def prize_ok
    @popup_confirm_window.refresh
    @popup_confirm_window.show.activate
    @popup_confirm_window.set_name(@lineup_window.item.name)
    @popup_confirm_window.select(0)
  end
  #--------------------------------------------------------------------------
  # ● 交換：キャンセル
  #--------------------------------------------------------------------------
  def prize_cancel
    @lineup_window.hide
    @status_window.hide
    @dummy_window.show
    @help_window.clear
    @command_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 確認ポップアップウィンドウの作成
  #--------------------------------------------------------------------------  
  def create_popup_confirm_window
    @popup_confirm_window = Window_PopupConfirm.new
    @popup_confirm_window.set_title(NWConst::Casino::CONFIRM_TEXT)
    @popup_confirm_window.viewport = @viewport
    @popup_confirm_window.hide
    @popup_confirm_window.set_handler(:ok, method(:confirm_ok))
    @popup_confirm_window.set_handler(:cancel, method(:confirm_cancel))
  end
  #--------------------------------------------------------------------------
  # ● 確認：決定
  #--------------------------------------------------------------------------  
  def confirm_ok
    item = @lineup_window.item
    price = @lineup_window.price(item)
    $game_party.lose_coin(price)
    $game_party.gain_item(item, 1)
    Sound.play_shop
    @gold_window.refresh
    @lineup_window.money = money
    @lineup_window.refresh
    @popup_confirm_window.hide
    @lineup_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 確認：キャンセル
  #--------------------------------------------------------------------------  
  def confirm_cancel
    @popup_confirm_window.hide
    @lineup_window.activate
  end
  #--------------------------------------------------------------------------
  # ● 所持金の取得
  #--------------------------------------------------------------------------
  def money
    @gold_window.value
  end
end

