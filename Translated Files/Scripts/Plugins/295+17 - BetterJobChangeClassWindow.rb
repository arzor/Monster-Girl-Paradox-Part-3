# encoding: UTF-8
#========================================#
# Better Job Change Class Window v1.2    |
# By JoSmiHnTh                           |
#========================================#

#========================================#

module ShowKey_Help
  class << self
    def rb_rt_page
      "#{Vocab.key_z}/#{Vocab.key_y}:Scroll"
    end
  end
end

module BetterJobChange
  def self.enabled?
    if defined?($game_system) && $game_system && $game_system.conf
      val = $game_system.conf[:better_job_change]
      return val != 0 unless val.nil?
    end
    true
  end
end

if defined?(NWConst::Config) && NWConst::Config.respond_to?(:add_toggle)
  NWConst::Config.add_toggle(
    :better_job_change,
    "Job Change Menu+",
    "[Mod]Use enhanced 4-page Job/Race Change windows across Job\r\nChange, Status, and Library.\r\n←/→ On/Off",
    0,
    "Extra"
  )
  NWConst::Config::DATA_TEXT[:better_job_change] = {
    0 => {:name => "Off", :help => "Use original 1-page Job/Race windows."},
    1 => {:name => "On",  :help => "Use enhanced 4-page Job/Race windows with more details."}
  }
end

CLASSNAME_WIDTH = 195
TITLE_GAP = 18

