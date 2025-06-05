# =仲間化システム
#
#
#
#
# ==更新履歴
#   Date     Version Author Comment
# ==15/09/03 2.0.2   トリス 統合J～U O
# ==16/03/21 2.0.3   トリス 特殊加入演出を編集　特殊加入演出のピクチャ関数を追加
# ==16/04/03 2.0.3   トリス 特殊加入演出を編集
# ==16/04/19 2.0.3   トリス 特殊加入演出を編集
# ==17/02/05 2.0.3   トリス 特殊加入演出を編集(ID変更)
# ==17/02/12 2.0.3   トリス 特殊加入演出を編集(座標調整)
# ==17/03/18 2.0.4   トリス 仲間化拒否スイッチを2つに
# ==17/04/16 2.0.5   トリス プログラム整理
#

#==============================================================================
# ■ NWConst::Follow
#==============================================================================
module NWConst::Follow
  SPECIAL = [78,  87,
             158, 168, 197, 200, 206, 208, 216, 230, 241,
             268, 321, 358, 515, 545, 753, 755, 900]
  NONE = [2005]
end

#==============================================================================
# ■ BattleManager
#==============================================================================
class << BattleManager
  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy78）
  #--------------------------------------------------------------------------
  def process_follow_enemy78
    pic_show(20, "80_zonbe_st21", 0, 210, 40, 100, 100, 0, 0)
    pic_show(19, "80_zonbe_st31", 0, 100,  0, 100, 100, 0, 0)
    pic_show(18, "80_zonbe_st41", 0, 300,  0, 100, 100, 0, 0)
    pic_show(17, "80_zonbe_st01", 0, 70, 0, 100, 100, 0, 0)
    pic_move(20, 0, 210, 40, 100, 100, 255, 0, 30)
    process_follow_question
    if process_follow_choice
      pic_move(20, 0, 240, 40, 100, 100, 255, 0, 30)
      pic_move(19, 0, 100,  0, 100, 100, 255, 0, 30)
      pic_move(18, 0, 300,  0, 100, 100, 255, 0, 30)
      pic_move(17, 0, 70, 0, 100, 100, 255, 0, 30)
      Word.new("The zombies have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Zombie Girl>Ohhhh...", "zonbe_fc3", 2).execute
      wait_for_message
      Word.new("\\n<Zombie Girl>Nice to...meet you...", "zonbe_fc3", 3).execute
      wait_for_message
      Word.new("\\n<Luka>Uh, hey...", "ruka_fc1", 0).execute
      wait_for_message
      process_follow_ok("Zombie Girls")
    else
      process_follow_no
      pic_move(20, 0, 210, 40, 100, 100, 0, 0, 30)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy87）
  #--------------------------------------------------------------------------
  def process_follow_enemy87
    pic_show(20, "50_fairys_st01", 0, 230, 120, 100, 100, 0, 0)
    pic_show(19, "50_fairys_st41", 0, 140, 120, 100, 100, 0, 0)
    pic_show(18, "50_fairys_st21", 0, 320, 140, 100, 100, 0, 0)
    pic_show(17, "50_fairys_st11", 0, 220,  20, 100, 100, 0, 0)
    pic_show(16, "50_fairys_st51", 0, 100,  20, 100, 100, 0, 0)
    pic_show(15, "50_fairys_st31", 0, 360,  20, 100, 100, 0, 0)
    pic_move(20, 0, 230, 120, 100, 100, 255, 0, 30)
    process_follow_question
    if process_follow_choice
      pic_move(20, 0, 230, 120, 100, 100, 255, 0, 30)
      pic_move(19, 0, 140, 120, 100, 100, 255, 0, 30)
      pic_move(18, 0, 320, 140, 100, 100, 255, 0, 30)
      pic_move(17, 0, 220,  20, 100, 100, 255, 0, 30)
      pic_move(16, 0, 100,  20, 100, 100, 255, 0, 30)
      pic_move(15, 0, 360,  20, 100, 100, 255, 0, 30)
      Word.new("The fairies have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Fairy>This person is going to take us outside...?", "fairys_fc2", 0).execute
      wait_for_message
      Word.new("\\n<Fairy>Yaaay, nice to meet you!", "fairys_fc3", 0).execute
      wait_for_message
      Word.new("\\n<Luka>J-just a minute...!\nThere's that many of you...?!", "ruka_fc1", 0).execute
      wait_for_message
      process_follow_ok("Fairies")
    else
      process_follow_no
      pic_move(20, 0, 230, 120, 100, 100, 0, 0, 30)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy158）
  #--------------------------------------------------------------------------
  def process_follow_enemy158
    pic_show(20, "80_ittanmomen_st01", 0, 0, 0, 100, 100, 0, 0)
    pic_show(19, "80_ittanmomen_st11", 0, 0, 0, 100, 100, 0, 0)
    pic_show(18, "80_ittanmomen_st21", 0, 0, 0, 100, 100, 0, 0)
    pic_move(20, 0, 0, 0, 100, 100, 255, 0, 30)
    process_follow_question
    if process_follow_choice
      pic_move(19, 0, 0, 0, 100, 100, 255, 0, 30)
      pic_move(18, 0, 0, 0, 100, 100, 255, 0, 30)
      Word.new("The Ittan-Momen have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Ittan-Momen>Let me come with you too.", "ittanmomen_fc2", 0).execute
      wait_for_message
      Word.new("\\n<Ittan-Momen>Nice to meet you!", "ittanmomen_fc3", 0).execute
      wait_for_message
      process_follow_ok("Ittan-Momen")
    else
      process_follow_no
      pic_move(20, 0, 0, 0, 100, 100, 0, 0, 30)
      pic_move(19, 0, 0, 0, 100, 100, 0, 0, 30)
      pic_move(18, 0, 0, 0, 100, 100, 0, 0, 30)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy168）
  #--------------------------------------------------------------------------
  def process_follow_enemy168
    pic_easy_setup(20, "50_kaeru_st01", 200, 60)
    pic_easy_setup(19, "50_kaeru_st11", 50, 10)
    pic_easy_setup(18, "50_kaeru_st21", 300, 70)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      pic_easy_appear(18)
      Word.new("The Frog Girls have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Frog Girl>Then I'll come along too.", "kaeru_fc2", 0).execute
      wait_for_message
      Word.new("\\n<Frog Girl>............", "kaeru_fc3", 0).execute  
      wait_for_message
      process_follow_ok("Frog Girls")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      pic_easy_erase(18)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy197）
  #--------------------------------------------------------------------------
  def process_follow_enemy197
    pic_easy_setup(20, "50_m_batterfly_st01", 160, 110)
    pic_easy_setup(19, "50_m_dragonfly_st01",   0, 70)
    pic_easy_setup(18, "50_m_tento_st01", 400, 70)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      pic_easy_appear(18)
      Word.new("The freshman students have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Magical Dragonfly>I might be a burden to you, but...\nPlease treat me well.", "m_dragonfly_fc1", 0).execute
      wait_for_message
      Word.new("\\n<Magical Ladybug>Let's play a lot♪", "m_tento_fc1", 0).execute  
      wait_for_message
      process_follow_ok("Bugstaves")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      pic_easy_erase(18)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy200）
  #--------------------------------------------------------------------------
  def process_follow_enemy200
    pic_easy_setup(20, "50_m_fairy_st01",    220,  60)
    pic_easy_setup(19, "50_m_elf_st01",      100,  60)
    pic_easy_setup(18, "50_m_succubus_st01", 350,  60)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      pic_easy_appear(18)
      Word.new("The senior students have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Magical Elf>It can't be helped, I'll take care of you.", "m_elf_fc1", 0).execute
      wait_for_message
      Word.new("\\n<Magical Succubus>Ufufu...let's have some fun♪","m_succubus_fc1", 0).execute
      wait_for_message
      process_follow_ok("Magi Staens")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      pic_easy_erase(18)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy206）
  #--------------------------------------------------------------------------
  def process_follow_enemy206
    pic_easy_setup(20, "50_a_alm_st01", 220, 60)
    pic_easy_setup(19, "50_a_looty_st01", 90, 60)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      Word.new("Alra Rooty also rises back up!", "", 0).execute
      wait_for_message
      Word.new("\\n<Alra Rooty>Don't leave me behind, Arum!\nWe're coming together!", "a_looty_fc1", 0).execute
      wait_for_message
      process_follow_ok("Plantwin")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy208）
  #--------------------------------------------------------------------------
  def process_follow_enemy208
    pic_easy_setup(20, "50_a_vore_st01",    220, 100)
    pic_easy_setup(19, "50_a_parasol_st01", 120,  60)
    pic_easy_setup(18, "50_a_prison_st01",  390,  70)
    pic_easy_setup(17, "50_a_mash_st01", 20, 80)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      pic_easy_appear(18)
      pic_easy_appear(17)
      Word.new("The alraune subspecies have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Alra Parasol>In that case, let me accompany you as well.", "a_parasol_fc1", 0).execute
      wait_for_message
      Word.new("\\n<Alra Prison>Will there be anything tasty?", "a_prison_fc1", 0).execute
      wait_for_message
      Word.new("\\n<Alra Shroom>...Do you eat mushrooms?", "a_mash_fc1", 0).execute
      wait_for_message
      process_follow_ok("Alplants")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      pic_easy_erase(18)
      pic_easy_erase(17)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy216）
  #--------------------------------------------------------------------------
  def process_follow_enemy216
    pic_easy_setup(20, "50_moss_st01", 220, 60)
    pic_easy_setup(19, "50_mosquito_st01", 60, 60)
    pic_easy_setup(18, "50_imomusi_st01", 370, 110)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      pic_easy_appear(18)
      Word.new("The insect girls have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Mosquito Girl>Take care of me while you're at it.", "mosquito_fc1", 0).execute
      wait_for_message
      Word.new("\\n<Caterpillar Girl>I'm a caterpillar, but it's nice to meet you!", "imomusi_fc1", 0).execute
      wait_for_message
      process_follow_ok("Insects")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      pic_easy_erase(18)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy230）
  #--------------------------------------------------------------------------
  def process_follow_enemy230
    pic_show(20, "50_slime_purple_st01", 0, 170,  90, 100, 100, 0, 0)
    pic_show(19, "50_slime_blue_st01",   0, 310,  90, 100, 100, 0, 0)
    pic_show(18, "50_slime_red_st01",    0, 40,  90, 100, 100, 0, 0)
    pic_show(17, "50_slime_green_st01",  0, 450, 110, 100, 100, 0, 0)
    pic_move(20, 0, 170, 90, 100, 100, 255, 0, 30)
    process_follow_question
    if process_follow_choice
      pic_move(19, 0, 310, 90, 100, 100, 255, 0, 30)
      pic_move(18, 0, 40,  90, 100, 100, 255, 0, 30)
      pic_move(17, 0, 450, 110, 100, 100, 255, 0, 30)
      Word.new("The slimes have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Green Slime>I'll help! ♪", "slime_green_fc1", 0).execute
      wait_for_message
      Word.new("\\n<Red Slime>We'll give you our support!", "slime_red_fc1", 0).execute
      wait_for_message
      Word.new("\\n<Blue Slime>I'll aid you...", "slime_blue_fc1", 0).execute
      wait_for_message
      process_follow_ok("Slimies")
    else
      process_follow_no
      pic_move(20, 0, 170,  90, 100, 100, 0, 0, 30)
      pic_move(19, 0, 310,  90, 100, 100, 0, 0, 30)
      pic_move(18, 0, 40,  90, 100, 100, 0, 0, 30)
      pic_move(17, 0, 450, 110, 100, 100, 0, 0, 30)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy241）
  #--------------------------------------------------------------------------
  def process_follow_enemy241
    pic_show(20, "50_gool_st01", 0, 240,  90, 100, 100, 0, 0)
    pic_show(19, "50_gool_st21", 0, 370,  90, 100, 100, 0, 0)
    pic_show(18, "50_gool_st11", 0, 100, 110, 100, 100, 0, 0)
    pic_move(20, 0, 240, 90, 100, 100, 255, 0, 30)
    process_follow_question
    if process_follow_choice
      pic_move(19, 0, 370, 90, 100, 100, 255, 0, 30)
      pic_move(18, 0, 100, 110, 100, 100, 255, 0, 30)
      Word.new("The ghouls have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Ghoul>Oooh...", "gool_fc1", 1).execute
      wait_for_message
      Word.new("\\n<Ghoul>Aah, uuu...", "gool_fc1", 2).execute
      wait_for_message
      process_follow_ok("Ghouls")
    else
      process_follow_no
      pic_move(20, 0, 240,  90, 100, 100, 0, 0, 30)
      pic_move(19, 0, 370,  90, 100, 100, 0, 0, 30)
      pic_move(18, 0, 100, 110, 100, 100, 0, 0, 30)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy268）
  #--------------------------------------------------------------------------
  def process_follow_enemy268
    pic_show(20, "80_succubuses_st01", 0, 0, 0, 100, 100, 0, 0)
    pic_show(19, "80_succubuses_st11", 0, 0, 0, 100, 100, 0, 0)
    pic_show(18, "80_succubuses_st21", 0, 0, 0, 100, 100, 0, 0)
    pic_show(17, "80_succubuses_st31", 0, 0, 0, 100, 100, 0, 0)
    pic_move(20, 0, 0, 0, 100, 100, 255, 0, 30)
    process_follow_question
    if process_follow_choice
      pic_move(19, 0, 0, 0, 100, 100, 255, 0, 30)
      pic_move(18, 0, 0, 0, 100, 100, 255, 0, 30)
      pic_move(17, 0, 0, 0, 100, 100, 255, 0, 30)
      Word.new("The succubi have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Succubus>Ehe, nice to meet you♪", "succubuses_fc3", 0).execute
      wait_for_message
      Word.new("\\n<Succubus>Ufufu, we'll have some fun...", "succubuses_fc4", 0).execute
      wait_for_message
      Word.new("\\n<Succubus>Tonight, without delay...right? ♪", "succubuses_fc5", 0).execute
      wait_for_message
      process_follow_ok("Succubus Harem")
    else
      process_follow_no
      pic_move(20, 0, 0, 0, 100, 100, 0, 0, 30)
      pic_move(19, 0, 0, 0, 100, 100, 0, 0, 30)
      pic_move(18, 0, 0, 0, 100, 100, 0, 0, 30)
      pic_move(17, 0, 0, 0, 100, 100, 0, 0, 30)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy321）
  #--------------------------------------------------------------------------
  def process_follow_enemy321
    pic_easy_setup(20, "50_arachnes_st01", 220, 70)
    pic_easy_setup(19, "50_arachnes_st11", 70,  0)
    pic_easy_setup(18, "50_arachnes_st21", 390, 0)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      pic_easy_appear(18)
      Word.new("The arachnes have gathered together!", "", 0).execute
      wait_for_message
      Word.new("\\n<Arachne>Nice to meet you! ♪", "arachnes_fc3", 0).execute
      wait_for_message
      Word.new("\\n<Arachne>Please treat us well! ♪", "arachnes_fc4", 0).execute
      wait_for_message
      process_follow_ok("Arachnes")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      pic_easy_erase(18)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy358）
  #--------------------------------------------------------------------------
  def process_follow_enemy358
    pic_show(20, "50_trinity_st01", 0, 180, 70, 100, 100, 0, 0)
    pic_show(19, "50_trinity_st11", 0, 120, 70, 100, 100, 0, 0)
    pic_show(18, "50_trinity_st21", 0, 350, 70, 100, 100, 0, 0)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      pic_easy_appear(18)
      Word.new("The other Trinities also rise back up!", "", 0).execute
      wait_for_message
      Word.new("\\n<Trinity>Please tell us whenever you want to taste pleasure.", "trinity_fc2", 0).execute
      wait_for_message
      Word.new("\\n<Trinity>Our powers and bodies together are yours...", "trinity_fc3", 0).execute
      wait_for_message
      process_follow_ok("Trinity")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      pic_easy_erase(18)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy515）
  #--------------------------------------------------------------------------
  def process_follow_enemy515
    pic_easy_setup(20, "80_kunoitielf2_st01",  0,  0)
    pic_easy_setup(19, "80_kunoitielf2_st11",  0,  0)
    pic_easy_setup(18, "80_kunoitielf2_st21",  0,  0)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      pic_easy_appear(18)
      Word.new("The other Kunoichi Elves also rise back up!", "", 0).execute
      wait_for_message
      process_follow_ok("Kunoichi Elves")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      pic_easy_erase(18)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy545）
  #--------------------------------------------------------------------------
  def process_follow_enemy545
    pic_easy_setup(20, "50_amoldoll_st01", 210, 60)
    pic_easy_setup(19, "50_amoldoll_st11", 90, 60)
    pic_easy_setup(18, "50_amoldoll_st21", 450, 60)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      pic_easy_appear(18)
      Word.new("アモルラームとアモルリームも起き上がった！", "", 0).execute
      wait_for_message
      process_follow_ok("Amor Doll")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      pic_easy_erase(18)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy753）
  #--------------------------------------------------------------------------
  def process_follow_enemy753
    pic_easy_setup(20, "50_hargenbeck_st21",   170, 60)
    pic_easy_setup(19, "50_hargenbeck_st01",   -30, -20)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      Word.new("Beck the Beast also rises back up!", "", 0).execute
      wait_for_message
      process_follow_ok("Hargenbeck")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy755）
  #--------------------------------------------------------------------------
  def process_follow_enemy755
    pic_easy_setup(20, "50_santamaria_st11",   220, 60)
    pic_easy_setup(19, "50_santamaria_st01",   -60, 0)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      Word.new("Saint Maiden also rises back up!", "", 0).execute
      wait_for_message
      process_follow_ok("Santa Maria")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      process_follow_bye
    end
    pic_clear
  end

  #--------------------------------------------------------------------------
  # ● 仲間加入時演出（enemy900）
  #--------------------------------------------------------------------------
  def process_follow_enemy835
    pic_easy_setup(20, "50_carthangels_st01", 210, 30)
    pic_easy_setup(19, "50_carthangels_st02", 60, 120)
    pic_easy_setup(18, "50_carthangels_st03", 410, 60)
    pic_easy_appear(20)
    process_follow_question
    if process_follow_choice
      pic_easy_appear(19)
      pic_easy_appear(18)
      Word.new("The other Curse Angels also rise back up!", "", 0).execute
      wait_for_message
      process_follow_ok("Curse Angels")
    else
      process_follow_no
      pic_easy_erase(20)
      pic_easy_erase(19)
      pic_easy_erase(18)
      process_follow_bye
    end
    pic_clear
  end
