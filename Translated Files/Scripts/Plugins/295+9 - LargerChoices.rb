#===============================================================================
# GRB_LargerChoices
# Fixed by JoSmiHnTh
#===============================================================================

# ------------------------------------[АНГ]-------------------------------------
# Use larger texts for Show Choice command
# by Garbata Team
#
# To use this plugin, add a comment starting with a line CHOICE TEXT: as the
# first event command inside a choice branch. Then the text of the comment
# (rest of it) will be used displayed as the choice text.
#
# This script is placed into public domain according to the CC0 public domain
# dedication. See https://creativecommons.org/publicdomain/zero/1.0/ for more
# information.
#
# Visit http://rpgmaker.ru/forum/issmv/62984-mv-grb-larger-choices#109807 for
# a RPG Maker MV version.
#
# ------------------------------------[РУС]-------------------------------------
# Использование больших текстов в команде Показать выбор.
# Авторы: команда Гарбата
#
# Чтобы использовать этот плагин, добавьте комментарий с текстом ТЕКСТ ВЫБОРА:
# в первой строке внутри ветви выбора. Комментарий должен быть первой командой
# внутри ветви. Тогда текст комментария (кроме первой строки) будет использо-
# ваться как текст выбора.
#
# Этот скрипт передан в общественное достояние согласно CC0. Подробнее см. на
# странице https://creativecommons.org/publicdomain/zero/1.0/deed.ru
#
# Версия для RPG Maker MV доступна по адресу:
# http://rpgmaker.ru/forum/issmv/62984-mv-grb-larger-choices#109807
#
# ------------------------------------[БЕЛ]-------------------------------------
# Выкарыстанне вялікіх тэкстаў у камандзе Паказаць выбар.
# Аўтары: каманда Гарбата
#
# Каб карыстацца гэтым плагінам, дадайце каментарый з тэкстам ТЭКСТ ВЫБАРУ:
# у першым радку ўсярэдзіне галіны выбару. Каментарый мусіць быць першай
# камандай усярэдзіне галіны. Тады тэкст каментарыя (акрамя першага радку) будзе
# выкарыстоўвацца як тэкст выбару.
#
# Гэты скрыпт пярэданы ў грамадскі набытак згодна з CC0. Падрабязней гл. на
# старонцы https://creativecommons.org/publicdomain/zero/1.0/deed.be
#
# Версія для RPG Maker MV даступная па адрасе:
# http://rpgmaker.ru/forum/issmv/62984-mv-grb-larger-choices#109807
#
# ------------------------------------[УКР]-------------------------------------
# Використання великих текстів в команді Показати вибір
# Автори: команда Гарбата
#
# Щоб користатися цим плагіном, додайте коментар з текстом ТЕКСТ ВИБОРУ:
# в першому рядку в галину вибору. Коментар мусить бути першої командою
# в середині галини. Тоді текст коментаря будзе вжито як текст вибору.
#
# Цей скрипт передано до суспільного надбання згідно з CC0. Детальніше див.
# на сторінці https://creativecommons.org/publicdomain/zero/1.0/deed.uk
#
# Версія для RPG Maker MV даступна за адресою:
# http://rpgmaker.ru/forum/issmv/62984-mv-grb-larger-choices#109807

class Game_Interpreter
  alias old_setup_choices :setup_choices
  def setup_choices(params)
    start_cmd = @list[@index]
    if start_cmd.code != 102 || start_cmd.parameters != params
      # The command is not called for the current command
      # I don't really understand how this can happen, probably other plugin's magic
      # To be safe, let's just bail out
      old_setup_choices(params)
    end

    choices = grb_find_matching_choices(@index)
    if !choices
      choices = params[0]
    end

    old_setup_choices(params)

    $game_message.choices.clear
    choices.each {|s| $game_message.choices.push(s) }
  end

  def grb_get_choice_text_from_comment(comment_index, indent)
    start_regexp = /^\s*(ТЕКСТ ВЫБОРА|ТЭКСТ ВЫБАРУ|ТЕКСТ ВИБОРУ|CHOICE TEXT):\s*$/

    start_cmd = @list[comment_index]

    return nil if start_cmd.code != 108
    return nil if start_cmd.parameters.size != 1
    return nil if start_cmd.parameters[0] !~ start_regexp
    return nil if start_cmd.indent != indent

    comment_lines = []
    for i in (comment_index + 1) .. (@list.size)
      line_cmd = @list[i]
      break if line_cmd.code != 408
      break if line_cmd.indent != indent
      break if line_cmd.parameters.length != 1

      comment_lines.push(line_cmd.parameters[0])
    end

    if comment_lines.length > 0
      return comment_lines.join("\n");
    else
      return nil
    end

  end

  def grb_find_matching_choices(start_index)
    start_cmd = @list[start_index]
    fallback_choices = start_cmd.parameters[0]
    indent = start_cmd.indent

    choices = []

    branch_index = start_index + 1
    choice_ended = false
    while branch_index <= @list.size && !choice_ended do
      current_cmd = @list[branch_index]
      return nil if current_cmd.code != 402 || current_cmd.indent != indent

      choice_text = grb_get_choice_text_from_comment(branch_index + 1 , indent + 1)
      if choice_text
        choices.push(choice_text)
      else
        choices.push(fallback_choices[choices.size])
      end

      branch_index += 1
      next_cmd = (@list)[branch_index]

      while branch_index <= @list.length do
        if next_cmd.code === 404 && next_cmd.indent == indent
          choice_ended = true
          break
        elsif next_cmd.code === 402 && next_cmd.indent == indent
          break
        end

        branch_index += 1
        next_cmd = @list[branch_index]
      end
    end

    # problems with the event command structure:
    return nil if !choice_ended
    return nil if choices.size != fallback_choices.size

    return choices
  end
end


class Window_ChoiceList < Window_Command

  def grb_item_height(index)
    text = $game_message.ex_choice_item.empty? ? $game_message.choices[index] : $game_message.ex_choice_item[index][0]
    return line_height if text.nil?

    text.split("\n").size * line_height
  end

  alias_method :original_item_rect, :item_rect
  def item_rect(index)

    if $game_message.ex_choice_item.nil?
      return original_item_rect(index)
    end

    rect = Rect.new
    rect.width = item_width
    rect.height = grb_item_height(index)
    rect.x = 0
    rect.y = 0

    for i in (0 .. index-1) do
      h_part = grb_item_height(i)
      rect.y += h_part if !h_part.nil?
    end
    rect
  end

  def max_choice_width
    ($game_message.choices.collect do |i|
      i.split("\n").collect { |l| text_size(l).width }.max
    end).max
  end

  alias_method :original_contents_height, :contents_height
  def contents_height

    if $game_message.ex_choice_item.nil?
      return original_contents_height
    end

    h = 0
    size = $game_message.ex_choice_item.empty? ? $game_message.choices.size : $game_message.ex_choice_item.size
    for i in 0 .. size-1 do
      h += grb_item_height(i)
    end
    h
  end

  alias_method :original_update_placement, :update_placement
  def update_placement

    if $game_message.ex_choice_item.nil?
      return original_update_placement
    end

    self.width = [max_choice_width + 12, 96].max + padding * 2
    self.width = [width, Graphics.width].min

    size = $game_message.ex_choice_item.empty? ? $game_message.choices.size : $game_message.ex_choice_item.size
    self.height = [[contents_height+24, fitting_height(size)].max, fitting_height(14)].min
    self.x = Graphics.width - width
    self.y = if @message_window.y >= Graphics.height / 2
               [@message_window.y - height,0].max
             else
               @message_window.y + @message_window.height
             end
  end
end