class Foo::JobChange::Window_ClassStatus
  include ScrollFramework::ScrollableGrid

  unless method_defined?(:better_page_initialize) || private_method_defined?(:better_page_initialize)
    alias better_page_initialize initialize
  end

  def initialize
    better_page_initialize

    if BetterJobChange.enabled?
      if self.class == Foo::JobChange::Window_ClassStatus
        self.x = CLASSNAME_WIDTH
        self.width = Graphics.width - CLASSNAME_WIDTH
      end

      create_contents
      scroll_init
      @scroll_up_keys = [:Y]
      @scroll_down_keys = [:Z]
      @user_page = 1
      @page = 1
      @max_page = 1
      @last_class_id = -1
      @shuffle_state = 0
      @shuffle_old_bmp = nil
      @scroll_y_per_page = {}
    else
      if self.class == Foo::JobChange::Window_ClassStatus
        self.x = 160
        self.width = Graphics.width - 160
      end
    end

  end

  def class_id=(id)
    @class_id = id
    return unless BetterJobChange.enabled?
    @scroll_memory_key = id
    @scroll_y_per_page = {}
    scroll_dispose
    self.contents_opacity = 255
    cleanup_shuffle

  end

  #--------------------------------------------------------------------------
  # ● アクターの取得【オーバーライド】
  #    ライブラリモードではアクターを持たないため常に nil。
  #--------------------------------------------------------------------------
  unless method_defined?(:better_jccw_orig_actor) || private_method_defined?(:better_jccw_orig_actor)
    alias better_jccw_orig_actor actor
  end

  def actor
    return nil if library_mode? && BetterJobChange.enabled?
    better_jccw_orig_actor
  end

  def defer_refresh
    @defer_count = 6
    contents.clear if contents && !contents.disposed?

  end

  def next_page
    return if @max_page <= 1
    return if @shuffle_state > 0
    @scroll_y_per_page[@page] = @scroll_y
    @page = @page >= @max_page ? 1 : @page + 1
    @user_page = @page
    @scroll_y = @scroll_y_per_page[@page] || 0
    start_shuffle

  end

  def previous_page
    return if @max_page <= 1
    return if @shuffle_state > 0
    @scroll_y_per_page[@page] = @scroll_y
    @page = @page <= 1 ? @max_page : @page - 1
    @user_page = @page
    @scroll_y = @scroll_y_per_page[@page] || 0
    start_shuffle

  end

  def clamp_scroll
    return unless @scroll_bitmap && !@scroll_bitmap.disposed?
    @scroll_max = [@scroll_bitmap.height - contents_height, 0].max
    @scroll_y = [@scroll_y, @scroll_max].min

  end

  def start_shuffle
    return unless contents && !contents.disposed?
    @shuffle_old_bmp = contents.clone
    @shuffle_state = 1

  end

  def update
    super
    return unless BetterJobChange.enabled?
    update_shuffle

    if @defer_count && @defer_count > 0
      if Input.press?(:UP) || Input.press?(:DOWN)
        @defer_count = 6
      else
        @defer_count -= 1

        if @defer_count == 0
          @defer_count = nil
          refresh
        end
      end
    end

    return unless visible
    return if @shuffle_state > 0
    return unless self.active

    previous_page if Input.trigger?(:LEFT)
    next_page     if Input.trigger?(:RIGHT)
    scroll_down   if Input.press?(:Z)
    scroll_up     if Input.press?(:Y)

  end

  def scroll_down
    scroll_input([], [:Z])

  end

  def scroll_up
    scroll_input([:Y], [])

  end

  def update_shuffle
    case @shuffle_state
    when 1
      self.contents_opacity -= 20

      if self.contents_opacity <= 0
        self.contents_opacity = 0
        self.contents.dispose if contents

        case @page
        when 1 then draw_page_status
        when 2 then draw_page_skills
        when 3 then draw_page_resistances
        when 4 then draw_page_requirements
        end

        clamp_scroll
        @shuffle_state = 2
      end

    when 2
      self.contents_opacity += 20

      if self.contents_opacity >= 255
        self.contents_opacity = 255

        if @shuffle_old_bmp
          @shuffle_old_bmp.dispose
          @shuffle_old_bmp = nil
        end

        @shuffle_state = 0
      end
    end

  end

  def cleanup_shuffle
    if @shuffle_old_bmp
      @shuffle_old_bmp.dispose
      @shuffle_old_bmp = nil
    end

    @shuffle_state = 0

  end

  def max_page
    @max_page || 1

  end

  def page
    @page || 1

  end

  #--------------------------------------------------------------------------
  # ● ライブラリモード (actorless)
  #   Library の Job Info / Race Info で使用。アクターを一切参照せず、
  #   選択しても転職は行われない。レベル表示も行わない。
  #--------------------------------------------------------------------------
  def library_mode=(flag)
    @library_mode = flag
    refresh
  end

  def library_mode?
    @library_mode
  end

  unless method_defined?(:better_page_refresh) || private_method_defined?(:better_page_refresh)
    alias better_page_refresh refresh
  end

  def refresh
    if BetterJobChange.enabled?
      contents.dispose if contents
      scroll_dispose
      do_refresh
    else
      reset_font_settings if contents && !contents.disposed?
      better_page_refresh
    end

  end

  def quick_refresh
    if BetterJobChange.enabled?
      scroll_dispose
      do_refresh
    else
      better_page_refresh
    end

  end

  def do_refresh
    if library_mode?
      return if @class_id == -1
      @max_page = 4
    else
      return unless @actor_id != -1 && @class_id != -1
      @max_page = class_change_enable?(@class_id) ? 4 : 1
    end

    if @last_class_id != @class_id
      @last_class_id = @class_id
      @scroll_y_per_page = {}
      @scroll_y = 0
    end

    @page = @user_page
    @page = 1 if @page < 1 || @page > @max_page
    @scroll_y = 0

    if library_mode? || class_change_enable?(@class_id)
      case @page
      when 1 then draw_page_status
      when 2 then draw_page_skills
      when 3 then draw_page_resistances
      when 4 then draw_page_requirements
      end
    else
      draw_page_requirements
    end

    clamp_scroll
    cleanup_shuffle

  end

  def finalize_page
    title_h = line_height - 4 + TITLE_GAP
    scroll_finalize(title_h)

  end

  def blit_scroll
    scroll_blit

  end

  def draw_page_title(title, right_text = nil)
    contents.font.bold = true
    old_fs = contents.font.size
    contents.font.size -= 2
    change_color(normal_color)
    draw_text(4, 1, contents_width - 8, line_height, title)

    if right_text
      change_color(normal_color)
      draw_text(4, 1, contents_width - 8, line_height, right_text, 2)
    end

    draw_horz_line(line_height + 1)
    contents.font.size = old_fs

  end

  def draw_section_title(bmp, y, text)
    bmp.font.bold = true
    bmp.font.color = system_color
    bmp.draw_text(0, y, contents_width, line_height, text, 1)
    bmp.font.bold = false
    bmp.font.color = normal_color

  end

  def feature_display_name(obj, ft)
    return nil unless obj && ft

    if ft.code == 72
      return nil unless ft.data_id.is_a?(Array) && ft.data_id.size >= 2
      skill = find_skill_by_feature(ft.code, ft.data_id, ft.value)
      return skill.name if skill
      is_weapon = ft.data_id[0] == 0
      type_id = ft.data_id[1]
      type_name = is_weapon ? $data_system.weapon_types[type_id] : $data_system.armor_types[type_id]
      return nil unless type_name && !type_name.empty?
      return "#{type_name} Mastery"
    end

    if ft.code == 69
      return nil unless ft.data_id.is_a?(Fixnum) && ft.value.is_a?(Hash) && !ft.value.empty?
      btype = ft.data_id
      names = []
      ft.value.each do |tid, val|
        pct = (val * 100).to_i

        case btype
        when 0
          en = $data_system.elements[tid]
          names << "#{en} Boost #{pct}%" if en && !en.empty?
        when 4
          return nil
        when 7
          return nil
        when 10
          next unless tid.is_a?(Array) && tid.size >= 2
          wn = $data_system.weapon_types[tid[0]]
          sn = $data_system.skill_types[tid[1]]
          names << "#{wn} Equipped: #{sn} Booster #{pct}%" if wn && sn
        end
      end

      return names.empty? ? nil : names
    end

    method_name = obj.enchant_method_table[ft.code] rescue nil
    return nil unless method_name
    obj.send(method_name, ft) rescue nil

  end

  def ability_type_icon(stype_id)
    GameIconRegistry.stype_icon(stype_id)
  end

  @@skill_index_built = false
  SKILL_BY_NAME = {}
  SKILL_BY_FEATURE = {}
  SKILL_MUTEX_FAMILIES = {}

  def find_skill_by_name(name)
    return nil unless name && !name.empty?
    ensure_skill_index
    SKILL_BY_NAME[name]
  end

  def normalize_mastery_rate(val)
    return 200 unless val
    return 200 if val.is_a?(Array) || val.is_a?(Hash)
    v = (val.to_f rescue 200.0)
    v < 50.0 ? (v * 100.0).round : v.round
  end

  def find_skill_by_feature(code, data_id, value = nil)
    ensure_skill_index
    candidates = SKILL_BY_FEATURE[[code, data_id]]
    return nil unless candidates && !candidates.empty?
    if value
      val_int = normalize_mastery_rate(value)
      match = candidates.select do |r, s|
        if val_int >= 700
          r >= 700
        elsif val_int >= 250
          r >= 400 && r < 700
        else
          r < 400
        end
      end.first || candidates.last
      return match[1] if match
    end
    candidates.first[1]
  end

  def ensure_skill_index
    return if @@skill_index_built && !SKILL_BY_FEATURE.empty?
    @@skill_index_built = true
    return unless $data_skills

    SKILL_BY_NAME.clear
    SKILL_BY_FEATURE.clear
    SKILL_MUTEX_FAMILIES.clear

    (1...$data_skills.size).each do |sid|
      s = $data_skills[sid]
      next unless s
      SKILL_BY_NAME[s.name] ||= s if s.name && !s.name.empty?

      dex = s.instance_variable_get(:@data_ex) || {}

      # Mutual exclusion family from database
      fam = if dex[:not_jumble_memorize] && !dex[:not_jumble_memorize].empty?
              ([sid] + dex[:not_jumble_memorize]).uniq
            elsif s.note =~ /<共存不可メモライズ\s+([0-9, ]+)>/i
              ([sid] + $1.split(',').map(&:to_i)).uniq
            else
              nil
            end
      if fam
        fam.each { |fid| SKILL_MUTEX_FAMILIES[fid] = fam }
      end

      # Direct features on skill
      if s.features
        s.features.each do |sf|
          val = normalize_mastery_rate(sf.value)
          SKILL_BY_FEATURE[[sf.code, sf.data_id]] ||= []
          SKILL_BY_FEATURE[[sf.code, sf.data_id]] << [val, s]
        end
      end

      # Features on passive ability armors linked to this skill
      arm_ids = if dex[:passive_armors] && !dex[:passive_armors].empty?
                  dex[:passive_armors]
                elsif s.respond_to?(:passive_armors) && s.passive_armors
                  s.passive_armors
                elsif s.note =~ /<パッシブ能力防具\s+([0-9, ]+)>/i
                  $1.split(',').map(&:to_i)
                else
                  []
                end

      arm_ids.each do |aid|
        armor = $data_armors[aid] rescue nil
        next unless armor && armor.features
        armor.features.each do |af|
          val = normalize_mastery_rate(af.value)
          SKILL_BY_FEATURE[[af.code, af.data_id]] ||= []
          SKILL_BY_FEATURE[[af.code, af.data_id]] << [val, s]
        end
      end
    end

    SKILL_BY_FEATURE.each do |_k, list|
      list.sort_by! { |val, _s| -val }
    end
  end

  def feat_icon(ft, _display_name = nil)
    return 0 unless ft

    case ft.code
    when 22, 23 then ability_type_icon(3)
    when 68 then ability_type_icon(1)
    when 69 then ability_type_icon(5)
    when 72 then ability_type_icon(5)
    else ability_type_icon(2)
    end

  end

  def draw_page_status
    temp_bmp = Bitmap.new(contents_width, [contents_height * 10, 1].max)
    temp_bmp.font.size = Font.default_size
    temp_bmp.font.color = normal_color
    job = $data_classes[@class_id]
    desc_text = NWConst::JobChange::JOB_DESC_TEXT[@class_id]

    old_swap = self.contents
    self.contents = temp_bmp
    y = draw_job_param(0)
    self.contents = old_swap
    y += 16

    all_fts = (job.features || []).to_a
    equip_fts = []; skills_fts = []; boost_fts = []
    all_fts.each do |ft|
      case ft.code
      when 43, 44, 51, 52, 53, 54, 55 then equip_fts << ft
      when 41, 42 then skills_fts << ft
      when 21 then nil
      when 22, 23, 31, 32, 33, 34, 61, 62, 64, 66, 67, 68, 69, 71, 78, 84 then boost_fts << ft
      when 11, 12, 13, 14, 88 then nil
      end
    end

    y = draw_status_description(temp_bmp, y, desc_text)
    y = draw_status_equipment(temp_bmp, y, job, equip_fts)
    y = draw_status_skills(temp_bmp, y, skills_fts)
    y = draw_status_boosters(temp_bmp, y, job, boost_fts)
    y = draw_status_masteries(temp_bmp, y, job, all_fts)

    title_h = line_height - 4 + TITLE_GAP
    if library_mode?
      level_text = nil
    else
      lv = actor ? actor.level_list[@class_id] : nil
      level_text = Vocab.level_a + (lv || 1).to_s
    end
    draw_status_finalize(temp_bmp, y, title_h, job.name, level_text)
    temp_bmp.dispose
    finalize_page
  end

  def draw_status_description(temp_bmp, y, desc_text)
    draw_section_title(temp_bmp, y, "Description")
    y += line_height + 4
    desc0 = desc_text[0] if desc_text
    full_text = ""

    if desc0 && desc0.any? { |t| !t.strip.empty? }
      full_text = desc0.select { |t| !t.strip.empty? }.map(&:strip).join(" ")
    end

    old_fs = temp_bmp.font.size
    temp_bmp.font.size -= 2
    y = draw_multiline_text(temp_bmp, 8, y, contents_width - 16, line_height, full_text.empty? ? "None" : full_text, 1)
    temp_bmp.font.size = old_fs
    y += 8
    y
  end

  def draw_status_equipment(temp_bmp, y, job, equip_fts)
    equip_names = []

    equip_fts.each do |ft|
      lbl = nil
      eic = 0

      case ft.code
      when 43
        lbl = $data_system.weapon_types[ft.data_id]
        eic = GameIconRegistry.wtype_icon(ft.data_id)

      when 44
        next if (10..32).include?(ft.data_id)
        lbl = $data_system.armor_types[ft.data_id]
        eic = GameIconRegistry.atype_icon(ft.data_id)

      when 51
        lbl = feature_display_name(job, ft)
        lbl = lbl.sub(/^Equip:/, '') if lbl
        eic = GameIconRegistry.wtype_icon(ft.data_id)

      when 52
        next if (10..32).include?(ft.data_id)
        lbl = feature_display_name(job, ft)
        lbl = lbl.sub(/^Equip:/, '') if lbl
        eic = GameIconRegistry.atype_icon(ft.data_id)

      when 53, 54, 55
        lbl = feature_display_name(job, ft)
      end

      equip_names << "\\i[#{eic}]#{lbl}" if lbl && !lbl.empty?
    end

    equip_names.uniq!
    draw_section_title(temp_bmp, y, "Equipment")
    y += line_height + 4
    old_fs = temp_bmp.font.size
    temp_bmp.font.size -= 2
    y = draw_multiline_text(temp_bmp, 8, y, contents_width - 16, line_height, equip_names.any? ? equip_names.join(", ") : "None", 1)
    temp_bmp.font.size = old_fs
    y += 16
    y
  end

  def draw_status_skills(temp_bmp, y, skills_fts)
    skill_entries = []

    skills_fts.each do |ft|
      name = $data_system.skill_types[ft.data_id]
      next unless name && !name.empty?
      prefix = ft.code == 42 ? "Sealed:" : ""
      icon = GameIconRegistry.stype_icon(ft.data_id).nonzero? || GameIconRegistry.sname_icon(name)
      skill_entries << "\\i[#{icon}]#{prefix}#{name}"
    end

    draw_section_title(temp_bmp, y, "Skills")
    y += line_height + 4
    old_fs = temp_bmp.font.size
    temp_bmp.font.size -= 2
    y = draw_multiline_text(temp_bmp, 8, y, contents_width - 16, line_height + 4, skill_entries.any? ? skill_entries.join(", ") : "None", 1)
    temp_bmp.font.size = old_fs
    y += 16
    y
  end

  def draw_status_boosters(temp_bmp, y, job, boost_fts)
    boost_list = []

    boost_fts.each do |ft|
      case ft.code
      when 68
        name = feature_display_name(job, ft)
        if name.is_a?(Array)
          name.each { |n| boost_list << [ft, n, nil] if n && !n.to_s.empty? }
        elsif name && !name.empty?
          boost_list << [ft, name, nil]
        end
      when 69
        name = feature_display_name(job, ft)
        next unless name

        if name.is_a?(Array)
          name.each { |n| boost_list << [ft, n, nil] }
        else
          boost_list << [ft, name, nil]
        end

      when 22, 23, 31, 32, 33, 34, 61, 62, 64, 66, 67, 71, 78, 84
        name = feature_display_name(job, ft)
        if name.is_a?(Array)
          name.each { |n| boost_list << [ft, n, nil] if n && !n.to_s.empty? }
        elsif name && !name.empty?
          boost_list << [ft, name, nil]
        end
      end
    end

    boost_list.each do |entry|
      lbl = entry[1]
      skill = find_skill_by_name(lbl)

      if skill
        entry[2] = skill
        entry[1] = skill.name
      end
    end

    boost_list.uniq!
    modifier_list = boost_list.select { |_, _, skill| !skill }
    ability_list = boost_list.select { |_, _, skill| skill }
    draw_section_title(temp_bmp, y, "Passive Traits")
    y += line_height + 4
    old_fs = temp_bmp.font.size
    temp_bmp.font.size -= 2
    y = draw_multiline_text(temp_bmp, 8, y, contents_width - 16, line_height, modifier_list.any? ? modifier_list.map { |_, lbl, _| lbl.to_s.gsub(/\\c\[\d+\]/, '').gsub(" ", "\u00A0") }.join(", ") : "None", 1)
    temp_bmp.font.size = old_fs
    y += 16
    draw_section_title(temp_bmp, y, "Passive Abilities")
    y += line_height + 4

    if ability_list.any?
      indent = 8
      old_fs = temp_bmp.font.size
      temp_bmp.font.size -= 2

      ability_list.each do |ft, lbl, skill|
        ic = skill.icon_index > 0 ? skill.icon_index : feat_icon(ft, lbl)
        draw_icon_on(temp_bmp, ic, indent, y)
        temp_bmp.draw_text(indent + 28, y, contents_width - indent - 28, line_height, lbl)
        y += line_height

        if skill.description && !skill.description.empty?
          fsz = temp_bmp.font.size
          temp_bmp.font.size -= 2
          y = draw_multiline_text(temp_bmp, indent + 28, y, contents_width - indent - 28, line_height, skill.description)
          temp_bmp.font.size = fsz
        end
      end

      temp_bmp.font.size = old_fs
    else
      old_fs = temp_bmp.font.size
      temp_bmp.font.size -= 2
      y = draw_multiline_text(temp_bmp, 8, y, contents_width - 16, line_height, "None", 1)
      temp_bmp.font.size = old_fs
    end

    y += 16
    y
  end

  def draw_dots_on(bmp, start, fin, y, fs, color = nil)
    return if start >= fin

    dot_color = color || Color.new(255, 255, 255, 100)
    dy = y + line_height / 2
    d = start

    while d < fin
      bmp.fill_rect(d, dy, 1, 1, dot_color)
      d += 4
    end
  end

  def draw_status_masteries(temp_bmp, y, job, all_fts)
    w_order = (1..32).to_a
    a_order = [1, 2, 3, 4, 5, 6, 7, 8, 9, 34, 35, 33, 36, 37, 38, 39, 40]

    mastery_items = []

    all_fts.each do |ft|
      next unless ft.code == 72
      next unless ft.data_id.is_a?(Array) && ft.data_id.size >= 2
      cat, tid = ft.data_id[0], ft.data_id[1]
      rate = normalize_mastery_rate(ft.value)
      bonus_pct = rate - 100

      if cat == 0
        type_name = $data_system.weapon_types[tid] rescue nil
        next unless type_name && !type_name.empty?
        ic = GameIconRegistry.wtype_icon(tid).nonzero? || 0
        sort_idx = w_order.index(tid) || (100 + tid)
        mastery_items << {
          name: type_name,
          icon: ic,
          bonus: bonus_pct,
          sort_key: sort_idx
        }
      else
        type_name = $data_system.armor_types[tid] rescue nil
        next unless type_name && !type_name.empty?
        ic = GameIconRegistry.atype_icon(tid).nonzero? || 0
        sort_idx = a_order.index(tid) || (100 + tid)
        mastery_items << {
          name: type_name,
          icon: ic,
          bonus: bonus_pct,
          sort_key: 1000 + sort_idx
        }
      end
    end

    draw_section_title(temp_bmp, y, "Passive Masteries")
    y += line_height + 4

    if mastery_items.any?
      mastery_items.sort_by! { |it| it[:sort_key] }

      col_w = (contents_width - 16) / 2
      total_rows = (mastery_items.size + 1) / 2
      row_h = line_height

      mastery_items.each_with_index do |item, idx|
        if idx < total_rows
          col = 0
          row = idx
        else
          col = 1
          row = idx - total_rows
        end
        rx = 8 + col * col_w
        ry = y + row * row_h

        draw_icon_on(temp_bmp, item[:icon], rx, ry) if item[:icon] > 0

        name_w = temp_bmp.text_size(item[:name]).width
        val_text = "+#{item[:bonus]}%"
        val_w = temp_bmp.text_size(val_text).width

        dots_start = rx + 28 + name_w + 4
        val_right = rx + col_w - 8
        dots_end = val_right - val_w - 4

        draw_dots_on(temp_bmp, dots_start, dots_end, ry, temp_bmp.font.size, system_color)

        temp_bmp.font.color = system_color
        temp_bmp.draw_text(rx + 28, ry, name_w + 4, row_h, item[:name])
        temp_bmp.font.color = normal_color
        temp_bmp.draw_text(val_right - val_w, ry, val_w + 8, row_h, val_text, 0)
      end

      total_rows = (mastery_items.size + 1) / 2
      y += total_rows * row_h
    else
      y = draw_multiline_text(temp_bmp, 8, y, contents_width - 16, line_height, "None", 1)
    end

    y += 16
    y
  end

  def draw_status_finalize(temp_bmp, y, title_h, title_text, level_text)
    total_h = title_h + y
    self.contents = Bitmap.new(contents_width, [total_h, contents_height].max)
    contents.clear
    draw_page_title(title_text, level_text)
    contents.blt(0, title_h, temp_bmp, Rect.new(0, 0, contents_width, y))
  end

  def element_icon(elem_id)
    tbl = {1=>244, 2=>188, 3=>144, 4=>145, 5=>146, 6=>149, 7=>148, 8=>147, 9=>150, 10=>151, 35=>176, 36=>51,
           41=>3610, 43=>185, 44=>165, 45=>166, 46=>168, 47=>167, 48=>169, 49=>303, 50=>274, 51=>245, 52=>3671}
    tbl[elem_id] || 0

  end

  STATE_GROUP_MAP = {
    "Bound" => "Bind", "Caught" => "Bind", "Bind" => "Bind",
    "Stop" => "Stop", "Stop 1" => "Stop", "Stop 2" => "Stop", "Stop 3" => "Stop",
    "Stun 1" => "Stun", "Stun 2" => "Stun", "Stun 3" => "Stun",
    "Stun 4" => "Stun", "Stun 5" => "Stun", "Stun 6" => "Stun", "Stun 7" => "Stun",
  }

  AILMENT_STATE_IDS = [230, 231, 232, 28, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27]

  def state_group_name(st)
    STATE_GROUP_MAP[st.name] || st.name

  end

  def resist_pct(val)
    (val * 100.0).to_i

  end

  def draw_resist_grid(bmp, x, y, col_w, entries)
    old_fs = bmp.font.size
    bmp.font.size -= 2
    gap = 8
    rh = line_height + gap
    col0 = []; col1 = []
    entries.each_with_index { |e, i| (i % 2 == 0 ? col0 : col1) << e }
    icon_w = 24; pad = 14
    rows = [col0.size, col1.size].max

    rows.times do |i|
      cy = y + i * rh

      [ [col0[i], x], [col1[i], x + col_w] ].each do |entry, cx|
        next unless entry
        icon, text = entry
        name = text =~ /\A(.+)\s+(.+)\z/ ? $1 : text
        val = text =~ /\A.+\s+(.+)\z/ ? $1 : ""
        draw_icon_on(bmp, icon, cx + pad, cy)
        nx = cx + pad + icon_w + pad
        bmp.font.color = normal_color
        bmp.draw_text(nx, cy, col_w - nx + cx, line_height, name)
        vx = cx + col_w - pad - bmp.text_size(val).width

        if val == "NULL"
          bmp.font.color = Color.new(0, 200, 80)
        elsif val =~ /\A(\d+)%/
          n = $1.to_i

          if n < 100
            bmp.font.color = Color.new(0, 200, 80)
          elsif n > 100
            bmp.font.color = Color.new(255, 80, 80)
          else
            bmp.font.color = normal_color
          end
        end

        bmp.draw_text(vx, cy, col_w - (vx - cx), line_height, val)
        bmp.font.color = normal_color
      end
    end

    bmp.font.size = old_fs
    y + rows * rh

  end
  def draw_page_resistances
    title_h = line_height - 4 + TITLE_GAP
    temp_bmp = Bitmap.new(contents_width, [contents_height * 10, 1].max)
    temp_bmp.font.size = Font.default_size
    temp_bmp.font.color = normal_color
    y = 0
    all_fts = ($data_classes[@class_id].features || []).to_a

    elem_fts = all_fts.select { |ft| ft.code == 11 }
    fix_fts = all_fts.select { |ft| ft.code == 88 }
    state_fts = all_fts.select { |ft| [13, 14].include?(ft.code) }

    col_w = contents_width / 2

    draw_section_title(temp_bmp, y, "Element Resistances")
    y += line_height + 4
    entries = []
    fix_map = {}
    fix_fts.each { |ft| fix_map[ft.data_id] = ft }
    elem_map = {}
    elem_fts.each { |ft| elem_map[ft.data_id] = (elem_map[ft.data_id] || []) << ft }
    max_eid = $data_system.elements.size - 1

    (1..max_eid).each do |eid|
      en = $data_system.elements[eid]
      next unless en && !en.empty?
      next if en == "Special" || en == "Null" || en == "Untyped" || en == "Recovery" || en == "Giant" || en == "Gravity"
      next if eid >= 11 && eid <= 34

      if fix_map.key?(eid)
        val = fix_map[eid].value
      elsif elem_map.key?(eid)
        val = elem_map[eid].map(&:value).inject(1.0, :*)
      else
        val = 1.0
      end

      ic = element_icon(eid)
      pct = resist_pct(val)
      entries << [ic, "#{en} #{pct}%"]
    end

    if entries.any?
      y = draw_resist_grid(temp_bmp, 0, y, col_w, entries)
    else
      old_fs = temp_bmp.font.size
      temp_bmp.font.size -= 2
      y = draw_multiline_text(temp_bmp, 8, y, contents_width - 16, line_height, "None", 1)
      temp_bmp.font.size = old_fs
    end

    y += 16

    draw_section_title(temp_bmp, y, "Ailment Resistances")
    y += line_height + 4
    # Collect all state features grouped, + fixed AILMENT_STATE_IDS base
    raw = {}

    state_fts.each do |ft|
      st = $data_states[ft.data_id]
      next unless st
      grp = state_group_name(st)
      pct = ft.code == 14 ? 100 : resist_pct(ft.value)
      is_immune = ft.code == 14

      if raw.key?(grp)
        if pct > raw[grp][0]
          raw[grp] = [pct, st.icon_index, is_immune]
        end
      else
        raw[grp] = [pct, st.icon_index, is_immune]
      end
    end

    AILMENT_STATE_IDS.each do |sid|
      st = $data_states[sid]
      next unless st
      grp = state_group_name(st)
      next if raw.key?(grp)
      ft = state_fts.find { |f| f.data_id == sid }

      if ft
        pct = ft.code == 14 ? 100 : resist_pct(ft.value)
        raw[grp] = [pct, st.icon_index, ft.code == 14]
      else
        raw[grp] = [resist_pct(1.0), st.icon_index, false]
      end
    end

    entries = raw.map do |grp, (pct, ic, immune)|
      [ic, immune ? "#{grp} NULL" : "#{grp} #{pct}%"]
    end

    if entries.any?
      y = draw_resist_grid(temp_bmp, 0, y, col_w, entries)
    else
      old_fs = temp_bmp.font.size
      temp_bmp.font.size -= 2
      y = draw_multiline_text(temp_bmp, 8, y, contents_width - 16, line_height, "None", 1)
      temp_bmp.font.size = old_fs
    end

    y += 16

    y += 16

    total_h = title_h + y
    self.contents = Bitmap.new(contents_width, [total_h, contents_height].max)
    contents.clear
    draw_page_title("Resistances")
    contents.blt(0, title_h, temp_bmp, Rect.new(0, 0, contents_width, y))
    temp_bmp.dispose
    finalize_page

  end

  def class_param_values(target_class)
    return nil unless target_class
    @class_param_cache ||= {}
    return @class_param_cache[target_class.id] if @class_param_cache.key?(target_class.id)

    params = Array.new(8) { 1.0 }
    target_class.features.each do |ft|
      next unless ft.code == NWFeature::FEATURE_PARAM

      params[ft.data_id] *= ft.value
    end
    params.collect! { |p| (p * 100.0).round }
    tp = target_class.features.select do |ft|
      ft.code == NWFeature::FEATURE_BATTLER_ABILITY && ft.data_id == NWFeature::Battler::INCREASE_TP && ft.value[:per]
    end.inject(0) do |sum, f|
      sum += f.value[:plus] ? f.value[:num] : -f.value[:num]
    end
    params.insert(2, tp + 100)
    @class_param_cache[target_class.id] = params
    params
  end

  unless method_defined?(:better_jccw_orig_draw_job_param) || private_method_defined?(:better_jccw_orig_draw_job_param)
    alias better_jccw_orig_draw_job_param draw_job_param
  end

  def draw_job_param(y)
    return better_jccw_orig_draw_job_param(y) unless BetterJobChange.enabled?

    rect_width = contents_width / 3
    row_h = line_height

    cur_class = if job && job.tribe?
                  actor ? actor.tribe : nil
                else
                  actor ? actor.class : nil
                end

    cur_params = (cur_class && job && cur_class.id != job.id) ? class_param_values(cur_class) : nil

    job_params.each_with_index do |param, i|
      col = i % 3
      row = i / 3
      col_x = col * rect_width
      row_y = y + row * row_h

      name = param_names[i]
      val = param
      val += 100 if i == 2

      change_color(system_color)
      draw_text(col_x + 4, row_y, rect_width - 64, row_h, name, 0)

      if cur_params
        cur_val = cur_params[i]
        diff = val - cur_val

        if diff > 0
          change_color(Color.new(0, 200, 80))
        elsif diff < 0
          change_color(Color.new(255, 80, 80))
        else
          change_color(normal_color)
        end
      else
        change_color(normal_color)
      end

      draw_text(col_x + rect_width - 64, row_y, 54, row_h, "#{val}%", 2)
    end

    change_color(normal_color)
    y + 3 * row_h + 8
  end

  def draw_multiline_text(bmp, x, y, width, line_h, text, align = 0)
    return y if text.nil? || text.empty?
    wrapped_lines = word_wrap_lines(text, bmp, width)

    wrapped_lines.each do |line|
      tokens = word_wrap_tokens(line)
      dx = x

      if align == 1
        tw = 0
        tokens.each { |tok| tw += tok[0] == :icon ? 24 : bmp.text_size(tok[1]).width }
        dx = x + (width - tw) / 2
      end

      tokens.each do |tok|
        if tok[0] == :icon
          draw_icon_on(bmp, tok[1], dx, y)
          dx += 26
        else
          bmp.draw_text(dx, y, x + width - dx, line_h, tok[1])
          dx += bmp.text_size(tok[1]).width
        end
      end

      y += line_h
    end

    y

  end

  def word_wrap_lines(text, bmp, width)
    lines = []

    text.split("\n").each do |para|
      tokens = word_wrap_tokens(para)
      cur = ""; cur_w = 0; i = 0

      while i < tokens.size
        tok = tokens[i]
        combined = nil
        combined_count = 0
        tw = tok[0] == :icon ? 24 : bmp.text_size(tok[1]).width

        if tok[0] == :icon
          combined = ""
          j = i + 1

          while j < tokens.size && tokens[j][0] == :text
            combined << tokens[j][1]
            tw += bmp.text_size(tokens[j][1]).width
            combined_count += 1
            j += 1
          end

          combined = nil if combined.empty?
        end

        if !cur.empty? && cur_w + tw > width
          lines << cur.strip; cur = ""; cur_w = 0

          if tok[0] == :text && tok[1].strip.empty?
            i += 1; next
          end
        end

        cur << (tok[0] == :icon ? "\\i[#{tok[1]}]" : tok[1])
        cur << combined if combined
        cur_w += tw
        i += combined ? (1 + combined_count) : 1
      end

      lines << cur.strip unless cur.empty?
    end

    lines

  end

  def word_wrap_tokens(raw)
    tokens = []
    i = 0

    while i < raw.size
      if raw[i] == "\\" && raw[i+1] == "i" && raw[i+2] == "["
        end_idx = raw.index("]", i)

        if end_idx
          tokens << [:icon, raw[(i+3)...end_idx].to_i]
          i = end_idx + 1; next
        end
      end

      start = i

      while i < raw.size && !(raw[i] == " " || (raw[i] == "\\" && raw[i+1] == "i" && raw[i+2] == "["))
        i += 1
      end

      if start < raw.size && raw[start] == " "
        tokens << [:text, " "]; i = start + 1
      else
        tokens << [:text, raw[start...i]] if start < i
      end
    end

    tokens

  end

  def draw_page_skills
    job = $data_classes[@class_id]
    return unless job
    learnings = job.learnings || []
    by_level = {}

    learnings.each do |l|
      by_level[l.level] ||= []
      by_level[l.level] << l.skill_id
    end

    title_h = line_height - 4 + TITLE_GAP
    sorted = by_level.keys.sort

    if sorted.empty?
      self.contents = Bitmap.new(contents_width, contents_height)
      contents.clear
      draw_page_title("Learned Skills/Abilities")
      draw_text(8, title_h, contents_width - 16, line_height, "None", 1)
      contents.font.bold = false
      finalize_page
      return
    end

    indent = 20
    content_bmp = Bitmap.new(contents_width, [contents_height * 40, 1].max)
    content_bmp.font.bold = false
    content_bmp.font.color = normal_color
    y = 0

    sorted.each do |level|
      content_bmp.font.bold = true
      content_bmp.font.color = system_color
      content_bmp.draw_text(0, y, contents_width, line_height, "Lv.#{level}", 1)
      y += line_height
      content_bmp.font.bold = false
      content_bmp.font.color = normal_color

      by_level[level].each do |sid|
        skill = $data_skills[sid]
        next unless skill
        draw_icon_on(content_bmp, skill.icon_index, indent, y)
        text_x = indent + 28
        content_bmp.draw_text(text_x, y, contents_width - text_x, line_height, skill.name)
        y += line_height
        old_fs = content_bmp.font.size
        content_bmp.font.size -= 2
        y = draw_multiline_text(content_bmp, text_x, y, contents_width - text_x, line_height, skill.description.to_s)
        content_bmp.font.size = old_fs
      end

      y += 16
    end

    total_h = title_h + y
    self.contents = Bitmap.new(contents_width, [total_h, contents_height].max)
    contents.clear
    draw_page_title("Learned Skills/Abilities")
    contents.blt(0, title_h, content_bmp, Rect.new(0, 0, contents_width, y))
    content_bmp.dispose
    finalize_page

  end

  def draw_page_requirements
    title_h = line_height - 4 + TITLE_GAP
    temp_bmp = Bitmap.new(contents_width, [contents_height * 10, 1].max)
    temp_bmp.font.size = Font.default_size
    temp_bmp.font.color = normal_color
    y = 0

    # Section 1: Job Item (needed items)
    items = job.need_jobchange_item.reject { |id| id == 0 || $data_items[id].nil? }

    if items.any?
      draw_section_title(temp_bmp, y, "Job Item")
      y += line_height + 4
      entry_texts = items.map do |id|
        if $game_party.has_item?($data_items[id])
          "\\i[#{$data_items[id].icon_index}]#{$data_items[id].name}"
        else
          unknown_name
        end
      end

      old_fs = temp_bmp.font.size
      temp_bmp.font.size -= 2
      y = draw_multiline_text(temp_bmp, 8, y, contents_width - 16, line_height, entry_texts.join(", "), 1)
      temp_bmp.font.size = old_fs
      y += 16
    end

    # Section 2: Needed Jobs
    needed_jobs = Array(job.need_jobchange_class).reject { |obj| obj.nil? || obj[:id].nil? || $data_classes[obj[:id]].nil? }
    selectable_groups = Array(job.select_jobchange_class).reject(&:empty?)

    if needed_jobs.any? || selectable_groups.any?
      draw_section_title(temp_bmp, y, "Needed Jobs/Races")
      y += line_height + 4
      job_names = []

      needed_jobs.each do |obj|
        next if obj.nil?
        job_names << (class_show_enable?(obj[:id]) ? $data_classes[obj[:id]].name : unknown_name)
      end

      selectable_groups.each do |group|
        group = Array(group).reject(&:nil?)
        names = group.map { |obj| obj && class_show_enable?(obj[:id]) ? $data_classes[obj[:id]].name : unknown_name }
        job_names << names.join(" or ") unless names.empty?
      end

      old_fs = temp_bmp.font.size
      temp_bmp.font.size -= 2
      y = draw_multiline_text(temp_bmp, 8, y, contents_width - 16, line_height, job_names.join(", "), 1)
      temp_bmp.font.size = old_fs
      y += 16
    end

    # Build final contents
    content_h = [y, line_height].max

    if y == 0
      temp_bmp.font.color = normal_color
      temp_bmp.draw_text(0, 0, contents_width, line_height, "None", 1)
      content_h = line_height
    end

    total_h = title_h + content_h
    self.contents = Bitmap.new(contents_width, [total_h, contents_height].max)
    contents.clear
    draw_page_title("Requirements")
    contents.blt(0, title_h, temp_bmp, Rect.new(0, 0, contents_width, content_h))
    temp_bmp.dispose
    finalize_page

  end

  def draw_icon_on(bmp, icon_index, x, y)
    return unless bmp
    icon_set = Cache.system("Iconset")
    rect = Rect.new(icon_index % 16 * 24, icon_index / 16 * 24, 24, 24)
    bmp.blt(x, y, icon_set, rect, 255)

  end

  def draw_mastery_icon(bmp, x, y, overlay_icon = 0)
    icon_set = Cache.system("Iconset")
    rect = Rect.new(99 % 16 * 24, 99 / 16 * 24, 24, 24)
    bmp.blt(x, y, icon_set, rect, 255)

  end