end

#==============================================================================
# ■ Game_Picture
#==============================================================================
class Game_Picture
  #--------------------------------------------------------------------------
  # ● 簡易作成　ピクチャの表示
  #--------------------------------------------------------------------------
  def easy_setup(name, x, y)
    show(name, 0, x, y, 100, 100, 0, 0)
  end

  #--------------------------------------------------------------------------
  # ● 簡易移動出現　ピクチャの移動
  #--------------------------------------------------------------------------
  def easy_appear_move(x, y)
    move(@origin, x, y, @zoom_x, @zoom_y, 255, @blend_type, 30)
  end

  #--------------------------------------------------------------------------
  # ● 簡易出現　ピクチャの移動
  #--------------------------------------------------------------------------
  def easy_appear
    easy_appear_move(@x, @y)
  end

  #--------------------------------------------------------------------------
  # ● 簡易消去　ピクチャの移動
  #--------------------------------------------------------------------------
  def easy_erase
    move(@origin, @x, @y, @zoom_x, @zoom_y, 0, @blend_type, 30)
  end
end

#==============================================================================
# ■ RPG::Enemy
#==============================================================================
class RPG::Enemy < RPG::BaseItem
  #--------------------------------------------------------------------------
  # ● 仲間化可能？
  #--------------------------------------------------------------------------
  def follower?
    return false if ex_dungeon_enemy?
    return false if NWConst::Follow::NONE.include?(id)

    NWConst::Follower::SETTINGS.key?(base_enemy.id)
  end

  #--------------------------------------------------------------------------
  # ● 仲間化用データの取得
  #--------------------------------------------------------------------------
  def follower_data
    NWConst::Follower::SETTINGS[base_enemy.id]
  end

  #--------------------------------------------------------------------------
  # ● 仲間になるアクターIDの取得
  #--------------------------------------------------------------------------
  def follower_actor_id
    follower_data[:actor_id]
  end

  #--------------------------------------------------------------------------
  # ● 仲間化する確率分母取得
  #--------------------------------------------------------------------------
  def follower_denominator
    follower_data[:denominator]
  end
