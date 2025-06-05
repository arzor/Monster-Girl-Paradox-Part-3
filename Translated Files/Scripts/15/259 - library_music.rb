module LibraryMusic
  class BaseBGM
    attr_reader :index

    def initialize
      @index = nil
    end

    def setup(data)
      return @index = nil if @index == data.id

      @index = data.id
    end

    def object
      return nil unless @index

      Item.new(@index, NWConst::Library::BGM_SCENE_ITEMS[@index]).object
    end
  end

  class Window_MainCommand < Window_Vertical_Command
    def initialize
      super(0, 0)
      @page = 0
      self.arrows_visible = false
    end

    def show_key_text
      bgm_text = if current_ext && current_ext.id == $game_system.base_bgm.index
                   "解除"
                 else
                   "登録"
                 end
      [ShowKey_Help.lr_scroll, "#{Vocab.key_y}:拠点BGM#{bgm_text}"]
    end

    def process_ok
      if current_item_enabled?
        call_ok_handler
        @last_select_index = @index
        refresh
      else
        Sound.play_buzzer
      end
    end

    def process_handling
      return unless open? && active
      return process_ok       if ok_enabled?        && Input.trigger?(:C)
      return process_cancel   if cancel_enabled?    && Input.trigger?(:B)
      return process_base_bgm if Input.trigger?(:Y)
    end

    def process_base_bgm
      return unless current_data

      $game_system.base_bgm.setup(current_ext)
      refresh
    end

    def make_command_list
      @data ||= NWConst::Library::BGM_SCENE_ITEMS.map { |k, v| Item.new(k, v) }
      @data.each do |item|
        next if item.hide?

        if item.show?
          add_command(item.name, item.id, true, item)
        else
          add_command("？？？", item.id, false, nil)
        end
      end
    end

    def current_base_bgm?
      return unless current_ext
    end

    def draw_item(index)
      return unless @list[index]

      color = if @list[index][:ext] && @list[index][:ext].id == $game_system.base_bgm.index
                tp_gauge_color2
              else
                normal_color
              end
      change_color(color, command_enabled?(index))
      draw_text(item_rect_for_text(index), command_name(index), alignment)
      if @last_select_index == index
        change_color(normal_color, true)
        draw_text(item_rect_for_text(index), "♪", 2)
      end
    end

    def window_height
      Graphics.height - 56
    end

    def window_width
      Graphics.width
    end

    def update_help
      @help_window.page_index = current_page
      @help_window.page_max = page_max
    end

    def current_page
      index / page_item_max + 1
    end

    def page_max
      item_max / page_item_max + 1
    end

    def ensure_cursor_visible
      move_page
    end

    def move_page
      return if @page == current_page

      @page = current_page
      self.top_col = col.odd? ? col - 1 : col
    end
  end

  class Item
    attr_reader :name
    attr_reader :file
    attr_reader :id

    def initialize(id, data)
      @id = id
      instance_variable_set_in_hash(data) if data
      @condition = LibraryH::Condition.make(@condition)
      @volume ||= 100
      @pitch ||= 100
    end

    def show?
      @condition.show?
    end

    def hide?
      @condition.hide?
    end

    def object
      RPG::BGM.new(@file, @volume, @pitch)
    end
  end
end

class Scene_Library_Music < Scene_MenuBase
  include ShowKey_HelpWindow
  def start
    super
    create_all_window
    BattleManager.save_bgm_and_bgs
  end

  def show_key_sprite_window
    @main_command_window
  end

  def show_key_text
    active_windows.map(&:show_key_text).flatten
  end

  def create_all_window
    @main_command_window = LibraryMusic::Window_MainCommand.new
    @main_command_window.set_handler(:ok, method(:main_command_ok))
    @main_command_window.set_handler(:cancel, method(:return_scene))
    @page_window = Window_Page.new
    @page_window.show
    @main_command_window.help_window = @page_window
  end

  def main_command_ok
    bgm = @main_command_window.current_ext.object
    bgm.play
  end

  def terminate
    super
    BattleManager.replay_bgm_and_bgs
  end
end