end

class Foo::JobChange::Window_ClassName
  def window_width
    BetterJobChange.enabled? ? CLASSNAME_WIDTH : 160
  end

  #--------------------------------------------------------------------------
  # ● ライブラリモード (actorless)
  #--------------------------------------------------------------------------
  def library_mode=(flag)
    @library_mode = flag
  end

  def library_mode?
    @library_mode
  end

  #--------------------------------------------------------------------------
  # ● アクターの取得【オーバーライド】
  #    ライブラリモードでは nil。
  #--------------------------------------------------------------------------
  unless method_defined?(:better_jccw_orig_actor_name) || private_method_defined?(:better_jccw_orig_actor_name)
    alias better_jccw_orig_actor_name actor
  end

  def actor
    return nil if library_mode? && BetterJobChange.enabled?
    better_jccw_orig_actor_name
  end

  #--------------------------------------------------------------------------
  # ● 決定ボタンが押されたときの処理【オーバーライド】
  #    ライブラリモードでは選択を何もしない (no-op)。deactivate も行わず
  #    フォーカスを維持する。
  #--------------------------------------------------------------------------
  def process_ok
    return super unless library_mode? && BetterJobChange.enabled?
    Sound.play_ok
  end

  #--------------------------------------------------------------------------
  # ● 表示用クラスIDの取得【オーバーライド】
  #    ライブラリモードではアクター要件を無視して全クラスを表示。
  #--------------------------------------------------------------------------
  unless method_defined?(:better_jcw_class_id)
    alias better_jcw_class_id class_id
  end

  def class_id
    return better_jcw_class_id unless library_mode? && BetterJobChange.enabled?
    return [] if @class_type_id == -1

    [NWConst::Class::JOB_RANGE, NWConst::Class::TRIBE_RANGE].at(@class_type_id).sort_by do |id|
      $data_classes[id].sort_obj
    end.select do |id|
      $data_classes[id].class_lank == @class_lank
    end
  end

  #--------------------------------------------------------------------------
  # ● コマンドリストの作成【オーバーライド】
  #    ライブラリモードではアクターを必要としない。
  #--------------------------------------------------------------------------
  unless method_defined?(:better_jcw_make_command_list)
    alias better_jcw_make_command_list make_command_list
  end

  def make_command_list
    return better_jcw_make_command_list unless library_mode? && BetterJobChange.enabled?

    return unless @class_type_id != -1

    class_id.each do |id|
      add_command($data_classes[id].name, :ok, class_show_enable?(id), id)
    end
  end

  #--------------------------------------------------------------------------
  # ● 項目の描画【オーバーライド】
  #    ライブラリモードではアクター色・マスターアイコンを省く。
  #--------------------------------------------------------------------------
  unless method_defined?(:better_jcw_draw_item)
    alias better_jcw_draw_item draw_item
  end

  def draw_item(index)
    if BetterJobChange.enabled?
      contents.font.size = 18

      if library_mode?
        change_color(normal_color, command_enabled?(index))
        rect = item_rect_for_text(index)
        rect.width -= 18
        draw_text_autosizing(rect, command_name(index), alignment)
      else
        better_jcw_draw_item(index)
      end
    else
      reset_font_settings
      better_jcw_draw_item(index)
    end

  end

  def select(index)
    super
    return unless @status
    @status.class_id = select_class_id

    if BetterJobChange.enabled?
      if Input.repeat?(:UP) || Input.repeat?(:DOWN) || Input.repeat?(:L) || Input.repeat?(:R)
        @status.defer_refresh
      else
        @status.quick_refresh
      end
    else
      @status.refresh
    end

  end

