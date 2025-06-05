module Sound
  @play_forget_ok = RPG::SE.new("Item3", 80)
  def self.play_forget_ok
    @play_forget_ok.play
  end
end

module SkillForget
  class Scene_ForgetMenuBase < Scene_MenuBase
    def start
      super
      create_popup_window
    end

    def create_popup_window
      @popup_window = Window_PopupConfirm.new
      @popup_window.viewport = @viewport
      @popup_window.z = 500
      @popup_window.hide
      @popup_window.set_handler(:ok, method(:confirm_ok))
      @popup_window.set_handler(:cancel, method(:confirm_cancel))
    end

    def popup_message
      ""
    end

    def item
      @item_window.item
    end

    def confirm_ok
      forget
      @popup_window.deactivate.hide
      @item_window.refresh
      @item_window.clamp_index
      @item_window.activate
      Sound.play_forget_ok
    end

    def confirm_cancel
      @popup_window.deactivate.hide
      @item_window.activate
    end

    def forget
      @actor.forget_skill(item.id)
      @actor.refresh
    end
  end
end