end

#==============================================================================
# ■ Game_Enemy
#==============================================================================
class Game_Enemy < Game_Battler
  #--------------------------------------------------------------------------
  # ○ コラプス効果の実行
  #--------------------------------------------------------------------------
  alias nw_follower_perform_collapse_effect perform_collapse_effect
  def perform_collapse_effect
    nw_follower_perform_collapse_effect
    $game_troop.dead_enemies.push(self)
  end

  #--------------------------------------------------------------------------
  # ● 仲間化可能？
  #--------------------------------------------------------------------------
  def follower?
    enemy.follower?
  end

  #--------------------------------------------------------------------------
  # ● 仲間化用データの取得
  #--------------------------------------------------------------------------
  def follower_data
    enemy.follower_data
  end

  #--------------------------------------------------------------------------
  # ● 仲間になるアクターIDの取得
  #--------------------------------------------------------------------------
  def follower_actor_id
    enemy.follower_actor_id
  end

  #--------------------------------------------------------------------------
  # ● 仲間化する確率分母取得
  #--------------------------------------------------------------------------
  def follower_denominator
    enemy.follower_denominator
  end

  #--------------------------------------------------------------------------
  # ● 仲間化時の質問セリフ取得
  #--------------------------------------------------------------------------
  def follow_question_word
    data = enemy.follower_data[:question]
    Word.new(data[0], data[1], data[2])
  end

  #--------------------------------------------------------------------------
  # ● 仲間化時の承諾セリフ取得
  #--------------------------------------------------------------------------
  def follow_yes_word
    data = enemy.follower_data[:yes]
    Word.new(data[0], data[1], data[2])
  end

  #--------------------------------------------------------------------------
  # ● 仲間化時の拒否セリフ取得
  #--------------------------------------------------------------------------
  def follow_no_word
    data = enemy.follower_data[:no]
    Word.new(data[0], data[1], data[2])
  end

  #--------------------------------------------------------------------------
  # ● 友好度の設定
  #--------------------------------------------------------------------------
  def friend=(value)
    enemy.friend = value
  end

  #--------------------------------------------------------------------------
  # ● 友好度の取得
  #--------------------------------------------------------------------------
  def friend
    enemy.friend
  end

  #--------------------------------------------------------------------------
  # ● 仲間化処理の時に特殊演出が発生する？
  #--------------------------------------------------------------------------
  def follow_special?
    NWConst::Follow::SPECIAL.include?(id)
  end