end

class Foo::JobChange::Window_ClassType
  def draw_item(index)
    if BetterJobChange.enabled?
      contents.font.size = 20
    else
      reset_font_settings
    end
    super

  end

end

class Scene_JobChange
  unless method_defined?(:better_focus_process_popup_actor_ok)
    alias better_focus_process_popup_actor_ok process_popup_actor_ok
  end

  def process_popup_actor_ok
    better_focus_process_popup_actor_ok
    return unless BetterJobChange.enabled?
    @class_name_window.deactivate
    @class_status_window.deactivate

  end

  unless method_defined?(:better_focus_create_class_type_window)
    alias better_focus_create_class_type_window create_class_type_window
  end

  def create_class_type_window
    better_focus_create_class_type_window
    return unless BetterJobChange.enabled?
    @class_type_window.set_handler(:ok, method(:process_class_type_focus_ok))
    @class_type_window.set_handler(:cancel, method(:process_class_cancel))

  end

  def process_class_type_focus_ok
    Sound.play_ok
    @class_type_window.deactivate
    @class_name_window.activate
    @class_status_window.activate
    @class_name_window.select(@class_name_window.index)
    @job_focus_locked = true

  end

  unless method_defined?(:better_focus_process_class_ok)
    alias better_focus_process_class_ok process_class_ok
  end

  def process_class_ok
    better_focus_process_class_ok
    @job_focus_locked = false

  end

  unless method_defined?(:better_focus_process_class_cancel)
    alias better_focus_process_class_cancel process_class_cancel
  end

  def process_class_cancel
    if BetterJobChange.enabled? && @job_focus_locked
      Sound.play_cancel
      @class_name_window.deactivate
      @class_status_window.deactivate
      @class_type_window.activate
      @job_focus_locked = false
    else
      Sound.play_cancel
      better_focus_process_class_cancel
    end

  end

  unless method_defined?(:better_page_show_key_text)
    alias better_page_show_key_text show_key_text
  end

  def show_key_text
    cs = @class_status_window

    if BetterJobChange.enabled? && cs && cs.max_page > 1 && cs.active
      ["#{Vocab.key_a}:Use EXP Items",
       ShowKey_Help.rb_rt_page,
       "\u2190/\u2192:Page #{cs.page}/#{cs.max_page}"]
    else
      better_page_show_key_text
    end

  end

