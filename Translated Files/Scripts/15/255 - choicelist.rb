class Window_ChoiceList
  def update_placement
    self.width = [max_choice_width + 12, 96].max + padding * 2
    self.width = [width, Graphics.width].min
    self.height = fitting_height([$game_message.choices.size, 14].min)
    self.x = Graphics.width - width
    self.y = if @message_window.y >= Graphics.height / 2
               @message_window.y - height
             else
               @message_window.y + @message_window.height
             end
  end
end