end

#==============================================================================
# ■ Game_Troop
#==============================================================================
class Game_Troop < Game_Unit
  #--------------------------------------------------------------------------
  # ● 公開インスタンス変数
  #--------------------------------------------------------------------------
  attr_accessor   :follower_enemy
  attr_accessor   :dead_enemies
  #--------------------------------------------------------------------------
  # ● クリア
  #--------------------------------------------------------------------------
  alias nw_follower_clear clear
  def clear
    nw_follower_clear
    @follower_enemy = nil
    @dead_enemies = []
  end

  #--------------------------------------------------------------------------
  # ● 仲間化の抽選
  #--------------------------------------------------------------------------
  def check_getup
    e = @dead_enemies.reverse.uniq.select { |e| $game_party.followable?(e) }.first
    return unless e

    base   = 1.0 / e.follower_denominator
    second = base * $game_party.collect_rate
    last   = second * (e.friend / 100.0)
    # テスト用途中経過表示
    if $TEST
      print "ID#{e.id} #{e.name}\n"
      print "基礎確率:#{Integer(base * 100.0)}%\n"
      print "仲間加入倍率:*#{$game_party.collect_rate}\n"
      print "友好度補正倍率:*#{e.friend / 100.0}\n"
      print "最終確率:#{Integer(last * 100)}%\n"
    end
    @follower_enemy = e if rand < last
  end
end

#==============================================================================
# ■ Sprite_Follower
#==============================================================================
class Sprite_Follower < Sprite_Base
  #--------------------------------------------------------------------------
  # ● 解放
  #--------------------------------------------------------------------------
  def dispose
    bitmap.dispose if bitmap
    super
  end

  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    refresh if $game_troop.follower_enemy != @enemy
    update_opacity
  end

  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    @enemy = $game_troop.follower_enemy
    return unless @enemy && !@enemy.follow_special?
    enemy_data = @enemy.enemy.base_enemy
    self.bitmap = Cache.battler(enemy_data.battler_name, enemy_data.battler_hue)
    self.ox = bitmap.width / 2
    self.oy = bitmap.height
    self.x = Graphics.width / 2
    self.y = @enemy.screen_y
    self.z = @enemy.screen_z
    self.opacity = 0
  end

  #--------------------------------------------------------------------------
  # ● 不透明度の更新
  #--------------------------------------------------------------------------
  def update_opacity
    self.opacity += @enemy ? 10 : -10
  end
end