end

class Scene_Status
  unless method_defined?(:better_status_create_now_class_window) || private_method_defined?(:better_status_create_now_class_window)
    alias better_status_create_now_class_window create_now_class_window
  end

  def create_now_class_window
    better_status_create_now_class_window

    if BetterJobChange.enabled? && @now_class_window
      Foo::JobChange::ShowChecker.check_class_show_enable
      @now_class_window.y = @simple_status_window.height
      @now_class_window.height = Graphics.height - @now_class_window.y
      @now_class_window.opacity = 0
      @class_vp = Viewport.new(@now_class_window.x, @now_class_window.y,
                               @now_class_window.width, @now_class_window.height)
      @class_vp.z = 300
      @now_class_window.viewport = @class_vp
      @now_class_window.x = 0
      @now_class_window.y = 0
    end

  end

  unless method_defined?(:better_status_orig_update) || private_method_defined?(:better_status_orig_update)
    alias better_status_orig_update update
  end

  def update
    if BetterJobChange.enabled?
      super

      if @main_status_window.active and @root_command_window.index == 0 and
         [1, 2].include?(@main_status_window.now_class_state)
        @now_class_window.show
      else
        @now_class_window.hide
      end

      if @now_class_window && @now_class_window.visible && !@now_class_window.active
        @now_class_window.activate
      end
    else
      better_status_orig_update
      if @main_status_window.active and @root_command_window.index == 0 and
         [1, 2].include?(@main_status_window.now_class_state)
        @viewport.rect.width = @now_class_window.x if @now_class_window
      end
    end

  end

  unless method_defined?(:better_status_orig_terminate) || private_method_defined?(:better_status_orig_terminate)
    alias better_status_orig_terminate terminate
  end

  def terminate
    @class_vp.dispose if @class_vp
    @hint_vp.dispose if @hint_vp
    better_status_orig_terminate

  end

  def create_show_key_sprite
    @hint_vp = Viewport.new
    @hint_vp.z = 400
    @show_key_sprite = Sprite_ShowKey.new(@root_command_window)
    @show_key_sprite.viewport = @hint_vp
    update_show_key_sprite

  end

  def update_show_key_sprite
    @show_key_sprite.set_text(show_key_text)

  end

  def show_key_text
    if @root_command_window.active
      [ShowKey_Help.lr_actor, ShowKey_Help.rb_rt_page]
    elsif @main_status_window.active && @root_command_window.index == 1
      [ShowKey_Help.equip_info, ShowKey_Help.lr_actor, ShowKey_Help.rb_rt_page]
    elsif @main_status_window.active
      result = [ShowKey_Help.lr_actor]
      idx = @root_command_window.index

      if BetterJobChange.enabled? && idx == 0 && [1, 2].include?(@main_status_window.now_class_state)
        cs = @now_class_window
        result += [ShowKey_Help.rb_rt_page, "\u2190/\u2192:Page #{cs.page}/#{cs.max_page}"]
      elsif [2, 3].include?(idx)
        result << ShowKey_Help.rb_rt_page
      end

      result
    else
      [ShowKey_Help.rb_rt_page]
    end

  end

