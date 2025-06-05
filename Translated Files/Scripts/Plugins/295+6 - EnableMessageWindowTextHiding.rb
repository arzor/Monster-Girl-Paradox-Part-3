#==============================================================================
#
# Enable Message Window Text Hiding.
#
#==============================================================================

=begin
===============================================================================
 Message Visibility by efeberk
 Version: RGSS3
===============================================================================
 This script will allow to player sets message window visible or unvisible with
 a key.

 Example : Press F8 to hide message window and repress F8 to show message
 window.
--------------------------------------------------------------------------------
=end

module EFE

  KEY = :F8

end

class Window_Message < Window_Base

  alias efeberk_window_message_update update
  def update
    efeberk_window_message_update
    if Input.trigger?(EFE::KEY)
      self.visible = !self.visible

      # Update For YEA - Ace Message System
      # Name Box Window
      @name_window.visible = self.visible if $imported["YEA-MessageSystem"]
      # Other Message Windows That Appear On Screen
      @gold_window.visible = self.visible
      @choice_window.visible = self.visible
      @number_window.visible = self.visible
      @item_window.visible = self.visible
    end
  end

end