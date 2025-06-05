#
#   Date     Version Author Comment
# ==17/02/01         トリス (common_text_to_data)データ量が大きいコモンへの対策
#
#

class RPG::BGM
  def inspect
    "RPG::BGM.new(\"#{@name}\", #{@volume}, #{@pitch})"
  end
end

class RPG::BGS
  def inspect
    "RPG::BGS.new(\"#{@name}\", #{@volume}, #{@pitch})"
  end
end

class RPG::SE
  def inspect
    "RPG::SE.new(\"#{@name}\", #{@volume}, #{@pitch})"
  end
end

class RPG::ME
  def inspect
    "RPG::ME.new(\"#{@name}\", #{@volume}, #{@pitch})"
  end
end

class RPG::MoveCommand
  def inspect
    "RPG::MoveCommand.new(#{@code}, #{@parameters})"
  end
end

class RPG::MoveRoute
  def initialize(repeat = true, skippable = false, wait = false, list = [RPG::MoveCommand.new])
    @repeat = repeat
    @skippable = skippable
    @wait = wait
    @list = list
  end

  def inspect
    "RPG::MoveRoute.new(#{@repeat}, #{@skippable}, #{@wait}, #{@list.inspect})"
  end
end

class Tone
  def inspect
    "Tone.new(#{red}, #{green}, #{blue}, #{gray})"
  end
end

class Color
  def inspect
    "Color.new(#{red}, #{green}, #{blue}, #{alpha})"
  end
end