end

#==============================================================================
# ■ Scene_JobShow — Library mode (actorless)
#------------------------------------------------------------------------------
# Library の "Job Info" / "Race Info" は Scene_JobShow を起動する。本来は
# 旧式の LibWindow_ClassStatus を表示するだけだったが、BetterJobChange の
# 4 ページ表示を「ライブラリモード」(actorless) で使うよう変更する。
# ライブラリモードでは:
#   * アクターを一切参照しない (actor = nil)
#   * 決定しても転職は行われない (no-op)
#   * レベル表示を行わない
#==============================================================================
class Scene_JobShow < Scene_JobChange
  #--------------------------------------------------------------------------
  # ● 全ウィンドウの作成【オーバーライド】
  #    基底は3ウィンドウ全てを activate するため、入力が重複する。
  #    ライブラリでは最初にタブ (class_type) だけをアクティブにし、
  #    クラス名・ステータスはタブ決定後にフォーカスを移す。
  #--------------------------------------------------------------------------
  unless method_defined?(:better_lib_mode_create_all_window)
    alias better_lib_mode_create_all_window create_all_window
  end

  def create_all_window
    better_lib_mode_create_all_window
    if BetterJobChange.enabled?
      @lib_focus_tab = true
      @class_name_window.deactivate
      @class_status_window.deactivate
      @class_type_window.activate
    end
  end

  #--------------------------------------------------------------------------
  # ● クラスステータスウィンドウの作成【オーバーライド】
  #    BetterJobChange の 4 ページウィンドウをライブラリモードで使う。
  #--------------------------------------------------------------------------
  def create_class_status_window
    if BetterJobChange.enabled?
      @class_status_window = Foo::JobChange::Window_ClassStatus.new
      @class_status_window.library_mode = true
    else
      @class_status_window = Foo::JobChange::LibWindow_ClassStatus.new
    end
  end

  #--------------------------------------------------------------------------
  # ● クラス選択ウィンドウの作成【オーバーライド】
  #    BetterJobChange のウィンドウをライブラリモードで使う。
  #--------------------------------------------------------------------------
  def create_class_name_window
    if BetterJobChange.enabled?
      @class_name_window = Foo::JobChange::Window_ClassName.new(@class_status_window)
      @class_name_window.library_mode = true
      @class_name_window.set_handler(:ok, method(:process_class_ok))
      @class_name_window.set_handler(:cancel, method(:process_class_cancel))
    else
      @class_name_window = Foo::JobChange::LibWindow_ClassName.new(@class_status_window)
      @class_name_window.set_handler(:cancel, method(:return_scene))
    end
  end

  #--------------------------------------------------------------------------
  # ● クラスタイプ選択ウィンドウの作成【オーバーライド】
  #    タブ決定でクラス名ウィンドウへフォーカスを移す。
  #--------------------------------------------------------------------------
  def create_class_type_window
    @class_type_window = Foo::JobChange::Window_ClassType.new(@class_name_window)
    if BetterJobChange.enabled?
      @class_type_window.set_handler(:ok, method(:process_class_type_lib_ok))
      @class_type_window.set_handler(:cancel, method(:process_class_cancel))
    end
  end

  #--------------------------------------------------------------------------
  # ● タブ決定処理 (ライブラリ)
  #--------------------------------------------------------------------------
  def process_class_type_lib_ok
    return unless BetterJobChange.enabled?
    Sound.play_ok
    @lib_focus_tab = false
    @class_type_window.deactivate
    @class_name_window.activate
    @class_status_window.activate
    @class_name_window.select(@class_name_window.index)
  end

  #--------------------------------------------------------------------------
  # ● クラス選択決定【オーバーライド】
  #    ライブラリモードでは転職を行わない。
  #--------------------------------------------------------------------------
  def process_class_ok
    Sound.play_ok
  end

  #--------------------------------------------------------------------------
  # ● クラス選択のキャンセル【オーバーライド】
  #    リスト表示中はタブへ戻り、タブ表示中はライブラリへ戻る。
  #--------------------------------------------------------------------------
  def process_class_cancel
    if BetterJobChange.enabled?
      if @lib_focus_tab
        return_scene
      else
        Sound.play_cancel
        @lib_focus_tab = true
        @class_name_window.deactivate
        @class_status_window.deactivate
        @class_type_window.activate
      end
    else
      return_scene
    end
  end
end
