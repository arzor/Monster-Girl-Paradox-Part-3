#==============================================================================
#    Global Text Codes [VXA]
#    Version: 1.0a
#    Author: modern algebra (rmrk.net)
#    Date: April 5, 2012
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#  Description:
#
#    This script allows you to use special message codes in any window, not
#   just message windows and help windows. Want to add an icon next to the
#   menu commands? With this script you can do that and more.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#  Instructions:
#
#    Simply paste this script into its own slot above Main and below Materials
#   and other custom scripts.
#
#    There are two settings for this script - automatic and manual. If set to
#   automatic, then all you will need to do is put any of the special message
#   codes in anything and they will automatically work. If set to manual, then
#   you will also need to type the following code somewhere in the text field
#   to activate it: \*
#
#    The following default codes are available:
#
# \c[n] - Set the colour of the text being drawn to the nth colour of the
#     Windowskin palette. 0 is the normal color and 16 is the system color.
# \i[n] - Draw icon with index n.
# \p[n] - Draw the name of the actor in the xth position in the party. 1 is
#     the party leader, 2 is the second member, etc.
# \n[n] - Draw the name of the actor with ID n
# \v[n] - Draw the value of variable with ID n.
# \g - Draws the unit of currency.
#
#    Depending on whether you are using any custom message script, you may have
#   additional message codes at your disposal. This script is mostly compatible
#   with my ATS and every code except \x and ones related to message control
#   will work.
#==============================================================================

$imported = {} unless $imported
$imported[:MAGlobalTextCodes] = true
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#  Editable Region
#||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#  MAGTC_MANUAL_CODES - If this is true, then you must put a \* code in any
# field that you want to have codes interpreted in. Otherwise, codes will
# always automatically be interpreted. The recommended value for this is true,
# as the process for drawing text with codes is much slower than the process
# for drawing text without codes.
MAGTC_MANUAL_CODES = true
#  MAGTC RCODES - This feature is designed to overcome the space limitations in
# much of the database - since codes take so much of that space, it might be
# difficult to write everything you want into one of those fields. This feature
# permits you to write the term you want in to the following array, and then
# access it in the database with the code \r[n], where n is the ID you assign
# to the phrase in the following way:
#
#    n => "replacement",
#
# Please note that: it is =>, not =; the replacement must be within quotation
# marks; and there must be a comma after every line. If using double quotation
# marks ("", not ''), then you need to use two backslashes to access codes
# instead of one (\\c[1], not \c[1]).
#
#  EXAMPLE:
#   0 => "\\i[112]\\c[14]New Game\\c[0]",
#
#  Under the New Game field in the Terms of the Database, all I would then need
# to put is:
#    \*\r[0]
#  and it would be the same as if I had put:
#    \*\i[112]\c[14]New Game\c[0]
MAGTC_RCODES = { # <- Do not touch
                 0 => "\\i[112]\\c[14]New Game\\c[0]", # Example
                 1 => "", # You can make as many of these as you want
                 2 => "\\i[40]Blood Hound",
                 #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
                 #  END Editable Region
                 #//////////////////////////////////////////////////////////////////////////////
}
MAGTC_RCODES.default = ""

#==============================================================================
# ** Window_Base
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#  Summary of Changes:
#    aliased methods - draw_text; convert_escape_characters; process_new_line;
#      reset_font_settings
#    new methods - magtc_align_x; magtc_test_process_escape_character;
#      magtc_calc_line_width
#==============================================================================