class Game_Interpreter
  #--------------------------------------------------------------------------
  # ●
  #--------------------------------------------------------------------------
  def ind_txt(indent, text)
    text.insert(0, " " * (indent * 2))
  end

  #--------------------------------------------------------------------------
  # ●
  #--------------------------------------------------------------------------
  def texts_to_text(texts)
    text = ""
    texts.each { |t| text += t + "\r\n" }
    text.chomp
  end

  #--------------------------------------------------------------------------
  # ●
  #--------------------------------------------------------------------------
  def output_data_base(f, base)
    f.puts ind_txt(2, ":id => #{base.id},")
    f.puts ind_txt(2, ":name => \"#{base.name}\",")
    f.puts ind_txt(2, ":description => [")
    base.description.each_line do |line|
      f.puts ind_txt(3, "\"#{line.chomp}\",")
    end
    f.puts ind_txt(3, "\"\"") if base.description.empty?
    f.puts ind_txt(2, "],")
    f.puts ind_txt(2, ":features => [")
    base.basic_features.each do |ft|
      f.puts ind_txt(3, "{")
      f.puts ind_txt(4, ":code => #{ft.code},")
      f.puts ind_txt(4, ":data_id => #{ft.data_id},")
      f.puts ind_txt(4, ":value => #{ft.value},")
      f.puts ind_txt(3, "},")
    end
    f.puts ind_txt(2, "],")
    f.puts ind_txt(2, ":note => [")
    base.note.each_line do |line|
      f.puts ind_txt(3, "\"#{line.chomp}\",")
    end
    f.puts ind_txt(3, "\"\"") if base.note.empty?
    f.puts ind_txt(2, "],")
  end

  #--------------------------------------------------------------------------
  # ●
  #--------------------------------------------------------------------------
  def actor_data_to_text
    unless File.exist?("Convert/Data/Actors.rvdata2")
      p "Actors.rvdata2が存在しません"
      return
    end
    p "変換作業を開始します"
    data_actors = load_data("Convert/Data/Actors.rvdata2")
    data_actors.shift
    File.open("Convert/Text/Actors.rb", "w") do |f|
      f.puts ind_txt(0, "[")
      data_actors.each  do |data_actor|
        output_data_actor(f, data_actor)
      end
      f.puts ind_txt(0, "]")
    end
    p "変換作業が終了しました"
  end

  #--------------------------------------------------------------------------
  # ●
  #--------------------------------------------------------------------------
  def output_data_actor(f, actor)
    f.puts ind_txt(1, "{ # #{actor.name}")
    output_data_base(f, actor)
    f.puts ind_txt(2, ":nickname => \"#{actor.nickname}\",")
    f.puts ind_txt(2, ":class_id => #{actor.class_id},")
    f.puts ind_txt(2, ":initial_level => #{actor.initial_level},")
    f.puts ind_txt(2, ":max_level => #{actor.max_level},")
    f.puts ind_txt(2, ":character_name => \"#{actor.character_name}\",")
    f.puts ind_txt(2, ":character_index => #{actor.character_index},")
    f.puts ind_txt(2, ":face_name => \"#{actor.face_name}\",")
    f.puts ind_txt(2, ":face_index => #{actor.face_index},")
    f.puts ind_txt(1, "},")
  end

  #--------------------------------------------------------------------------
  # ●
  #--------------------------------------------------------------------------
  def actor_text_to_data
    unless File.exist?("Convert/Text/Actors.rb")
      p "Actors.rbが存在しません"
      return
    end
    p "変換作業を開始します"
    text_actors = eval(File.read("Convert/Text/Actors.rb"))
    data_actors = [nil]
    text_actors.each do |text_actor|
      data_actor = RPG::Actor.new
      data_actor.id = text_actor[:id]
      data_actor.name = text_actor[:name]
      data_actor.description = texts_to_text(text_actor[:description])
      text_actor[:features].each do |text_feature|
        ft = RPG::BaseItem::Feature.new
        ft.code = text_feature[:code]
        ft.data_id = text_feature[:data_id]
        ft.value = text_feature[:value]
        data_actor.basic_features.push(ft)
      end
      data_actor.note = texts_to_text(text_actor[:note])
      data_actor.nickname = text_actor[:nickname]
      data_actor.class_id = text_actor[:class_id]
      data_actor.initial_level = text_actor[:initial_level]
      data_actor.max_level = text_actor[:max_level]
      data_actor.character_name = text_actor[:character_name]
      data_actor.character_index = text_actor[:character_index]
      data_actor.face_name = text_actor[:face_name]
      data_actor.face_index = text_actor[:face_index]
      data_actors.push(data_actor)
    end
    save_data(data_actors, "Convert/Data/Actors.rvdata2")
    p "変換作業が終了しました"
  end

  #--------------------------------------------------------------------------
  # ●
  #--------------------------------------------------------------------------
  def common_data_to_text
    unless File.exist?("Convert/Data/CommonEvents.rvdata2")
      p "CommonEvents.rvdata2が存在しません"
      return
    end
    p "変換作業を開始します"
    data_commons_all = load_data("Convert/Data/CommonEvents.rvdata2")
    data_commons_all.shift
    i = 1
    data_commons_all.each_slice(250) do |data_commons|
      File.open(format("Convert/Text/CommonEvents%02d.rb", i), "w") do |f|
        f.puts ind_txt(0, "[")
        data_commons.each do |data_common|
          output_data_common(f, data_common)
        end
        f.puts ind_txt(0, "]")
      end
      i += 1
    end
    p "変換作業が終了しました"
  end

  #--------------------------------------------------------------------------
  # ●
  #--------------------------------------------------------------------------
  def output_data_common(f, common)
    f.puts ind_txt(1, "{")
    f.puts ind_txt(2, ":id => #{common.id}, :name => \"#{common.name}\",")
    f.puts ind_txt(2, ":trigger => #{common.trigger}, :switch_id => #{common.switch_id},")
    f.puts ind_txt(2, ":list => [")
    common.list.each  do |list|
      f.puts ind_txt(3, "{")
      f.puts ind_txt(4, ":code => #{list.code}, :indent => #{list.indent},")
      f.puts ind_txt(4, ":parameters => #{list.parameters.inspect},")
      f.puts ind_txt(3, "},")
    end
    f.puts ind_txt(2, "],")
    f.puts ind_txt(1, "},")
  end

  #--------------------------------------------------------------------------
  # ●
  #--------------------------------------------------------------------------
  def common_text_to_data
    if Dir.glob("Convert/Text/CommonEvents*.rb").empty?
      p "CommonEvents.rbが存在しません"
      return
    end
    p "変換作業を開始します"
    data_commons = [nil]
    dir_pass = "Convert/Text/"
    pat_common = /.*{\n(.*?)\n(.*?)\n.*?:list => \[\n.*({(?:\n.*?\n.*?\n.*?\n.*?)+?.*?\]),\n.*?}/
    pat_list = /.*\n.*:code\s*=>\s*(\d+).*:indent\s*=>\s*(\d+).*\n.*?:parameters\s*=>\s*(\[.*\])/
    Dir.entries(dir_pass).select do |file_name|
      file_name =~ /CommonEvents\d+.rb/
    end.each do |file_name|
      file_data = File.read(dir_pass + file_name)
      text_commons = file_data.scan(pat_common)
      text_commons.each do |text_common|
        id   = text_common[0] =~ /:id\s*=>\s*(\d+)/ ? ::Regexp.last_match(1).to_i : raise
        name = text_common[0] =~ /:name\s*=>\s*"(.*)"/ ? ::Regexp.last_match(1) : raise
        trigger   = text_common[1] =~ /:trigger\s*=>\s(\d+)/ ? ::Regexp.last_match(1).to_i : raise
        switch_id = text_common[1] =~ /:switch_id\s=>\s(\d+)/ ? ::Regexp.last_match(1).to_i : raise
        text_lists = text_common[2].scan(pat_list)
        data_common = RPG::CommonEvent.new
        data_common.id = id
        data_common.name = name
        data_common.trigger = trigger
        data_common.switch_id = switch_id
        data_common.list.clear
        text_lists.each do |text_list|
          code = text_list[0].to_i
          indent = text_list[1].to_i
          parameters = eval(text_list[2])
          cd = RPG::EventCommand.new
          cd.code = code
          cd.indent = indent
          cd.parameters = parameters
          data_common.list.push(cd)
        end
        data_commons.push(data_common)
      end
    end
    save_data(data_commons, "Convert/Data/CommonEvents.rvdata2")
    p "変換作業が終了しました"
  end

  def common_message_convert(ids, before, after)
    before.gsub!(/\n/, "")
    after.gsub!(/\n/, "")

    Array(ids).map { |id| $data_common_events[id] }.compact.each do |common|
      common.list.each do |event|
        next if event.code != 401

        event.parameters[0].gsub!(before) do |b|
          after
        end
      end
    end
    File.rename("Data/CommonEvents.rvdata2", "CommonEvents#{Time.now.strftime('%Y%m%d%H%M%S')}.rvdata2")
    save_data($data_common_events, "Data/CommonEvents.rvdata2")
  end
end