class Window_Base
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # * Draw Text
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  alias ma_gtc_drwtxt_3fs1 draw_text
  def draw_text(*args, &block)
    # Get the arguments
    if args[0].is_a?(Rect)
      x, y, w, h = args[0].x, args[0].y, args[0].width, args[0].height
      text, align = *args[1, 2]
    else
      x, y, w, h, text, align = *args[0, 6]
    end
    align = 0 unless align
    #  Draw normally if text is not a string, draw normally if the text is not
    # long enough to hold a code, and draw normally when the script is set to
    # manual and \* is included in the text
    if !text.is_a?(String) || text.size < 2 || (MAGTC_MANUAL_CODES && text[/\\\*/].nil?)
      ma_gtc_drwtxt_3fs1(*args, &block) # Run Original Method
    else
      @magtc_reset_font = contents.font.dup # Do not automatically reset font
      @magtc_rect, @magtc_align = Rect.new(x, y, w, h), align
      # Get first line of the text to test for alignment
      @magtc_test_line = convert_escape_characters(text[/.*/])
      y += [(h - calc_line_height(@magtc_test_line)) / 2, 0].max
      # Draw text with message codes
      draw_text_ex(magtc_align_x(x), y, text)
      @magtc_reset_font = nil # Do not automatically reset font
      @magtc_rect, @magtc_align = nil, nil # Reset Rect and Alignment
    end
  end
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # * Convert Escape Characters
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  alias ma_gtc_convescchar_5tk9 convert_escape_characters
  def convert_escape_characters(text, *args, &block)
    # Remove \* codes
    new_text = text.gsub(/\\\*/, "")
    # Substitute for the R Codes
    new_text.gsub!(/\\[Rr]\[(\d+)\]/) { MAGTC_RCODES[$1.to_i].to_s }
    ma_gtc_convescchar_5tk9(new_text, *args, &block) # Call Original Method
  end
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # * Reset Font Settings
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  alias magtc_resetfonts_4ga5 reset_font_settings
  def reset_font_settings(*args, &block)
    magtc_resetfonts_4ga5(*args, &block) # Call Original Method
    contents.font = @magtc_reset_font if @magtc_reset_font
  end
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # * Process New Line
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  alias magtc_prcsnewl_5gn9 process_new_line
  def process_new_line(text, pos, *args, &block)
    magtc_prcsnewl_5gn9(text, pos, *args, &block) # Run Original Method
    if @magtc_align && @magtc_rext
      @magtc_test_line = text[/.*/] # Get new line
      pos[:x] = magtc_align_x       # Get the correct x, depending on alignment
    end
  end
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # * Get Alignment X
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  def magtc_align_x(start_x = @magtc_rect.x)
    return start_x unless (@magtc_rect && @magtc_align && @magtc_test_line) || @magtc_align != 0
    tw = magtc_calc_line_width(@magtc_test_line)
    case @magtc_align
    when 1 then return start_x + ((@magtc_rect.width - tw) / 2)
    when 2 then return start_x + (@magtc_rect.width - tw)
    end
    start_x
  end
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # * Calc Line Width
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  def magtc_calc_line_width(line)
    # Remove all escape codes
    line = line.clone
    line.gsub!(/[\n\r\f]/, "")
    real_contents = contents # Preserve Real Contents
    # Create a dummy contents
    self.contents = Bitmap.new(@magtc_rect.width, @magtc_rect.height)
    reset_font_settings
    pos = {x: 0, y: 0, new_x: 0, height: calc_line_height(line)}
    tw = 0
    while line[/^(.*?)\e(.*)/]
      tw += text_size($1).width
      line = $2
      # Remove all ancillaries to the code, like parameters
      code = obtain_escape_code(line)
      magtc_test_process_escape_character(code, line, pos)
    end
    #  Add width of remaining text, as well as the value of pos[:x] under the
    # assumption that any additions to it are because the special code is
    # replaced by something which requires space (like icons)
    tw += text_size(line).width + pos[:x]
    self.contents.dispose # Dispose dummy contents
    self.contents = real_contents # Restore real contents
    return tw
  end
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  # * Test Process Escape Character
  #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  def magtc_test_process_escape_character(code, text, pos)
    if $imported[:ATS_SpecialMessageCodes] && ['X', 'HL'].include?(code.upcase)
      obtain_escape_param(text)
      return
    end
    process_escape_character(code, text, pos)
  end
end