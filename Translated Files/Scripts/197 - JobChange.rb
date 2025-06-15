# -*- encoding: utf-8 -*-
=begin
=転職_職業データ設定セクション by Foo

転職画面で扱う職業データを設定するセクションです

==更新履歴
Date     Version Author Comment
13/08/05 1.1.0   Foo    表示行数設定の変更
13/08/05 1.0.0   Foo    試作

=end

#==============================================================================
# ■ NWConst::JobChange
#==============================================================================
module NWConst::JobChange
  JOB_DESC_TEXT = {
    1 => # 戦士 / Warrior
      [[
        "An ordinary fighter and the first step for all warrior-type jobs. Better than average attack and defense, but poor with and against magic. Capable of using basic weapons like swords and spears, but not knight swords or heavy weapons. Learns mostly basic sword skills.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Rapier,Spear,Axe,Club,Scythe,Flail,Armor",
        "   Helmet,Shield",
        "Skills: Dagger,Sword,Rapier",
        "Passive: None",
        "",
      ]],
    2 => # 剣士 / Swordsman
      [[
        "An accomplished master of the blade. Newfound strength grants usage of the mighty knight sword, a wide range of sword skills, and enhanced attack and defense. Unfortunately, magic is still out of the question.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Rapier,Spear,Axe,Scythe,Armor",
        "   Heavy Armor,Helmet,Heavy Helmet,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Rapier",
        "Passive: None",
        "",
      ]],
    3 => # 剣聖 / Swordmaster
      [[
        "The highest class of a swordsman who is proficient at using Katanas as well as swords. This class is the object of admiration for all aspiring sword users. This class allows for the acquisition of unrivaled sword skills that target multiple targets. Katana skills can also be used; it is truly the pinnacle of Sword mastery.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Rapier,Katana,Spear,Axe,Scythe",
        "   Armor,Heavy Armor,Helmet,Heavy Helmet,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Katana",
        "Passive: Sword Mastery,Katana Mastery",
        "",
      ]],
    4 => # 魔剣士 / Monster Swordsman
      [[
        "A skillful swordsman who is proficient with Dark swordplay, wielding powerful skills that deal great damage at the cost of the user's vitality. Has the ability to wield Magic Swords and specializes in Rapier and Spellblade skills. Those who master the power of darkness can truly be called legendary warriors.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Great Sword,Rapier,Spear,Axe",
        "   Scythe,Armor,Heavy Armor,Helmet,Heavy Helmet,Shield",
        "   Heavy Shield",
        "Skills: Dagger,Sword,Rapier,Spellblade",
        "Passive: Dark Strike,Sword Mastery",
        "",
      ]],
    5 => # 聖堂騎士 / Temple Knight
      [[
        "A holy soldier bearing a Priest's piety and a Warrior's bravery. Wields SP-fueled healing magic and adept with heavy spears. Learns abilities that aid in banishing the undead to the grave.",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Spear,Heavy Spear,Armor,Heavy Armor,Helmet",
        "   Heavy Helmet,Shield,Heavy Shield",
        "Skills: Rapier,Spear,White Magic,Holy",
        "Passive: None",
        "",
      ]],
    6 => # ホーリーナイト / Holy Knight
      [[
        "The highest ranking position for holy warriors who have mastered many sacred mysteries. The Spear of the Church that destroys evil and heals the wounded. A Holy Knight's training teaches many powerful holy and spear skills. With their powerful recovery skill, a holy knight can heal all their allies at once.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Spear,Heavy Spear,Armor,Heavy Armor",
        "   Helmet,Heavy Helmet,Shield,Heavy Shield",
        "Skills: Rapier,Spear,White Magic,Holy",
        "Passive: Rapier Mastery,Spear Mastery",
        "",
      ]],
    7 => # 魔法戦士 / Spellsword
      [[
        "Specialized fighter trained in swordplay and magic, the Spellsword style is born. A Warrior's strength is retained and black magic can be used. The sword itself can be enchanted with various attributes to inflict elemental damage and status ailments.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Rapier,Armor,Helmet,Shield",
        "Skills: Dagger,Sword,Black Magic,Spellblade",
        "Passive: None",
        "",
      ]],
    8 => # マスターソーサラー / Master Swordcerer
      [[
        "The ultimate Spellsword who takes swordsmanship and magical might to the highest level, possessing the power to destroy any enemy before them. The Master Swordcerer possesses a wide variety of skills including Black Magic, a talent for wielding Magic Swords, and the ability to strike entire groups of foes at once.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Rapier,Magic Sword,Armor,Helmet,Shield",
        "Skills: Dagger,Sword,Black Magic,Spellblade",
        "Passive: Sword Mastery",
        "",
      ]],
    9 => # 竜騎士 / Dragoon
      [[
        "Spear-wielding aerodynamic knight who leaps to the skies and toys with foes. Spear skills consist of harpy slaying attacks and blinding speed. Magic stats on the other hand aren't very respectable.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Rapier,Spear,Heavy Spear,Armor,Heavy Armor,Helmet",
        "   Heavy Helmet,Shield,Heavy Shield",
        "Skills: Rapier,Spear",
        "Passive: Eva +10%",
        "",
      ]],
    10 => # ホーリーランサー / Holy Lancer
      [[
        "Lancers who shine with Heaven's light as they hunt the wicked, slaying enemies with exceptional power and speed. The Holy Lancer wields an extremely powerful skill that consumes both MP and SP. Among all, the holy lancer is the bane of demon-class monsters.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Rapier,Spear,Heavy Spear,Armor,Heavy Armor,Helmet",
        "   Heavy Helmet,Shield,Heavy Shield",
        "Skills: Rapier,Spear",
        "Passive: Eva +10%,Rapier Mastery,Spear Mastery",
        "",
      ]],
    11 => # 邪竜騎士 / Dark Dragoon
      [[
        "A Dragoon who mastered the Spear Arts and uses the power of Darkness. Pouring all of their power into their attacks, the Dark Dragoon wields powerful spear and dark skills. The Darkness inherent in their spears makes them a fatal threat for opponents with no Darkness resistance. The more life force they offer, the more destructive power Dark Dragoons wield.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Rapier,Spear,Heavy Spear,Armor,Heavy Armor,Helmet",
        "   Heavy Helmet,Shield,Heavy Shield",
        "Skills: Rapier,Spear",
        "Passive: Eva +10%,Rapier Mastery,Spear Mastery",
        "",
      ]],
    12 => # 侍 / Samurai
      [[
        "An honorable swordsman who hails from the East and wields a unique sword: the Katana. A Samurai boasts unparalleled power, wielding an impressive display of Katana skills. Despite their low defense, the Samurai excel in attack power. Armed with powerful Katana skills, a Samurai is even capable of striking all enemies at once.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Katana",
        "Skills: Katana",
        "Passive: Crit +20%,Eva +15%",
        "",
      ]],
    13 => # 聖侍 /Samurai Saint
      [[
        "A Samurai who walks a pure path, slaying darkness with holy powers. Wielding a Katana blessed with Holy energy, the Samurai Saint mercilessly destroys evil spirits For the price of MP and SP, the Samurai Saint can unleash a powerful Holy Katana skill. Besides powerful sword and katana skills, it is possible to master the ability \"Serene Mind\".",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Katana",
        "Skills: Katana",
        "Passive: Crit +30%,Eva +15%,Katana Mastery",
        "",
      ]],
    14 => # 魔侍 / Dark Samurai
      [[
        "A Samurai who defied the law of the gods and walks the path of darkness. The Dark Samurai wields Katana skills that can stop an enemy's breath, killing them instantly. However, the use of this skill comes at a cost of the user's life force. Through this job, one can learn the most powerful sword skills, making them a master of the battlefield.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Katana",
        "Skills: Katana",
        "Passive: Crit +30%,Eva +15%,Katana Mastery",
        "",
      ]],
    15 => # パワーファイター / Power Fighter
      [[
        "A crude fighter who thoroughly smashes foes with hidden power. Forgoes the blade in favor of blunt weapons like clubs and flails. Like most warriors, attack is great while magic stays low.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Great Sword,Axe,Club,Flail,Armor,Heavy Armor,Helmet",
        "   Heavy Helmet,Shield,Heavy Shield",
        "Skills: Axe,Club,Flail",
        "Passive: Crit +10%,Endure",
        "",
      ]],
    16 => # ギガファイター / Giga Fighter
      [[
        "The ultimate power fighter that destroys everyone and everything with overwhelming power. Able to put tremendous power into their weapon, crushing even the most heavily armored enemies. Despite their lack of magic, Gigafighters have superior attack and defensive power. Master the mysteries of the Axe, Club, and Flail, and you will be a force to be reckoned with.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Great Sword,Axe,Club,Flail,Armor,Heavy Armor,Helmet",
        "   Heavy Helmet,Shield,Heavy Shield",
        "Skills: Axe,Club,Flail",
        "Passive: Crit +20%,Super Endure,Power Mastery",
      ]],
    17 => # 狂戦士 / Savage Warrior
      [[
        "Rabid feral warrior fighting on pure instinct, tearing foes with extreme strength at the expense of sanity. In exchange, the SP regeneration rate is doubled and new Axe skills can be learned.",
        "",
        "",
        "",
      ],
      [
        "Equip: Great Sword,Axe,Club,Flail,Armor,Helmet,Shield",
        "Skills: Axe,Club,Flail",
        "Passive: Crit +15%,Double SP Charge,SP Regen +30%,Berserk",
        "",
      ]],
    18 => # ベルセルク / Berserker
      [[
        "Warriors who have abandoned all logic and reason to obtain ultimate physical power. Despite the unparalleled ability to annihilate any foe, Berserkers are unable to be commanded. With an accelerated SP recovery, a variety of powerful skills can be executed in rapid succession. Along with the ability \"Triple SP Charge\", a Berserker learns many powerful Axe Skills.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Great Sword,Axe,Club,Flail,Armor,Helmet,Shield",
        "Skills: Axe,Club,Flail",
        "Passive: Crit +30%,Triple SP Charge,SP Regen +30%",
        "   Power Mastery,Rampage",
      ]],
    19 => # 陰陽剣士 / Tao Swordsman
      [[
        "Unique fencer with Tao-infused blades homes in on enemy weaknesses. A tactical job mixing offense and defense, it has access to both Sword and Taoism skills and learns element boosting abilities.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Scythe,Rod,Fan,Armor,Helmet,Shield",
        "Skills: Dagger,Sword,Taoism",
        "Passive: Mag Eva +10%,Mag Counter +25%",
        "",
      ]],
    20 => # 九字剣神 / Kuji-In Sword God
      [[
        "A magic swordsman that expertly combines the powers of Taoism and swordplay. These warriors can completely annihilate their enemies by summoning spirits with their blade. The Kuji-In Sword God can imbue their sword with the natural elements, making all of their attacks extremely powerful. With the ability to enhance their elements, Kuji-In Sword Gods possess tremendous power.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Magic Sword,Katana,Scythe,Rod,Fan",
        "   Armor,Helmet,Shield",
        "Skills: Dagger,Sword,Taoism",
        "Passive: Mag Eva +10%,Mag Counter +50%,Sword Mastery",
        "",
      ]],

    22 => # 武道家 / Martial Artist
      [[
        "A fighter who makes use of their own body through punches and kicks. Especially adept at critical hits, counters, and using high agility to dodge attacks. Learns various unarmed skills, instant KO skills, and body-strengthening skills.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fist,Club,Gi",
        "Skills: Unarmed",
        "Passive: Crit +15%,Counter +25%,Eva +20%",
        "",
      ]],
    23 => # 拳豪 / Overpowering Fist
      [[
        "Remarkable martial artist rewarded with a buffed counter rate, evasion, and critical hits after intense training. Techniques worthy of a Black Belt and even healing arts through sheer force of will become available.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fist,Club,Gi",
        "Skills: Unarmed",
        "Passive: Crit/Eva +20%,Counter +50%",
        "",
      ]],
    24 => # 拳聖 / Saint Fist
      [[
        "A Martial Artist who is pure of heart and possesses a clear mind. Warriors of this rank possess extraordinary fighting focus, allowing them to counter almost every attack. The Saint Fist demonstrates overwhelming power against evil monsters with their Holy and Fist skills. Martial Artists of this rank are extremely powerful and can even use their chakra to heal their allies.",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fist,Club,Gi",
        "Skills: Unarmed",
        "Passive: Crit +30%,Counter +75%,Eva +20%,Fist Mastery",
      ]],
    25 => # 邪拳王 / Dark Fist
      [[
        "A dark fighter that has mastered forbidden fist techniques and whose heart is stained in darkness. With their exceptional sense for close combat, they are capable of frequently countering and inflicting critical hits. Learns several dark unarmed skills, mercilessly killing foes with their fists. The price of sacrificing one's life force is necessary to master these forbidden arts.",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fist,Club,Gi",
        "Skills: Unarmed",
        "Passive: Crit +30%,Counter +75%,Eva +20%,Fist Mastery",
      ]],
    26 => # 魔導拳士 / Magus Fist
      [[
        "Hybrid monk who fights with magic-infused fists. In addition to black magic, this oddly mixed class wields elemental punches that spell doom for foes weak in both body and mind. A special skill restores MP.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fist,Club,Gi",
        "Skills: Unarmed,Black Magic",
        "Passive: Crit/Eva +15%,Mag Counter +25%",
        "",
      ]],
    27 => # フォースモンク / Force Monk
      [[
        "The ultimate warrior who can channel overwhelming magic into their fists. By imbuing the power of every element into their fists, a Force Monk can defeat any enemy. Black Magic can also be used, making the Force Monk a physical and magical threat. Without a doubt, the Force Monk is a master of elements and an all-around powerful class.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fist,Club,Gi",
        "Skills: Unarmed,Black Magic",
        "Passive: Crit +20%,Eva +15%,Mag Counter +50%,Fist Mastery",
        "",
      ]],
    28 => # パラディン / Paladin
      [[
        "Faithful monk specializing in self-defense. While decent in attack, most skills prioritize the party's safety and overall health via holy power, ranging from recovery to revival.",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Fist,Club,Staff,Gi",
        "Skills: Unarmed,White Magic,Holy",
        "Passive: Crit +15%",
        "",
      ]],
    29 => # ゴッドハンド / God Hand
      [[
        "The ultimate warrior whose devotion to their faith knows no bounds. Warriors of this rank are bestowed with great power to protect their allies and mercilessly defeat evil. A God Hand's faith grants them great strength and teaches them the ultimate healing skill that sacrifices themselves for their allies.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Fist,Club,Staff,Gi",
        "Skills: Unarmed,White Magic,Holy",
        "Passive: Crit +20%,Fist Mastery",
        "",
      ]],
    30 => # バトルマスター / Battle Master
      [[
        "Undisputed master of sword and fist, this class mixes relentless punches and countless slashes into a unique style backed by a handsome attack stat. However, the same cannot be said for magic.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Rapier,Spear,Heavy Spear,Fist",
        "   Axe,Club,Scythe,Flail,Armor,Heavy Armor,Helmet,Heavy Helmet",
        "   Shield,Heavy Shield",
        "Skills: Dagger,Sword,Multiweapon,Unarmed",
        "Passive: Crit +15%,Counter +25%,Eva +15%,HP Regen +5%,",
        "   Great Defense, Dual Wield",
      ]],
    31 => # バトルエンペラー /  Battle Emperor
      [[
        "A unique warrior who has mastered the peak of swordsmanship and martial arts. Wields multiple weapons and combines them with martial arts in combat. Has mastered overwhelming consecutive attacks and boasts great destructive power. Can also learn Triple Attack, making normal attacks very powerful.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Great Sword,Rapier,Spear",
        "   Heavy Spear,Fist,Axe,Club,Scythe,Flail",
        "Skills: Dagger,Sword,Multiweapon,Unarmed",
        "Passive: Evasion +15%,Critical +25%,Counter +50%,HP Regen +10%,",
        "   Ultimate Defense,Dual Wield",
      ]],
    33 => # 魔法使い / Magician
      [[
        "The first step for all magic-user jobs. Specializes in magic; extremely poor at physical combat. Low defense and health; weak to being hit. Learns basic Black Magic focusing on the three primary magic elements.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Scythe,Rod,Grimoire,Robe,Magic Hat",
        "Skills: Black Magic",
        "Passive: None",
        "",
      ]],
    34 => # 黒魔導師 / Black Mage
      [[
        "Magician walking down the path of Black Magic, taking great pride in learning stronger elemental magic bolstered by an equally strong magic stat. It goes without saying that they're not fit for physical combat.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Scythe,Rod,Grimoire,Robe,Magic Hat",
        "Skills: Black Magic",
        "Passive: None",
      ]],
    35 => # 灼熱魔導師 / Inferno Mage
      [[
        "The ultimate Black Mage who specializes in Fire magic. The Inferno Mage wields a torrent of hellfire that burns the enemy away. Along with a resistance to Fire, Inferno mages are immune to the Burn status effect. With the ability to strengthen their elemental magic, the Inferno Mage is the master of Fire.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Scythe,Magic Sword,Rod,Grimoire,Robe",
        "   Magic Hat",
        "Skills: Black Magic,Dark",
        "Passive: Magic Mastery",
        "",
      ]],
    36 => # 輝氷魔導師 / Arctic Mage
      [[
        "The ultimate Black Mage who specializes in Ice magic. The Arctic Mage wields a torrent of ice, freezing enemies in their tracks. Along with a resistance to Ice, Arctic mages are immune to the Freeze status effect. With the ability to strengthen their elemental magic, the Arctic Mage is the master of Ice.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Scythe,Magic Sword,Rod,Grimoire,Robe",
        "   Magic Hat",
        "Skills: Black Magic,Dark",
        "Passive: Magic Mastery",
        "",
      ]],
    37 => # 極雷魔導師 / Gigavolt Mage
      [[
        "The ultimate Black Mage who specializes in Lightning magic. The Gigavolt Mage wields a torrent of lightning, rendering enemies to smoldering ash. Along with a resistance to Lightning, Gigavolt mages are immune to the Shock status effect. With the ability to strengthen their elemental magic, the Gigavolt Mage is the master of Lightning.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Magic Sword,Scythe,Rod,Grimoire,Robe",
        "   Magic Hat",
        "Skills: Black Magic,Dark",
        "Passive: Magic Mastery",
        "",
      ]],
    38 => # 時魔導師 / Time Mage
      [[
        "Branch of the mage family that taps into time and space. Unfit for combat and more suited for support, ranging from hastening allies to stopping enemies in their tracks. Furthermore, warp magic can be learned for fast travel to previous locations.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Scythe,Rod,Grimoire,Robe,Magic Hat",
        "Skills: Time Magic",
        "Passive: None",
        "",
      ]],
    39 => # 時空魔導師 / Spacetime Mage
      [[
        "A powerful rank of magician who can control space and time. The Spacetime Mage can manipulate the flow of time to the advantage of their allies. A Spacetime Mage can also control space by summoning meteorites from the sky itself, combining useful support magic with powerful attack magic.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Magic Sword,Scythe,Rod,Grimoire,Robe",
        "   Magic Hat",
        "Skills: Time Magic",
        "Passive: Magic Mastery",
        "",
      ]],
    40 => # 召喚士 / Summoner
      [[
        "Magician capable of calling forth magical beasts that attack or heal. Much stronger than bog-standard spells and has the MP cost to match, making it fitting for decisive blows but infeasible for constant casting.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Scythe,Rod,Grimoire,Robe,Magic Hat",
        "Skills: Summoning",
        "Passive: None",
        "",
      ]],
    41 => # 精霊召喚士 / Spirit Summoner
      [[
        "The ultimate summoner who can call upon the spirits and the divine. Despite the large MP cost, a Spirit Summoner possesses exceptionally powerful attack magic. With an increased amount of MP and the ability to cast the ultimate summoning spells, a Spirit Summoner is a powerful force on the battlefield.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Scythe,Magic Sword,Rod,Grimoire,Robe",
        "   Magic Hat",
        "Skills: Summoning",
        "Passive: Magic Mastery",
        "",
      ]],
    42 => # 陰陽師 / Taoist
      [[
        "Unique magician hailing from Yamatai. Seemingly weak magic attacks inflict potentially crippling weaknesses on all enemies with a chance of status ailments.",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Rod,Fan,Robe,Magic Hat",
        "Skills: Taoism",
        "Passive: Eva/Mag Eva +5%",
        "",
      ]],
    43 => # 天地陰陽師 / Cosmic Taoist
      [[
        "A talented Taoist who has polished their spiritual skills to annihilate groups of foes by inflicting abnormal statuses and reduced magical resistances. Can do extreme damage by targeting the weakened resists.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Magic Sword,Scythe,Rod,Fan,Robe,Magic Hat",
        "Skills: Taoism",
        "Passive: Eva/Mag Eva +5%,Magic Mastery, Fan Mastery",
        "",
      ]],
    44 => # 僧侶 / Priest
      [[
        "A pious monk who serves Ilias and specializes in healing magic. Invaluable on long trips for their ability to heal outside of combat. Not good at physical combat, although better than magic users. Learns support magic to assist the party.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Club,Staff,Whip,Grimoire,Robe,Magic Hat",
        "Skills: White Magic",
        "Passive: None",
        "",
      ]],
    45 => # 白魔導師 / White Mage
      [[
        "Hardworking Priest promoted to a true mage after mastering the basics. Learns stronger recovery and support magic along with a few offensive Holy spells. An unwritten requirement for truly dedicated parties.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Club,Staff,Whip,Grimoire,Robe,Magic Hat",
        "Skills: White Magic",
        "Passive: None",
        "",
      ]],
    46 => # 聖魔導師 / Holy Mage
      [[
        "A mage who concentrates their faith and power solely into White Magic, using Holy attacks that embodies Divine Strength to purge evil. Holy Mages can heal their allies and supplement their strength with great power. With this ultimate healer among your party, success is guaranteed.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Club,Staff,Whip,Grimoire,Robe,Magic Hat",
        "Skills: White Magic,Holy",
        "Passive: Magic Mastery",
        "",
      ]],
    47 => # 賢者 / Sage
      [[
        "Magical expert who has trained in the ways of both the priest and the magician. Able to wield both Black and White Magic, allowing them to attack and heal all on their own. The Sage also learns powerful magical support abilities such as MP cost reduction and boosters for elemental skills.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Magic Sword,Club,Scythe,Whip,Staff,Rod",
        "   Fan,Grimoire,Robe,Magic Hat",
        "Skills: White Magic,Black Magic",
        "Passive: MP Cost 75%",
      ]],
    48 => # 森羅万象士 / Cosmic Magus
      [[
        "Highest-class mage with knowledge of all living things. Uses skills of all types, including Holy and Dark. Reduced MP consumption allows many uses of powerful spells, including ones that expend all MP.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Magic Sword,Club,Scythe,Whip,Staff,Rod",
        "   Fan,Grimoire,Robe,Magic Hat",
        "Skills: White Magic,Black Magic,Time Magic,Summoning,Holy,Dark",
        "   Taoism",
        "Passive: MP Cost 50%,Magic Mastery",
      ]],
    49 => # 魔法少女 / Magical Girl
      [[
        "A bringer of justice with a pure heart who transforms into a Magical Girl. Although unreliable under normal circumstances, Magical Girls can wield powerful offensive and supportive magic after transforming. The transformation time is limited, but ideal for short-term battles.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Magic Sword,Scythe,Staff,Rod,Bow,Grimoire",
        "   Gun,Robe,Magic Hat",
        "Skills: White Magic,Black Magic",
        "Passive: MP Regen +1%",
        "",
      ]],
    50 => # 魔女 / Witch
      [[
        "Magician who has given in to destruction and curses and whose once pure heart has become tainted. Can use exceptionally potent offensive magic once transformed. Can spread curses and calamities to groups of enemies with very strong status ailments and instant death effects. An extremely powerful entity capable of annihilating enemies in one go.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Magic Sword,Scythe,Staff,Rod,Bow,Grimoire,Gun",
        "Skills: White Magic,Black Magic,Time Magic,Heroism",
        "Passive: MP Regen +2%,Magic Mastery",
        "",
      ]],
    52 => # 狩人 / Hunter
      [[
        "Experts with the bow, Hunters have extremely high accuracy and also learn elemental skills. Hunters live up to their name by learning skills especially effective against certain races. Their damage dealing is excellent, but their defense is less than a Warrior's.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Bow,Whip,Boomerang",
        "Skills: Scythe,Bow,Whip,Throwing",
        "Passive: Crit/Eva +10%,Forest Strength,Slayer Boost 100%",
        "",
      ]],
    53 => # ボウマスター / Bowmaster
      [[
        "Keen-eyed Hunter after rigorous training. Learns skills that inflict severe damage to even more races, such as Insects and Alraunes. Shooting down whole groups of foes at once becomes child's play for this class. Defenses are still fragile, so do be careful.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Bow,Whip,Boomerang",
        "Skills: Scythe,Bow,Whip,Throwing",
        "Passive: Crit +15%,Eva +10%,Forest Strength,Slayer Boost 100%",
        "",
      ]],
    54 => # 神弓手 / Holy Archer
      [[
        "A holy Hunter boasting superior Bow and Holy skills. The Holy Archer wields arrows that deal holy damage at the cost of SP and MP, as well as hunt down monsters such as Lamias and Scyllas. Despite the large SP cost, the force behind each arrow is well worth it.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Bow,Whip,Boomerang",
        "Skills: Scythe,Bow,Whip,Throwing",
        "Passive: Crit +20%,Eva +10%,Super Forest Strength",
        "   Slayer Boost 100%,Bow Mastery",
        "",
      ]],
    55 => # 影狩人 / Shadow Hunter
      [[
        "A Hunter who has devoted themselves to the power of darkness. Capable of taking down prey such as elves and fairies, that ordinary hunters lack the skill to hunt. The Shadow Hunter uses forbidden skills that bury enemies in darkness, annihilating them at the cost of the user's life force.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Bow,Whip,Boomerang",
        "Skills: Scythe,Bow,Whip,Throwing",
        "Passive: Crit +20%,Eva +10%,Super Forest Strength",
        "   Slayer Boost 100%,Bow Mastery",
        "",
      ]],
    56 => # ガンナー / Gunner
      [[
        "Dynamic sharpshooter that swaps the old for the new. No enemy can avoid the bullets, their speed dwarfing and downing Harpies and Succubi. Average attack stat aside, even healing ammo can be acquired.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gun",
        "Skills: Gun",
        "Passive: Crit +15%,Slayer Boost 100%",
        "",
      ]],
    57 => # 神銃士 / God's Eye
      [[
        "A gunner who utilizes bullets infused with divinity to purge the world of evil. The God's Eye consumes MP to deploy Gun Skills that deal damage with tremendous power. By reaching Gun Mastery and learning a series of useful Gun skills, the God's Eye is prepared for any type of situation, especially against vampires and the undead.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gun",
        "Skills: Gun",
        "Passive: Crit +20%,Slayer Boost 100%,Gun Mastery",
        "",
      ]],
    58 => # 魔弾の射手 / Devil's Eye
      [[
        "Gunners who bargained with demons to infuse their weapons with the power of evil. By consuming HP, the Devil's Eye is able to wield forbidden Gun techniques. With an arsenal of useful skills, they can adapt to any situation including fights against Mermaids and Dragons.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gun",
        "Skills: Gun",
        "Passive: Crit +20%,Slayer Boost 100%,Gun Mastery",
        "",
      ]],
    59 => # 魔獣使い / Monster Tamer
      [[
        "Different kind of Hunter that aims to tame monster girls. Paralyzing, binding, seducing, and overall subduing their will to attack is their specialty. The mere presence of a Monster Tamer attracts other monster girls to come along for the ride.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Whip,Boomerang",
        "Skills: Scythe,Whip",
        "Passive: Recruit 150%,Slayer Boost 100%",
        "",
      ]],
    60 => # ドラゴン使い / Dragon Tamer
      [[
        "The ultimate Hunter who has learned to tame one of the most powerful monsters of all: the Dragon. The ultimate goal of the Dragon Tamer is not just to control dragons, but every type of monster that exists. The Dragon Tamer deals more damage with whips and can master powerful Whip skills, including one that deals holy damage at the cost of MP.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Whip,Boomerang",
        "Skills: Scythe,Whip",
        "Passive: Recruit 200%,Slayer Boost 100%,Whip Mastery",
        "",
      ]],
    61 => # デビルサマナー / Devil Summoner
      [[
        "A Hunter who obeys the will of darkness and uses forbidden skills to summon dark servants. The Devil Summoner can also learn Whip skills tainted by darkness that sap the user's life force.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Whip,Boomerang",
        "Skills: Scythe,Whip",
        "Passive: Recruit 200%,Slayer Boost 100%,Whip Mastery",
        "",
      ]],
    62 => # シーフ / Thief
      [[
        "Thieves make their living by taking from others, including stealing items from enemies and opening treasure chests. Other than agility, their stats are very low. Despite being poor at combat, they learn many skills useful in an adventure.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Whip,Boomerang",
        "Skills: Dagger,Throwing,Thievery",
        "Passive: Crit +10%,Eva +20%,Nullify Ambush",
        "   Preemptive Strike Up,Steal Rate 150%",
        "",
      ]],
    63 => # マスターシーフ / Master Thief
      [[
        "Expert Thief with enhanced thievery prowess. They can even steal HP and unlock green chests. More Dagger skills are acquired as well, but only as a last resort due to low fighting stats.",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Whip,Boomerang",
        "Skills: Dagger,Throwing,Thievery",
        "Passive: Crit +15%,Eva +20%,Nullify Ambush",
        "   Preemptive Strike Up,Steal Rate 200%",
        "",
      ]],
    64 => # トリックスター / Trickster
      [[
        "The ultimate Thief said to possess godly skills. By mastering the art of theft, the Trickster is capable of stealing anything. The Trickster deals more damage with Dagger skills and is able to kill several enemies instantly. Nevertheless, it is important to note that Tricksters have inferior attack power compared to standard warrior jobs.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Whip,Boomerang",
        "Skills: Dagger,Throwing,Thievery",
        "Passive: Crit/Eva +20%,Nullify Ambush",
        "   Preemptive Strike Up,Steal Rate 300%,Dagger Mastery",
        "",
      ]],
    65 => # 忍者 / Ninja
      [[
        "Elusive assassin from the far East cloaked in darkness, severing lives swiftly and efficiently with Ninjutsu. Paired with dual wielding, the attack options only grow. High evasion makes up for paper-thin defenses and low attack.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Ninja Sword,Scythe,Gi",
        "Skills: Ninjutsu",
        "Passive: Crit +15%,Eva +20%,Dual Wield",
        "",
      ]],
    66 => # 極忍 / Master Shinobi
      [[
        "The ultimate Ninja who has undergone rigorous training to obtain considerable skills, including a number of lethal ninjutsu abilities. The ability to dual wield weapons makes the Master Shinobi very dangerous. Above all, it should be noted that Master Shinobi have fragile defenses.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Ninja Sword,Scythe,Gi",
        "Skills: Ninjutsu",
        "Passive: Crit/Eva +20%,Dual Wield",
        "",
      ]],
    67 => # 淫流くのいち / Erotic Kunoichi
      [[
        "The ultimate Ninja who has mastered the sexual arts, using charm and seduction to harass and subdue their targets. The Erotic Kunoichi also learns how to endure pleasure, giving them a high tolerance to sexual attacks. Because of their weak strength, the Erotic Kunoichi must rely on Dexterity and have the utmost caution in fights.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Ninja Sword,Scythe,Sex Toy,Gi",
        "Skills: Ninjutsu,Sexcraft",
        "Passive: Crit/Eva +20%,Dual Wield",
        "   Horny/Trance/Seduction Strike +5%",
        "   Incontinence Strike +5%",
      ]],
    68 => # 海賊 / Pirate
      [[
        "A proud ocean warrior who respects freedom. Pirates have excellent melee and Gun capabilities, with a high tolerance for elemental damage and status ailments. Their passionate fighting spirit enables the Pirates to reduce the SP cost of their combat skills. Armed with a plethora of offensive skills, Pirates are best suited for the front line.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Great Sword,Axe,Club,Flail,Gun",
        "Skills: Sword,Gun,Piracy",
        "Passive: Crit +10%,SP Cost 75%,Sea Strength",
        "",
      ]],
    69 => # 海賊王 / Pirate King
      [[
        "Proud Emperors of the Sea who reign over all Pirates and possess outstanding combat abilities while leaving no openings in their offense or defense. They boast high physical strength and elemental resistances and are excellent all-around survivors. Having the potential to acquire powerful skills, Pirate Kings are superior, first-rate fighters.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Great Sword,Axe,Club,Flail,Gun",
        "Skills: Sword,Gun,Piracy",
        "Passive: Crit +20%,Dual Wield,SP Cost 50%",
        "   Super Sea Strength",
        "",
      ]],
    72 => # 兵士 / Guard
      [[
        "Protects towns and castles, your average Guard. Learns skills to weaken and disable enemies. Average stats for a fighter-type, but bad with magic and not able to equip many types of weapons or armor.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Rapier,Spear,Boomerang,Armor,Helmet,Shield",
        "Skills: Sword,Spear",
        "Passive: City Strength",
        "",
      ]],
    73 => # 王宮騎士 / Royal Guard
      [[
        "Senior Guard charged with protecting top VIPs and sites. Learns more skills to further weaken foes. Attack and defense stats are fit for the offensive and are further bulked by heavy equipment.",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Rapier,Spear,Heavy Spear",
        "   Boomerang,Armor,Heavy Armor,Helmet,Heavy Helmet,Shield",
        "   Heavy Shield",
        "Skills: Dagger,Sword,Rapier,Spear",
        "Passive: City Strength",
      ]],
    74 => # ナイツオブラウンド / Knight of the Round
      [[
        "Knight who has earned the highest title in the world, Knight of the Round Table. Said to boast sword skills capable of debilitating all foes at once, and can even bring forth miracles with the power of the Holy Grail. With the ability to even wield Spellblades, they are truly almighty knights.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip:Dagger,Sword,Knight Sword,Rapier,Spear,Heavy Spear",
        "   Boomerang,Armor,Heavy Armor,Helmet,Heavy Helmet,Shield",
        "   Heavy Shield",
        "Skills:Dagger,Sword,Rapier,Spear,Spellblade",
        "Passive:Super Town Strength,Sword Mastery",
      ]],
    75 => # 海兵 / Marine
      [[
        "A trained soldier of the sea who defends order and carries out justice. More robust than normal soldiers, the Marine is well suited for combat in harsh environments. Empowered by their fiery fighting spirit, Marines start the battle with more SP than normal. With additional strength in battles on the Sea, the Marine is a reliable offensive role.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Great Sword,Spear,Bow,Gun",
        "Skills: Sword,Gun,Piracy",
        "Passive: Crit +10%,Sea Strength,Battle Start SP 75%",
        "",
      ]],
    76 => # 海軍大将 / Admiral
      [[
        "A brave general of the Navy, leading the other Marines into battle. The Admiral is a combat veteran with a tremendous fighting spirit, starting battle with max SP. With the might of the Armada Barrage, the Admiral mercilessly defeats any who oppose them.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Great Sword,Spear,Heavy Spear,Bow,Gun",
        "Skills: Sword,Gun,Piracy",
        "Passive: Crit +20%,Super Sea Strength,Battle Start SP 100%",
        "   Sword Mastery,Gun Mastery",
        "",
      ]],
    77 => # 正義のヒーロー / Hero of Justice
      [[
        "Strange masked warrior with a heart of justice. Stats are average all around but certain skills can only be used when transformed. Smite evildoers with all sorts of embarrassingly named attacks!",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fist",
        "Skills: Unarmed",
        "Passive: Strength in Solitude,Unyielding Fighting Spirit",
        "",
      ]],
    78 => # ジャスティスカイザー / Justice Kaiser
      [[
        "Warrior of justice who has inherited a legendary hero title. Transforming increases the Justice Kaiser's powers and unlocks the use of powerful Justice skills. Can learn many powerful skills that aren't just for show. A fearless, time-limited fighter with the power to turn the tide of battle.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Fist",
        "Skills: Sword, Unarmed",
        "Passive: Super Strength in Solitude,Indomitable",
        "   Fighting Spirit,Sword Mastery,Fist Mastery",
        "",
      ]],
    79 => # 商人 / Merchant
      [[
        "Traveling salesmen enthusiastic about business. Increases the amount of gold acquired after battle. Not suited for combat, but nonetheless hearty and tenacious. Can purchase items in combat and use them immediately.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Boomerang,Abacus",
        "Skills: Throwing,Mercantile,EX-Item",
        "Passive: Medicine Lore I,Gold Drop 150%",
        "",
      ]],
    80 => # 闇商人 / Black Marketeer
      [[
        "Accomplished Merchant with lucrative but dubious connections. Get party members out of a jam with swift under-the-table dealings. High defense aside, direct combat is not recommended. Better items can be bought too.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Boomerang,Abacus",
        "Skills: Throwing,Mercantile,EX-Item",
        "Passive: Medicine Lore I,Gold Drop 200%",
        "",
      ]],
    81 => # 神の見えざる手 / Invisible Hand of God
      [[
        "The most efficient businessman revered as a mediator for both political and financial affairs. Able to amass a vast amount of wealth via market manipulation. With a wide variety of Mercantile skills, like purchasing rare items and immediately using them in battle, the Invisible Hand of God makes use of every advantage money can buy.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Boomerang,Abacus",
        "Skills: Throwing,Mercantile,EX-Item",
        "Passive: Medicine Lore I,Gold Drop 300%",
        "   　Abacus Mastery",
        "",
      ]],
    82 => # アイテム士 / Item User
      [[
        "Innovative user of many items and traveling faux-doctor for adventurers. The item's true essence is drawn out and divided across the party or reversed against foes. Learns Boomerang skills but otherwise powerless.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Boomerang,Abacus",
        "Skills: Throwing,Mercantile,EX-Item",
        "Passive: Medicine Lore II",
        "",
      ]],
    83 => # マスターアイテム / Item Master
      [[
        "The ultimate pharmacist who mastered the use of items. The Item Master has superior skills that can turn even the common herb into an Elixir of Wonders. The ability to provide recovery without using MP makes the Item Master essential on long journeys. Despite being lackluster in direct combat, Item Masters can still defend themselves with their Throwing skills.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Boomerang,Abacus",
        "Skills: Throwing,Mercantile,EX-Item",
        "Passive: Medicine Lore III,Boomerang Mastery",
        "",
      ]],
    84 => # 冒険家 / Adventurer
      [[
        "Classic traveler of uncharted lands. Learns skills that'll lessen the stress and dangers of long journeys. Robust, adaptable, and won't mind fighting in harsh environments. Learns a few Boomerang skills as well.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Ninja Sword,Scythe,Bow,Boomerang",
        "Skills: Dagger,Throwing,Thievery,EX-Item",
        "Passive: Crit +5%,Eva +10%,Env. Damage 50%",
        "   Desert Strength,Cave Strength",
      ]],
    85 => # レンジャー / Ranger
      [[
        "A special soldier trained to fight even in extreme environments. With training experience from both Ninjas and Pirates, Rangers can survive in any situation. Besides useful adventuring skills, Rangers can also learn powerful Throwing skills. With a Ranger in your party, you are safe in and out of combat.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Ninja Sword,Scythe,Bow,Boomerang",
        "Skills: Dagger,Throwing,Thievery,Ninjutsu,Piracy",
        "   EX-Item",
        "Passive: Crit/Eva +10%,Null Env. Dmg,Boomerang Mastery",
        "   Super Desert Strength,Super Cave Strength",
      ]],
    86 => # 占い師 / Fortune Teller
      [[
        "A soothsaying expert of mysterious forces. Uses tarot cards that bring out random effects. Physical stats are subpar but magic skills are passable. Besides tarot cards, many luck-based skills can be learned.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Staff,Rod,Cards",
        "Skills: Oracle",
        "Passive: Item Drop 150%,Gambling Luck I",
        "",
      ]],
    87 => # ギャンブラー / Gambler
      [[
        "Edge-teetering soothsayer gambling with fate. Disrupt the flow of battle with random events. Lady Luck may either bless your friends or empower your foes, so don't push your luck and use with caution.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Staff,Rod,Cards",
        "Skills: Oracle",
        "Passive: Crit +30%,Item Drop 200%,Gambling Luck II",
        "",
      ]],
    88 => # 闇の賭博師 / Dark Gambler
      [[
        "A legendary Gambler who has made dealings in the Underworld. With a Dark Gambler as the house, gambling can have a disastrous outcome for any and all in the game. They acquire Oracle skills that are more unpredictable, becoming more powerful and dangerous. If you want a way to turn the tide of battle, you can't ask for a better combatant.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Staff,Rod,Cards",
        "Skills: Oracle",
        "Passive: Crit +40%,Item Drop 300%,Gambling Luck III",
        "   Cards Mastery",
        "",
      ]],
    89 => # カードバトラー / Card Battler
      [[
        "Ex-Fortune Teller turned full-time card battler. Each card drawn possesses magical power that may shuffle the tide of battle. Effects range from attack to recovery. Magic may be decent, but best suited for support.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Staff,Rod,Cards",
        "Skills: Oracle",
        "Passive: None",
        "",
      ]],
    90 => # カードサマナー / Card Summoner
      [[
        "A skilled card player, who uses magic cards to summon powerful creatures. However, there is no controlling the summoned creatures for they act on their own volition. Additionally, Oracle skills have a low cost in SP and MP, allowing them to be used in quick succession. If Lady Luck smiles on you, even the toughest journeys will be nothing but cakewalks.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Staff,Rod,Cards",
        "Skills: Oracle",
        "Passive: Cards Mastery",
        "",
      ]],
    91 => # ゴッドファーザー / Godfather
      [[
        "The head of a criminal empire that rules over the Underworld. The Godfather wields two guns with great finesse and has very high combat capabilities. Acquires unique Gun skills that can effectively defeat different kinds of enemies, despite being a threat to their allies as well.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Fist,Gun",
        "Skills: Gun,Mercantile,Unarmed",
        "Passive: Counter +50%,Dual Wield,Gambling Luck III",
        "",
      ]],
    92 => # 遊び人 / Gadabout
      [[
        "A useless job, Gadabouts are inclined to goof off during battle. Not only are they poor in combat, they often interfere with other party members too. Learns singing and dancing skills, which may be useful in more advanced jobs...",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fan,Whip,Boomerang,Sex Toy",
        "Skills: Oracle,Dancing,Singing,Sexcraft",
        "Passive: Crit/Eva +20%,Gambling Luck I",
        "",
      ]],
    93 => # 踊り子 / Dancer
      [[
        "Confound and disturb the hearts of both man and monster. Learn alluring and magical dances to buff one side and debilitate the other. Has high evasion and picks up a few fan skills but due to low attack they serve as a last resort only.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Whip,Fan",
        "Skills: Fan,Dancing",
        "Passive: Eva +20%",
        "",
      ]],
    94 => # 戦巫女 / War Miko
      [[
        "A warrior who dances to bring honor to the Gods. A War Miko's dance can bring about Miracles and eliminate evil. Although they learn powerful Fan skills and boast above average magic, War Miko are not suited for direct combat.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Whip,Fan",
        "Skills: Fan,Dancing",
        "Passive: Eva +20%,Fan Mastery",
        "",
      ]],
    95 => # 吟遊詩人 / Minstrel
      [[
        "Vocalist whose songs shake the hearts of both man and monster. Alter the tone to awaken hidden abilities in allies. Excellent at support during drawn out battles but a poor fighter.",
        "",
        "",
        "",
      ],
      [
        "Equip: Boomerang,Harp",
        "Skills: Singing",
        "Passive: Mag Eva +20%",
        "",
      ]],
    96 => # 神唱の歌姫 / Divine Songstress
      [[
        "A diva with the singing voice of God who captivates people and monsters from all over the world. A Divine Songstress' voice brings miracles to their allies and destruction to enemies. With a score of songs from attack to recovery, this singer is an encouraging ally. Their overall stats are not very high, so caution is advised.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Boomerang,Harp",
        "Skills: Singing",
        "Passive: Mag Eva +20%,Harp Mastery",
        "",
      ]],
    97 => # 娼婦 / Prostitute
      [[
        "Sexcraft specialist aiming to melt body and mind in pleasure. Inflict pleasure 'damage' with lewd skills that leave foes moist and quivering for more. While resistant against the same type of damage, don't expect anyone in this job to throw punches.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Whip,Sex Toy",
        "Skills: Sexcraft",
        "Passive: Horny/Trance Strike +5%",
        "",
      ]],
    98 => # 慈愛の聖娼 / Saintly Prostitute
      [[
        "A whore who gives affection to men and women alike, slowly leading them to ascension by ecstasy. The Saintly Prostitute learns many Pleasure skills to bring foes to ecstasy, but should avoid direct combat as much as possible.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Whip,Sex Toy",
        "Skills: Sexcraft",
        "Passive: Sex Toy Mastery,Horny/Trance Strike +5%",
        "   Incontinence Strike +5%",
        "",
      ]],
    99 => # 傾国の魔娼 / Devilish Prostitute
      [[
        "A whore who captivates the hearts of men and women with the movements of their fingers and takes their soul away through sexual ruin. The Devilish Prostitute learns many Pleasure skills to bring foes to temptation, but should avoid direct combat as much as possible.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Whip,Sex Toy",
        "Skills: Sexcraft",
        "Passive: Sex Toy Mastery,Horny/Trance Strike +5%",
        "   Seduction Strike +5%",
        "",
      ]],
    100 => # スーパースター / Superstar
      [[
        "Singing, dancing, and all-around captivating idol. Distract foes with songs while allies are encouraged by dances. Special stage skills can be learned as well. Support capabilities are virtually peerless.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Whip,Harp,Fan",
        "Skills: Fan,Dancing,Singing",
        "Passive: Eva/Mag Eva +15%,Seduction Strike +20%",
        "",
      ]],
    101 => # バトルファッカー / Battle Fucker
      [[
        "Lewd fighter who incorporates sex acts into battle. The foe's privates are erotically tortured by hands, feet, and other body parts. Apart from greater resistance against pleasure-based attacks, new abilities increase the odds of addling foes into a rapturous stupor.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Whip,Fist,Sex Toy",
        "Skills: Whip,Unarmed,Sexcraft",
        "Passive: Crit +15%,Eva +10%,Horny/Trance Strike +5%",
        "",
      ]],
    102 => # クイーンファッカー / Queen Fucker
      [[
        "Queen of sex battles who reigns supreme over all Battle Fuckers. Can make any opponent instantly ascend to heaven with powerful and unparalleled pleasure techniques. Highly resistant to pleasure attacks and pleasure status ailments. Displays unmatched power against monsters weak to pleasure.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Whip,Fist,Sex Toy",
        "Skills: Whip,Unarmed,Sexcraft",
        "Passive: Sex Toy Mastery,Horny/Trance Strike +5%",
        "   Seduction/Incontinence Strike +5%",
        "",
      ]],
    103 => # 学者 / Scholar
      [[
        "Ambitious student on the pursuit of truth. Utilizes a new form of magic to fend off enemies. This type of magic uses SP as opposed to MP, making it a versatile skill set useful in future jobs.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Rod,Scalpel,Grimoire,Gun",
        "Skills: Magic Science,Alchemy,Grimoire",
        "Passive: None",
        "",
      ]],
    104 => # 魔導学者 / Magical Scholar
      [[
        "Scholar fully immersed in the next level of magic science, mixing and matching various compounds to wreak havoc upon Dolls and other artificial monsters. The conversion rate between SP and MP has increased as well.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Rod,Scalpel,Grimoire,Gun",
        "Skills: Magic Science,Alchemy,Grimoire",
        "Passive: None",
        "",
      ]],
    105 => # マスターアルケミスト / Master Scholar
      [[
        "The ultimate scholar of Magic Science. The Master Scholar is able to harness the extreme power of science to cause destruction indistinguishable from the effects of magic. They can efficiently make use of both SP and MP, making them just as proficient at casting magic.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Rod,Scalpel,Grimoire,Gun",
        "Skills: Magic Science,Alchemy,Grimoire",
        "Passive: Magic Mastery",
        "",
      ]],
    106 => # 錬金術士 / Alchemist
      [[
        "A scholar who explored the ability to create items out of thin air by refining objects into mysterious alchemical tools. Items created by the Alchemist's skills are immediately used upon creation. The Alchemist performs well as an offensive spellcaster with stats similar to that of a mage.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Staff,Rod,Grimoire",
        "Skills: Magic Science,Alchemy,Grimoire",
        "Passive: Alchemy Material Auto-collection 50%",
        "",
      ]],
    107 => # 錬金宝貝士 / Golden Alchemist
      [[
        "The ultimate Alchemist who combines items and alchemical reagents to craft rare and mysterious weapons and armors. The refined equipment can only be utilized once in battle, but its power is extremely useful. Although Golden Alchemists are not suited for combat, the power of legendary weapons shouldn't be underestimated.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Staff,Rod,Grimoire",
        "Skills: Magic Science,Alchemy,Grimoire",
        "Passive: Alchemy Material Auto-collection 50%, Magic Mastery",
        "",
      ]],
    108 => # 魔導司書 / Magical Librarian
      [[
        "Scholar and researcher of magical books. By sacrificing a page of the grimoire, a powerful phenomenon occurs at no extra cost. Besides the basic elements, the pages contain spells for every occasion...if you have enough to spare.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Staff,Rod,Grimoire",
        "Skills: Magic Science,Alchemy,Grimoire",
        "Passive: None",
        "",
      ]],
    109 => # ロードライブラリ / Library Lord
      [[
        "The ultimate magic scientist who wields the power of grimoires. By consuming a page from the grimoire, the Library Lord can activate powerful magical skills, including recovery and support spells. Be sure to keep stock of grimoire pages.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Staff,Rod,Grimoire",
        "Skills: Magic Science,Alchemy,Grimoire",
        "Passive: Magic Mastery",
        "",
      ]],
    110 => # 技師 / Engineer
      [[
        "Job that uses cutting-edge weaponry to dispatch whole swaths of enemies. Despite the boost in SP its general status still falls short of the more traditional combat-oriented jobs.",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Club,Gun",
        "Skills: Makina",
        "Passive: None",
        "",
      ]],
    111 => # マキナマイスター / Machinist
      [[
        "Advanced engineer skilled with higher-grade tech, wielding their destructive power in the heat of battle. Some makina are designed to explicitly mow down certain types of enemies, while others are aligned towards self-defense.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Club,Gun",
        "Skills: Makina",
        "Passive: None",
        "",
      ]],
    112 => # マスターマシーナリー / Makina Master
      [[
        "The ultimate engineer who has learned to wield various Makina. With mastery over every kind of Makina, this combatant can hold back hordes of enemies. With high stats and the right weapon equipped, Makina Masters will outmatch even the strongest of warriors.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Club,Gun",
        "Skills: Makina",
        "Passive: Gun Mastery",
        "",
      ]],
    113 => # 魔芸師 / Spiritualist
      [[
        "Novice necromancer who seeks mastery of the three arts. Learns a few fledgling skills of each school and armed with high magic stats. As a branch of the Summoning arts, this job must be mastered in order to settle into a true profession.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Scythe,Rod,Whip,Grimoire,Robe,Magic Hat",
        "Skills: Scythe,Summoning",
        "Passive: None",
        "",
      ]],
    114 => # ネクロマンサー / Necromancer
      [[
        "Unique summoner that turns corpses into minions fueled by life. Countless experiments with many bodies indirectly allows for the dubious use of Medicine skills as well. Juggle syringes and impromptu graverobbing effectively for complete reliability.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Scythe,Rod,Whip,Scalpel,Grimoire,Robe,Magic Hat",
        "Skills: Scythe,Summoning,Medicine,Corpse",
        "Passive: None",
        "",
      ]],
    115 => # ネクロマスター / Necromaster
      [[
        "The ultimate Necromancer who can skillfully manipulate powerful zombies and summon legendary Yomas. With additional knowledge of medicine, the Necromaster is a useful combat medic.",
        "",
        "",
        "",
      ],
      [
        "Equip: Scythe,Rod,Whip,Scalpel,Grimoire,Robe,Magic Hat",
        "Skills: Scythe,Summoning,Medicine,Corpse",
        "Passive: Magic Mastery",
        "",
      ]],
    116 => # 降霊術師 / Medium
      [[
        "Unique summoner that calls ghosts from the afterlife lured by mana. With a few nibbles of the Medium's MP, they'll fight alongside the party and even impart life in return. Black Magic is a less costly alternative, provided that there's MP to spare.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Scythe,Staff,Rod,Grimoire,Robe,Magic Hat",
        "Skills: Scythe,Black Magic,Summoning,Corpse",
        "Passive: None",
        "",
      ]],
    117 => # マスターシャーマン / Master Shaman
      [[
        "The ultimate shaman who can summon legendary spirits both living and dead. With mighty Summoning skills and high magic power, the Master Shaman is an outstanding ally to have.",
        "",
        "",
        "",
      ],
      [
        "Equip: Scythe,Staff,Rod,Grimoire,Robe,Magic Hat",
        "Skills: Scythe,Black Magic,Summoning,Corpse",
        "Passive: Magic Mastery",
        "",
      ]],
    118 => # からくり人形師 / Puppeteer
      [[
        "Unique summoner that controls dolls built from scratch with great care. Controlling the dolls takes neither magic nor life, but very high concentration to perform well. Ergo, Makina serve as a viable backup.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Scythe,Rod,Grimoire,Gun,Robe,Magic Hat",
        "Skills: Scythe,Summoning,Makina,Artificial",
        "Passive: None",
        "",
      ]],
    119 => # マスタードーラー / Puppet Master
      [[
        "The ultimate Puppeteer who manipulates dolls as powerful weapons. By wielding Artificial and Makina skills, the Puppet Master is a powerful attacker.",
        "",
        "",
        "",
      ],
      [
        "Equip: Scythe,Rod,Grimoire,Gun,Robe,Magic Hat",
        "Skills: Scythe,Summoning,Makina,Artificial",
        "Passive: Magic Mastery",
        "",
      ]],
    120 => # 情報屋 / Informant
      [[
        "Words become weapons in this unorthodox job. Distract the enemy with stories and idle gossip. Despite subpar efforts in both forms of combat, this job is invaluable for gathering more allies.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Boomerang,Gun",
        "Skills: Throwing,Talk",
        "Passive: None",
        "",
      ]],
    121 => # 話術士 / Smooth Talker
      [[
        "A skilled wordsmith who fights without throwing a punch. Suave fast-talking can coax money and items from foes. Failing that, colorful phrases can induce abnormal status. Not fit for fighting and would prefer to use words as weapons.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Boomerang,Gun",
        "Skills: Throwing,Talk",
        "Passive: None",
        "",
      ]],
    122 => # 話神 / God of Speech
      [[
        "The ultimate informant whose mastery of speech approaches the realm of magic. Capable of uttering blessings to revive an ally, or cursing opponents with instantaneous death. Naturally, they are adept at quickly building friendships with their enemies.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Boomerang,Gun",
        "Skills: Throwing,Talk",
        "Passive: Boomerang Mastery",
        "",
      ]],
    123 => # 料理人 / Cook
      [[
        "Devoted foodie in pursuit of unique recipes. Skilled hands and a passionate heart craft splendid meals in the heat of battle, buffing allies and smiting foes. Completed dishes are stored in the inventory.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Kitchen Knife",
        "Skills: Dagger,Cooking",
        "Passive: None",
        "",
      ]],
    124 => # トリプルコック / Three Star Chef
      [[
        "Master chef capable of whipping out divine meals. The recipe list is expanded with cuisines that dish out spectacular effects on the tongue and battlefield. Kitchen knives are handy in a pinch, but are unreliable compared to real weapons.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Kitchen Knife",
        "Skills: Dagger,Cooking",
        "Passive: None",
        "",
      ]],
    125 => # 味皇 / Flavor Emperor
      [[
        "Masters of the culinary arts who have become recognized as gods of cooking, with first-class recipes that restore the party's vitality. The Flavor Emperor can apply unique support effects and buffs, and is able to create dishes even without the necessary ingredients.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Kitchen Knife",
        "Skills: Dagger,Cooking",
        "Passive: Kitchen Knife Mastery",
        "",
      ]],
    126 => # ナース / Nurse
      [[
        "Assistant doctor armed with basic first aid. Mend wounds, inoculate against status ailments, and improve general health with skills based on SP. Speed and dexterity are decent, but subpar for the front lines.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Staff,Scalpel",
        "Skills: Dagger,Medicine",
        "Passive: Eva +10%",
        "",
      ]],
    127 => # 医者 / Doctor
      [[
        "Accomplished battle physician fully loaded with the basics. Mends wounds without the use of items or magic. Even resuscitation is possible without using a hint of mana. Overall, an acceptable substitute for a White Mage when MP support is low.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Staff,Scalpel",
        "Skills: Dagger,Medicine",
        "Passive: Eva +10%",
        "",
      ]],
    128 => # 神医 / Godly Doctor
      [[
        "Legendary doctors who have mastered Eastern and Western medicine, able to treat their patients with flawless healing skills. With the ability to grant immunities to abnormal statuses and instant death, Godly Doctors are the perfect healers.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Staff,Scalpel",
        "Skills: Dagger,Medicine",
        "Passive: Eva +10%,Scalpel Mastery",
        "",
      ]],
    129 => # メイド / Maid
      [[
        "Dutifully performs household tasks with utmost care. Improvises housekeeping skills for combat to support allies and cripple enemies. Uses special skills to eliminate pesky bugs and weeds.",
        "",
        "",
        "",
      ],
      [
        "Equip: Whip,Fan,Plate,Sex Toy",
        "Skills: Whip,Service",
        "Passive: Eva/Mag Eva +10%",
        "",
      ]],
    130 => # マスターメイド / Master Maid
      [[
        "An expert maid that provides service without delay. In addition to keeping allies cozy, maids of this caliber can jump into the fray with secret self-defense techniques. Also obtains an ability that boosts job XP acquisition.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fan,Whip,Plate,Sex Toy",
        "Skills: Whip,Service",
        "Passive: Eva/Mag Eva +10%",
        "",
      ]],
    131 => # パーフェクトメイド / Perfect Maid
      [[
        "The ultimate maid who is ranked above all other maids, using flawless Service skills to fully support allies. The Perfect Maid's sexual skills are also outstanding, bringing enemies to ascension through service. They have also mastered strong Service skills, and cannot be beaten on the battlefield.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fan,Whip,Plate,Sex Toy",
        "Skills: Whip,Service",
        "Passive: Eva/Mag Eva +10%,Plate Mastery",
        "",
      ]],

    134 => # 貴族 / Noble
      [[
        "Members of the nobility who appear on the battlefield to fulfill the obligations that accompany their high-born status. Use rapiers and rapier skills along with abilities to increase XP and recover HP automatically. Good in combat with overall high stats.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Bow",
        "Skills: Dagger,Rapier,Ruling",
        "Passive: Eva +10%,HP Regen +5%",
        "",
      ]],
    135 => # 王 / King
      [[
        "Unequaled ruler of an entire country. Capable of taking control of the battlefield while fighting on the front lines. Fierce with a sword imbued with secret techniques. Heavy equipment can also even the odds.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Rapier,Spear,Heavy Spear,Bow",
        "   Armor,Heavy Armor,Helmet,Heavy Helmet,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Rapier,Ruling",
        "Passive: Crit +10%,HP Regen +10%",
        "",
      ]],
    136 => # 騎士王 / King of Knights
      [[
        "A king among kings who has mastered the art of war. The King of Knights' military prowess is said to be on par with a thousand soldiers. Can master extremely powerful skills passed down only within the royal family. Can learn many very useful abilities.",
        "",
        "",
        "",
		"",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Great Sword,Rapier,Spear",
        "   Heavy Spear,Bow",
        "Skills: Dagger,Sword,Rapier,Ruling",
        "Passive: HP Regen +20%,Sword Mastery",
        "",
      ]],
    137 => # 魔導王 / Magus King
      [[
        "A Warrior born from a bloodline of Kings naturally gifted to wield all manner of magic. The Magus King boasts powerful magic resistance, which cuts elemental damage in half. Having mastered all forms of magic, the Magus King is a force to be reckoned with.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Magic Sword,Staff,Rod,Grimoire,Robe,Magic Hat",
        "Skills: White Magic,Black Magic,Time Magic,Summoning",
        "   Magic Science,Alchemy,Grimoire,Ruling",
        "Passive: Mag Eva +20%,MP Regen +4%,Magic Mastery",
        "",
      ]],
    138 => # 法王 / Pope
      [[
        "Traveling minister preaching the good word across the world. Dutiful prayers call upon miracles to heal allies and smite enemies at the Goddess' behest. Good tidings shall come to those who bring a Pope along.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Magic Sword,Club,Staff,Grimoire,Robe,Magic Hat",
        "Skills: White Magic,Holy,Ruling",
        "Passive: Mag Eva +20%,Mag Ref +30%",
        "",
      ]],
    139 => # 神聖法王 / Sacred Pope
      [[
        "Great Master considered the closest to the Goddess among all the succeeding Popes. With outstanding miracles that shine even brighter, a Sacred Pope can share divine revelations with their companions. Can call forth crusades and even bring about the apocalypse. Shines not only as a healer, but also as a magic attacker.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Magic Sword,Club,Staff,Grimoire",
        "Skills: White Magic,Holy,Ruling",
        "Passive: Magic Reflect +50%,Magic Mastery",
        "",
      ]],
    140 => # 機甲法王 / Armored Pope
      [[
        "Military Pope who believes in firepower and armor above all. Uses exclusive weapons developed in secret and silences the enemies of the Goddess with firepower. Has mastered all manner of Makina and is well versed in mechanical technology from all over the world. The Armored Pope's ferocious appearance as they go to the front lines with their weapons is divine.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Magic Sword,Club,Staff,Grimoire,Gun",
        "Skills: Gun,White Magic,Makina,Ruling",
        "Passive: Magic Reflect +50%,Gun Mastery",
        "",
      ]],
    141 => # 見習い勇者 / Apprentice Hero
      [[
        "A hero-in-training who has not received the blessing of the Goddess. Aims to be a true hero, wields a sword but without experience. Average stats, poor at magic. Has personal sword skills and minor divine protection.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Rapier,Spear,Axe,Club,Scythe,Boomerang",
        "   Armor,Helmet,Shield",
        "Skills: Dagger,Sword,Heroism",
        "Passive: None",
        "",
      ]],
	142 => # 勇者 / Hero
      [[
        "A genuine hero blessed by the Goddess Ilias. Few in number, these sanctified warriors purge spirits and demons with blazing techniques, reducing them to ashes. Many stats are well above average and worthy of the title.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Rapier,Spear,Axe,Club,Scythe",
        "   Boomerang,Armor,Heavy Armor,Helmet,Heavy Helmet,Shield",
        "   Heavy Shield",
        "Skills: Dagger,Sword,Heroism",
        "Ability: Crit +10%,SP Regen +10%",
        "",
      ]],
    143 => # 光の勇者 / Hero of Light
      [[
        "A hero among heroes bestowed with the power of light by the Goddess of Creation. Even their skills are imbued with holy powers that reject the existence of monsters. With overwhelming stats and extraordinary abilities, their superior strength in any situation allows them to lead the party on the battlefield.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Great Sword,Rapier,Spear,",
        "       Heavy Spear,Axe,Club,Scythe,Boomerang,Armor,Heavy Armor,",
        "       Helmet,Heavy Helmet,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Holy,Heroism",
        "Passive: Crit Rate 20%,Holy Skill Booster +50%,SP Regen 20%,",
        "         Sword Mastery+",
      ]],
    144 => # 闇の勇者 / Hero of Darkness
      [[
        "A rebellious, corrupted hero granted the power of darkness by",
        "the Dark Goddess. Can imbue any blade which doesn't conform to",
        "Goddess Ilias' will with dark power to bring forth destruction.",
        "With overwhelming stats and extraordinary abilities, their",
        "superior strength in any situation allows them to lead the party",
        "on the battlefield.",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Great Sword,Rapier,Spear,",
        "       Heavy Spear,Axe,Club,Scythe,Boomerang,Armor,Heavy Armor,",
        "       Helmet,Heavy Helmet,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Dark,Heroism",
        "Passive: Crit Rate 20%,Dark Skill Booster +50%,SP Regen 20%,",
        "         Sword Mastery+",
      ]],
    149 => # 無職 / Unemployed
      [[
        "Unemployed bum with no job. There are no advantages or skills associated with being unemployed. Mastering it does nothing, either.",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger",
        "Skills: None",
        "Passive: None",
        "",
      ]],
    6998 => # 野生児 / Feral Youth
      [[
        "A wild child who fights weaponless, using only their body to unleash pure, untamed power. Excels at monster techniques and has impressive attack and agility. Poorly suited to magic and low on defense, so caution is necessary. Ideal for those who wish to make monster skills the primary weapon in battle.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang",
        "Skills: All Racial Skills",
        "Passive: Racial Skill Booster 15%, Critical Rate +15%",
        "",
      ]],
    6999 => # 魔物魂 / Monster Soul
      [[
        "A physical expert who has mastered the art of monster skills. Inflicts heavy damage using monster skills alone and boasts exceptionally high attack and agility. Ill-suited to wielding weapons or using magic, but can learn numerous abilities to significantly boost the potency of monster skills.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang",
        "Skills: All Racial Skills",
        "Passive: Racial Skill Booster 30%, Critical Rate +20%",
        "",
      ]],
    7000 => # ワイルドハート / Wildheart
      [[
        "A top-class expert who has mastered the art of monster skills. Elevates monster skills to devastating levels with overwhelming attack and agility. Incapable of using weapons other than fangs or wielding magic. A pure specialist in monster techniques, unleashing unparalleled strength when focused solely on them.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang",
        "Skills: All Racial Skills",
        "Passive: Racial Skill Booster 50%, Fang Mastery,",
        "  Critical Rate +20%",
      ]],
    7001 => # エスパー / Esper
      [[
        "A job with skills that allow the user to master Psychokinesis and freely use it in battle. Although it has become an abandoned job, it is said to be the origin of Magic Swords. Telekinetic attacks negate the opponent's defenses and are impossible to avoid. And since they have no element, they are unaffected by the enemy's resistances.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Magic Sword,Rod,Sex Toy",
        "Skills: Sword,Black Magic,Psychic,Sexcraft",
        "Passive: MP Regen 1%",
      ]],
    7002 => # ハイサイキック / High Psychic
      [[
        "An Esper with enhanced psychic power. Due to their extraordinary psychokinetic power, they can overwhelm their enemies without even touching them. Telekinetic attacks negate the opponent's defenses and are impossible to avoid. This job has good compatibility with pleasure attacks and is easy to use with a variety of elemental skills.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Magic Sword,Rod,Sex Toy",
        "Skills: Sword,Black Magic,Psychic,Sexcraft",
        "Passive: MP Regen 2%",
      ]],
    7003 => # サイコソルジャー / Psycho Soldier
      [[
        "The ultimate psychic warrior, combining psychokinetic power and combat skills. It is said that during the time of the Great Monster Wars, only a few elites had mastered this job. Telekinetic attacks negate the opponent's defenses and are impossible to avoid. Excels in both attack and defense and can flexibly deal with any situation.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Magic Sword,Rod,Sex Toy",
        "Skills: Sword,Black Magic,Psychic,Sexcraft",
        "Passive: MP Regen 4%,Sword Mastery,Sex Toy Mastery",
      ]],
    7004 => # フェンサー / Fencer
      [[
        "A fleet-footed warrior wielding a rapier with ease and whose speed is their greatest weapon. Has a noble spirit that inspires them to battle against the strong. Can automatically recover SP with the use of rapiers, making them able to fight for extended periods. However, they are very vulnerable to attacks and need to fight with utmost caution.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Rapier,Spear",
        "Skills: Rapier",
        "Passive: Physical Reflect +10%, Boss Slayer 10%",
      ]],
    7005 => # ノーブルフェンサー / Noble Fencer
      [[
        "A noble warrior who has mastered the art of the rapier. Their noble spirit heightens their ability to battle the strong. Can learn a variety of abilities suited to the handling of the rapier. Their speed allows them to attack in rapid succession, but their defense is brittle.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Rapier,Spear",
        "Skills: Rapier",
        "Passive: Physical Reflect +30%, Boss Slayer 30%,Rapier Mastery",
      ]],
    7006 => # 妖術師 / Sorcerer
      [[
        "A spellcaster who recreates techniques used by monsters with their own life energy. Some skills used by enemies can be learned by seeing them in battle. Learned skills can be used as sorcery in subsequent battles. Sorcery has a variety of special effects and can be used in many situations.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Magic Sword,Fist,Scythe,Staff,Rod,Fan",
        "Skills: Sorcery",
        "Passive: Learning",
      ]],
    7007 => # 異界妖術師 / Nether Sorcerer
      [[
        "A master Sorcerer who has further enhanced their ability to manipulate life energy. Can use learned skills and powerful techniques in battle. Their stats are all high and they have no major weaknesses. By using the special effects of various techniques with Sorcery, they can deal with any situation.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Magic Sword,Fist,Scythe,Staff,Rod,Fan",
        "Skills: Sorcery",
        "Passive: Learning,Scythe Mastery",
      ]],
    7008 => # シールドナイト / Shield Knight
      [[
        "A knight skilled in the use of shields, with excellent defensive abilities. Has the power to reflect or neutralize attacks before striking back. They can not only protect themselves, but also defend and heal their allies. Can also learn a skill to throw their shield at the enemy, but it's not very powerful.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Rapier,Spear,Boomerang,Heavy Armor",
        "Skills: Throwing",
        "Passive: Endure,Appeal",
      ]],
    7009 => # キャプテンシールド / Captain Shield
      [[
        "A hero renowned for their mastery of the shield. Has a unique style of equipping shields with both hands and is extremely strong. Their various defensive skills make them the guardian of the party. Can also convert their defense into attack and enhance their throwing skills.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Heavy Armor",
        "Skills: Throwing",
        "Passive: Double Shield,Super Endure",
        "　　　　　　Super Appeal,Shield Mastery",
      ]],
    7011 => # 究極剣士 / Ultimate Swordsman
      [[
        "The ultimate swordfighter who combines the sacred and monster sword arts to reach the heights of chaos. Excels at close combat with superior attack and defense alongside above-average agility. With skills that can deal with single foes or entire groups, they demonstrate effectiveness in any situation. A solid high-level warrior with no glaring flaws.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Great Sword,Rapier,Katana,",
        "       Armor,Heavy Armor,Helmet,Heavy Helmet,Shield,Heavy Shield",
        "Skill: Sword,Katana,Spellblade",
        "Passive: Sword/Katana Mastery+",
      ]],
    7012 => # フォースマスター / Force Master
      [[
        "A magical warrior who has mastered the powers of magic and taoism and has reached the realm of chaos, able to imbue superior chaos-element into their magical blades. In addition to sword skills, they also have the ability to use black magic and taoism. An overall extremely versatile fighter skilled in both swordplay and magic.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Rapier,Magic Sword,Katana,Scythe,Rod,Fan,",
        "       Armor,Helmet,Shield",
        "Skills: Sword, Black Magic, Taoism, Spellblade",
        "Passive: Mag Eva 15%,Auto-Hit Eva 10%,Mag Counter 100%,",
        "         Sword Mastery+,Spellblade Chaos Element Imbue",
      ]],
    7013 => # 神竜の騎士 / Divine Dragoon
      [[
        "A dragoon who has reached a godly realm through mastery of holy and dark power, reaching towards a glimpse of chaos. Unleashes spear skills with overwhelming agility to instantly silence foes, dealing even greater damage through their Vanguard ability should they act first. They are said to also learn an ultimate skill that imbues their spear with the galaxy's might.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Spear,Heavy Spear,Armor,Heavy Armor,Helmet,Heavy Helmet,",
        "       Shield,Heavy Shield",
        "Skills: Spear",
        "Passive: Eva 15%,Auto-Hit Eva 10%,Spear Mastery+",
        "",
      ]],
    7014 => # 修羅 / Shura
      [[
        "The ultimate samurai who has mastered holy and dark power, capable of even demonstrating chaos powers. Learn superior physical chaos skills of the carnage element, along with an ability to use katana and sword skills together in a chain. Despite some holes in their defense, the Shura's offensive capabilities are overwhelming.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Katana,",
        "Skills: Katana",
        "Passive: Eva +20%,Auto-Hit Eva 10%,Crit Rate 35%,Katana Mastery+",
        "",
      ]],
    7015 => # メテオブレイカー / Meteor Breaker
      [[
        "The ultimate heavy fighter of chaos who has mastered the axe, club, and flail. Wields unrivaled strength said to be capable of even shattering asteroids. Although poor with magic, their attack and defense are overwhelmingly high, and can learn many powerful skills and abilities specialized for offense.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Great Sword,Axe,Club,Flail,Armor,Heavy Armor,Helmet,",
        "       Heavy Helmet,Shield,Heavy Shield",
        "Skills: Axe,Club,Flail",
        "Passive: Crit Rate 35%, Ultimate Endure,Power Mastery+,",
        "         Double SP Charge",
      ]],
    7016 => # 拳神 / Fist Sage
      [[
        "A peerless martial artist who has mastered holy and dark martial arts, reaching the realm of chaos. Boasts overwhelming attack and agility to annihilate foes before they can act. Readily counters most attacks and has excellent evasion and critical rate as well. Despite having flawed defensive capabilities, their specialization in swift attacks make them incredibly reassuring.",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fist,Club,Gi",
        "Skills: Unarmed",
        "Passive: Eva 25%,Auto-Hit Eva 15%,Crit Rate 35%,",
        "         Counter/Mag Counter 100%,Fist Mastery+",
      ]],
    7017 => # 神の守護者 / Guardian of God
      [[
        "The ultimate fighter who devotes themselves to the Goddess with deep faith. Possesses extremely powerful martial arts and superior defensive abilities. They are also skilled with holy arts, and can sacrifice themselves to bring forth miracles. A very reliable presence on the battlefield that excels both offensively and defensively.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fist,Club,Staff",
        "Skills: Unarmed,White Magic,Holy",
        "Passive: Crit Rate 25%,Holy Skill Booster +100%,Fist Mastery+",
        "",
      ]],
    7018 => # 終焉魔導師 / Demise Mage
      [[
        "A magician who has mastered black magic, finally stepping into the realm of chaos. Learns extremely powerful black magic and can even utilize the demise element. Can also learn various abilities to strengthen offensive magic. Unsuited for physical offense and has low defense, so they must take caution.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Magic Sword,Scythe,Rod,Grimoire,Robe,",
        "       Magic Hat",
        "Skills: Black Magic,Dark",
        "Passive: Dark Skill Booster +100%,Magic Mastery+",
        "",
      ]],
    7019 => # 銀河魔導師 / Galaxy Mage
      [[
        "The ultimate time mage who has finally attained the ability to control the galaxy's movement. Can use galactic-element attack spells in addition to assisting in battles with powerful time magic. Galactic falls under the realm of chaos elements, and is incredibly powerful due to almost no foes resisting it. An extremely powerful spellcaster whose offense is second to none.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Magic Sword,Scythe,Rod,Grimoire,Robe,",
        "       Magic Hat",
        "Skills: Time Magic",
        "Passive: Magic Mastery+",
        "",
      ]],
    7020 => # 混沌召喚士 / Chaos Summoner
      [[
        "A forbidden summoner possessing the ability to call upon beings of chaos. The chaos entities summoned deal overwhelming damage to all foes. Pay attention however, to their high MP cost. Can also learn several other strong abilities suited to the use of summoning skills.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Magic Sword,Scythe,Rod,Grimoire,Robe,",
        "       Magic Hat",
        "Skills: Summoning",
        "Passive: Magic Mastery+",
        "",
      ]],
    7021 => # 太極陰陽師 / Taiji Immortal Taoist
      [[
        "The ultimate taoist who has mastered the art of taoism, reaching the realm of chaos. Learns terra- and galactic-element skills to deal outstanding damage. Does not suffer from low stats other than magic like most mages, allowing them to handle various situations. The ability to follow up taoism with summoning is also strong, making them a powerful force in battle.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Magic Sword,Rod,Fan,Robe,Magic Hat",
        "Skills: Taoism",
        "Passive: Eva/Mag Eva/Auto-Hit Eva 10%,Magic/Fan Mastery+",
        "",
      ]],
    7022 => # 永劫魔導師 / Eternity Mage
      [[
        "A mage who has mastered white magic, finally stepping into the realm of chaos. Learns eternal-element attack magic and can excel in offense as well. Also has access to many excellent recovery skills, allowing them to be used for both attacking and defending. With abilities that also boost the potency of white magic, they boast the top performance as healers.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Club,Whip,Staff,Grimoire",
        "Skills: White Magic,Holy",
        "Passive: Holy Skill Booster +100%,Magic Mastery+",
        "",
      ]],
    7023 => # ソーサラースプリーム / Magus Supreme
      [[
        "A transcendental being considered to be the pinnacle of mages. Wields all forms of magic from white to black and even time magic. Can also use multiple chaos elements as well with overwhelming offensive prowess. As a top-ranking mage, the Magus Supreme exhibits unmatched power.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Magic Sword,Club,Scythe,Whip,Staff,Rod,Fan,",
        "       Grimoire,Robe,Magic Hat",
        "Skills: White Magic,Black Magic,Time Magic,Summoning,Holy,Dark,",
        "        Taoism",
        "Passive:Holy/Dark Skill Booster +100%,MP Cost 50%,Magic Mastery+",
      ]],
    7024 => # アルティメット魔法少女 / Ultimate Magical Girl
      [[
        "The strongeset magical girl who has acquired the ultimate power. This magical power is also connected to chaos, enabling them to use the galactic and eternal elements. Also learns several useful magic abilities in addition to powerful attack skills. All stats increase drastically while transformed, making her an exceptional magical heroine.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Magic Sword,Scythe,Staff,Rod,Bow,Grimoire,Gun,Robe,",
        "       Magic Hat",
        "Skills: White Magic,Black Magic,Time Magic,Holy",
        "Passive: Holy Booster +100%, MP Regen 6%,Magic Mastery+",
      ]],
    7025 => # 狩神 / Supreme Hunter
      [[
        "The ultimate hunter who wields both holy and dark power. Their arrows are imbued with the power of chaos, allowing them to learn hadron-element bow skills. Has very high agility and accuracy, enabling them to shoot down foes with the first move with powerful species-slayer attacks. Despite lacking in defense, the job boasts great destructive capabilities.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Scythe,Bow,Whip,Boomerang",
        "Skills: Scythe,Bow,Whip,Throwing",
        "Passive: Eva 15%,Auto-Hit Eva 10%,Crit Rate 25%,",
        "         Slayer Booster 50%,Super Forest Strength,Bow Mastery+",
      ]],
    7026 => # 銃神 / Freischutz
      [[
        "Peerless gunner reaching the realm of chaos who has mastered both holy and dark gun skills. Learns carnage-element gun skills that display excellent offensive capabilities, as well as useful abilities which greatly enhance the power of gun skills. Although stats other than dexterity are low, the offensive capabilities more than make up for it.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gun",
        "Skills: Gun",
        "Passive: Slayer Booster 50%,Gun Mastery+",
      ]],
    7027 => # カオスバスター / Chaos Buster
      [[
        "Forbidden monster tamer who can even command beings of chaos. Can call upon apoptosis to unleash their overwhelming power in addition to learning the strongest whip skills to deliver chaos-imbued whip swings. Also very effective at slaying apoptosis, making them strong in battles against chaos entities.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Scythe,Whip,Boomerang",
        "Skills; Scythe,Whip",
        "Passive: Recruit Rate x5,Slayer Booster 50%,Whip Mastery+",
        "",
      ]],
    7028 => # パーフェクトアームズ / Perfect Arms
      [[
        "An all-rounder who wields various weapons as if they were extensions of their body, overwhelming foes with a powerful barrage of skills. From close combat to sharpshooting, they boast top-notch skills with all manner of arms. Can also strengthen normal attacks with the Chaotic Assault ability.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: All Weapons,Armor,Heavy Armor,Helmet,Heavy Helmet,Shield,",
        "       Heavy Shield",
        "Skills: Dagger,Sword,Rapier,Katana,Spear,Axe,Club,Scythe,Bow,",
        "        Whip,Throwing,Flail,Fan,Gun,Multiweapon",
        "Passive: Eva 15%,Auto-Hit Eva 10%,Crit Rate 25%,",
        "         Counter Rate 50%,Quadruple Attack,Dual Wield"
      ]],
    7029 => # 盗神 / Shadow Pilferer
      [[
        "Forbidden thief whose skills enter into the realm of chaos. Learns various skills related to stealing in addition to being extremely agile and evasive. Their chain allowing thievery skills to follow-up dagger skills is also very useful. They aren't very good at up-front combat however, and are unsuitable for the attacking role.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Whip,Boomerang",
        "Skills: Dagger,Throwing,Thievery",
        "Passive: Eva 25%,Auto-Hit Eva 15%,Crit Rate 25%,Nullify Ambush,",
        "         Preemptive Strike Up,Steal Rate x5,Dagger Mastery+",
        "",
      ]],
    7030 => # 忍神 / Phantom Shinobi
      [[
        "Forbidden ninja who has every ninjutsu in existence and now reaches into chaos. Learns terra-element ninjutsu in addition to the ultimate pleasure ninjutsu. Also acquires abilities to strengthen dual wielding, giving them exceptionally high offensive performance. Has poor defensive capabilities, so caution must be taken not to be on the receiving end of attacks.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Ninja Sword,Scythe,Sex Toy,Gi",
        "Skills: Ninjutsu",
        "Passive: Eva 15%,Auto-Hit Eva 15%,Crit Rate 25%,Dual Wield",
        "",
      ]],
    7031 => # 七海覇王 / Seven Seas Sovereign
      [[
        "A king of the pirates and admiral of the navy; a true ruler of the seven seas. Wields mighty piracy skills to pulverize foes with overwhelming force. Their base stats are very high and they are unrivaled in direct combat. Also has the ability to start battles with more than the maximum amount of SP.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Great Sword,Gun",
        "Skills: Sword,Gun,Piracy",
        "Passive: Crit Rate 25%,Super Sea Strength,SP Cost 50%,",
        "         Battle Start SP Overlimit +30%,Dual Wield",
      ]],
    7032 => # エクセルシオール / Excelsior
      [[
        "A superhero among superheroes who has become mythical. Displays unrivaled power with dramatically increased stats while transformed. The justice skills learned are also overwhelmingly powerful and capable of mowing down groups of foes. Aim ever higher!",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Fist",
        "Skills: Sword,Unarmed",
        "Passive: Indomitable Fighting Spirit,",
        "         Ultimate Strength in Solitude,Sword/Fist Mastery+",
      ]],
    7033 => # 商神 / Trade Magnate
      [[
        "A god of commerce who reigns over the world with their enormous wealth. Excels in the use of both top-level mercantile skills and item usage, and delivery skills they learn even allow them to purchase items of chaos. Has surprisingly high defensive capabilities but take caution as they aren't particularly suited to direct combat.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Boomerang,Abacus",
        "Skills: Throwing,Mercantile,EX-Item",
        "Passive: Gold Drop x4,Medicine Lore III,Boomerang/Abacus Mastery+",
        "",
      ]],
    7034 => # ラストサバイバー / Last Survivor
      [[
        "Ultimate survivalist who can survive in any situation. Has overall high stats except for magic on top of excellent survival capabilities. Can also learn useful abilities such as recovering large amounts of HP after winning battles. While not overwhelmingly powerful, it is a useful job for surviving.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Ninja Sword,Scythe,Bow,Boomerang",
        "Skills: Dagger,Throwing,Thievery,Ninjutsu,Piracy,EX-Item",
        "Passive: Eva 15%,Auto-Hit Eva 10%,Crit Rate 15%,",
        "         Super Desert/Cave Strength,Nullify Environmental Damage,",
        "         Boomerang Mastery+",
      ]],
    7035 => # ゴッドギャンブラー / God Gambler
      [[
        "Ultimate gambler who has reached a godly level. Learns very chancy skills with a razor-thin line separating glory and ruin. Can multiply experience gains by repeatedly doubling up, but it comes with heavy risk. If you are looking to add some luck to your battles, this is the job you'll want to include.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Staff,Rod,Card",
        "Skills: Oracle",
        "Passive: Item Drop Rate 400%,Gambling Luck III,Card Mastery+",
        "",
      ]],
    7036 => # 舞踏神 / Dance Maestro
      [[
        "Ultimate dancer who can tap into the galaxy's power. Learns a variety of powerful dances, including a galactic dance that can devastate foes, as well as abilities to enhance the effects of dances. Take note that base stats aren't very high and is fragile when exposed to enemy attacks.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Whip,Fan",
        "Skills: Fan,Dancing",
        "Passive: Eva 25%,Auto-Hit Eva 15%,Fan Mastery+",
        "",
      ]],
    7037 => # 歌唱神 / Virtuoso
      [[
        "Ultimate singer whose songs can reach even chaos. Learns singing skills that are especially effective against beings of chaos in addition to a full range of support skills to bring great blessings to allies. Extremely useful for the support role, but is weak in direct combat and needs to be careful.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Boomerang,Harp",
        "Skills: Singing",
        "Passive: Mag Eva 25%,Auto-Hit Eva 15%,Harp Mastery+",
        "",
      ]],
    7038 => # コズミックアイドル / Cosmic Idol
      [[
        "Ultimate superstar who has raised their abilities to galactic levels. Their songs and dances reach chaos and bring about great destruction. Can also learn support skills that use the galaxy's power. With their ability to sing and dance, they are worthy of being considered the apex of support roles.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Whip,Harp,Fan",
        "Skills: Fan,Dancing,Singing",
        "Passive: Eva/Mag Eva/Auto-Hit Eva 20%,Seduction Strike 30%,",
        "         Fan/Harp Mastery+",
      ]],
    7039 => # QOBF
      [[
        "Abbreviation for Queen of Battle Fuckers, a job which takes pleasure to its extremes. Boasts overwhelming pleasure-specialized capabilities, learning several powerful sexual skills in addition to having high pleasure tolerance with near-immunity to the pleasure element. The QOBF is an attacker with unmatched performance against pleasure-weak foes.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Whip,Fist,Sex Toy",
        "Skills: Whip,Unarmed,Sexcraft",
        "Passive: Horny/Trance/Seduction/Incontinence Strike 10%,",
        "         Crit Rate 25%,Eva 15%,Auto-Hit Eva 10%,Sex Toy Mastery+",
      ]],
    7040 => # 禁忌科学者 / Forbidden Scientist
      [[
        "Forbidden magic scientist who dabbles in taboo fields of study. Their techniques apply the power of the galaxy to cause destructive phenomena. They can also spread their MP and SP conversion techniques, granting the effects to allies. A magic attacker role that uses SP to display incredible power.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Rod,Scalpel,Grimoire,Gun",
        "Skills: Magic Science,Alchemy,Grimoire",
        "Passive: Magic Mastery+",
        "",
      ]],
    7041 => # トリスメギストス / Trismegistus
      [[
        "Ultimate alchemist who has mastered alchemy. The items they synthesize are extremely useful, capable of completely changing the tide of battle. Take note however, that these will consume more alchemy reagents. Stats are also not very high at all and below average for a sealed job apart from magic.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Staff,Rod,Grimoire",
        "Skills: Magic Science,Alchemy,Grimoire",
        "Passive: Alchemy Material Auto-collection 50%,Magic Mastery+",
        "",
      ]],
    7042 => # アカシックレコード Akashic Record
      [[
        "Ultimate magic librarian who has obtained forbidden power. Can step into the realm of chaos and even cast nano-element magic. These spells are much more powerful than regular magic, but take note they consume several pages. Also learns various abilities suited to the use of grimoires.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Staff,Rod,Grimoire",
        "Skills: Magic Science,Alchemy,Grimoire",
        "Passive: Magic Mastery+",
        "",
      ]],
    7043 => # ゴッドマシーナリー / God of Machinery
      [[
        "Forbidden machinist capable of even using makina created from chaos. Demonstrates overwhelming destructive power when using extremely powerful unknown makina. However, these cannot be used naturally if you haven't found the makina yet. Their high offensive and defensive stats make them very useful as attackers.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Club,Gun",
        "Skills: Makina",
        "Passive: Gun Mastery+",
        "",
      ]],
    7044 => # 究極魔芸師 / Magicraft Master
      [[
        "Ultimate seeker who has mastered the three magicrafts of necromancy, spiritualism, and puppetry.  Displays overwhelming power using the strongest techniques learned from each magicraft. Also learns several useful skills such as charging for magic and dexterity. With high stats overall, they can be useful in any situation.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Scythe,Staff,Rod,Whip,Scalpel,Grimoire,Gun,Robe,Magic Hat",
        "Skills: Scythe,Black Magic,Summoning,Makina,Medicine,Corpse,",
        "        Artificial",
        "Passive: Magic Mastery+",
        "",
      ]],
    7045 => # 言霊神 / Word Weaver
      [[
        "Ultimate user of reality-altering words who has reached the realm of chaos. Can use various talk skills with very powerful effects such as increasing the number of actions, displaying excellent capabilities in the support role. Their stats are low apart from their agility and dexterity however, so they must be used carefully.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Rapier,Boomerang,Gun",
        "Skills: Throwing,Talk",
        "Passive: Boomerang Mastery+",
        "",
      ]],
    7046 => # 料理神 / Master Chef
      [[
        "Ultimate cook who has finally stepped into the realm of chaos. Can prepare dishes capable of even displaying galactic power. Also capable of making dishes from nothing without any ingredients. The abilities they learn to strengthen cooking are useful and offer great effectiveness for supporting.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger,Scythe,Kitchen Knife",
        "Skills: Dagger,Cooking",
        "Passive: Kitchen Knife Mastery+",
        "",
      ]],
    7047 => # 禁医 / Forbidden Medic
      [[
        "A doctor who has dabbled in forbidden medical techniques, learning many extremely useful medicine skills. By specializing in recovery and support, they are able to greatly bolster their party. Also learns offensive skills, allowing them to display all-around power.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Staff,Scalpel",
        "Skills: Dagger,Medicine",
        "Passive: Eva 15%,Auto-Hit Eva 10%,Scalpel Mastery+",
        "",
      ]],
    7048 => # ゴッドメイド / Paragon Maid
      [[
        "Ultimate supreme maid whose skills reach a divine realm. Exhibits all-around offense, recovery, support and pleasure with their service. Has above average stats all around, allowing them to perform any role.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fan,Whip,Plate,Sex Toy",
        "Skills: Whip,Service",
        "Passive: Eva/Mag Eva/Auto-Hit Eva 15%,Plate Mastery+",
        "",
      ]],
    7049 => # オールジョブラウンダー / Grand All-Rounder
      [[
        "A truth seeker who has mastered countless crafts through many",
        "professions. Being versed in all professions, they can use all",
        "job-related skills, and learn abilities to enhance these various",
        "skills to increase their power. Can also learn an ability to",
        "triple job experience gained.",
      ],
      [
        "Equip: Dagger,Rapier,Club,Scythe,Staff,Rod,Whip,Harp,Boomerang,",
        "       Fan,Kitchen Knife,Abacus,Scalpel,Card,Plate,Grimoire,",
        "       Sex Toy,",
        "Skills: Mercantile,EX-Item,Oracle,Dancing,Singing,Talk,",
        "        Magic Science,Alchemy,Grimoire,Makina,Cooking,Medicine,",
        "        Service,Sexcraft",
        "Passive: Dual Wield",
      ]],
    7050 => # 覇王 / Supreme Ruler
      [[
        "The greatest king in the world who reigns above all other",
        "sovereigns. Overpowers foes both physically and magical with",
        "their immense power. Has has incredible combat prowess and",
        "learns many abilities suited for battle. A job boasting great",
        "power all around that can be relied upon any time.",
      ],
      [
        "Equip: Sword,Knight Sword,Great Sword,Rapier,Magic Sword,Staff,",
        "       Rod,Grimoire,Armor,Heavy Armor,Robe,Helmet,Heavy Helmet,",
        "       Magic Hat,Shield,Heavy Shield",
        "Skills: Sword,Black Magic,White Magic,Time Magic,Holy,Ruling",
        "Passive: Crit Rate 20%,Magic Eva 20%,Auto-Hit Eva 10%,",
        "         Holy Skill Booster +100%, HP Regen 20%,MP Regen 4%,",
        "         Magic Reflect 50%,Sword/Magic Mastery+",
      ]],
    7051 => # 混沌の勇者 / Hero of Chaos
      [[
        "Forbidden hero who has mastered both light and darkness,",
        "transforming them into chaos. Learns carnage-element skills in",
        "addition to holy and dark techniques. Has very high stats",
        "overall apart from dexterity and demonstrates overwhelming",
        "combat prowess. With the wide array of abilities acquired, it is",
        "worthy of being called the apex of vanguard jobs.",
      ],
      [
        "Equip: Dagger,Sword,Knight Sword,Great Sword,Rapier,Spear,",
        "       Heavy Spear,Axe,Club,Scythe,Boomerang,Armor,Heavy Armor,",
        "Helmet,Heavy Helmet,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Holy,Heroism",
        "Passive: Crit Rate 25%,Holy Skill Booster +100%,SP Regen 20%,",
        "         Sword Mastery+",
      ]],
    7052 => # サイコトリニティ / Psycho Trinity
      [[
        "Forbidden user of auras who has mastered psychic power, stepping into the realm of chaos. Can create nuclear flames with telekinesis to wreak destruction upon enemy groups. They also have high magic and dexterity and are able to use black magic and pleasure skills. The Psycho Trinity is an almighty job that can overwhelm foes with a variety of skills.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Magic Sword,Rod,Sexy Toy",
        "Skills: Sword,Black Magic,Psychic,Sexcraft",
        "Passive: MP Regen 6%,Sword/Sex Toy Mastery+",
        "",
      ]],
    7053 => # ラストノーブル / Last Noble
      [[
        "Forbidden rapier user who has perfected their technique to the limits, approaching the realm of chaos. Can imbue the tips of their blades with galactic power and ruthlessly pierce even the sturdiest foes. Their skills inflict many hits, further increased with abilities. Their damage against bosses is also greater, making them reassuring as high-speed attackers.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Rapier,Spear",
        "Skills: Rapier",
        "Passive: Physical Reflect 50%,Boss Slayer 40%,Rapier Mastery+",
      ]],
    7054 => # 禁忌妖術師 / Forbidden Sorcerer
      [[
        "Forbidden user of sorcery who has refined their art to the point of being taboo. Has high stats all-around and can use various learned skills as sorcery. Can also learn abilities to enhance special skills in addition to sorcery. Should one master the use of sorcery, they will be capable of demonstrating tremendous power.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Magic Sword,Fist,Scythe,Staff,Rod,Fan",
        "Skills: Sorcery",
        "Passive: Learning, Scythe Mastery+",
        "",
      ]],
    7055 => # シールドヒーロー / Shield Hero
      [[
        "Genuine hero who protects the party with their sturdy shields. Holding a shield in each hand, they defend allies from all kinds of threats. The skills they learn are solely dedicated to the protection of their friends. With one in your party, you can drastically reduce the damage you suffer.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Armor,Heavy Armor,Helmet,Heavy Helmet,Buckler,Shield,",
        "       Heavy Shield",
        "Skills: Throwing",
        "Passive: Dual Shield,Ultimate Endure,Super Appeal,Super Defense",
        "         Shield Mastery+",
      ]],
    7056 => # 超魔生物 / Superior Being
      [[
        "A fighter who has modified their body to its utmost form. Specializes in the use of monster skills, drastically enhancing their power. The additionally reduced SP costs of these skills makes them excellent in prolonged battles. However, this job won't be able to show its true potential if you use weapons or magic.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang",
        "Skills: All Racial Skills",
        "Passive: Crit Rate 35%, Racial Skill Over-Booster",
        "",
      ]],
    7057 => # 剣ヲ極メシ者
      [[
        "剣を極めし者の禁職で、その剣は星をも斬ると伝えられる",
        "圧倒的な体力と攻撃力を秘め、禁断の剣技の数々を習得する",
        "SP消費を極端に抑えるアビリティも覚え、強力スキルを連発可能",
        "前衛役として脅威の力を振るう事は間違いない",
      ],
      [
        "Equip: 短剣　剣　騎士剣　巨剣　尖剣　魔導剣　刀",
        "Skills: 短剣技　剣技　尖剣技　刀技　黒魔法　陰陽術　魔法剣",
        "Passive: 重装備可能　剣・刀ハイマスタリー＋　SP消費1/4",
        "　　　　　　魔法剣で上位混沌属性発動　剣技・刀技の後にガード",
        "",
      ]],
    7058 => # 全テヲ穿ツ者
      [[
        "全てを穿つ者の禁職で、その一撃は太陽をも貫くという",
        "尖剣や槍の技術を極め、驚異的な素早さで敵を穿つ",
        "連撃数も極めて多く、ヒット数が多くなるほど威力が上がる特性を持つ",
        "また相手の物理耐性を無視してダメージを与えられる",
      ],
      [
        "Equip: 尖剣　槍　重槍",
        "Skills: 尖剣技　槍技",
        "Passive: 重装備可能　物理反射50%　物理耐性貫通",
        "　　　　　　ヒートアップコンボ　槍・尖剣ハイマスタリー＋",
        "",
      ]],
    7059 => # 全テヲ壊ス者
      [[
        "全てを壊す者のための禁職で、その一撃は銀河をも滅するという",
        "斧に棍、鉄球の技能を極め、圧倒的な超パワーで敵を討ち滅ぼす",
        "防御力も高く、正面戦闘だと最強の力を発揮",
        "魔法には全く適していないが、物理系では最高の攻め手となる",
      ],
      [
        "Equip: 巨剣　斧　棍　鉄球",
        "Skills: 斧技　棍技　鉄球技",
        "Passive: 超食いしばり　重装備可能　SPチャージ3倍",
        "　　　　　　チェーンスキル超強化　パワーハイマスタリー＋",
        "",
      ]],
    7060 => # 拳ヲ極メシ者
      [[
        "拳を極めし者のための禁職で、その拳は天地を逆転させるという",
        "会心やカウンターを必ず発動し、究極の武力を誇る",
        "また、究極の破壊力を備えた格闘技を習得することが可能",
        "攻撃力も素早さも並外れており、絶対的な殲滅力を発揮するだろう",
      ],
      [
        "Equip: 拳　棍",
        "Skills: 格闘",
        "Passive: 完全カウンター　完全魔法カウンター",
        "　　　　　　武道着装備可能　拳ハイマスタリー＋",
        "　　　　　　反撃ダメージ4段階強化　回避時ラッシュタイム発動",
        "",
      ]],
    7061 => # 全テヲ護ル者
      [[
        "全てを護る者のための禁職で、隕石衝突の衝撃さえ防ぎきるという",
        "強力な防御技を複数習得し、パーティ全員を敵の攻撃から守護する",
        "また強力な聖技や盾投擲技も習得し、攻撃に転じる事も可能",
        "自身の体力や防御力も圧倒的で、生存率は極めて高い",
      ],
      [
        "Equip: 短剣　拳　棍　杖",
        "Skills: 投擲技　格闘　白魔法　聖技",
        "Passive: 聖技大幅威力アップ　全ダメージ半減　ダブルシールド",
        "　　　　　　武道着装備可能　重装備可能　超食いしばり　超アピール",
        "　　　　　　拳・ブーメラン・盾ハイマスタリー＋",
      ]],
    7062 => # 千ノ武具ヲ極メシ者
      [[
        "千の武具を極めし者のための禁職で、あらゆる武具を使用可能",
        "覚える乱撃スキルやアビリティは破壊的な威力を誇る",
        "また、武技スキルを二連続で繰り出すアビリティも習得可能",
        "能力値も魔力以外は極めて高く、前衛で無二の力を発揮する",
      ],
      [
        "Equip: 武器全て",
        "Skills: 短剣技　剣技　尖剣技　刀技　槍技　斧技",
        "　　　　棍技　鎌技　弓技　鞭技　投擲技　鉄球技",
        "　　　　扇技　銃技　多武器技",
        "Passive: 三刀流　三刀流強化　皆伝乱れ撃ち　武技全体化",
        "　　　　　　超ヒートアップコンボ　通常武器ハイマスタリー＋",
        "",
      ]],
    7063 => # 全テヲ識ル者
      [[
        "全てを識る者のための禁職で、並外れた力ゆえ封じられていた",
        "絶大な魔力をもって、万物の運行をも制するという",
        "太古に存在した究極魔法を習得し、この世の全てを支配する",
        "また魔法使用をサポートする数々のアビリティも極めて強力",
      ],
      [
        "Equip: 魔導剣　鎌　杖　ロッド　扇　魔導書",
        "Skills: 白魔法　黒魔法　時魔法　召喚　聖技　闇技",
        "　　　　陰陽術",
        "Passive: 聖技・闇技最大限威力アップ　魔法全体化　MP消費1/4",
        "　　　　　　ウィッチタイム　時間停止無視　魔防具装備可能",
        "　　　　　　魔法ハイマスタリー＋",
      ]],
    7080 => # 全てを癒す者
      [[
        "究極の癒しを与える禁職で、救世主として信仰されていた",
        "神業に等しい回復術を使いこなし、控えの仲間をも癒す",
        "回復技の他に、数多くのサポート技で味方を補佐",
        "防御性能も決して低くなく、激戦の中でも生残性が高い",
      ],
      [
        "Equip: 杖　ロッド　メス　魔導書",
        "Skills: 格闘　白魔法　聖技　医術",
        "Passive: 聖技大幅威力アップ　MP消費1/2　超食いしばり",
        "　　　　　　戦闘開始時、ディフレクト2枚発動",
        "　　　　　　戦闘不能になっても一度だけ自動復活",
        "",
      ]],
    7064 => # 全テヲ撃チ抜ク者
      [[
        "全てを撃ち抜く者のための禁職で、星さえ撃ち抜くという",
        "弓矢と銃を極め、圧倒的な器用さで狙撃スキルを使用できる",
        "各種特攻の効果も大幅にアップし、狙った魔物を効率的に排除可能",
        "防御面では難があるが、殲滅力に長けた攻撃役である",
      ],
      [
        "Equip: 弓矢　銃",
        "Skills: 弓技　銃技",
        "Passive: 種族特攻超強化　状態異常特攻超強化",
        "　　　　　　弓・銃ハイマスタリー＋",
      ]],
    7065 => # 音ヨリモ速キ者
      [[
        "音よりも速き者のための禁職で、その速さは視認さえ不可能だという",
        "強力な短剣技や忍術を使用可能で、圧倒的な速度で敵をねじ伏せる",
        "回避率も異常なまでに高く、ほとんどの攻撃を高確率で回避可能",
        "混沌属性さえ回避でき、結果的に被ダメージを大幅に減少させられる",
      ],
      [
        "Equip: 短剣　忍者刀　ブーメラン　淫具",
        "Skills: 短剣技　投擲技　盗賊技　忍術　淫技",
        "Passive: 盗む確率5倍　不意打ち無効　先制攻撃アップ",
        "　　　　　　二刀流　二刀流強化　武道着装備可能",
        "　　　　　　短剣・忍者刀・ブーメランハイマスタリー＋",
        "　　　　　　回避時にソフィスティケイト発動",
      ]],
    7066 => # 極マリシ偶像
      [[
        "極まりし偶像のための禁職で、その存在は象徴と化している",
        "歌と踊りを極限まで極め、銀河のエネルギーを付加する事が可能",
        "サポート系の歌や踊りの効果も高く、味方全体を大幅に強化する",
        "自身の能力値は高くはないが、支援役として抜群の働きを見せるだろう",
      ],
      [
        "Equip: 短剣　尖剣　鞭　竪琴　扇",
        "Skills: 扇技　踊る　歌う",
        "Passive: 通常攻撃誘惑50%　扇・竪琴ハイマスタリー＋",
        "　　　　　　カウンターでハッスルダンス確率発動",
      ]],
    7067 => # 快楽ヲ極メシ者
      [[
        "快楽を極めし者のための禁職で、老若男女から無生物まで絶頂可能",
        "最高レベルの快楽技に加え、サイコに属するスキルも習得出来る",
        "当然ながら器用さは最高レベルで、快楽攻撃に本領を発揮",
        "また自身に快楽は一切通じず、ガード面でも完璧である",
      ],
      [
        "Equip: 鞭　拳　淫具",
        "Skills: 鞭技　格闘　淫技　サイコ",
        "Passive: 通常攻撃敏感15%　通常攻撃恍惚15%",
        "　　　　　　通常攻撃誘惑15%　通常攻撃失禁15%",
        "　　　　　　快楽・ナイトメア属性無効　絶頂・快楽状態異常無効",
        "　　　　　　鞭・扇・淫具ハイマスタリー＋",
        "",
      ]],
    7068 => # 真理ノ探究者
      [[
        "真理の探究者のための禁職で、求道を極めているという",
        "魔導科学から錬金術、マキナの扱い、魔芸にまで通じている存在",
        "最高レベルの威力を持つ各種スキルを習得し、攻め手は極めて多い",
        "扱える混沌属性の数も多く、攻撃役として無類の性能を誇る",
      ],
      [
        "Equip: 短剣　鎌　棍　杖　ロッド　鞭　メス　魔導書　銃",
        "Skills: 鎌技　黒魔法　召喚　魔導科学　錬金術　魔本術　マキナ",
        "　　　　医術　屍技　造技",
        "Passive: 備蓄獲得　魔防具装備可能　魔法・銃ハイマスタリー＋",
        "　　　　　　カウンターでソフィスティケイト確率発動",
      ]],
    7069 => # 万職ヲ極メシ仕事人
      [[
        "万職を極めし仕事人のための禁職で、幾多のスキルを習得",
        "天地の法則と俗世間の雇用情勢を崩壊させると伝えられる",
        "職業スキルを大幅に強化する禁断のアビリティを多く習得",
        "特に職技が二連続で発動するアビリティは極めて強力である",
      ],
      [
        "Equip: 短剣　尖剣　棍　鎌　杖　ロッド　鞭　竪琴",
        "　　　　　ブーメラン　扇　包丁　そろばん　メス",
        "　　　　　カード　皿　魔導書　銃　淫具",
        "Skills: 商技　EXアイテム　オラクル　踊る　歌う　話す　魔導科学",
        "　　　　錬金術　魔本術　マキナ　料理　医術　御奉仕　淫技",
        "Passive: 薬の知識3　三刀流　三刀流強化　職技全体化",
        "　　　　　　獲得ゴールド・ドロップ率5倍　職業武器ハイマスタリー＋",
      ]],
    7070 => # 英雄王
      [[
        "数々の武技を極め、伝説そのものと化した禁断の英雄王",
        "天地を乱すほどの武力を誇り、神をも威圧するとされる",
        "究極の剣技や、常識外れのアビリティを習得可能",
        "強敵との戦いにも強く、歴史に残る強さを発揮する",
      ],
      [
        "Equip: 剣　騎士剣　巨剣　尖剣　魔導剣　杖　ロッド　魔導書",
        "Skills: 剣技　白魔法　黒魔法　時魔法　聖技　王技　勇者技",
        "Passive: 聖技大幅威力アップ　毎ターンHP20%回復",
        "　　　　　　毎ターンSP20%回復　毎ターンMP4%回復　ボス特攻50%",
        "　　　　　　ボスからのダメージ軽減　重装備・魔防具装備可能",
        "　　　　　　消費SP半減　剣・魔法ハイマスタリー＋",
      ]],
    7073 => # 破滅事象
      [[
        "異世界を破滅させ、存在を禁じられていた究極の闘士",
        "魔物技の威力を圧倒的に高め、全てを消滅させる",
        "習得できるアビリティも、世の理を歪めるほどのもの",
        "武器も魔法も使えないが、破滅的な力を擁した存在である",
      ],
      [
        "Equip: 牙",
        "Skills: 全魔物技",
        "Passive: 魔物技マキシブースター",
        "",
      ]],
    7071 => # ジャッジメント
      [[
        "世界そのものを裁くべく地上に降臨した審判者",
        "その威光により、あらゆる邪悪をたちまち消滅させる",
        "聖技の最高奥義や、人智を超えたアビリティを習得可能",
        "その能力値も極めて高く、神さえ凌駕するほどの力を誇る",
      ],
      [
        "Equip: 剣　騎士剣　魔導拳　杖　ロッド　魔導書",
        "Skills: 剣技　黒魔法　白魔法　時魔法　聖技　勇者技",
        "Passive: 聖技究極威力アップ　全攻撃永劫付加",
        "　　　　　　永劫吸収　時間停止無視　全武器マスタリー＋",
      ]],
    7072 => # ワールドブレイカー
      [[
        "世界を破壊するために現れた万物の破壊者",
        "次元そのものを消滅させ、無へと還してしまうという",
        "闇技の最高奥義や、人智を超えたアビリティを習得可能",
        "その能力値も極めて高く、神さえ凌駕するほどの力を誇る",
      ],
      [
        "Equip: 剣　騎士剣　魔導剣　銃",
        "Skills: 剣技　闇技　勇者技",
        "Passive: 闇技究極威力アップ　全攻撃終焉付加",
        "　　　　　　終焉吸収　時間停止無視　全武器マスタリー＋",
      ]],
    7074 => # 虚職 / Neveremployed
      [[
        "A nonexistent intermediate extension of Unemployed. Learns no new skills at all, even as its job level is raised. Has overall poor stats and is an ordeal to train in of itself. Mastering it however can allow you to access an advanced Unemployed job.",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger",
        "Skills: None",
        "Passive: None",
        "",
      ]],
    7075 => # 空職 / Nullemployed
      [[
        "A nonexistent advanced extension of Unemployed. Learns no new skills at all, even as its job level is raised. Has overall average stats and cannot be considered particularly strong. Mastering it however can allow you to access a sealed Unemployed job.",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger",
        "Skills: None",
        "Passive: None",
        "",
      ]],
    7076 => # 零職 / Voidemployed
      [[
        "A nonexistent sealed extension of Unemployed. Learns no new skills at all, even as its job level is raised. Has overall high stats, but its lack of innate abilities makes them difficult to utilize. However, once you master this job...",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger",
        "Skills: None",
        "Passive: None",
        "",
      ]],
    7077 => # 職無キ者 / Jobless
      [[
        "A nonexistent forbidden extension of Unemployed. Has overall high stats, but its lack of innate abilities makes them difficult to utilize. The abilities it can learn however, are extremely powerful. Take this an an opportunity to learn abilities for all of your hard work.",
        "",
        "",
        "",
      ],
      [
        "Equip: Dagger",
        "Skills: None",
        "Passive: None",
        "",
      ]],
    7078 => # もんむす・くえすと！
      [[
        "もんむすの頂点にして到達点",
        "本当にお疲れ様でした",
        "",
        "",
      ],
      [
        "Equip: 全て",
        "Skills: 全て",
        "Passive: なし",
        "",
      ]],

    151 => # 人間 / Human
      [[
        "A pure, commonplace human. Fairly talkative, armor that can be equipped depends on the individual. Humans learn many abilities related to experience point acquisition.",
        "",
        "",
        "",
      ],
      [
        "Equip: None",
        "Skills: Talk",
        "Passive: None",
        "",
      ]],
    152 => # 魔人 / Demonoid
      [[
        "A descendant of man who has awakened to their dark powers. Can manipulate time and learns exclusive scythe skills. Extremely high stats allow them to excel in all situations.",
        "",
        "",
        "",
      ],
      [
        "Equip: Sword,Scythe,Clothes,Armor,Heavy Armor,Robe,Dress,Skimpy,",
        "   Hat,Helmet,Heavy Helmet,Magic Hat,Fancy Cap,Buckler,Shield,",
        "   Heavy Shield",
        "Skills: Sword,Scythe,Unarmed,Black Magic,Time Magic,",
        "　　　Dark,Demon Arts",
        "Passive: Sword/Katana/Fist/Scythe/Magic Mastery, Contract of Darkness",
        "",
      ]],
    153 => # 魔神 / Archfiend
      [[
        "A Demonoid manifesting the bloodline of a fallen angel. Possesses power rivaling that of a god. Strong dark and time magic allows them to control time and space. Specializes in the Carnage element and learns several boosting and resistance abilities.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sword,Scythe,Clothes,Armor,Heavy Armor,Robe,Dress,Skimpy,",
        "   Hat,Helmet,Heavy Helmet,Magic Hat,Fancy Cap,Buckler,Shield,",
        "   Heavy Shield",
        "Skills: Scythe,Time Magic,Holy,Dark",
        "Passive: Null HP Cost, Sword/Scythe/Magic Mastery+",
        "",
      ]],
    154 => # 超魔神 / Super Archfiend (Original description states it can equip scythes, but isn't present in class data)
      [[
        "A mighty Archfiend possessing even greater power. They are able to use dark skills without sacrificing HP in addition to skills which stop time. With incredibly high stats all around and a near-invincible set of elemental resistances, the Super Archfiend is a being beyond mortal ken that is able to fulfill any role effectively.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: All Armors A",
        "Skills: Sword,Scythe,Unarmed,Time Magic,Holy,Dark",
        "Passive: Holy/Dark Skill Booster 100%, Null HP Cost,",
        "　        Time Stop Immunity Sword/Scythe Mastery+",
        "",
      ]],
    7412 => # 混沌の魔神
      [[
        "混沌の力をも極めた究極の魔神",
        "神の領域をも超越し、混沌そのものに極めて近い",
        "絶大なる能力値と耐性を備え、その力は万能にして究極",
        "習得できるアビリティも極めて強力である",
      ],
      [
        "Equip: 全防具SSS",
        "Skills: 剣技　鎌技　格闘　時魔法　聖技　闇技　カオス",
        "Passive: 聖技・闇技最大限威力アップ　鎌・重装備可能",
        "　　　　　　闇の支配者　物理・快楽反射　時間停止無視",
        "　　　　　　剣・鎌・魔法マスタリー＋",
      ]],
    155 => # ワームサマナー / Worm Summoner
      [[
        "A human mage who has integrated a Homunculus into their body at a cellular level and is no longer human. Attacks with tentacle skills and HP draining attacks. Can also automatically regenerate MP during battle.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Robe,Dress,Skimpy,Hat,Magic Hat",
        "   Buckler",
        "Skills: Black Magic,Summoning,Slime,Tentacle",
        "Passive: Mag Eva +20%,MP Regen +1%",
        "",
      ]],
    156 => # マスターホムンクルス / Master Homunculus
      [[
        "A grotesque human being whose cells were mixed with those of a homunculus, increasing their power significantly. The Master Homunculus possesses tentacles that are used to prey on its enemies by absorbing their HP and MP, even devouring them whole.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Robe,Dress,Skimpy,Hat,Magic Hat",
        "   Buckler",
        "Skills: Black Magic,Summoning,Slime,Tentacle",
        "Passive: Mag Eva +20%,MP Regen +2%",
        "",
      ]],
    157 => # ワームエンプレス / Worm Empress
      [[
        "An empress among tentacle summoners who can command the ultimate worms, designated as a sealed race due to their immense, abominable power. With their countless tentacles, they are capable of draining the energy of any living creature. Also learns a chain ability that can follow up tentacle skills with summoning.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes B,Breastplate C,Robe A,Dress B,Skimpy B,Hat B,",
        "       Magic Hat A,Buckler C",
        "Skills: Black Magic,Summoning,Tentacle",
        "Passive: Mag Eva 20%,Auto-Hit Eva 10%,MP Regen 4%,",
        "         Crisis MP Cost 50%",
      ]],
    7413 => # 万魔の宿主
      [[
        "あらゆる魔物細胞をその身に宿す禁断の存在",
        "次元侵蝕者の干渉を受けているがゆえ、禁種とされていた",
        "魔力によってワームを操り、次元規模の魔導も発動可能",
        "快楽や属性耐性も高く、強大な魔力を存分に行使できる",
      ],
      [
        "Equip: 服SS　胸当てS　ローブSSS　ドレスSS",
        "　　　　　薄着SS　帽子SS　魔帽SSS　軽盾S",
        "Skills: 黒魔法　召喚　触手技",
        "Passive: 毎ターンMP8%回復　瀕死時MP消費ゼロ",
      ]],
    158 => # 妖魔 / Yoma
      [[
        "The monster race with the highest magical power and intelligence. Yoma are strong and utilize magnificent Rapier skills. Their magical prowess is often put to use in fire magic, roasting their enemies alive. They wear heavy armor and have no particular weaknesses.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Heavy Armor,Robe,Dress,Skimpy,Hat,Helmet",
        "   Heavy Helmet,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Rapier,Black Magic,Dark,Demon Arts",
        "Passive: Rapier Booster 20%",
        "",
      ]],
    159 => # 上級妖魔 / High Yoma
      [[
        "A race with a prestigious pedigree among the Yoma. Proud of their high combat efficiency with rapiers and fire magic. Learns more effective magic eyes and numerous other attacks. An all-purpose race that excels in any combat situation.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Heavy Armor,Robe,Dress,Skimpy,Hat,Helmet",
        "   Heavy Helmet,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Rapier,Black Magic,Dark,Demon Arts",
        "Passive: Rapier Booster 20%",
        "",
      ]],
    160 => # 妖魔貴族 / Noble Yoma
      [[
        "The highest rank of Yoma, boasting a noble lineage. They hold tremendous magic power capable of reducing any foe to ash. Their ability with a rapier is superb, having acquired the Yoma secrets of the weapon. Extraordinary stats.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Heavy Armor,Robe,Dress,Skimpy,Hat,Helmet",
        "   Heavy Helmet,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Rapier,Black Magic,Dark,Demon Arts",
        "Passive: Rapier Booster 20%",
        "",
      ]],
	161 => # 聖魔 / Holy Yoma
      [[
        "An unusual Yoma who acquired holy power through mutation. Learns Holy attacks in addition to White Magic. Can use magic eyes to heal allies. Attack power is less than a yoma, but their magic is extremely strong.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Robe,Dress,Skimpy,Hat,Helmet,Magic Hat",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Rapier,White Magic,Black Magic,Holy,Dark,Demon Arts",
        "Passive: Rapier Booster 20%",
        "",
      ]],
    162 => # 神魔 / Divine Yoma
      [[
        "A sacred Yoma worshiped as a god, wielding powerful Lightning magic and smiting enemies with Holy might. The Divine Yoma's eyes possess powerful magic that can revive the dead and heal severe wounds. With excellent attack and recovery skills, the Divine Yoma is a dependable race.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Robe,Dress,Skimpy,Hat,Helmet,Magic Hat",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Rapier,White Magic,Black Magic,Holy,Dark,Demon Arts",
        "Passive: Rapier Booster 20%",
        "",
      ]],
    163 => # 半獣妖魔 / Bestial Yoma
      [[
        "A subspecies of Yoma with the lower half of a beast. The bestial parts such as claws and fangs can shred foes, while the Yoma parts provide strong magic, especially ice. A reliable species in all aspects of combat.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Breastplate,Armor,Robe,Dress,Skimpy,Hat",
        "   Helmet,Fancy Cap,Buckler,Shield",
        "Skills: Rapier,Black Magic,Dark,Demon Arts,Beast",
        "Passive: Crit +15%,Eva +20%,Rumble,Rapier Booster 20%",
        "",
      ]],
    164 => # 邪獣妖魔 / Feral Yoma
      [[
        "A high class Yoma whose body has awoken to the true power of Beast monsters, harnessing the destructive power within them to unleash devastating physical attacks. Combined with mastery over Ice magic, this race is perfectly suited for offensively-oriented roles.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Breastplate,Armor,Robe,Dress,Skimpy",
        "   Hat,Helmet,Fancy Cap,Buckler,Shield",
        "Skills: Rapier,Black Magic,Dark,Demon Arts,Beast",
        "Passive: Crit +15%,Eva +20%,War Rumble",
        "   Rapier Booster 20%",
      ]],
    165 => # 古神 / Ancient Deity
      [[
        "Harboring powerful genes from a bygone age, the Ancient Deity wields ancient powers from both Holy and Dark skills alike. Because of their nature as a monster, the Ancient Deity can use a variety of pleasure attacks. With a variety of powerful physical and pleasure attacks, the Ancient Deity's power is unparalleled.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Breastplate,Armor,Robe,Dress,Skimpy",
        "   Hat,Helmet,Fancy Cap,Buckler,Shield",
        "Skills: Rapier,White Magic,Black Magic,Holy,Dark,Demon Arts",
        "   Beast",
        "Passive: Eva +20%,Rapier Booster 30%",
      ]],
    166 => # 魔王 / Monster Lord
      [[
        "Sovereign who reigns supreme over all monsters. Possesses the genes of various monsters and boasts overwhelming power. Due to their lineage, the Monster Lord is able to use dark skills with only half of their usual HP cost. Learns extremely powerful skills, including the ultimate fire and dark techniques.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes B,Breastplate B,Armor A,Heavy Armor A,",
        "       Robe A,Dress A,Skimpy A,Hat B,Helmet A,Heavy Helmet A,",
        "       Magic Hat A,Fancy Cap A,Buckler B,Shield B,Heavy Shield A,",
        "Skills: Rapier,White Magic,Black Magic,Dark,Demon Arts,Beast",
        "Passive: Rapier/Fang Booster 20%,Dark Skill/",
        "         Dark Element Booster 100%,Dark skill HP Cost 50%",
      ]],
    7414 => # 大魔王
      [[
        "闇の世界に君臨する究極の魔王",
        "その力は神に並ぶとされ、存在自体が禁じられている",
        "究極の炎魔法や尖剣技、また世界を闇に閉ざす奥義を修得",
        "攻撃力も魔力も最高クラスを誇り、あらゆる敵を破壊する",
      ],
      [
        "Equip: 服SS　胸当てSS　鎧SSS　重鎧SSS　ローブSSS",
        "　　　　　ドレスSSS　薄着SSS　帽子SS　兜SSS　重兜SSS",
        "　　　　　魔帽SSS　高級帽SSS　軽盾SS　盾SS　重盾SSS",
        "Skills: 尖剣技　白魔法　黒魔法　闇技　魔技　獣技",
        "Passive: 尖剣・牙威力アップ　闇技最大限威力アップ",
        "　　　　　　闇属性スキルHP消費1/4　牙装備可能",
      ]],
    167 => # 亜人 / Demi-Human
      [[
        "Monsters that resemble humans. Aside from HP and magic, their stats are mostly identical to humans. Draining hair, frisky tongue, and oriental ice magic sets them apart. A similar build to humans allows for similar equipment.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Dress,Skimpy,Hat,Helmet",
        "   Buckler,Shield",
        "Skills: Scythe,Taoism,Demon Arts",
        "Passive: Scythe Booster 20%",
        "",
      ]],
    168 => # 妖怪 / Youkai
      [[
        "Also called Mononoke, Youkai are Demi-Humans with stronger magic. They mostly live to the east, coexisting with humans. Other than using their hair and tongues as weapons, they can learn ice magic. A useful species with balanced physical and magical capabilities.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Dress,Skimpy,Hat,Helmet",
        "   Buckler,Shield",
        "Skills: Scythe,Taoism,Demon Arts",
        "Passive: SP Cost 75%,Scythe Booster 20%",
        "",
      ]],
    169 => # 妖神 / Elder Youkai
      [[
        "A higher-ranked Youkai who is revered as a God in the Eastern Lands, wielding the power to freeze enemies and everything around them. They are a mighty race, using their hair and tongue skill to bring mind-numbing pleasure and raw physical power to inflict excruciating pain.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Dress,Skimpy,Hat,Helmet",
        "   Buckler,Shield",
        "Skills: Scythe,Taoism,Demon Arts",
        "Passive: SP Cost 50%,Scythe Booster 20%",
        "",
      ]],
    170 => # 妖鬼 / Oni
      [[
        "A subspecies of Youkai known for their strength. Experts at using clubs and crushing foes with strong skills. They learn ice attacks and full-body techniques which never leave them wanting for physical skills. High attack power and defense, but comparatively weak to magic and pleasure.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Heavy Armor,Dress,Skimpy",
        "   Hat,Helmet,Heavy Helmet,Buckler,Shield,Heavy Shield",
        "Skills: Axe,Club,Demon Arts",
        "Passive: Crit +15%,Battle Start SP 75%",
      ]],
    171 => # 鬼神 / Kishin
      [[
        "A high-ranking Oni revered as a god for their strength with a club, smashing everything in their path. Despite their inferior magic power, the Kishin is a dependable physical fighter.",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Heavy Armor,Dress,Skimpy",
        "   Hat,Helmet,Heavy Helmet,Buckler,Shield,Heavy Shield",
        "Skills: Axe,Club,Demon Arts",
        "Passive: Crit +15%,Battle Start SP 100%",
        "",
      ]],
    172 => # 夜叉 / Yasha
      [[
        "A Youkai that possesses multiple arms, each wielding a weapon to deliver unending slashes. Despite their lackluster defense, a Yasha can learn mighty sword skills and learn to attack twice for overwhelming power.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Dress,Skimpy,Hat,Helmet",
        "Skills: Katana,Multiweapon,Demon Arts",
        "Passive: Eva +10%,Dual Wield",
        "",
      ]],
    173 => # 阿修羅 / Asura
      [[
        "A species of Kishin wielding countless blades with their multiple arms to mercilessly annihilate their enemies. The Asura is able to learn powerful katana, multi-weapon and pleasure skills, as well as the ability to strike three times in a row.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Dress,Skimpy,Hat,Helmet",
        "Skills: Katana,Multiweapon,Demon Arts",
        "Passive: Eva +10%,Dual Wield",
        "",
      ]],
    174 => # 妖怪王 / Youkai Lord
      [[
        "A great youkai said to stand above all other demi-human monsters. They were designated a sealed race by the goddesses for disrupting the balance of the world. Wields clubs and katana with expertise beyond even masters, learning very powerful attack skills. Despite having somewhat frail defense, the Youkai Lord displays overwhelming force when attacking.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes A,Gi A,Breastplate B,Armor B,Dress C,Skimpy C,",
        "       Hat A,Helmet B,Buckler B,Shield B",
        "Skills: Katana,Scythe,Axe,Club,Taoism,Demon Arts",
        "Passive: Crit Rate 15%,Crit Damage +50%,Scythe Booster 20%,",
        "         Battle Start SP Overlimit +20%,SP Cost 50%",
      ]],
    7415 => # マガツオオミカミ
      [[
        "女神によって兵器として作り出された究極の人造亜人",
        "黄泉の力で稼働し、異世界においては世界を消滅させた",
        "多腕に様々な神器を携え、ひたすらに破壊と殺戮を行う",
        "SP消費も非常に少なく、圧倒的な攻撃性能を誇る",
      ],
      [
        "Equip: 服SSS　武道着SSS　胸当てSS　鎧SS　ドレスS",
        "　　　　　薄着S　帽子SSS　兜SS　軽盾SS　盾SS",
        "Skills: 刀技　鎌技　斧技　棍技　陰陽術　魔技",
        "Passive: 鎌威力アップ　戦闘開始時SP150%　SP消費1/4",
        "　　　　　　会心ダメージ100%アップ　三刀流　三刀流強化",
      ]],
    175 => # インプ / Imp
      [[
        "Small demons who subsist on human semen; not quite skilled enough yet to be called succubi. Imps use pleasure attacks, drowning their enemies in bliss. They specialize in Wind techniques, but are otherwise poor fighters.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sex Toy,Clothes,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: Black Magic,Sexcraft,Demon Arts,Nature",
        "Passive: Eva +10%,Horny/Trance Strike +5%",
        "",
      ]],
	176 => # サキュバス / Succubus
      [[
        "Imps who become proficient at sexual skills become full-fledged succubi capable of taking away their foe's will to fight through pleasure. They can also act as mages with their high magic power, but weak attack and defense make them poor in direct combat.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sex Toy,Clothes,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: Black Magic,Sexcraft,Demon Arts,Nature",
        "Passive: Eva +10%,Horny/Trance/Seduction Strike +5%",
        "",
      ]],
    177 => # エルダーサキュバス / Elder Succubus
      [[
        "A high-ranking Succubus boasting superior pleasure skills, using them to squeeze everything from men and women alike. An Elder Succubus can learn powerful wind magic and mind-numbing pleasure skills, with one such skill capable of sending sleeping foes to an eternal slumber.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sex Toy,Clothes,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: Black Magic,Sexcraft,Demon Arts,Nature",
        "Passive: Eva +10%,Horny/Trance/Seduction Strike +5%",
        "   Incontinence Strike +5%",
      ]],
    178 => # モンクサキュバス / Succubus Monk
      [[
        "A rare Succubus who has devoted her body and life to fighting, gaining high offensive power. Despite being a Succubus, she can throw powerful punches and whip out sharp slaps as well as she can milk enemies dry.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sex Toy,Clothes,Gi,Robe,Dress,Skimpy,Hat,Fancy Cap",
        "Skills: Unarmed,Sexcraft,Demon Arts,Nature",
        "Passive: Crit +15%,Eva +20%,Horny/Trance Strike +5%",
        "",
      ]],
    179 => # 淫闘サキュバス / Lewdfighter Succubus
      [[
        "A Succubus fighter who uses her body to overwhelm enemies with ancient combat skills and obscene pleasure attacks. The Lewdfighter Succubus can develop sexual defenses for themselves and master powerful pleasure skills to make enemies incontinent.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sex Toy,Clothes,Gi,Robe,Dress,Skimpy,Hat,Fancy Cap",
        "Skills: Unarmed,Sexcraft,Demon Arts,Nature",
        "Passive: Crit +15%,Eva +20%,Horny/Trance Strike +10%",
        "",
      ]],
    180 => # ウィッチサキュバス / Succubus Witch
      [[
        "A talented Succubus mage who has mastered lewd sorcery, in addition to powerful Wind and Black Magic spells. She can also learn to use her Demon Eyes to inflict pleasure status ailments, although she has lackluster defense, like other mages.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sex Toy,Clothes,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "Skills: Black Magic,Summoning,Sexcraft,Demon Arts,Nature",
        "Passive: Mag Eva +10%,Horny/Trance Strike +5%",
        "",
      ]],
    181 => # アークサキュバス / Arc Succubus
      [[
        "An archmage amongst Succubus Witches who has attained the apex of magic spells and rare pleasure skills. The Arc Succubus can learn more Black Magic spells, as well as summon wild tentacles to bring agonizing pleasure to enemies.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sex Toy,Clothes,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "Skills: Black Magic,Summoning,Sexcraft,Demon Arts,Nature",
        "Passive: Mag Eva +10%,Horny/Trance Strike +10%",
        "",
      ]],
    182 => # クイーンサキュバス / Queen Succubus
      [[
        "The apex of all succubi, able to effortlessly ascend anyone to heaven with pleasures from all corners of the world. Perfectly balanced, her body is as beautiful as is powerful, unleashing devastating Wind magic and Martial Arts techniques.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sex Toy,Clothes,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: Unarmed,Black Magic,Summoning,Sexcraft,Demon Arts,Nature",
        "Passive: Eva +20%,Mag Eva +10%,Horny/Trance Strike +10%",
        "   Seduction/Incontinence Strike +10%",
      ]],
    183 => # リリスナイトメア / Lilith Nightmare
      [[
        "A devastating succubus very closely related to the original Great Whore of Babylon. They were shunned by the Goddess Ilias during the Great Monster Wars and designated a sealed race. The skill Dust Wind, feared by even Ilias, boasts destructive force on a level reaching chaos. This succubus learns other powerful skills, and boasts overwhelming speed and dexterity.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sex Toy,Clothes B,Gi A,Robe B,Dress A,Skimpy A,Hat B,",
        "       Magic Hat B,Fancy Cap A,Buckler A",
        "Skills: Unarmed,Black Magic,Summoning,Sexcraft,Demon Arts,Nature",
        "Passive: Eva/Mag Eva/Auto-Hit Eva 15%,Horny/Trance/Seduction/",
        "         Incontinence Strike 20%,Wind/Hadron Res Pierce",
      ]],
    7416 => # バビロンの大淫婦
      [[
        "太古の伝説にのみ名を残す最大最悪の大淫魔",
        "快楽によって全ての男を堕落させ、滅びに導くとされる",
        "強大な淫術など、数々の淫らなスキルを習得可能",
        "器用さはもちろん魔力と素早さも卓越し、無類の強さを誇る",
      ],
      [
        "Equip: 服SS　武道着SSS　ローブSS　ドレスSSS　薄着SSS",
        "　　　　　帽子SS　魔帽SS　高級帽SSS　軽盾SSS",
        "Skills: 格闘　黒魔法　召喚　淫技　魔技　自然感応",
			"Passive: 淫具装備可能　通常攻撃敏感30%　通常攻撃恍惚30%",
			"　　　　　　通常攻撃誘惑30%　通常攻撃失禁30%　快楽・風耐性貫通",
			"　　　　　　全スキルの威力が器用さに依存する",
        "",
      ]],
    184 => # ヴァンパイア / Vampire
      [[
        "Nocturnal monster that feeds on blood. Boasting strong bodies and even stronger magic, they can absorb HP and more via bloodsucking. Daggers are at their deadliest in their hands.",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Armor,Heavy Armor,Robe,Dress,Hat,Helmet",
        "   Heavy Helmet,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Black Magic,Dark,Demon Arts",
        "Passive: Dagger Booster 20%",
        "",
      ]],
    185 => # ノスフェラトゥ / Nosferatu
      [[
        "A vampire that has fed on a large amount of blood, gaining great power. Learns powerful Dagger skills, and can feed on blood to drain not only life, but mana as well. If used well, they can fight on their own with no need for healing from allies.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Armor,Heavy Armor,Robe,Dress,Hat,Helmet",
        "   Heavy Helmet,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Black Magic,Dark,Demon Arts",
        "Passive: Dagger Booster 20%",
        "",
      ]],
    186 => # 夜の帝王 / Night Emperor
      [[
        "A high ranking member of the Vampire aristocracy who have mastered the use of daggers and learn powerful Lightning techniques. They are able to drain life, mana and stamina when feeding on blood and their exceptional combat strength makes them reliable allies.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Armor,Heavy Armor,Robe,Dress,Hat,Helmet",
        "   Heavy Helmet,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Black Magic,Dark,Demon Arts",
        "Passive: Dagger Booster 20%",
      ]],
    187 => # マージヴァンパイア / Vampire Magus
      [[
        "A Vampire mage with high magical potential who is proficient in a wide variety of area-of-effect elemental spells. They are also able to inflict status ailments on their enemies with their demon eyes and their defenses are surprisingly high for magic users, making them dependable allies.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Armor,Robe,Dress,Hat,Helmet,Magic Hat",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Dagger,Black Magic,Summoning,Dark,Demon Arts",
        "Passive: None",
        "",
      ]],
    188 => # アークヴァンパイア / Arc Vampire
      [[
        "A Vampire archmage with extreme magical powers, possessing Black Magic capable of destroying every enemy at once. The Arc Vampire also possesses powerful Demon Arts able to inflict instant death on groups of enemies as well as high stats, making them an immensely powerful spellcaster.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Armor,Robe,Dress,Hat,Helmet,Magic Hat",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Dagger,Black Magic,Summoning,Dark,Demon Arts",
        "Passive: None",
        "",
      ]],
    189 => # シノビヴァンパイア / Vampire Shinobi
      [[
        "A Vampire who has trained in the ways of the Shinobi, boasting unrivaled physical strength and magical power. They can infuse preexisting ninjutsu with their demonic magic, creating brand new techniques. Their attack power is worthy of a Ninja, but their defense is no different from a mage.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Robe,Dress,Hat,Helmet,Fancy Cap",
        "Skills: Dagger,Dark,Ninjutsu,Demon Arts",
        "Passive: Eva +20%,Dual Wield",
        "",
      ]],
    190 => # クノイチナイトメア / Nightmare Kunoichi
      [[
        "A Vampire Shinobi who has pushed themselves beyond their limits, allowing them to overwhelm foes with physical and magical attacks. The Vampire Kunoichi learns many skills beyond the capabilities of average ninjas, giving them unparalleled offensive power.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Robe,Dress,Hat,Helmet,Fancy Cap",
        "Skills: Dagger,Dark,Ninjutsu,Demon Arts",
        "Passive: Eva +20%,Dual Wield",
        "",
      ]],
    192 => # クイーンヴァンパイア / Queen Vampire
      [[
        "A Vampire with royal blood who rules over her kind, rumored to live in a castle with hundreds of maids at her service. With complete mastery over Dagger skills and magic to bend the laws of nature, this vampire is the undisputed queen of the night.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Gi,Armor,Heavy Armor,Robe,Dress,Hat,Helmet",
        "   Heavy Helmet,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Ninjutsu,Black Magic,Summoning,Dark,Demon Arts",
        "Passive: Eva +20%,Dagger Booster 20%",
        "",
      ]],
    193 => # ドラキュリーナ / Draculina
      [[
        "A legendary vampire who wreaked havoc during the Great Monster",
        "Wars. Their lightning could channel the power of chaos, and thus",
        "they were designated a sealed race by the goddesses. Has flawed",
        "resistances like others of her kind, but is overwhelming on the",
        "offensive. Specialized in daggers and the lightning element, she",
        "is exceptional on both the physical and magic side.",
      ],
      [
        "Equip: Fang,Clothes C,Gi C,Armor B,Heavy Armor B,Robe A,Dress A,",
        "       Hat C,Helmet B,Heavy Helmet B,Fancy Cap A,Buckler B,",
        "       Shield B,Heavy Shield B",
        "Skills: Dagger,Ninjutsu,Black Magic,Summoning,Dark,Demon Arts",
        "Passive: Eva 20%,Auto-Hit Eva 10%,Dagger Booster 20%,Dark Skill",
        "         Booster 100%,Lightning/Ion Res Pierce,Fang Mastery+",
      ]],
    7417 => # 神祖
      [[
        "あらゆる吸血鬼の祖である究極のヴァンパイア",
        "その膨大な魔力は、世界を夜で覆い尽くすほどだという",
        "強力な魔技の他に、短剣技の最終奥義を修得する",
        "また強力な防御スキルを習得し、耐性の穴も補完可能",
      ],
      [
        "Equip: 服S　武道着S　鎧SS　重鎧SS　ローブSSS",
        "　　　　　ドレスSSS　帽子S　兜SS　重兜SS　高級帽SSS",
        "　　　　　軽盾SS　盾SS　重盾SS",
        "Skills: 短剣技　忍術　黒魔法　召喚　闇技　魔技",
        "Passive: 短剣威力アップ　闇技最大限威力アップ　雷耐性貫通",
        "　　　　　　闇の衣　牙装備可能　牙ハイマスタリー＋",
      ]],
    194 => # マーメイド / Mermaid
      [[
        "Beautiful monster with the lower body of a fish. Controls water at will to attack enemies and heal allies. Despite their weak bodies, spells and songs alike make up for their physical shortcomings.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Robe,Hat,Magic Hat,Fancy Cap,Buckler",
        "Skills: White Magic,Black Magic,Singing,Ocean",
        "Passive: Sea Strength,Recovery Booster 50%,Sleep Strike +5%",
        "",
      ]],
    195 => # ハイマーメイド / High Mermaid
      [[
        "A high-ranked Mermaid capable of sweeping away hordes of enemies with tsunamis. With knowledge of water magic and healing spells, the high Mermaid makes for a powerful support mage.",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Robe,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: White Magic,Black Magic,Singing,Ocean",
        "Passive: Sea Strength,Recovery Booster 50%",
        "   Sleep Strike +10%",
      ]],
    196 => # ローレライ / Lorelei
      [[
        "A Mermaid that possesses the power to flood a town and submerge it underwater, a power beyond a High Mermaid's capabilities. With a greater grasp of White Magic, the Lorelei is a powerful support unit.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Robe,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: White Magic,Black Magic,Singing,Ocean",
        "Passive: Super Sea Strength,Recovery Booster 50%",
        "   Sleep Strike +20%",
      ]],
    197 => # 海賊マーメイド / Pirate Mermaid
      [[
        "A Mermaid who excels in swordsmanship that has chosen to walk the Pirate's path. With her unique Piracy and Sword skills, songs that drive allies berserk and the ability to call upon a hurricane, the Pirate Mermaid is a powerful frontline combatant.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Robe,Hat,Helmet,Magic Hat",
        "   Fancy Cap,Buckler,Shield",
        "Skills: White Magic,Piracy,Singing,Ocean",
        "Passive: SP Cost 75%,Sea Strength,Sleep Strike +5%",
        "",
      ]],
    198 => # 海賊王ローレライ / Pirate King Lorelei
      [[
        "A Lorelei with command over Pirate Mermaids, set to conquer the Seven Seas. With powerful Piracy skills at her disposal, the Pirate King Lorelei is a mighty force on the battlefield.",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Robe,Hat,Helmet,Magic Hat",
        "   Fancy Cap,Buckler,Shield",
        "Skills: White Magic,Piracy,Singing,Ocean",
        "Passive: SP Cost 50%,Super Sea Strength,Sleep Strike +5%",
        "",
      ]],
    199 => # 行商マーメイド / Mermaid Merchant
      [[
        "A well-respected Mermaid who does business with humans, trading gold for goods and vice versa. Despite her poor survival abilities, the Mermaid Merchant can wield her Mercantile skills to provide support.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Robe,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: White Magic,Mercantile,Singing,Ocean",
        "Passive: Gold Drop 200%,Sea Strength,Sleep Strike +5%",
        "",
      ]],
    200 => # 海運王ローレライ / Shipping Magnate Lorelei
      [[
        "A Lorelei who controls the battlefield, marketplace, and the Seven Seas with the power of money. With the use of convenient Mercantile skills, like purchasing rare goods in and out of combat, the Merchant Magnate Lorelei is useful in many situations.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Robe,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: White Magic,Mercantile,Singing,Ocean",
        "Passive: Gold Drop 300%,Super Sea Strength",
        "   Sleep Strike +5%",
      ]],
    201 => # クィーンマーメイド / Queen Mermaid
      [[
        "A Mermaid who resides over her race as a queen, wielding extraordinary magic power. With her unparalleled powers of healing, coupled with her Piracy and Mercantile skills, and topped with the ability to flood towns, the Mermaid Queen is truly a force of nature.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Robe,Hat,Helmet,Magic Hat",
        "   Fancy Cap,Buckler,Shield",
        "Skills: White Magic,Black Magic,Piracy,Mercantile,Singing,Ocean",
        "Passive: Super Sea Strength,Recovery Booster 50%",
        "   Sleep Strike +20%",
      ]],
    202 => # 伝説の神魚 / Legendary Divine Fish
      [[
        "The ultimate mermaid, said to be endowed with the power of a distant utopia. Their healing powers could disrupt the cycle of life, and thus they were designated a sealed race. They can manipulate water and ice at will, and has extremely potent recovery abilities. Their defenses are also not lacking, making them a dependable healing presence.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes A,Breastplate B,Armor C,Robe A,Hat A,Helmet C,",
        "       Magic Hat A,Fancy Cap A,Buckler C,Shield C",
        "Skills: White Magic,Black Magic,Piracy,Mercantile,Singing,Ocean",
        "Passive: Sleep Strike 40%,Recovery Booster 50%,Super Sea",
        "         Strength",
      ]],
    7418 => # ワールドドロウン
      [[
        "世界全体を水没させ、文明を滅ぼした悪夢のマーメイド",
        "その歌声さえも滅びの能力を有し、あらゆる生命を否定する",
        "破壊だけでなく癒しの力も極限に達し、カウンターで味方を回復強化",
        "絶大な魔力に隙はなく、いかなる役割もこなす事ができる",
      ],
      [
        "Equip: 服SSS　胸当てSS　鎧S　ローブSSS　帽子SSS",
        "　　　　　兜S　魔帽SSS　高級帽SSS　軽盾S　盾S",
        "Skills: 白魔法　黒魔法　海賊技　商技　歌う　海技",
        "Passive: 回復超強化　通常攻撃睡眠50%　海超強化",
        "　　　　　　ラピッド・ディレイヒールに全状態異常治療効果付加",
        "　　　　　　敵の攻撃に対し頻繁にリープタイムを発生させる",
      ]],
    203 => # エルフ / Elf
      [[
        "Self-proclaimed forest guardians resembling humans, they pride themselves on always hitting their mark. Unfortunately, despite natural buffers against status ailments they're rather weak to pleasure.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Robe,Dress,Skimpy,Hat,Fancy Cap",
        "Skills: Bow,Sexcraft,Demon Arts,Nature",
        "Passive: Eva +10%,Forest Strength,Slayer Boost 100%",
        "",
      ]],
    204 => # ハイエルフ / High Elf
      [[
        "A high-ranked Elf with exceptional skill with a Bow. With arrows that impair enemies and lewd skills to pleasure them, a High Elf is a capable fighter.",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Robe,Dress,Skimpy,Hat,Fancy Cap",
        "Skills: Bow,Sexcraft,Demon Arts,Nature",
        "Passive: Eva +10%,Forest Strength,Slayer Boost 100%",
        "",
      ]],
    205 => # マスターエルフ / Master Elf
      [[
        "A highly trained Elf that serves under the Queen Elf, wielding powerful Bow skills that can annihilate groups of enemies. Despite her weak pleasure defense, the Master Elf can petrify enemies, kill them instantly, and resist many ailments with her high stats.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Robe,Dress,Skimpy,Hat,Fancy Cap",
        "Skills: Bow,Sexcraft,Demon Arts,Nature",
        "Passive: Eva +10%,Forest Strength,Slayer Boost 100%",
        "",
      ]],
    206 => # フォレストエルフ / Forest Elf
      [[
        "An Elf related to Fairies, capable of manipulating the forces of nature. By communicating with the forest, she can call upon natural energies to heal allies and strike enemies down.",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "Skills: Bow,White Magic,Sexcraft,Demon Arts,Plant,Nature",
        "Passive: Super Forest Strength",
        "",
      ]],
    207 => # ワンダーエルフ / Wonder Elf
      [[
        "A Forest Elf who has mastered the forces of nature, creating earthquakes and gusts to destroy her enemies.  With the ability to gain protection and heal her allies by calling upon nature, the Wonder Elf is an active fighter in many aspects.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "Skills: Bow,White Magic,Sexcraft,Demon Arts,Plant,Nature",
        "Passive: Super Forest Strength",
        "",
      ]],
    208 => # ダークエルフ / Dark Elf
      [[
        "An Elf whose body and soul have been stained by darkness, wielding a sword instead of a bow. Despite the weak defense, a Dark Elf excels with physical strength and can use magic to summon tentacles.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Armor,Robe,Dress,Skimpy,Hat,Helmet,Magic Hat",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Sword,Black Magic,Dark,Sexcraft,Demon Arts,Tentacle",
        "   Nature",
        "Passive: Forest Strength",
      ]],
    209 => # アークエルフ / Arc Elf
      [[
        "A Dark Elf who is able to channel destructive black magic through her body. Although her defense is weak, the Arc Elf wields tentacle skills, lethal sword skills, and powerful magic.",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Armor,Robe,Dress,Skimpy,Hat,Helmet,Magic Hat",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Sword,Black Magic,Dark,Sexcraft,Demon Arts,Tentacle",
        "   Nature",
        "Passive: Forest Strength",
      ]],
    210 => # デュラハン / Dullahan
      [[
        "A headless knight, closely related to Elves, who can learn powerful Sword skills. The Dullahan can amplify their power using Spellblade skills and attack twice with her head and body.",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Armor,Heavy Armor,Robe,Dress,Skimpy,Hat",
        "   Helmet,Heavy Helmet,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Sword,Spellblade,Demon Arts",
        "Passive: None",
      ]],
    211 => # ロードデュラハン / Dullahan Lord
      [[
        "A high-ranking Dullahan who is an expert in combat and a master of the sword. Possessing rare sword skills coupled with the art of Spellblade, the Dullahan Lord can easily exploit the vulnerabilities of her enemies. Apart from her lackluster magical power, she has no other significant flaws.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Armor,Heavy Armor,Robe,Dress,Skimpy,Hat",
        "   Helmet,Heavy Helmet,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Sword,Spellblade,Demon Arts",
        "Passive: None",
        "",
      ]],
    212 => # クィーンエルフ / Queen Elf
      [[
        "An Elf who rules her kind with mastery over the Bow and all its secrets. With powerful healing spells and the most satisfying Pleasure attacks, the Queen Elf is a mighty force.",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Armor,Robe,Dress,Skimpy,Hat,Helmet",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Sword,Bow,White Magic,Black Magic,Dark,Spellblade",
        "   Sexcraft,Demon Arts,Plant,Nature",
        "Passive: Eva +10%,Super Forest Strength,Slayer Boost 100%",
      ]],
    213 => # アルフ神族 / Alph Divine Clan
      [[
        "A mysterious clan of gods from ancient times who were the",
        "ancestors to elves and humans, said to have led a forbidden army",
        "that would've heralded the world's end. Can master the ultimate",
        "bow skills in addition to learning ancient cursed sword",
        "techniques. With their innnate resistance to the natural",
        "elements, their defensive performance is also quite good.",
      ],
      [
        "Equip: Clothes A,Gi A,Armor C,Robe B,Dress B,Skimpy A,Hat A,",
        "       Helmet C,Magic Hat B,Fancy Cap A,Buckler B,Shield C",
        "Skills: Sword,Bow,White Magic,Black Magic,Spellblade,Sexcraft,",
        "        Demon Arts,Plant,Nature",
        "Passive: Eva 10%,Auto-Hit Eva 5%,Slayer/Condition Booster 50%,",
        "         Alph's Protection,Super Forest Strength",
      ]],
    7419 => # アンゴルモア
      [[
        "恐怖の大王と称された史上最強のアルフ神族",
        "原初ヒトの遺伝子の元ともなった、強大なる破壊的存在",
        "複腕で幾多の武器を使いこなすが、最も得意なのはやはり弓矢",
        "能力も総じて高く、目立った弱点は存在しない",
      ],
      [
        "Equip: 服SSS　武道着SSS　鎧S　ローブSS　ドレスSS",
        "　　　　　薄着SSS　帽子SSS　兜S　魔帽SS　高級帽SSS",
        "　　　　　軽盾SS　盾S",
        "Skills: 剣技　弓技　白魔法　黒魔法　魔法剣　淫技",
        "　　　　魔技　植物技　自然感応",
        "Passive: 種族特攻超強化　状態異常特攻超強化",
        "　　　　　　アンゴルモアの護り　森超強化",
      ]],
    214 => # フェアリー / Fairy
      [[
        "Playful forest-dwellers resembling humans. Although physically powerless, their alignment with nature calls forth natural forces to attack and heal. High evasion and magic mitigates their pitiful defenses.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Fancy Cap",
        "Skills: White Magic,Black Magic,Dancing,Nature",
        "Passive: Eva +50%,Mag Eva +50%,MP Regen +1%,Gambling Luck I",
        "",
      ]],
    215 => # 風精 / Wind Sprite
      [[
        "A superior fairy that has increased its affinity with the power of wind. As a result of her link with nature, she has gained a further increase in magic power including healing skills and dances that call down tornadoes. However, her defenses are fragile and frontline combat is ill-advised.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Fancy Cap",
        "Skills: White Magic,Black Magic,Dancing,Nature",
        "Passive: Eva +50%,Mag Eva +50%,MP Regen +2%",
        "   Gambling Luck I",
        "",
      ]],
    216 => # 風の精霊 / Wind Spirit
      [[
        "A high-ranked Fairy who has become a spirit of the Wind, wrecking havoc with her devastating gales and harnessing the wrath of nature through dancing. By learning an advanced mana restoration ability, the Wind Spirit can also continuously cast magic spells.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Fancy Cap",
        "Skills: White Magic,Black Magic,Dancing,Nature",
        "Passive: Eva/Mag Eva +50%,MP Regen +4%",
        "   Gambling Luck I",
        "",
      ]],
    217 => # 土精 / Earth Sprite
      [[
        "A Fairy who has adapted to using the Earth element, granting her improved attack and defense power. The Earth Sprite can wield Axes and Clubs in direct combat, but at the cost of lower magical capabilities.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Hat,Helmet,Buckler,Shield",
        "Skills: Axe,Club,Dancing,Nature",
        "Passive: Crit +15%,Eva/Mag Eva +10%,Battle Start SP 75%",
        "",
      ]],
    218 => # 土の精霊 / Earth Spirit
      [[
        "A high-ranked Fairy who has become a spirit of the Earth, boasting greater fighting power. An Earth Spirit's high defense power and exceptional skill with Axes and Clubs make up for their lackluster magical capabilities.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Hat,Helmet,Buckler,Shield",
        "Skills: Axe,Club,Dancing,Nature",
        "Passive: Crit +15%,Eva/Mag Eva +10%,Battle Start SP 100%",
        "",
      ]],
    219 => # ダークフェアリー / Dark Fairy
      [[
        "A Fairy who has accepted Darkness into her heart to attain powerful attack magic. A Dark Fairy loves to gamble and is capable of Summoning the beast known as Pegasus.",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Fancy Cap",
        "Skills: White Magic,Black Magic,Summoning,Dark,Dancing,Oracle",
        "   Nature",
        "Passive: Eva/Mag Eva +40%,MP Regen +1%,Item Drop 200%",
        "   Gambling Luck II",
      ]],
    220 => # アークフェアリー / Arc Fairy
      [[
        "A high-ranked Fairy who has become one with Darkness, gaining the power to invoke large-scale disasters. Despite not being a strong physical fighter, the Arc Fairy can slay an entire group of enemies thanks to her magic and Oracle skills.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Fancy Cap",
        "Skills: White Magic,Black Magic,Summoning,Dark,Dancing,Oracle",
        "   Nature",
        "Passive: Eva/Mag Eva +40%,MP Regen +2%,Item Drop 300%",
        "   Gambling Luck III",
        "",
      ]],
    221 => # クィーンフェアリー / Queen Fairy
      [[
        "A Fairy who rules over her kind and commands nature effortlessly due to her tremendous magical power. The Queen Fairy is the embodiment of nature, thanks to a powerful Dancing skill, not to mention her mana regeneration and cost reduction.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Fancy Cap",
        "Skills: White Magic,Black Magic,Summoning,Dark,Oracle,Dancing",
        "   Plant,Nature",
        "Passive: Eva/Mag Eva +50%,MP Regen +4%,MP Cost 50%",
        "   Item Drop 300%,Gambling Luck III",
      ]],
    222 => # コスモフェアリー / Cosmo Fairy
      [[
        "An incredibly strong fairy possessing galactic powers. Because",
        "their will alone could disrupt the flow of nature, they were",
        "designated a sealed race. Wields tremendous magical might said",
        "to be capable of shaking even the stars themselves. They can",
        "also learn ultimate-level summoning magic, and their MP is",
        "almost limitless.",
      ],
      [
        "Equip: Robe A,　Fancy Cap A",
        "Skills: White Magic,Black Magic,Summoning,Oracle,Dancing,Plant,",
        "        Nature",
        "Passive: Eva/Mag Eva/Auto-Hit Eva 50%,Galactic Booster 50%,",
        "         MP Regen 6%,MP Cost 50%,Item Drop Rate 300%,",
        "         Gambling Luck III",
      ]],
    7420 => # コスモス
      [[
        "星の意志そのものとも言われる、破壊と守護の神蝶",
        "生命を栄えさせるのも文明を滅ぼすのも、その意のままだとされる",
        "銀河の力で全てを消滅させるほどの圧倒的魔力を持ち、素早さも高い",
        "また、付き従う者達に様々な幸運をもたらすという",
      ],
      [
        "Equip: ローブSSS　高級帽SSS",
        "Skills: 白魔法　黒魔法　召喚　オラクル　踊る",
        "　　　　植物技　自然感応",
        "Passive: 銀河属性100%アップ　毎ターンMP8%回復　MP消費1/4",
        "　　　　　　アイテムドロップ5倍",
        "",
      ]],
    223 => # スライム / Slime
      [[
        "A monster composed entirely of slime. Besides using their slimy bodies as a weapon, they're proficient with boomerangs. They can heal allies with slime too. Their bodies are resistant to physical attacks, but susceptible to magic.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell,Robe,Fancy Cap",
        "Skills: Throwing,Slime",
        "Passive: Boomerang Booster 20%,Slimed Strike +10%",
        "",
      ]],
    224 => # メガスライム / Mega Slime
      [[
        "A strong Slime capable of creating a clone of herself and using her body as a weapon. She can attack groups of enemies at once with Throwing skills; however, her magic and elemental defense are very poor.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell,Robe,Fancy Cap",
        "Skills: Throwing,Slime",
        "Passive: Boomerang Booster 20%,Slimed Strike +20%",
        "",
      ]],
    225 => # ギガスライム / Giga Slime
      [[
        "A top-class Slime that has gained great power, including the ability to split into three clones. The Giga Slime can master powerful Slime and Throwing skills; because her elemental defense is poorly developed, she must take caution when health becomes an issue.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell,Robe,Fancy Cap",
        "Skills: Throwing,Slime",
        "Passive: Boomerang Booster 20%,Slimed Strike +30%",
        "",
      ]],
    226 => # 癒しのスライム / Heal Slime
      [[
        "A gentle Slime that heals others by activating the metabolism in their bodies. Despite her lackluster attack power, the Heal Slime's \"Aqua Shield\", as well as her healing and other support skills are top notch.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell,Robe,Fancy Cap",
        "Skills: White Magic,Throwing,Slime",
        "Passive: Boomerang Booster 20%",
        "   Slimed Strike +20%",
      ]],
    227 => # 破邪の粘妖 / Purifying Slime
      [[
        "A high-ranked Slime with advanced healing powers and Throwing skills that destroy evil on the spot. The Purifying Slime can learn many powerful healing spells and other useful skills, making her a versatile support character.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell,Robe,Fancy Cap",
        "Skills: White Magic,Throwing,Slime",
        "Passive: Boomerang Booster 20%,Slimed Strike +30%",
        "",
      ]],
    228 => # 肉食スライム / Carnivorous Slime
      [[
        "A Slime that has developed a taste for devouring live creatures by wrapping them up in her slime and digesting them whole. The Carnivorous Slime can coat enemies in her juices using her boomerang or through counter-attacks; as a last resort, she can self-destruct to cause considerable damage.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell,Robe,Fancy Cap",
        "Skills: Throwing,Slime",
        "Passive: Boomerang Booster 20%,Digestion Strike +10%",
        "",
      ]],
    229 => # 淫酷の粘妖 / Malicious Slime
      [[
        "A cruel high ranking Slime who captures groups of prey and devours them all. The Malicious Slime acquires aggressive Slime abilities with predatorial effects as well as powerful Throwing skills, making her a specialized offensive combatant.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell,Robe,Fancy Cap",
        "Skills: Throwing,Slime",
        "Passive: Boomerang Booster 20%,Digestion Strike +20%",
        "",
      ]],
    230 => # クィーンスライム / Queen Slime
      [[
        "The ultimate slime who stands above all others. Has incorporated countless beings within their body and become a colony lifeform. Learns secret Boomerang skills in addition to powerful attacks utilizing their slime body. Also learns various other skills such as self-destruction and protective magic.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell,Robe,Fancy Cap",
        "Skills:White Magic,Throwing,Slime",
        "Passive:Slime Strike 30%,Digestion Strike 20%,Boomerang Booster 30%",
      ]],
    231 => # 究極群体生命 / Ultimate Colony Lifeform
      [[
        "A forbidden colony lifeform that is a collective of over a hundred million wills. Because their existence disrupted the balance of the world, the goddesses designated them a sealed race. Learns skills that utilize the colony's body in addition to the ultimate boomerang techniques. Their vitality is ranked the highest among all the races.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell A,Robe A,Fancy Cap A",
        "Skills: White Magic,Throwing,Slime",
        "Passive: Boomerang Booster 20%,Slime Strike 40%,",
        "         Digestion Strike 50%",
      ]],
    7421 => # カナデ
      [[
        "スライム達の間で祖神として知られている原初の群体生命",
        "世界を自身の生命で満たすほどの力を誇り、その能力は圧倒的",
        "究極の分裂技など、強大な力を持つ粘体スキルを習得可能",
        "属性攻撃と状態異常には弱いが、物理面では無類の防御力を誇る",
      ],
      [
        "Equip: 甲羅SSS　ローブSSS　高級帽SSS",
        "Skills: 白魔法　投擲技　粘液技",
        "Passive: ブーメラン威力アップ　通常攻撃ヌルヌル75%",
        "　　　　　　通常攻撃消化50%　分裂しても能力低下しない",
      ]],
    232 => # 魔獣 / Beast
      [[
        "A type of monster with pronounced animal features. Beasts are fast and tear at their enemies with fang and claw. Their attack power, agility, and evasion are excellent, but their defense is low, especially against pleasure. They specialize in offense.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Breastplate,Shell,Fancy Cap",
        "Skills: Beast",
        "Passive: Crit +15%,Counter +25%,Eva +20%,Fang Booster 20%",
        "",
      ]],
    233 => # ルナティックビースト / Lunatic Beast
      [[
        "A strong Beast who goes on a rampage to tear her enemies apart. To make up for their lackluster Agility, the Lunatic Beast can go berserk at will to gain massive power at the cost of losing control.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Breastplate,Shell,Fancy Cap",
        "Skills: Beast",
        "Passive: Crit +30%,Counter +25%,Eva +20%",
        "   Fang Booster 20%",
      ]],
    234 => # 血塗られた狂獣 / Blood-Crazed Beast
      [[
        "A Beast who has developed overwhelming power, making her able to crush anything that stands in her way. By mastering destructive Beast skills, the Blood-Crazed Beast increases her power to extreme heights, despite her lower defensive capabilities.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Breastplate,Shell,Fancy Cap",
        "Skills: Beast",
        "Passive: Crit +30%,Counter +25%,Eva +20%",
        "   Battle Start Preemptive War Cry 50%",
        "   Fang Mastery,Fang Booster 20%",
      ]],
    235 => # スピードビースト / Speed Beast
      [[
        "A Beast with overwhelming speed, capable of taking down enemies with consecutive combo attacks. The Speed Beast's blinding speed allows her to effortlessly evade attacks and steal the enemy's items in the blink of an eye.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Breastplate,Shell,Fancy Cap",
        "Skills: Thievery,Beast",
        "Passive: Crit +15%,Counter +50%,Eva +30%",
        "   Fang Booster 20%,Blind Strike +10%",
        "",
      ]],
    236 => # 疾空の魔獣 / Sonic Beast
      [[
        "A Beast who runs like the wind, launching continuous attacks faster than the eye can see. The Sonic Beast is so fast, she can even steal items from her enemies as she attacks them; due to her low defense, she has developed extremely high agility to avoid deadly attacks.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Breastplate,Shell,Fancy Cap",
        "Skills: Thievery,Beast",
        "Passive: Crit +15%,Counter +75%,Eva +30%,Fang Mastery",
        "   Fang Booster 20%,Blind Strike +20%",
        "",
      ]],
    237 => # ミノタウロス / Minotaur
      [[
        "Famous half-bull creatures, legendary for their strength and their power with an Axe. The Minotaur's defense is substantial, making her a sturdy physical fighter for the frontline of a battlefield; however, her agility and magic defense are lacking, so take caution when facing enemies with speed and magic.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gi,Breastplate,Hat,Fancy Cap",
        "Skills: Axe,Club,Flail,Beast",
        "Passive: Crit +30%",
        "",
      ]],
    238 => # ギガタウロス / Giga Minotaur
      [[
        "A top-ranking Minotaur who boasts both extremely high offensive and defensive capabilities. While unable to use magic effectively, the Giga Minotaur is a master of Axe skills, making her the apex fighting machine able to crush everything in her path.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gi,Breastplate,Hat,Fancy Cap",
        "Skills: Axe,Club,Flail,Beast",
        "Passive: Crit +30%",
        "",
      ]],
    239 => # ケンタウロス / Centaur
      [[
        "A monster with the body of a horse, possessing outstanding speed and high combat capabilities. To make up for her poor defense, the Centaur develops great evasion and learns many Spear skills, allowing her to charge into battle.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gi,Breastplate,Armor,Hat,Helmet,Fancy Cap,Buckler,Shield",
        "Skills: Rapier,Spear,Beast",
        "Passive: Crit +15%,Eva +30%",
        "",
      ]],
    240 => # グランセントール / Grand Centaur
      [[
        "A high-ranking Centaur boasting outstanding leg strength and fighting ability, charging like a gale wielding powerful Spear skills. The Grand Centaur can adapt her speed to act twice in combat and overwhelm her enemies with unrivaled agility, making her a powerful attack force.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gi,Breastplate,Armor,Hat,Helmet,Fancy Cap,Buckler,Shield",
        "Skills: Rapier,Spear,Beast",
        "Passive: Crit +15%,Eva +30%",
        "",
      ]],
    241 => # ねこまた / Nekomata
      [[
        "A monster with a cat's body, boasting excellent agility and fighting sense hidden under the disguise of a lax attitude. To make up for her poor defense, the Nekomata learns amazing Unarmed attacks, unique Dancing skills, and develops incredible evasion.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Gi,Breastplate,Shell,Hat,Fancy Cap",
        "Skills: Unarmed,Dancing,Beast",
        "Passive: Crit +15%,Counter +50%,Eva +20%",
        "   Fang Booster 20%,Blind Strike +10%",
        "",
      ]],
    242 => # 武神キャット / Martial God Cat
      [[
        "A superior Nekomata with extraordinary physical capabilities, using their incredible Unarmed skills to overwhelm her enemies. With extreme agility for avoiding enemy attacks and wild dances, the Martial God Cat is a powerful offensive fighter.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Gi,Breastplate,Shell,Hat,Fancy Cap",
        "Skills: Unarmed,Dancing,Beast",
        "Passive: Crit +15%,Counter +75%,Eva +20%,Fang Booster 20%",
        "   Fang Mastery,Blind Strike +20%",
        "",
      ]],
    244 => # 百獣王 / Beast Lord
      [[
        "Legendary queen of beasts who reigns supreme  over all beast",
        "monsters. Due to their ferocious rampages during the Great",
        "Monster Wars, the goddesses designated them a sealed race.",
        "The Beast Lord has extremely high attack and agility and learns",
        "several powerful beast skills. Athough defensively frail, they",
        "make up for it with high evasion.",
      ],
      [
        "Equip: Fang,Gi B,Breastplate A,Armor C,Shell A,Hat A,",
        "       Fancy Cap B,Buckler C,Shield C",
        "Skills: Axe,Club,Flail,Unarmed,Thievery,Dancing,Beast",
        "Passive: Eva 30%,Auto-Hit Eva 20%,Crit Rate 30%,",
        "         Counter Rate 100%,Fang Booster 20%,Blind Strike 40%,",
        "         Fang Mastery+",
      ]],
    7422 => # 時の神獣
      [[
        "時間を管理すると言われている混沌の神獣",
        "管理者に属する存在ゆえ、神に禁種として指定されていた",
        "時を自在に操り、異なる空間を行き来するという",
        "獣としての力も凄まじく、究極の獣技を習得可能",
      ],
      [
        "Equip: 武道着SS　胸当てSSS　鎧S　甲羅SSS　ローブS",
        "　　　　　帽子SSS　高級帽SS　軽盾S　盾S",
        "Skills: 斧技　棍技　鉄球技　格闘　時魔法　盗賊技",
        "　　　　踊る　獣技",
        "Passive: 牙威力アップ　通常攻撃暗闇50%　牙装備可能",
        "　　　　　　牙ハイマスタリー＋　頻繁にリープタイム発動",
        "",
      ]],
    245 => # 妖狐 / Kitsune
      [[
        "Mysterious and mischievous fox girl. Makes for a decent magician with an adequate magic stat and spells from Yamatai. Learns a wide array of fluffy pleasure skills in addition to earth spells.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Dress,Skimpy,Hat,Helmet",
        "   Magic Hat,Fancy Cap,Buckler,Shield",
        "Skills: Fan,Black Magic,Taoism,Ninjutsu,Beast,Nature",
        "Passive: Mag Eva +10%,SP Regen +5%,Fan Booster 20%",
        "",
      ]],
    246 => # 中級妖狐 / Mid-Rank Kitsune
      [[
        "A Kitsune who has gathered a large amount of spiritual energy, possessing high magical power. The Mid-Rank Kitsune is a reliable fighter with high resistance to ailments, using her characteristic tails to attack in conjunction with her Ninjutsu and Taoism skills.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Dress,Skimpy,Hat",
        "   Helmet,Magic Hat,Fancy Cap,Buckler,Shield",
        "Skills: Fan,Black Magic,Taoism,Ninjutsu,Beast,Nature",
        "Passive: Mag Eva +10%,SP Regen +5%,Fan Booster 20%",
        "",
      ]],
    247 => # 上級妖狐 / High-Rank Kitsune
      [[
        "A highly-trained Kitsune with immense levels of spiritual energy who has mastered powerful Taoism and Ninjutsu skills. The High-Ranked Kitsune has excellent overall stats and is able to manipulate the Earth both offensively and defensively, making her a versatile fighter in any role.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Dress,Skimpy,Hat",
        "   Helmet,Magic Hat,Fancy Cap,Buckler,Shield",
        "Skills: Fan,Black Magic,Taoism,Ninjutsu,Beast,Nature",
        "Passive: Mag Eva +10%,SP Regen +5%,Fan Booster 20%",
        "",
      ]],
    248 => # 狐魔獣 / Bestial Kitsune
      [[
        "A Kitsune who has reverted back to her bestial origins, losing some magical capabilities in favor of superior strength. The Bestial Kitsune fights with her powerful fangs and claws, using first-class speed to avoid attacks at a high rate.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Gi,Breastplate,Robe,Dress,Skimpy,Hat",
        "   Fancy Cap",
        "Skills: Taoism,Ninjutsu,Beast,Nature",
        "Passive: Crit +15%,Eva +20%,SP Regen +10%,Rumble",
        "   Fang Booster 20%",
      ]],
    249 => # 上級狐魔獣 / Feral Kitsune
      [[
        "A high-ranking Kitsune who fights like a wild animal, launching powerful physical attacks with a strong body. A Feral Kitsune can use the power of Earth-based Taoism, making her both a mighty physical and magical fighter.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Gi,Breastplate,Robe,Dress,Skimpy,Hat",
        "   Fancy Cap",
        "Skills: Taoism,Ninjutsu,Beast,Nature",
        "Passive: Crit +15%,Eva +20%,SP Regen +20%,War Rumble",
        "   Fang Booster 20%",
      ]],
    250 => # 狐芸者 / Kitsune Geisha
      [[
        "A Kitsune trained in the ways of a geisha, able to Sing, Dance, and Cook her way through battle. The Kitsune Geisha is not much of a fighter, but with her skill with a Fan and her other abilities, she is a strong support companion.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: Fan,Taoism,Ninjutsu,Dancing,Singing,Cooking,Sexcraft",
        "   Beast,Nature",
        "Passive: Eva/Mag Eva +10%,SP Regen +5%,Fan Booster 20%",
      ]],
    251 => # 狐花魁 / Kitsune Courtesan
      [[
        "A high-ranking kitsune who mastered the ways of the geisha, learning Singing, Dancing, and Cooking skills that greatly damage her enemies. With knowledge of many support skills and mastery of the Fan, the Kitsune Courtesan is an invaluable ally on the battlefield.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: Fan,Taoism,Ninjutsu,Dancing,Singing,Cooking,Sexcraft",
        "   Beast,Nature",
        "Passive: Eva +10%,Mag Eva +10%,SP Regen +5%,Fan Booster 20%",
        "",
      ]],
    252 => # 九尾の狐 / Nine-tailed Kitsune
      [[
        "The greatest kitsune who bears nine tails. Proud of her strength, she can destroy her surroundings with a boisterous dance of tails. Her magic is immense and she can use sealed jutsus and talismans. She's skilled with fans, and boasts overall high stats.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Dress,Skimpy,Hat,",
        "Helmet,Magic Hat,Fancy Cap,Buckler,Shield",
        "Skills: Fan,Black Magic,Taoism,Ninjutsu,Dancing,Singing,",
        "Cooking,Sexcraft,Beast,Nature",
        "Passive: Eva/Mag Eva 10%,SP Regen +30%,Fan Booster 20%",
        "",
      ]],
    253 => # 零尾の狐 / Zero-Tailed Kitsune
      [[
        "The ultimate kitsune said to surpass even the nine-tailed, their",
        "tails extend from imaginary dimensions that cannot be observed",
        "from reality. They had also attained the power of chaos, and",
        "were thus designated a sealed race by the goddesses. The",
        "Zero-Tailed Kitsune has overall high stats and is highly",
        "versatile in magic, job skills, and more.",
      ],
      [
        "Equip: Clothes A,Gi B,Breastplate B,Armor B,Robe A,",
        "　　　　　Dress A,Skimpy A,Hat A,Helmet B,Magic Hat A,",
        "　　　　　Fancy Cap A,Buckler B,Shield B",
        "Skills: Fan,Black Magic,Taoism,Ninjutsu,Dancing,Singing,Cooking,",
        "        Sexcraft,Beast,Nature",
        "Passive: Eva/Mag Eva/Auto-hit Eva 10%,Fan Booster 20%,",
        "         MP Regen 4%,SP Regen 20%,Earth/Terra Res Pierce",
      ]],
    7423 => # 白面金毛九尾の狐
      [[
        "全ての力を解き放った禁断の妖狐",
        "月を喰らい世界を滅ぼすと伝えられ、禁種として指定された",
        "膨大な魔力を誇り、禁じられた秘術を使いこなす",
        "陰陽術に忍術、扇技と、いずれも究極の技を修得可能",
      ],
      [
        "Equip: 服SSS　武道着SS　胸当てSS　鎧SS　ローブSSS",
        "　　　　　ドレスSSS　薄着SSS　帽子SSS　兜SS　魔帽SSS",
        "　　　　　高級帽SSS　軽盾SS　盾SS",
        "Skills: 扇技　黒魔法　陰陽術　忍術　踊る　歌う",
        "　　　　料理　淫技　獣技　自然感応",
        "Passive: 扇威力アップ　土耐性貫通　毎ターンSP30%回復",
        "　　　　　　毎ターンMP8%回復　全スキルの威力が魔力に依存",
      ]],
    254 => # ラミア / Lamia
      [[
        "A type of monster with the lower body of a snake. They use their giant tails as a weapon, and their thick, scaly hide provides good defense. They excel with flails and learn powerful offensive skills.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Hat,Helmet",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Flail,Demon Arts,Snake",
        "Passive: Flail Booster 20%,Stun Strike +10%",
        "",
      ]],
    255 => # ラミアンボア / Boa Lamia
      [[
        "A Lamia who enjoys the cruelty of constricting her prey before swallowing them whole. With her strong defense and her ability to wield flails as if they were her own tail, the Boa Lamia is a powerful frontline fighter.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Hat,Helmet",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Flail,Demon Arts,Snake",
        "Passive: Flail Booster 20%,Stun Strike +20%",
        "",
      ]],
    256 => # ラミアンナイトメア / Nightmare Lamia
      [[
        "A high-ranking Lamia who takes the cruelty of winding around her prey and swallowing them whole to another level. With her outstanding defense and the ability to mow down groups of enemies with her incredible Flail skills, the Nightmare Lamia is a force of destruction.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Hat,Helmet",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Flail,Demon Arts,Snake",
        "Passive: Flail Booster 20%,Stun Strike +30%",
        "",
      ]],
    257 => # シスターラミア / Lamia Nun
      [[
        "A Lamia who has achieved the power to heal through devotion to her faith. True to her nature as a Lamia, she can restrain enemies with her tail in a gentle hug; although the Lamia Nun is a capable physical fighter, she is more proficient at magic, allowing her to fight as a magician using holy spells.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Hat,Helmet",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Flail,White Magic,Demon Arts,Snake",
        "Passive: Flail Booster 20%,Stun Strike +10%",
        "",
      ]],
    258 => # 慈愛の聖蛇 / Lamia Saint
      [[
        "A high-ranking Lamia who brings the miracle of healing fueled by compassion to all her allies. With reliable defensive powers and the ability to use Holy attacks to slay enemies, the Lamia Saint is a reliable supporter.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Hat,Helmet",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Flail,White Magic,Demon Arts,Snake",
        "Passive: Flail Booster 20%,Stun Strike +20%",
        "",
      ]],
    259 => # 蛇巫女 / Snake Miko
      [[
        "A Lamia with a gentle heart who trained both her mind and body to become a miko. With her powerful flail skills and dances that can drive nature wild, the Snake Miko can stand her ground against anybody.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Robe,Skimpy,Hat,Fancy Cap,Buckler",
        "Skills: Flail,Dancing,Demon Arts,Snake",
        "Passive: Flail Booster 20%,Stun Strike +10%",
        "",
      ]],
    260 => # 白蛇神楽 / White Snake Kagura
      [[
        "The highest class of Snake Miko who dedicates both body and soul to her deity. Wielding godly skill with a Flail and mysterious dances that both bring benefits and crushes her enemies, the White Snake Kagura is one of the best support races.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Hat,Helmet",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Flail,Dancing,Demon Arts,Snake",
        "Passive: Flail Booster 20%,Stun Strike +20%",
        "",
      ]],
    261 => # メデューサ / Medusa
      [[
        "A Lamia who has snakes for hair rather than a serpentine lower body, possessing the ability to petrify foes with a glance. Despite not being able to wear hats and helmets because of the snakes in her hair, the Medusa can learn and execute powerful Flail skills to mow down enemies.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Buckler,Shield",
        "Skills: Flail,Demon Arts,Snake",
        "Passive: Counter +50%,Flail Booster 20%",
        "",
      ]],
    262 => # ロードメデューサ / Medusa Lord
      [[
        "A high-rank Medusa with both snakes for hair and a serpentine lower body. With the ability to destroy groups of enemies with both powerful Flail skills and her petrification gaze coupled with her high overall stats, the Medusa Lord is a versatile companion to have.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Buckler,Shield",
        "Skills: Flail,Demon Arts,Snake",
        "Passive: Counter +75%,Flail Booster 20%",
        "",
      ]],
    263 => # クィーンラミア / Queen Lamia
      [[
        "A Lamia who reigns over her race, wielding every single skill of magic and power that her ancestors learned before her. With her high overall stats and mastery over Flails, Dancing, and other offensive skills, the Lamia Queen is one of the most active members of any party.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Hat,Helmet",
        "   Fancy Cap,Buckler,Shield",
        "Skills: Flail,White Magic,Dancing,Demon Arts,Snake",
        "Passive: Flail Booster 20%,Stun Strike +30%",
        "",
      ]],
    264 => # ウロボロス / Ouroboros
      [[
        "A lamia of chaos that symbolizes infinity. Their powers were so immense that they were designated a sealed race by the goddesses. The Ouroboros can learn incredibly powerful flail and snake skills, and with her extremely high defense and vitality, she demonstrates unmatched strength on the front line.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes C,Gi C,Breastplate A,Armor A,Robe C,Skimpy C,",
        "       Hat C,Helmet A,Fancy Cap C,Buckler A,Shield A",
        "Skills: Flail,White Magic,Dancing,Demon Arts,Snake",
        "Passive: Counter Rate 75%,Stun Strike 40%,Flail Booster 20%,",
        "         Crisis All Stats Up",
      ]],
    7424 => # 淫欲の堕蛇
      [[
        "神の楽園に潜み、ヒトを堕落させる悪魔の蛇",
        "人間全てを失楽させる存在として、神に禁種として指定された",
        "強力な快楽技や巻き付き技で、全てを堕落させる",
        "最強の鉄球奥義も修得し、戦闘能力は神にも匹敵する",
      ],
      [
        "Equip: 服S　武道着S　胸当てSSS　鎧SSS　ローブS",
        "　　　　　薄着S　帽子S　兜SSS　高級帽S　軽盾SSS　盾SSS",
        "Skills: 鉄球技　白魔法　踊る　魔技　蛇技",
        "Passive: 鉄球威力アップ　カウンター100%　通常攻撃スタン75%",
        "　　　　　　瀕死時超強化　鉄球技・蛇技防御力無視",
        "　　　　　　拘束された仲間がいると無限蛇の踊り発動",
      ]],
    265 => # スキュラ / Scylla
      [[
        "A monster with multiple soft tentacles for a lower body. They can use their tentacles like whips, attacking enemies repeatedly. Scylla also learn very powerful dual wielding skills. However, their defense is poor.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Robe,Skimpy,Hat,Fancy Cap",
        "Skills: Multiweapon,Tentacle",
        "Passive: Triple Attack,Whip Booster 20%",
        "",
      ]],
    266 => # ハイスキュラ / High Scylla
      [[
        "A highly trained Scylla who has improved her skill with Tentacles, launching continuous attacks to deal significant damage to her enemies. Although her low defenses make her rather fragile, the High Scylla is able to use her many tentacles to pleasure her enemies with gentle caresses.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Robe,Skimpy,Hat,Fancy Cap",
        "Skills: Multiweapon,Tentacle",
        "Passive: Triple Attack,Tentacle Skills +1",
        "   Whip Booster 20%",
      ]],
    267 => # エルダースキュラ / Elder Scylla
      [[
        "A Scylla of the highest rank, able to use her strong tentacles to attack or give pleasure to enemies like an unyielding storm. The Elder Scylla is an expert at using her tentacles, able to attack thrice in a row and restrain foes with exceptional power, making her an unparalleled offensive force from the depths of the sea.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Robe,Skimpy,Hat,Fancy Cap",
        "Skills: Multiweapon,Tentacle",
        "Passive: Triple Attack,Tentacle Skills +1",
        "   Whip Booster 20%",
        "",
      ]],
    268 => # サムライスキュラ / Scylla Samurai
      [[
        "A Scylla trained in the ways of the Samurai, wielding multiple swords in her tentacles and annihilating groups of enemies with a storm of slashes. The Scylla Samurai learns skills that can hinder enemies as well as strike down groups of them with a single attack. However, she leaves herself vulnerable on the battlefield by focusing everything into attack.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Hat,Helmet",
        "   Fancy Cap",
        "Skills: Katana,Multiweapon,Tentacle",
        "Passive: Dual Wield,Double Attack",
        "",
      ]],
    269 => # 天下無双スキュラ / Peerless Scylla Samurai
      [[
        "A Scylla Samurai who has attained higher power, wielding even more swords in her tentacles to bring countless slashes to her enemies. The Peerless Scylla Samurai has fragile defenses, but compensates by learning a variety of powerful Katana and Multiweapon skills.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Hat,Helmet",
        "   Fancy Cap",
        "Skills: Katana,Multiweapon,Tentacle",
        "Passive: Dual Wield,Double Attack",
        "",
      ]],
    270 => # スキュラメイド / Scylla Maid
      [[
        "A Scylla who has been trained as a maid, using her tentacles to Service both allies and enemies. To compensate for her low stats excluding Dexterity, the Scylla Maid has useful healing abilities with her Maid skills, making her a capable support unit.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Robe,Skimpy,Hat,Fancy Cap",
        "Skills: Service,Tentacle",
        "Passive: Eva +10%,Triple Attack",
      ]],
    271 => # スキュラサーバント / Scylla Servant
      [[
        "A highly trained Scylla Maid whose superior Service skills are supplemented by her countless tentacles. The Scylla Servant is better suited for support instead of direct combat; however, she can use pleasurable Service skills to immerse enemies in ecstasy.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Robe,Skimpy,Hat,Fancy Cap",
        "Skills: Service,Tentacle",
        "Passive: Eva +10%,Triple Attack",
        "",
      ]],
    272 => # クィーンスキュラ / Queen Scylla
      [[
        "A Scylla who rules over her kind, using her mastery of Tentacles to attack, restrain, and pleasure her enemies. Despite her troublesome defense, the Queen Scylla has high combat capability through the use of multiple weapons.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Robe,Skimpy,Hat,Helmet",
        "   Fancy Cap",
        "Skills: Katana,Multiweapon,Service,Tentacle",
        "Passive: Chaotic Attack,Tentacle Skill +1",
        "   Whip Booster 20%",
      ]],
    273 => # インフィニティスキュラ / Infinity Scylla
      [[
        "The ultimate scylla possessing an infinite number of tentacles. They captured the angel armies in a hell of tentacles during the Great Monster Wars and were designated a sealed race. The Infinity Scylla inflicts tremendous damage to foes with an overwhelming number of attacks. While their offense is outstanding, one must be careful with their brittle defenses.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes A,Gi A,Breastplate B,Armor C,Robe C,Skimpy C,",
        "       Hat A,Helmet C,Fancy Cap B",
        "Skills: Katana,Multiweapon,Service,Tentacle",
        "Passive: Chaotic Attack,Tentacle Skill +1,Tentacle Combo +1",
        "         Whip Booster 20%",
      ]],
    7425 => # 正体不明触手禍
      [[
        "非常に謎の多い触手生命体",
        "異世界の触手生物の遺伝子を持ち、神によって禁種とされた",
        "世界を触手で覆い尽くし、生あるものを嫐り尽くすという",
        "究極の触手技を習得できる他、多武器の扱いにも長けている",
      ],
      [
        "Equip: 服SSS　武道着SSS　胸当てSS　鎧S　ローブS",
        "　　　　　薄着S　帽子SSS　兜S　高級帽SS",
        "Skills: 刀技　多武器技　御奉仕　触手技",
        "Passive: 皆伝乱れ撃ち　触手技三連続発動　鞭威力アップ",
        "　　　　　　触手技連撃回数2アップ",
      ]],
    274 => # ハーピー / Harpy
      [[
        "Flying monster girls with big wings, they glide around enemy attacks with ease. They also learn energetic dances to boost stats and morale. Proficient at stealing too, but can't take a lot of hits.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Skimpy,Hat,Fancy Cap",
        "Skills: Fan,Thievery,Dancing,Wing",
        "Passive: Eva/Mag Eva +40%,Fan Booster 20%",
        "",
      ]],
    275 => # ウィングハーピー / Wing Harpy
      [[
        "A Harpy with enormous wings that allow her to fly at exceptional speeds and avoid enemy attacks. While the Wing Harpy's combat ability isn't high, she is well suited to provide support with her Dance skills and ability to steal items from enemies.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Skimpy,Hat,Fancy Cap",
        "Skills: Fan,Thievery,Dancing,Wing",
        "Passive: Eva/Mag Eva +40%,Fan Booster 20%",
        "",
      ]],
    276 => # エルダーハーピー / Elder Harpy
      [[
        "A high ranking Harpy who dominates the sky with her strong wings that stir up gusts of Wind and help her avoid enemy attacks. The Elder Harpy's powerful Thievery skills and her inspirational Dances make her effective at supporting her allies, to compensate for not being fully capable in combat.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Skimpy,Hat,Fancy Cap",
        "Skills: Fan,Thievery,Dancing,Wing",
        "Passive: Eva/Mag Eva +40%,Fan Booster 20%",
        "",
      ]],
    277 => # ハーピーナイト / Harpy Knight
      [[
        "An unconventional Harpy who trains in the ways of a Knight, overwhelming enemies with a barrage of spear thrusts augmented by her tremendous speed. The Harpy Knight is capable of using her unique Warrior's Dance to enhance her offensive strength, however her defense is low despite the ability to equip breastplates.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Skimpy,Hat,Helmet",
        "   Fancy Cap",
        "Skills: Spear,Thievery,Dancing,Wing",
        "Passive: Eva/Mag Eva +30%",
        "",
      ]],
    278 => # スカイハイ / Sky Knight
      [[
        "A high ranking Harpy Knight who soars through the heavens, using refined Spear skills to subdue her enemies with the force of gale. The Sky Knight can perform a Hero's Dance to enhance her own power; however, she sacrifices defensive capabilities to focus everything into offense.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Skimpy,Hat,Helmet",
        "   Fancy Cap",
        "Skills: Spear,Thievery,Dancing,Wing",
        "Passive: Eva/Mag Eva +30%",
        "",
      ]],
    279 => # エイビス / Aevis
      [[
        "A Harpy who acts and fights like a rabid beast, using her high physical prowess to rip enemies apart with tooth and talon. The Aevis can strike at foes with great gusts of wind and even breathe fire; however, she sacrifices magical capabilities to supplement her incredible combat prowess.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Breastplate,Hat,Fancy Cap",
        "Skills: Thievery,Beast,Wing,Breath",
        "Passive: Crit +15%,Eva +30%,Fang Booster 20%",
        "",
      ]],
    280 => # ガルーダ / Garuda
      [[
        "A Harpy known as the \"God Bird\", possessing overwhelming physical power and eliminating enemies without mercy. Armed with various Beast, Breath, and Wing skills, the Garuda is an excellent attack force of immense power.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Breastplate,Hat,Fancy Cap",
        "Skills: Thievery,Beast,Wing,Breath",
        "Passive: Crit +15%,Eva +30%,Fang Booster 20%",
        "",
      ]],
    281 => # クィーンハーピー / Queen Harpy
      [[
        "A Harpy who rules over her kind with beauty and grace. With mastery over Beast, Breath, Dancing, Fan, Spear, Thievery, and Wing skills, the Queen Harpy is a powerful fighter with both offensive and supportive capabilities.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Armor,Skimpy,Hat,Helmet",
        "   Fancy Cap",
        "Skills: Spear,Fan,Thievery,Dancing,Beast,Wing,Breath",
        "Passive: Eva/Mag Eva +40%,Fan Booster 20%",
        "",
      ]],
    282 => # 神鳥 / Divine Bird
      [[
        "A ruler of the skies said to possess great power. Their power was believed to be within the realm of the gods, and was thus sealed. The Divine Bird learns the ultimate skills of the spear and fan, and boasts exceptional combat prowess. Despite having weak defense, their extraordinary evasiveness makes it unlikely they will suffer damage.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes B,Gi B,Breastplate A,Armor C,Skimpy A,Hat A,",
        "       Helmet C,Fancy Cap A",
        "Skills: Spear,Fan,Thievery,Dancing,Beast,Wing,Breath",
        "Passive: Eva/Mag Eva/Auto-Hit Eva 40%,Crit Rate 15%,",
        "         Fan Booster 20%,1-time Auto-Revive",
      ]],
    7426 => # フェニックス
      [[
        "燃えさかる巨鳥の姿をなした宇宙波動生命体",
        "不滅の生命力を備えており、神によって禁種とされた",
        "生命エネルギーを支配し、惑星の全てを無に還すという",
        "何度倒されても蘇り、防御の薄さはものともしない",
      ],
      [
        "Equip: 服SS　武道着SS　胸当てSSS　鎧S　薄着SSS",
        "　　　　　帽子SSS　兜S　高級帽SSS",
        "Skills: 槍技　扇技　盗賊技　踊る　獣技　翼技",
        "　　　　ブレス",
        "Passive: 扇威力アップ　戦闘不能時3回自動復活",
        "",
      ]],
    283 => # ドラゴン / Dragon
      [[
        "Powerful monster girl famed for their strength. Fangs and claws alike wield fantastic power. With its trademark fire breath and excellent stats, this race screams reliability.",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Breastplate,Armor,Heavy Armor,Hat,Helmet",
        "   Heavy Helmet,Buckler,Shield,Heavy Shield",
        "Skills: Beast,Breath",
        "Passive: Fang Booster 20%",
        "",
      ]],
    284 => # 竜人 / Dragonkin
      [[
        "A Dragon who has developed a humanoid body, retaining her physical superiority. With knowledge of Unarmed and Sword skills coupled with an ability that charges SP at twice the normal speed, the Dragonkin is an encouraging ally to have.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Heavy Armor,Hat,Helmet",
        "   Heavy Helmet,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Unarmed,Beast,Breath",
        "Passive: None",
      ]],
    285 => # 覇竜 / Dragon Conqueror
      [[
        "A high-ranked Dragonkin possessing overwhelming attack, defensive power, and agility. Wielding Unarmed skills that sets her fists ablaze, the Dragon Conqueror is a reliable attack force on the battlefield.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Heavy Armor,Hat,Helmet",
        "   Heavy Helmet,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Unarmed,Beast,Breath",
        "Passive: None",
        "",
      ]],
    286 => # 竜神 / Divine Dragon
      [[
        "A Dragonkin who has evolved to resemble divinity, possessing powerful fire-based magic that could raze anything down to ash. Wielding powerful Black, White, and Time Magic, the Divine Dragon is an active if not robust magical fighter.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Heavy Armor,Robe,Hat,Helmet",
        "   Heavy Helmet,Buckler,Shield,Heavy Shield",
        "Skills: White Magic,Black Magic,Time Magic,Holy,Dark,Beast",
        "   Breath",
        "Passive: None",
      ]],
    287 => # 飛竜 / Wyvern
      [[
        "A Dragon whose body is closer to her ancestors, possessing wings like the others, but able to fly in the sky above. By breathing intense flames, summoning gusts of wind to destroy enemies, and possessing high melee capabilities, the Wyvern is a powerful aerial force.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Breastplate,Armor,Hat,Helmet",
        "Skills: Beast,Wing,Breath",
        "Passive: Eva +10%,Fang Booster 20%",
        "",
      ]],
    288 => # バハムート / Bahamut
      [[
        "A Dragon who rules the skies, wielding combat abilities said to be equal to that of a God. Her low pleasure defenses notwithstanding, a Bahamut can destroy enemies by burning them with roaring flames and blowing them away with her mighty wings.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Breastplate,Armor,Hat,Helmet",
        "Skills: Beast,Wing,Breath",
        "Passive: Eva +10%,Fang Mastery,Fang Booster 20%",
        "",
      ]],
    289 => # 海竜 / Sea Dragon
      [[
        "A Dragon born in the sea who is infamous among seafarers for their ability to cause tsunamis and freeze everything with their breath. With her high defense and possession of more magical power than regular dragons, the Sea Dragon is a very active fighter in many aspects.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Breastplate,Armor,Hat,Helmet",
        "Skills: Beast,Nature,Breath",
        "Passive: Sea Strength,Fang Booster 20%",
        "",
      ]],
    290 => # リヴァイアサン / Leviathan
      [[
        "A legendary Sea Dragon who dominates the vast seas, capable of summoning tsunamis to sink everything down to the bottom of the sea. With the power to freeze any creature accompanied with her high overall stats, the Leviathan is nothing short of a superlative combatant.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Fang,Clothes,Breastplate,Armor,Hat,Helmet",
        "Skills: Beast,Nature,Breath",
        "Passive: Super Sea Strength,Fang Mastery",
        "   Fang Booster 20%",
        "",
      ]],
    291 => # 神竜 / Dragon God
      [[
        "A dragon that has come into contact with the power of chaos,",
        "many of whom take the form of dragonkin swordswomen. The",
        "Dragon God has mastered the techniques of monsters and use top-",
        "class sword skills as well as unarmed skills, learning several",
        "martial arts unique to dragons. The Dragon God has extremely",
        "high stats, making them the best among physical attackers.",
      ],
      [
        "Equip: Fang,Clothes C,Breastplate B,Armor B,Heavy Armor A,",
        "       Hat C,Helmet B,Heavy Helmet A,Buckler C,Shield B,",
        "       Heavy Shield A,",
        "Skills: Dagger,Sword,Katana,Unarmed,Spellblade,Beast,Wing,",
        "        Nature,Breath",
        "Passive: Triple SP Charge,Fang Booster 20%,Fang Mastery+,",
        "         Physical/Carnage Res Pierce",
      ]],
    7427 => # 虚竜
      [[
        "邪神によって存在が抹消された零番目の六祖",
        "あらゆる存在と比しても最強と賞され、禁種として指定された",
        "凄まじい威力のブレスや、独自に編み出した剣技を修得",
        "能力も耐性も極めて高く、神をも上回る力を誇る",
      ],
      [
        "Equip: 服S　胸当てSS　鎧SS　重鎧SSS　帽子S　兜SS",
        "　　　　　重兜SSS　軽盾S　盾SS　重盾SSS",
        "Skills: 短剣技　剣技　刀技　格闘　白魔法　黒魔法",
        "　　　　時魔法　聖技　闇技　魔法剣　獣技　翼技",
        "　　　　自然感応　ブレス",
        "Passive: 聖技・闇技大幅威力アップ　牙威力アップ　牙装備可能",
        "　　　　　　SPチャージ5倍　物理耐性貫通　瀕死時SP消費なし",
        "　　　　　　牙ハイマスタリー＋",
      ]],
    293 => # 陸棲種 / Land-Dweller
      [[
        "A general term for reptilian and amphibian monsters who live on land. They typically have Breath skills and other toxic attacks along with skills to use their bodies as weapons. HP and defense are high, but other stats are mediocre.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Shell,Robe,Hat,Fancy Cap,Buckler",
        "Skills: Slime,Beast,Tentacle,Breath",
        "Passive: Metabolism Up",
        "",
      ]],
    294 => # 陸上魔類 / High Land-Dweller
      [[
        "A high-ranking Land-Dweller whose toughened body is capable of many feats of combat. The High Land-Dweller's exceptional vitality, coupled with her ability to breathe flames and produce strong toxins makes her a balanced fighter.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Shell,Robe,Hat,Fancy Cap,Buckler",
        "Skills: Slime,Beast,Tentacle,Breath",
        "Passive: Super Metabolism",
        "",
      ]],
    295 => # エビルスピーシーズ / Evil Species
      [[
        "A Land-Dweller who has further improved her talent with fiery Breath skills and other abilities using poison. By utilizing a special Breath skill that spreads status effects to entire groups of enemies, she can play an active role on the battlefield.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Shell,Robe,Hat,Fancy Cap,Buckler",
        "Skills: Slime,Beast,Tentacle,Breath",
        "Passive: Ultimate Metabolism",
        "",
      ]],
    296 => # 軟体搾精種 / Leech
      [[
        "A Land-Dweller who uses her mucus-covered body as a weapon. The Leech can use her unique body to bring pleasure to her enemies, and resist strong blows thanks to her high defense.",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Shell,Robe,Hat,Fancy Cap,Buckler",
        "Skills: Slime,Beast,Tentacle,Breath",
        "Passive: Metabolism Up,Slimed Strike +20%",
        "",
      ]],
    297 => # ハイクリーチャー / High Creature
      [[
        "A top-grade Land-Dweller with the ability to produce amazing mucus, using it to pleasure enemies and even melt them in digestive juices. Thanks to her overall balanced stats, the High Creature has no trouble fitting into any role on the battlefield.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Shell,Robe,Hat,Fancy Cap,Buckler",
        "Skills: Slime,Beast,Tentacle,Breath",
        "Passive: Super Metabolism,Null Dmg <= 300",
        "   Slimed Strike +30%",
        "",
      ]],
    298 => # 魔物狩り狩り / Monster Hunter-Hunter
      [[
        "An anti-hunter expert who hunts monster hunters. Specializes in bows and acquires skills to turn the tables against hunters. They're especially strong against Humans and Elves, and are able to strengthen their species-slayer attacks. While not particularly good with magic, they make up for it with their bow proficiency.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Shell,Robe,Hat,Fancy Cap",
        "Skills: Bow,Slime,Beast,Tentacle,Breath",
        "Passive: Eva +10%,Metabolism Up,Nullify Ambush",
        "   Preemptive Strike Up,Endure,Slayer Boost 100%",
      ]],
    299 => # 巨人殺し / Giant Slayer
      [[
        "A high-ranking Monster Hunter specifically trained to exterminate Giants. By learning a variety of Bow skills built for hunting prey both large and small, the Giant Slayer is an excellent long-ranged attacker.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Shell,Robe,Hat,Fancy Cap",
        "Skills: Bow,Slime,Beast,Tentacle,Breath",
        "Passive: Eva +10%,Super Metabolism,Nullify Ambush",
        "   Preemptive Strike Up,Super Endure,Slayer Boost 100%",
        "",
      ]],
    300 => # 百魔の王 / Hundred Demons Lord
      [[
        "A champion who stands above all other land-dwelling monsters. Because they were seen as the saviors of monsters, they were designated a sealed race by the Goddess Ilias. Their toxins and mucus are said to be capable of throwing the world into disarray, and they can also learn extremely powerful slime and breath skills.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes C,Gi C,Breastplate B,Shell A,Robe C,Hat A,",
        "       Fancy Cap B,Buckler C",
        "Skills: Bow,Slime,Beast,Tentacle,Breath",
        "Passive: Slime Strike 30%,Ultimate Metabolism,Nullify Ambush,",
        "         Preemptive Strike Up,Super Endure,Null Dmg <= 3000",
      ]],
    7428 => # 次元侵蝕者
      [[
        "異なる次元から侵蝕してくる正体不明の触手粘液生命体",
        "世界を触手と粘液で満たし同一化、神をも恐れさせる存在である",
        "非常に高い防御性能を備え、卓越した生命力を誇る",
        "習得できるスキルも極めて強力で、無類の力を発揮する",
      ],
      [
        "Equip: 服S　武道着S　胸当てSS　甲羅SSS　ローブS",
        "　　　　　帽子SSS　高級帽SS　軽盾S",
        "Skills: 弓技　粘液技　獣技　触手技　ブレス",
        "Passive: 究極代謝　不意打ち無効　先制攻撃アップ",
        "　　　　　　超食いしばり　50000以下ダメージ無効",
        "　　　　　　ターン終了時自動捕食",
      ]],
    301 => # 海棲種 / Sea-Dweller
      [[
        "A general term for monsters who live in and around the seas and oceans. They use tentacles as weapons, and some spew ink or bubbles. Their defense is better than the land-dwellers, but attack power is somewhat inferior.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Robe,Fancy Cap,Buckler",
        "Skills: Ocean,Tentacle",
        "Passive: Sea Strength",
        "",
      ]],
    302 => # 海洋搾精種 / Sea Leech
      [[
        "A Leech who dwells in the ocean, using her tentacles to strike down her enemies. The Sea Leech can summon a tsunami with her magic and possesses a strong body with above average stats.",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Robe,Fancy Cap,Buckler",
        "Skills: Ocean,Tentacle",
        "Passive: Sea Strength",
        "",
      ]],
    303 => # マリンプリンセス / Marine Princess
      [[
        "A Sea-Dweller who exercises dominion over the ocean, using the overwhelming power of her tentacles to destroy her enemies at her leisure. The Marine Princess can learn a variety of Ocean skills and use her tentacles to bind or pleasure enemies.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Robe,Fancy Cap,Buckler",
        "Skills: Ocean,Tentacle",
        "Passive: Super Sea Strength",
        "",
      ]],
    304 => # 深海搾精種 / Deep-Sea Leech
      [[
        "A Leech who comes from the ocean depths, possessing a needle she can use to paralyze enemies and even immerse them in ecstasy. The Deep Sea Leech is stronger than most Sea-Dwellers thanks to her talents with Ocean skills, the ability to discharge electricity towards groups of enemies, and her sturdy defense and resistance to pleasure.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Robe,Fancy Cap,Buckler",
        "Skills: Ocean,Tentacle",
        "Passive: Sea Strength,Deep Sea Strength",
        "",
      ]],
    305 => # 深淵の主 / Abyss Lord
      [[
        "A Sea-Dweller who rules the abyss of the ocean, capable of using powerful Tentacle skills and unleashing intense Lightning attacks. The Abyss Lord possesses the power to summon a whirlpool and is even capable of immersing enemies in pleasure before devouring them whole.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Robe,Fancy Cap,Buckler",
        "Skills: Ocean,Tentacle",
        "Passive: Super Sea Strength,Super Deep Sea Strength",
        "",
      ]],
    306 => # 竜宮舞妓 / Sea Palace Maiko
      [[
        "A Sea-Dweller diva who performs with Dancing and Singing skills learned from the Dragon Palace. The Sea Palace Maiko can utilize powerful Fan skills to summon waves of water to attack enemies; however, her stats are generally low, excluding Dexterity, so front-line combat is highly inadvisable.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Robe,Skimpy,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: Dancing,Singing,Sexcraft,Ocean,Tentacle",
        "Passive: Eva +10%,Mag Eva +10%,Sea Strength",
        "   Fan Booster 20%",
      ]],
    307 => # 竜宮姫 / Sea Palace Princess
      [[
        "A princess Sea-Dweller who resides in the Dragon Palace, inheriting secret Dancing and Singing skills for use on the battlefield. The Sea Palace Princess also learns mysterious Fan skills handed down from the palace, making her a valuable support character.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Robe,Skimpy,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: Dancing,Singing,Sexcraft,Ocean,Tentacle",
        "Passive: Eva/Mag Eva +10%,Super Sea Strength",
        "   Fan Booster 20%",
      ]],
    308 => # 海神 / Sea God (Water res pierce and tentacle defense ignore are bugged in the raw game)
      [[
        "A legendary monster that governs the seas. They had the power to cover the world in seas, and were sealed by the goddesses. The Sea God's tentacles can destroy everything, and they have the power to create giant tsunamis capable of flooding continents. Her defense and vitality is also high, making them suitable for any situation.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate B,Shell A,Robe B,Skimpy B,Magic Hat B,",
        "       Fancy Cap A,Buckler B",
        "Skills: Dancing,Singing,Sexcraft,Ocean,Tentacle",
        "Passive: Super Sea/Deep Sea Strength,Water/Nano Res Pierce",
        "         Tentacle Defense Ignore",
      ]],
    7429 => # 名状しがたきもの
      [[
        "太古の昔、外宇宙から飛来した異界の邪神",
        "深い海底で眠り続け、強大なる力ゆえに禁種とされた",
        "惑星そのものを消滅させるほど強力なスキルを習得可能",
        "各種耐性も卓越しており、万能の強さを誇る",
      ],
      [
        "Equip: 胸当てSS　甲羅SSS　ローブSS　薄着SS　魔帽SS",
        "　　　　　高級帽SSS　軽盾SS",
        "Skills: 踊る　歌う　淫技　海技　触手技",
        "Passive: 水耐性貫通　触手技防御力無視　海超強化　深海超強化",
        "　　　　　　敵の状態異常に応じてクトゥルフの呼び声発動",
      ]],
    309 => # 妖虫 / Insect
      [[
        "Taut and firm insect girl. Brandishes stingers and scales to attack and weaken enemies. A sturdy carapace provides high defense but little protection against status ailments.",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell,Hat,Fancy Cap",
        "Skills: Insect",
        "Passive: Great Defense,Desert Strength",
        "",
      ]],
    310 => # 闇蟲 / Dark Insect
      [[
        "An Insect possessing a strong exoskeleton, using sickle-like claws and a stinger to assault her foes. Although the Dark Insect has lackluster magic, she has extremely high offensive and defensive power and can generate a powerful Vibration Wave to strike groups of enemies at once.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell,Hat,Fancy Cap",
        "Skills: Insect",
        "Passive: Ultimate Defense,Desert Strength",
        "",
      ]],
    311 => # 冥蟲 / Underworld Insect
      [[
        "A high-ranking Insect from the underground with a body more powerful than any standard weapon. Armed with her deadly scales and extremely tough armor, the Underworld Insect is both strong and sturdy, despite her weakness to status ailments.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Shell,Hat,Fancy Cap",
        "Skills: Insect",
        "Passive: Ultimate Defense,Super Desert Strength",
        "",
      ]],
    312 => # レギオン / Legion
      [[
        "An Insect that acts and fights in accordance with the will of the colony, not unlike ants or bees. An Insect of the Legion is able to make use of Unarmed skills, call in friends for reinforcements, and even utilize her stinger as a weapon. However, her form closely resembles a human body, so her defense is inferior compared to most other bug monsters.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Hat,Fancy Cap",
        "Skills: Unarmed,Insect",
        "Passive: Desert Strength",
      ]],
    313 => # マザーレギオン / Legion Mother
      [[
        "An Insect who is the established leader of her colony, each one of them capable of many abilities. With knowledge of special Unarmed and Insect skills, including one that can kill enemies instantly with poisonous stingers, the Legion Mother is very successful on the battlefield.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Hat,Fancy Cap",
        "Skills: Unarmed,Insect",
        "Passive: Desert Strength",
        "",
      ]],
    314 => # アラクネ / Arachne
      [[
        "An Insect born from the spider family, possessing high magical power including a gift for Time Magic. The Arachne is not only good with Magic, but her support capability is very high; she can also launch sticky silk from her abdomen for a variety of attacks and restraints.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Robe,Dress,Skimpy,Hat,Magic Hat",
        "   Fancy Cap",
        "Skills: Time Magic,Insect",
        "Passive: Mag Eva +10%",
        "",
      ]],
    315 => # アトラク＝ナクア / Atlach-Nacha
      [[
        "A high-grade Arachne, using her tremendous Magic to warp time and dominate space from the past straight into the future. The Atlach-Nacha also possesses destructive physical power, and with the addition of learning predation skills, her skill diversity is exceptional.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Robe,Dress,Skimpy,Hat,Magic Hat",
        "   Fancy Cap",
        "Skills: Time Magic,Insect",
        "Passive: Mag Eva +10%",
        "",
      ]],
    317 => # クィーンインセクト / Queen Insect
      [[
        "An Insect who reigns over all types of her race; the Queen Insect shows that she is worthy of her title due to her very strong exoskeleton that can repel many attacks and using of her body, sickle-like claws, arms, and vibrating organs to boast high combat ability.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Breastplate,Shell,Robe,Dress,Skimpy,Hat",
        "   Magic Hat,Fancy Cap",
        "Skills: Unarmed,Time Magic,Insect",
        "Passive: Ultimate Defense,Super Desert Strength",
        "",
      ]],
    318 => # 神蟲 / Divine Insect
      [[
        "A magnificent insect monster that was worshipped as a deity in desert regions. Because they disrupted the balance of nature, they were designated a sealed race by the goddesses. The Divine Insect has extremely high defense and excellent resistance to elements and status ailments. Also boasts overwhelming power with the strong insect skills she can learn.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes C,Gi C,Breastplate B,Shell A,Robe C,Dress C,",
        "       Skimpy C,Hat A,Magic Hat C,Fancy Cap A",
        "Skills: Unarmed,Time Magic,Insect",
        "Passive: Perfect Counter,Counter Damage *10,Ultimate Defense,",
        "         Super Desert Strength",
      ]],
    7430 => # バアル・ゼブル
      [[
        "高き天空に君臨するという禁断の幻蟲",
        "集合意識を通じ、世界そのものと統合しようとしている",
        "万物をハイブマインドに誘う強力スキルを複数習得",
        "また卓越した防御性能を誇り、生残性が極めて高い",
      ],
      [
        "Equip: 服S　武道着S　胸当てSS　甲羅SSS　ローブS",
        "　　　　　ドレスS　薄着S　帽子SSS　魔帽S　高級帽SSS",
        "Skills: 格闘　時魔法　虫技",
        "Passive: 超究極防御　砂漠超強化　反撃ダメージ4段階強化",
        "　　　　　　完全カウンター",
      ]],
    319 => # アルラウネ / Alraune
      [[
        "Gently seductive flower monsters with healing power. Using things like ivy and pollen, Alraunes use their bodies offensively. They are also skilled with whips and learn basic whip skills, but are best suited using their nectar in a healing role for the party.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gi,Breastplate,Robe,Hat,Magic Hat,Fancy Cap,Buckler",
        "Skills: Whip,White Magic,Plant",
        "Passive: Medicine Lore I,Whip Booster 20%,Poison Strike +5%",
        "   Confusion/Paralysis Strike +5%",
        "",
      ]],
    320 => # ハイアルラウネ / High Alraune
      [[
        "A kind Alraune who is able to use White Magic and her nectar to heal her allies. Although she is capable of using her ivy as weapons to strike and restrain enemies, the High Alraune is well suited in a support role as she is not a strong physical fighter.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gi,Breastplate,Robe,Hat,Magic Hat,Fancy Cap,Buckler",
        "Skills: Whip,White Magic,Plant",
        "Passive: Medicine Lore II,Whip Booster 20%,Recovery Booster 50%",
        "   Poison/Confusion/Paralysis Strike +5%",
        "",
      ]],
    321 => # 慈愛の聖花 / Alraune Saint
      [[
        "A high-ranking Alraune with a spirit of compassion, possessing exceptional power and talent with her ivy and Whip skills. With her incredible healing powers and honey that can even revive the dead, the Alraune Saint is a very reliable support companion.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gi,Breastplate,Robe,Hat,Magic Hat,Fancy Cap,Buckler",
        "Skills: Whip,White Magic,Plant",
        "Passive: Medicine Lore III,Whip Booster 20%",
        "   Recovery Booster 50%,Poison/Confusion/Paralysis Strike +5%",
        "",
      ]],
    322 => # ワルラウネ / Walraune
      [[
        "A bad Alraune with a dark heart that drains the energy from her enemies and impairs them with her crippling pollen. With knowledge of powerful Whip skills to bring harm to her foes, the Walraune is more suited for direct combat when compared to others of her species.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gi,Breastplate,Robe,Hat,Magic Hat,Fancy Cap,Buckler",
        "Skills: Whip,Black Magic,Plant",
        "Passive: Whip Booster 20%,Plant Ailment Booster 50%",
        "   Poison/Confusion/Paralysis Strike +7%",
        "",
      ]],
    323 => # 彼岸の魔花 / Flower of Nirvana
      [[
        "A jet-black Alraune with a destructive will and pollen that invite enemies to death. The Flower of Nirvana learns powerful Whip Skills and merciless Plant Skills, sowing chaos on the battlefield by spreading status ailments amongst her enemies.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gi,Breastplate,Robe,Hat,Magic Hat,Fancy Cap,Buckler",
        "Skills: Whip,Black Magic,Plant",
        "Passive: Whip Booster 20%,Plant Ailment Booster 50%",
        "   Poison/Confusion/Paralysis Strike +10%",
        "",
      ]],
    324 => # 食虫淫花 / Carnivorous Flower
      [[
        "A species of Alraune with a hunger for melting and devouring prey of all kinds. The Carnivorous Flower can learn special whip skills to digest her restrained foes and with her high attack power, she can fight in direct combat.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gi,Breastplate,Robe,Hat,Magic Hat,Fancy Cap,Buckler",
        "Skills: Whip,Slime,Plant",
        "Passive: Whip Booster 20%,Digest/Trance Strike +10%",
        "",
      ]],
    325 => # ビーナスネペンテス / Venus Nepenthes
      [[
        "A carnivorous Alraune who has feasted upon countless creatures. With Whip skills to melt enemies, techniques that allow her to devour groups of enemies at once, and a good balance of stats, the Venus Nepenthes is a mighty creature.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Whip,Gi,Breastplate,Robe,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: Whip,Slime,Plant",
        "Passive: Whip Booster 20%,Digest/Trance Strike +15%",
        "",
      ]],
    326 => # クィーンアルラウネ / Queen Alraune
      [[
        "An Alraune who stands at the top of the chain of command. With her mastery and control of Whip, Plant, Slime, and ultimately White and Black Magic skills, the Queen Alraune is an almighty force with both offensive and recovery power.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gi,Breastplate,Robe,Hat,Magic Hat,Fancy Cap,Buckler",
        "Skills: Whip,White Magic,Black Magic,Slime,Plant",
        "Passive: Ultimate Medicine,Whip Booster 20%",
        "   Recovery Booster 50%,Plant Ailment Booster 50%",
        "   Poison/Confusion/Paralysis/Digest/Trance Strike +15%",
      ]],
    327 => # 世界樹花 / World Tree Flower
      [[
        "A legendadry flower monster from the magnificent World Tree that",
        "acquired a will of her own. They absorbed the life force of many",
        "angels during the Great Monster Wars and were designated a",
        "sealed race. Has excellent restorative power in addition to",
        "tremendous magical might. Although her defenses are weak, she",
        "boasts unmatched capability as a support.",
      ],
      [
        "Equip: Gi C,Breastplate B,Robe A,Hat B,Magic Hat A,Fancy Cap A,",
        "       Buckler B",
        "Skills: Whip,White Magic,Black Magic,Slime,Plant",
        "Passive: Whip Booster 20%,Poison/Confusion/Paralyze Strike 20%,",
        "         Digestion/Trance Strike 15%,Recovery Booster 50%,",
        "         Ultimate Medicine,Pollen Success Up",
      ]],
    7431 => # 千樹華音
      [[
        "星の精を吸い上げ成長するという究極の魔樹",
        "大地の命と引き替えに花を咲かせ、禁種に指定された",
        "そのツタは大地を埋め、その花粉は終末をもたらすという",
        "また鞭技の究極奥義を修得し、絶大な力を発揮する",
      ],
      [
        "Equip: 武道着S　胸当てSS　ローブSSS　帽子SS",
        "　　　　　魔帽SSS　高級帽SSS　軽盾SS",
        "Skills: 鞭技　白魔法　黒魔法　粘液技　植物技",
        "Passive: 通常攻撃毒30%　通常攻撃混乱30%　通常攻撃麻痺30%",
        "　　　　　　究極薬効　鞭威力アップ　植物技状態異常率アップ",
        "　　　　　　植物技の全体回復・治療技を控えの仲間にも適用",
        "",
      ]],
    328 => # ゾンビ / Zombie
      [[
        "Shambling corpse reanimated by unknown means. With no memory or sense of self to speak of, its stats amount to little else but endurance and brute force. Preferably with a club.",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Heavy Armor,Hat,Helmet",
        "   Heavy Helmet",
        "Skills: Club,Dancing,Corpse,Breath",
        "Passive: Poison/Zombie Strike +5%",
        "",
      ]],
    329 => # ハイアンデッド / High Undead
      [[
        "An undead creature who has grown stronger, using brute force to compensate for intelligence. Although the High Undead can produce toxins to supplement her high offensive power, she is weak at all aspects of magic.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Heavy Armor,Hat,Helmet",
        "   Heavy Helmet",
        "Skills: Club,Dancing,Corpse,Breath",
        "Passive: Poison/Zombie Strike +10%",
        "",
      ]],
    330 => # マスターアンデッド / Master Undead
      [[
        "A high-grade undead who has immense spiritual energy, well suited for crushing her enemies to a pulp in spite of her low intelligence. The Master Undead possesses extreme physical strength and can learn powerful attacks that can poison and zombify enemies; however, her magic is still nothing of value.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Heavy Armor,Hat,Helmet",
        "   Heavy Helmet",
        "Skills: Club,Dancing,Corpse,Breath",
        "Passive: Poison/Zombie Strike +15%",
        "",
      ]],
    331 => # マミー / Mummy
      [[
        "A special type of undead revived through the use of cursed bandages, surpassing other Zombies with her ability to invoke powerful spells. The Mummy can use her bandage wraps to capture and restrain her enemies, and with her high magical power, she is well suited for the role of magician.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Robe,Hat,Helmet,Magic Hat",
        "Skills: Club,Black Magic,Demon Arts,Corpse",
        "Passive: Mag Eva +10%,Mini/Petrify Strike +5%",
        "",
      ]],
    332 => # イシス / Isis
      [[
        "A high-ranking Mummy with advanced magic, utilizing powerful spells to destroy entire groups of enemies. In addition to being a capable magical fighter, an Isis can also use her bandages to bind her enemies and drain them dry.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Robe,Hat,Helmet,Magic Hat",
        "Skills: Club,Black Magic,Demon Arts,Corpse",
        "Passive: Mag Eva +10%,Mini/Petrify Strike +10%",
        "",
      ]],
    333 => # ゾンビドクター / Zombie Doctor
      [[
        "An insane Doctor who has been resurrected as an undead creature, spreading poison and other biological contamination through her Medicine skills. Although her stats are not particularly high, the Zombie Doctor can inject enemies with a virus to zombify them, making her suitable for a supportive role.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Robe,Hat,Helmet,Magic Hat",
        "Skills: Magic Science,Alchemy,Medicine,Corpse",
        "Passive: Poison/Zombie Strike +15%",
        "",
      ]],
    334 => # デスプロフェッサー / Death Professor
      [[
        "A resurrected mad scientist who has accumulated vast knowledge of the magic arts. Armed with powerful Magic Science skills that can create a Biohazard, the Death Professor is an excellent attack force.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Robe,Hat,Helmet,Magic Hat",
        "Skills: Magic Science,Alchemy,Medicine,Corpse",
        "Passive: Poison/Zombie Strike +20%",
        "",
      ]],
    335 => # カオスアンデッド / Chaos Undead
      [[
        "A ruler of the underworld who brings death and demise across the",
        "land. They were shunned by the goddesses for this ability, and",
        "designated a sealed race. The Chaos Undead can learn the",
        "ultimate club skills to destroy the very land itself. The status",
        "ailments they inflict are also potent, and can bring death unto",
        "all foes.",
      ],
      [
        "Equip: Clothes A,Breastplate A,Armor B,Heavy Armor C,Robe C,",
        "       Hat A,Helmet B,Heavy Helmet C,Magic Hat C,",
        "Skills: Club,Black Magic,Dancing,Magic Science,Alchemy,Medicine,",
        "        Demon Arts,Corpse,Breath",
        "Passive: Poison/Mini/Zombie/Petrify Strike 20%,",
        "         Club/Medicine/Corpse Persistence",
      ]],
    7432 => # ノーライフキング
      [[
        "世の摂理を否定した不滅の反生命存在",
        "物理法則のバグを利用した形で、消滅せず現世に残り続ける",
        "それゆえに戦闘不能になっても毎ターン終了時に自動復活",
        "生命力や攻撃力も非常に高く、肉弾戦で力を発揮する",
      ],
      [
        "Equip: 服SSS　胸当てSSS　鎧SS　重鎧S　ローブS",
        "　　　　　帽子SSS　兜SS　重兜S　魔帽S",
        "Skills: 棍技　黒魔法　踊る　魔導科学　錬金術　医術",
        "　　　　魔技　屍技　ブレス",
        "Passive: 通常攻撃毒30%　通常攻撃ミニマム30%　通常攻撃ゾンビ30%",
        "　　　　　　通常攻撃石化30%　棍技・医術・屍技頑強発動　不滅の肉体",
      ]],
    336 => # ゴースト / Ghost
      [[
        "Ethereal being made of dark magic and souls. These undead creatures are masters of haunted flames. Deadly with scythes and strong against physical attacks, but poor against magic.",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Magic Hat",
        "Skills: Scythe,Black Magic,Corpse",
        "Passive: Eva +30%,Scythe Booster 20%,Mag Ref +10%",
        "   Death Strike +5%",
        "",
      ]],
    337 => # エビルミスト / Evil Mist
      [[
        "A Ghost who has grown stronger through accumulating high concentrations of dark magic. The Evil Mist is capable of burning enemies with Black Magic, learning greater Scythe skills, and even using pleasure attacks to drain the health of entire groups of enemies.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Magic Hat",
        "Skills: Scythe,Black Magic,Corpse",
        "Passive: Eva +30%,Scythe Booster 20%,Mag Ref +30%",
        "   Death Strike +10%",
        "",
      ]],
    338 => # マスターシャドウ / Master Shadow
      [[
        "A top-ranked Ghost who has accumulated vast amounts of dark energy. With Scythe skills that bring death to enemies and the power to burn away everything with the fires of Hell, the Master Shadow plays an active role as a magic fighter.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Magic Hat",
        "Skills: Scythe,Black Magic,Corpse",
        "Passive: Eva +30%,Scythe Booster 20%,Mag Ref +50%",
        "   Death Strike +20%",
        "",
      ]],
    339 => # 魔棲の書物 / Grimoire
      [[
        "A subspecies of Ghost spiritually bound to a book. By wielding powerful Grimoire skills, including the ability to create pages for further use, she is a versatile magical fighter, even though her defense is higher and magic defense is lower than most magicians.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Magic Hat",
        "Skills: Alchemy,Grimoire,Corpse",
        "Passive: Eva +20%",
        "",
      ]],
    340 => # ページオブロード / Page Lord
      [[
        "A Grimoire with high spirituality, boasting magic power accumulated over hundreds of years. The Page Lord can master powerful Grimoire skills, each one activating a variety of effects; however, her magic defense is quite low, so caution is advisable.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Magic Hat",
        "Skills: Alchemy,Grimoire,Corpse",
        "Passive: Eva +20%",
        "",
      ]],
    341 => # ミミック / Mimic
      [[
        "A treasure chest possessed by a ghost who attacks with fangs and slime. The Mimic can swallow digested enemies whole and has high defense in comparison to other Ghost-type monsters.",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Magic Hat",
        "Skills: Black Magic,Slime,Corpse",
        "Passive: Battle Start Surprise Box 100%,Cave Strength",
        "   Death Strike +20%",
        "",
      ]],
    342 => # パンドラ / Pandora
      [[
        "A powerful Mimic who has mastered the cruel art of predation. With additional capabilities of biting foes with her fangs, bringing Mass Death to groups of enemies, and a good balance of stats, Pandora can handle any variety of combat.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe,Magic Hat",
        "Skills: Black Magic,Slime,Corpse",
        "Passive: Battle Start Surprise Box 100%",
        "   Super Cave Strength,Death Strike +30%",
        "",
      ]],
    343 => # エターニティ / Eternity
      [[
        "A legendary ghost that is said to linger forever. Many angels were killed by them during the Great Monster Wars, and they were designated a sealed race. Learns powerful skills and abilities that can lead foes to death. Weak against elemental attacks, but has a high chance to reflect magic back.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Robe A,Hat A,Magic Hat A,Buckler C,Shield C",
        "Skills: Scythe,Black Magic,Dark,Alchemy,Grimoire,Slime,Corpse",
        "Passive: Eva 30%,Auto-Hit Eva 15%,Magic Reflect 75%,",
        "         Death Strike 50%,Scythe Booster 20%,",
        "         Dark Skill Booster 100%,Super Cave Strength",
      ]],
    7433 => # 死神
      [[
        "冥府に君臨し、万物の死を統括する支配者",
        "神にも届かぬ力を疎んじられ、禁種として指定された",
        "鎌技の究極奥義や、強力な炎術を修得可能",
        "魔法を全て反射するという、強力な能力を持つ",
      ],
      [
        "Equip: ローブSSS　帽子SSS　魔帽SSS　軽盾S　盾S",
        "Skills: 鎌技　黒魔法　闇技　錬金術　魔本術　粘液技",
        "　　　　屍技",
        "Passive: 通常攻撃即死100%　完全魔法反射　鎌威力アップ",
        "　　　　　　屍技頑強発動　洞窟超強化　闇技最大限威力アップ",
      ]],
    344 => # ドール / Doll
      [[
        "Basic construct with free will. Fights with weapons implanted within its body. In accordance with the Laws of Robotics, it gladly serves others and learns as it goes. Its artificial body blocks most ailments.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Robe,Dress,Skimpy,Hat,Fancy Cap,Buckler",
        "Skills: Service,Demon Arts,Artificial",
        "Passive: None",
        "",
      ]],
    345 => # エビルマータ / Evilmaton
      [[
        "A Doll monster that has become stronger through spiritual powers, using her many body parts as weapons. Although her stats are not very high, the Evilmaton can learn a variety of useful skills, including the ability to use her hair to drain energy from her enemies.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Robe,Dress,Skimpy,Hat,Fancy Cap,Buckler",
        "Skills: Service,Demon Arts,Artificial",
        "Passive: None",
        "",
      ]],
    346 => # フォースドール / Force Doll
      [[
        "A high-ranking Doll monster with extreme spiritual power, armed with many weapons and the ability to self-destruct. The Force Doll is capable of using powerful Service skills to pleasure their foes, and possesses immunity to multiple status ailments.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Robe,Dress,Skimpy,Hat,Fancy Cap,Buckler",
        "Skills: Service,Demon Arts,Artificial",
        "Passive: None",
        "",
      ]],
    347 => # ボーカロイド / Vocaloid
      [[
        "A Doll made for entertainment, singing a variety of songs that can impair enemies with different status ailments. The Vocaloid is also able to use sound as a weapon to damage her enemies, making her excellent in a support role despite being unsuited for melee combat.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Robe,Dress,Skimpy,Hat,Fancy Cap",
        "Skills: Singing,Service,Artificial",
        "Passive: Eva/Mag Eva +10%",
        "",
      ]],
    348 => # アカデミードール / Academy Doll
      [[
        "A high-ranked Vocaloid created to use unmatched Dancing and Singing skills, each with many special effects. The Academy Doll learns skills that can be used for both support and offense, making her a highly versatile and reliable contribution on the battlefield.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Robe,Dress,Skimpy,Hat,Fancy Cap",
        "Skills: Dancing,Singing,Service,Artificial",
        "Passive: Eva/Mag Eva +10%",
        "",
      ]],
    349 => # ゴーレム / Golem
      [[
        "A large artificial monster created with metal and stone through the art of Magic Science. The Golem possesses colossal strength and learns many physical attack skills that make use of her tremendous bulk and her overwhelming power.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Heavy Armor,Helmet,Fancy Cap",
        "Skills: Artificial,Giant",
        "Passive: Endure",
        "",
      ]],
    350 => # マスターゴーレム / Master Golem
      [[
        "A Golem who has been reinforced with magic, granting her even more overwhelming power. With her knowledge of multiple powerful physical skills and her extremely high defense, the Master Golem is well built for melee combat.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Heavy Armor,Helmet,Fancy Cap",
        "Skills: Artificial",
        "Passive: Super Endure",
        "",
      ]],
    353 => # 究極至高人形 / Ultimate Supreme Doll
      [[
        "The greatest and ultimate doll created with unknown technology. They were deployed during the Great Monster Wars, and designated as a sealed race afterwards. Can learn all sorts of skills worthy of an ultimate doll. They also possess a fraction of the chaos power, making them resistant to damage from chaos elements.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes A,Breastplate C,Shell C,Robe B,Dress A,Skimpy A,",
        "       Hat A,Fancy Cap A,Helmet C,Buckler B,Shield B",
        "Skills: Gun,Dancing,Singing,Makina,Service,Demon Arts,Artificial",
        "Passive: Ultimate Endure",
      ]],
    7434 => # 影、紬ぐ人形
      [[
        "禁術に手を出した天才人形遣いが仕上げた禁断の人形",
        "人知を超えた技術により、史上類を見ない強さを誇る",
        "あまりにも危険な技能や、未知の踊りに歌を習得",
        "混沌属性に対する耐性も僅かながら増している",
      ],
      [
        "Equip: 服SSS　胸当てS　甲羅S　ローブSS　ドレスSSS",
        "　　　　　薄着SSS　帽子SSS　高級帽SSS　兜S　軽盾SS",
        "　　　　　盾SS",
        "Skills: 銃技　踊る　歌う　マキナ　御奉仕　魔技",
        "　　　　造技",
        "Passive: 究極食いしばり　混沌属性軽減",
      ]],
    354 => # キメラ / Chimera
      [[
        "Artificial monster made by state-of-the-art biotechnology. Amalgamation of superior parts grants it superb fighting power. Can breathe fire, ice, and even lightning. Comes with basic self-repair systems and fantastic vitality.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Skimpy,Hat,Helmet,Buckler,Shield",
        "Skills: Beast,Artificial,Breath",
        "Passive: None",
        "",
      ]],
    355 => # 三種混合体 / Tri-Chimera
      [[
        "A Chimera formed from many strong monsters, with a selectively modified body and potent Breath attacks. With the ability to capture and assimilate foes into her form and her high stats, the Tri-Chimera will play a useful role in many situations.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Skimpy,Hat,Helmet,Buckler,Shield",
        "Skills: Beast,Artificial,Breath",
        "Passive: None",
        "",
      ]],
    356 => # ギガミュータント / Giga Mutant
      [[
        "A supreme Chimera said to be completely perfect, boasting overwhelming combat capabilities. Although her magic power is somewhat low, the Giga Mutant has extraordinary stats and a Breath skill that harnesses the element of Darkness, making her very reliable.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Skimpy,Hat,Helmet,Buckler,Shield",
        "Skills: Beast,Artificial,Breath",
        "Passive: None",
        "",
      ]],
    357 => # 魔導キメラ / Magical Chimera
      [[
        "A Chimera made with Yoma genes, granting her magical capabilities. The Magical Chimera can also perform Summoning skills, and with physical stats on par with her magical powers, she can handle fighting on the front lines.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Robe,Skimpy,Hat,Helmet,Magic Hat",
        "   Buckler,Shield",
        "Skills: White Magic,Black Magic,Summoning,Demon Arts,Artificial",
        "   Breath",
        "Passive: None",
      ]],
    358 => # フォースミュータント / Force Mutant
      [[
        "A Magical Chimera who has attained greater magical might, expressing power much like a living furnace. The Force Mutant is capable of creating a forcefield, unleashing a Breath skill empowered by the Holy element, and ultimately Summoning artificial versions of the Four Spirits.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Robe,Skimpy,Hat,Helmet,Magic Hat",
        "   Buckler,Shield",
        "Skills: White Magic,Black Magic,Summoning,Demon Arts,Artificial",
        "   Breath",
        "Passive: None",
      ]],
    359 => # キメラロイド / Chimeraroid
      [[
        "A Chimera created with both biological and mechanical parts, including weapons capable of destroying enemies with overwhelming firepower. Although her Speed and Magic are lackluster, the Chimeraroid possesses superior Attack and Defense, as well as the ability to repair her body, making her extremely effective in combat.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Skimpy,Hat,Helmet,Buckler,Shield",
        "Skills: Gun,Makina,Artificial",
        "Passive: None",
      ]],
    360 => # 機神 / Machine God
      [[
        "The supreme mechanical Chimera made with cutting edge technology, including weapons that are capable of bringing endless destruction. With her versatile control over guns, as well as her high stats and formidable resistance against status ailments, the Machine God spares no enemy on the battlefield.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Skimpy,Hat,Helmet,Buckler,Shield",
        "Skills: Gun,Makina,Artificial",
        "Passive: None",
        "",
      ]],
    361 => # ウェポンタイプ / Weapon Type
      [[
        "A super biological weapon created during the Great Monster Wars. It operates using the reaction of the opposing holy and dark energies. The Weapon Type's power was immense, and believed to be without equal. With the many powerful offensive skills it learns, the strength it boasts is unbeatable.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate A,Shell A,Skimpy B,Hat B,Helmet A,",
        "       Buckler B,Shield B",
        "Skills: Gun,White Magic,Black Magic,Makina,Demon Arts,Beast,",
        "        Artificial,Breath",
        "Passive: 6-Turn MP/SP Cost 50%",
      ]],
    7435 => # オメガタイプ
      [[
        "神の技術を投入して完成した究極のウェポンタイプ",
        "無尽蔵の力で、文明を灰燼に帰するほどの力を所持している",
        "習得スキルも極めて強力で、究極兵器の名に相応しい",
        "また戦闘開始時に魔力や気力の消費はなく、縦横に荒れ狂う",
      ],
      [
        "Equip: 胸当てSSS　甲羅SSS　薄着SS　帽子SS　兜SSS",
        "　　　　　軽盾SS　盾SS",
        "Skills: 銃技　白魔法　黒魔法　マキナ　魔技",
        "　　　　獣技　造技　ブレス",
        "Passive: 戦闘開始後4ターンMPおよびSP消費ゼロ",
        "",
      ]],
    362 => # 下位天使 / Lowly Angel
      [[
        "The vanguard in the armies of Heaven. Their holy power can be used for both attacking and healing. Skilled with swords and holy techniques. Balanced stats and excellent resistances.",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Heavy Armor,Robe,Dress,Skimpy,Hat,Helmet",
        "   Heavy Helmet,Magic Hat,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Rapier,White Magic,Holy",
        "Passive: Eva/Mag Eva +10%,Body of Divine Protection",
        "",
      ]],
    363 => # 中位天使 / Mid-Ranking Angel
      [[
        "An Angel from the middle ranks who rarely visits the Earth, wielding divine power granted to her from the Goddess Ilias. With knowledge of powerful Sword skills coupled with her superior attack and recovery abilities, the Mid-Ranking Angel is clearly a great contribution on the battlefield.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Heavy Armor,Robe,Dress,Skimpy,Hat,Helmet",
        "   Heavy Helmet,Magic Hat,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Rapier,White Magic,Holy",
        "Passive: Eva/Mag Eva +10%,Body of Grace",
        "",
      ]],
    364 => # 上位天使 / High Angel
      [[
        "An Angel recognized by the Goddess Ilias and placed among the highest ranks. With powerful Sword skills that execute divine justice, the ability to perform heavenly miracles, and even her high stats, the High Angel shows versatility in any situation.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Heavy Armor,Robe,Dress,Skimpy,Hat,Helmet",
        "   Heavy Helmet,Magic Hat,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Rapier,White Magic,Holy",
        "Passive: Eva/Mag Eva +10%,Body of Miracles",
        "",
      ]],
    365 => # 堕天使 / Fallen Angel
      [[
        "A High Angel who rebelled against the Goddess Ilias and fell to the Earth, retaining her power despite falling. The Fallen Angel can learn many offensive skills and wield them with her blade; with high combat capabilities and the ability to heal through Meditation, she is a force to be reckoned with.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Heavy Armor,Robe,Dress,Skimpy,Hat,Helmet",
        "   Heavy Helmet,Magic Hat,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Rapier,Black Magic,Holy,Dark",
        "Passive: Eva/Mag Eva +10%,Body of Miracles",
        "",
      ]],
    366 => # ヴァルキリー / Valkyrie
      [[
        "A war Angel given the role of destroying Ilias' enemies. The Valkyrie can wield powerful Spear skills, charge stamina by consuming mana, and naturally utilize Holy abilities used to destroy evil.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Heavy Armor,Robe,Dress,Skimpy,Hat,Helmet",
        "   Heavy Helmet,Magic Hat,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Rapier,Spear,Holy,Spellblade",
        "Passive: Eva/Mag Eva +10%,Body of Grace",
        "",
      ]],
    367 => # ロードヴァルキリア / Valkyrie Lord
      [[
        "A Valkyrie who leads allies as the pinnacle of heroism. Wielding powerful spear skills, including one that can restore stamina for repeated use, as well as the ability to attack multiple enemies at once. The Valkyrie Lord boasts unrivaled strength capable of destroying all of the Goddess' enemies.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Armor,Heavy Armor,Robe,Dress,Skimpy,Hat,Helmet",
        "   Heavy Helmet,Magic Hat,Fancy Cap,Buckler,Shield,Heavy Shield",
        "Skills: Dagger,Sword,Rapier,Spear,Holy,Spellblade",
        "Passive: Eva/Mag Eva +10%,Body of Miracles",
        "",
      ]],
    368 => # キューピッド / Cupid
      [[
        "An Angel of love who controls the emotions and desire of mortal creatures. The Cupid can use her Bow skills to disturb an enemy's heart or smite them with Holy power, as well as learn powerful healing spells.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: Bow,White Magic,Black Magic,Holy,Sexcraft",
        "Passive: Eva/Mag Eva +30%,Body of Grace",
        "   Seduction Strike 20%",
      ]],
    369 => # 淫欲のクピド / Cupid of Lust
      [[
        "A high-ranking Cupid with very high Holy energy. With the acquisition of many offensive attacks, including Bow abilities blessed with divine power, healing spells, and a variety of Sexcraft skills, the Cupid of Lust is extremely versatile.",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Gi,Robe,Dress,Skimpy,Hat,Magic Hat,Fancy Cap",
        "   Buckler",
        "Skills: Bow,White Magic,Black Magic,Holy,Sexcraft",
        "Passive: Eva/Mag Eva +30%,Body of Miracles",
        "   Seduction Strike +40%",
        "",
      ]],
    370 => # 熾天使 / Seraph
      [[
        "An angel of the highest rank who presides over other high-",
        "ranking angels. They are regarded as a sealed race because only",
        "the Goddess Ilias herself chooses who is granted this rank.",
        "Their offensive capabilities are staggering, annihilating the",
        "Goddess' enemies with overwhelming force. Despite being weak to",
        "pleasure, they boast all-around resistance to everything else.",
      ],
      [
        "Equip: Clothes B,Gi B,Armor A,Heavy Armor A,Robe A,Dress A,",
        "       Skimpy B,Hat B,Helmet A,Heavy Helmet A,Magic Hat A,",
        "       Fancy Cap A,Buckler A,Shield A,Heavy Shield A,",
        "Skills: Dagger,Sword,Rapier,White Magic,Time Magic,Holy",
        "Passive: Eva/Mag Eva/Auto-Hit Eva 10%,Holy Skill Booster 100%,",
        "         Body of Divinity",
      ]],
    7436 => # 天の軍団長
      [[
        "あらゆる天使の頂点に立つ最高位の天使",
        "神に天上の武力を委託され、天使の軍団を率いる",
        "究極の剣技と呼ばれる天軍の剣を修得可能",
        "また聖なる力を操り、神敵を滅ぼし尽くす",
      ],
      [
        "Equip: 服SS　武道着SS　鎧SSS　重鎧SSS　ローブS",
        "　　　　　ドレスSS　薄着SS　帽子SS　兜SSS　重兜SSS　魔帽S",
        "　　　　　高級帽SS　軽盾SSS　盾SSS　重盾SSS",
        "Skills: 短剣技　剣技　尖剣技　白魔法　時魔法　聖技",
        "Passive: 聖技最大限威力アップ　神代の肉体　物理反射",
      ]],
    7437 => # 明けの明星
      [[
        "最高位の天使でありながら堕天し、神に背いた存在",
        "最強の堕天使と伝えられ、世界を破滅へと回帰させるという",
        "自らの異名を冠した奥義「明けの明星」を使用可能",
        "弓の腕前も凄まじく、天地に及ぶ者はないという",
      ],
      [
        "Equip: 服SS　武道着SS　鎧SS　重鎧SS　ローブSSS",
        "　　　　　ドレスSSS　薄着SSS　帽子SS　兜SS　重兜SS",
        "　　　　　魔帽SSS　高級帽SSS　軽盾SSS　盾SSS　重盾SSS",
        "Skills: 弓技　白魔法　黒魔法　時魔法　聖技　闇技",
        "Passive: 聖技・闇技最大限威力アップ　神代の肉体　魔法反射",
      ]],
    7438 => # 慈愛の聖百合
      [[
        "女神により新たに創造された七大天使の一人",
        "慈愛と審判を告げる聖百合とされている",
        "癒やしの力を極め、聖技と癒やしの技を同時に発動可能",
        "また植物を自在に操り、己の手足として使いこなす",
      ],
      [
        "Equip: 服SS　武道着SS　鎧S　重鎧S　ローブSSS",
        "　　　　　ドレスSSS　薄着SSS　帽子SS　兜S　重兜S",
        "　　　　　魔帽SSS　高級帽SSS　軽盾SS",
        "Skills: 鞭技　白魔法　聖技　植物技",
        "Passive: 聖技最大限威力アップ　神代の肉体",
        "　　　　　　戦闘開始時「ガブリエラの大加護」発動",
        "",
      ]],
    7439 => # 律法の守護者
      [[
        "女神により新たに創造された七大天使の一人",
        "律法を守護し、古今東西の魔法を修めていると言われる",
        "聖技を使用した際、全ての味方を守護する事が可能",
        "また清純な外見とは裏腹に、淫らな本性を備えているという",
      ],
      [
        "Equip: 服SS　武道着SS　鎧S　重鎧S　ローブSSS",
        "　　　　　ドレスSSS　薄着SSS　帽子SS　兜S　重兜S",
        "　　　　　魔帽SSS　高級帽SSS　軽盾SS",
        "Skills: 白魔法　黒魔法　時魔法　聖技　魔本術　淫技",
        "Passive: 聖技最大限威力アップ　神代の肉体",
        "　　　　　　聖技後「聖者の守護」発動",
        "",
      ]],
    7440 => # 天界決戦兵器
      [[
        "女神により新たに創造された七大天使の一人",
        "破壊と憤怒を司り、神の炎を統べるとされる",
        "その力は絶大であり、全身に破壊兵器を組み込んでいるという",
        "聖技を使用した際、同時に複数のミサイルを発射する",
      ],
      [
        "Equip: 服SS　武道着SS　鎧SSS　重鎧SSS　ローブS",
        "　　　　　ドレスS　薄着S　帽子SS　兜SSS　重兜SSS　魔帽S",
        "　　　　　高級帽S　軽盾SS　盾SS　重盾SS",
        "Skills: 格闘　聖技　マキナ　造技",
        "Passive: 聖技最大限威力アップ　神代の肉体",
        "　　　　　　聖技後「マイティミサイル」発動",
      ]],
    7441 => # 死の契約者
      [[
        "女神により新たに創造された七大天使の一人",
        "死を司る外法の天使で、堕天使であるとも言われている",
        "天使でありながら闇の力を使いこなし、大いなる災いをもたらす",
        "毎ターンごとに蘇生し、決して滅びる事がない",
      ],
      [
        "Equip: 服SS　武道着SS　鎧S　重鎧S　ローブSS",
        "　　　　　ドレスSSS　薄着SSS　帽子SS　兜S　重兜S",
        "　　　　　魔帽SS　高級帽SSS　軽盾SS　盾SS",
        "Skills: 鎌技　黒魔法　時魔法　聖技　闇技　魔技　屍技",
        "Passive: 聖技・闇技最大限威力アップ　神代の肉体",
        "　　　　　　闇属性スキルHP消費1/4　不滅の肉体",
      ]],
    7442 => # 核動力天使
      [[
        "女神により新たに創造された七大天使の双子",
        "弓や銃などの射撃武器に優れ、無類の連射性能と狙撃性能を誇る",
        "また戦闘開始後の5ターンは、SPの消費なく強力スキルを連発可能",
        "ただし5ターンが過ぎると、冷却のため各種性能が大幅に低下する",
      ],
      [
        "Equip: 服SS　武道着SS　鎧S　重鎧S　ローブS",
        "　　　　　ドレスSS　薄着SSS　帽子SS　兜S　重兜S　魔帽S",
        "　　　　　高級帽SSS　軽盾S　盾S　重盾S",
        "Skills: 弓技　銃技　白魔法　黒魔法　聖技　マキナ　造技",
        "Passive: 聖技最大限威力アップ　神代の肉体　核動力",
        "　　　　　　全スキルSPハイバースト",
      ]],
    7401 => # 試作ロイド / Prototype Roid
      [[
        "An experimental fighting machine. Highly dexterous and skilled in handling firearms and heavy weapons. They are also capable of using a variety of armaments built into their body. Sturdy with high defensive capabilities, but completely unsuited to the use of magic.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Breastplate,Shell,Skimpy,Hat,Helmet,Buckler,Shield,Guns",
        "Skills: Gun,Makina,Artificial",
        "Passive: Titanium Armor",
      ]],
    7402 => # サイボーグ / Cyborg
      [[
        "A cyborg that incorporates mechanical parts into the human body. They are skilled in the use of firearms and heavy weapons, and have extremely high agility. They also have a built-in accelerator that allows them to move at super speed. Also has high defensive capabilities, but very low magic power.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Skimpy,Hat,Helmet,Buckler,",
        "　　　Shield,Guns",
        "Skills: Gun,Makina,Artificial",
        "Passive: Accelerator",
      ]],
    7403 => # ナノアンドロイド / Nano Android
      [[
        "An android built with cutting-edge nano-technology. Can temporarily quantize their body to nullify all attacks. Also has the ability to increase the power of firearms and Makina with increased speed. Has excellent defensive capabilities, and their overall combat ability is extremely high.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Armor,Skimpy,Hat,Helmet,Buckler,",
        "　　　Shield,Guns",
        "Skills: Gun,Makina,Artificial",
        "Passive: Quantization,Accelerated Fire,Gun Mastery",
      ]],
    7404 => # 射撃型ロイド / Gunner Roid
      [[
        "A fighting machine who specializes in long-range shooting and artillery. The destructive capacity of their guns and Makina is extremely high, but their defense is low. A slow and sluggish machine only good at shooting. Also has a multi lock-on function, which makes them effective against multiple enemies.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gun,Breastplate,Shell,Hat",
        "Skills: Gun,Makina,Artificial",
        "Passive: Dual Wield,Support Bit,Multi Lock-On",
      ]],
    7405 => # バスターロイド / Buster Roid
      [[
        "A top-class fighting machine with extreme shooting capabilities. Extremely dexterous and skilled in the use of guns and Makina. Has an improved lock-on function and shows their true potential in battle against groups. Their low defensive performance and speed require careful handling.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Gun,Breastplate,Shell,Hat",
        "Skills: Gun,Makina,Artificial",
        "Passive: Dual Wield,Buster Bit,Full Lock-On",
      ]],
    7406 => # 近接型ロイド / Melee Roid
      [[
        "A fighting machine specialized in close combat. Good at close combat against enemies with excellent offensive performance. Very good at defense, and can learn unique defensive abilities. Excels in offense and defense, and has no notable weaknesses other than their inferior magical abilities.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sword,Breastplate,Armor,Heavy Armor,Shell,Skimpy,Hat,",
        "       Helmet,Heavy Helmet",
        "Skills: Sword,Makina,Artificial",
        "Passive: Dual Wield,CIWS,Assist Vulcan",
      ]],
    7407 => # アサルトロイド / Assault Roid
      [[
        "A high-class combat machine with extreme close quarters combat capabilities. Has extremely high offensive and defensive capabilities, making them an unparalleled force in combat. Has the ability to boost the power of Guns and Makina. Their unique defensive abilities are also useful, providing them with a wide array of abilities.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Sword,Breastplate,Armor,Heavy Armor,Shell,Skimpy,Hat,",
        "       Helmet,Heavy Helmet",
        "Skills: Sword,Makina,Artificial",
        "Passive: Dual Wield,Advanced CIWS,Assist Burst,",
        "         Artificial Attack Append 50%",
      ]],
    7443 => # アサルトバスター / Assault Buster
      [[
        "A humanoid weapon combining the strengths of the Assault Roid",
        "and Buster Roid, with abilities so tremendous that they were",
        "designated a sealed race by the goddesses. Possessing immense",
        "offensive power, the Assault Buster is suited to both close- and",
        "long-range fighting. Their abundance of unique abilities also",
        "allows them to display overwhelming combat prowess.",
      ],
      [
        "Equip: Sword,Gun,Clothes B,Breastplate C,Shell C,Armor A",
        "       Heavy Armor A,Skimpy B,Hat B,Helmet A,Heavy Helmet A,",
        "       Buckler B,Shield B",
        "Skills: Sword,Gun,Makina,Artificial",
        "Passive: Quantization,Dual Wield,Buster Bit,Over Lock-On,High",
        "         Adv. CIWS,Assist Full Burst,Artificial ATK Append 50%",
        
      ]],
    7444 => # シンギュラリティ
      [[
        "技術的飽和点に達した究極人工知性体",
        "あらゆる無機物に侵蝕し、自身の一部として機械化する",
        "その絶大なる力は、複数の世界を破滅に導いたとされる",
        "習得スキルは非常に強力で、戦闘能力も防御性能も極めて高い",
      ],
      [
        "Equip: 服SS　胸当てS　甲羅S　鎧SSS　重鎧SSS　薄着SS",
        "　　　　　帽子SS　兜SSS　重兜SSS　軽盾SS　盾SS",
        "Skills: 剣技　銃技　マキナ　造技",
        "Passive: 剣・銃装備可能　完全量子化　二刀流",
        "　　　　　　オメガビット　オーバーロックオン　オメガCIWS",
        "　　　　　　アシストギガバースト　アサルトシステム",
        "　　　　　　ターン終了時、ソフィスティケイトを確率発動",
      ]],
    7408 => # 巨人 / Giant
      [[
        "A rare species with a massive body, believed to be a mutation of humans and elves. They are extremely sturdy and strong with very high vitality. They boast great destructive power and can learn abilities suited to the use of Charge skills. However, they are not very good at magic and lack speed.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Hat,Helmet,Fancy Cap",
        "Skills: Giant",
        "Passive: None",
      ]],
    7409 => # ギガース / Gigas
      [[
        "An evolved species of Giants that boasts a body that defies common sense. Their vitality and sturdiness are unsurpassed, and they boasts extraordinary strength. The destructive power of their Charge skills and offensive techniques that make use of their gigantic size is tremendous. However, mind their low speed and vulnerability to status ailments.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Hat,Helmet,Fancy Cap",
        "Skills: Giant",
        "Passive: None",
      ]],
    7410 => # 巨神 / Titan
      [[
        "The ultimate giant, revered as a deity. The destruction wrought by their massive body is tantamount to disaster. Their abilities, which assist their Charge skills, give them explosive power. However, their speed is low and they are vulnerable to status ailments, so they require protective measures.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Hat,Helmet,Fancy Cap",
        "Skills: Giant",
        "Passive: None",
      ]],
    7445 => # 巨神王  / Titan Lord
      [[
        "A legendary giant that wreaked havoc during the Great Monster Wars. They were designated a sealed race after the wars due to the immense casualties they inflicted upon the angel armies. The overwhelming offensive might of the Titan Lord's large body devastates all foes before them. The abilities they learn are also extremely powerful, allowing them to serve as the strongest frontliners.",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes C,Breastplate A,Hat A,Helmet C,Fancy Cap B",
        "Skills: Axe,Club,Flail,Giant",
        "Passive: Crit Rate 15%,Crit Damage +75%,",
        "         Axe/Club/Flail/Giant Skill Booster 50%/SP Cost*2",
      ]],
    7446 => # 星喰い
      [[
        "惑星そのものを喰らうという宇宙の大巨人",
        "滅びをもたらす存在として、神によって禁種とされた",
        "その力は絶大であり、圧倒的な破壊をもたらす",
        "耐性は高くないが、有り余る生命力でそれを補っている",
      ],
      [
        "Equip: 服S　胸当てSSS　帽子SSS　兜S　高級帽SS",
        "Skills: 棍技　斧技　鉄球技　巨技",
        "Passive: 会心率アップ　会心ダメージ100%アップ",
        "　　　　　　棍技・斧技・鉄球技・巨技威力究極アップ、消費SP三倍",
        "　　　　　　銀河属性100%アップ",
      ]],
    351 => # 下位アポトーシス / Lowly Apoptosis
      [[
        "An unknown entity from the realm of Tartarus, wholly unidentified and seemingly not as an ordinary organism. The only information recorded about the Apoptosis is that they are beings who can passively use Makina and Dark magic, have high stats, and ultimately strong immunity to all status ailments.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Shell,Robe,Dress,Skimpy,Hat",
        "   Helmet,Fancy Cap,Buckler,Shield",
        "Skills: Gun,Time Magic,Dark,Makina,Artificial",
        "Passive: None",
        "",
      ]],
    352 => # 上位アポトーシス / High Apoptosis
      [[
        "A high-ranking Apoptosis who commands all the others, with nothing known of its identity or origin. With innate talent at using Makina and Dark skills, not to mention the ability to control time, all coupled with her amazing stats, the High Apoptosis has full combat capabilities.",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes,Breastplate,Shell,Robe,Dress,Skimpy,Hat",
        "   Helmet,Fancy Cap,Buckler,Shield",
        "Skills: Gun,Time Magic,Dark,Makina,Artificial",
        "Passive: None",
        "",
      ]],
    7447 => # X型アポトーシス / X-Class Apoptosis
      [[
        "One of the highest class of apotosis, said to bear a unique model number. Their true identity is unknown, but their combat abilities are extraordinarily high. Uses the power of chaos and unknown machine technology to eliminate foreign entities. With extremely high resistances as well, the X-Class Apoptosis' power draws a line setting it apart from this world's monsters.",
        "",
        "",
        "",
        "",
        "",
        "",
      ],
      [
        "Equip: Clothes B,Breastplate A,Shell A,Robe A,Dress B,Skimpy B,",
        "       Hat B,Fancy Cap A,Helmet A,Buckler B,Shield B",
        "Skills: Gun,Time Magic,Holy,Dark,Makina,Artificial,Chaos",
        "Passive: Holy/Dark Skill Booster 100%",
        "",
      ]],
    7448 => # XX型アポトーシス
      [[
        "「管理者」とも呼ばれる超越者的な存在",
        "その枠はアポトーシスにとどまらず、物理法則の運行を司る",
        "当然ながら強大な力を持ち、戦闘能力も極めて高い",
        "能力値も耐性も極めて高く、あらゆる戦場で活躍できる",
      ],
      [
        "Equip: 服SS　胸当てSSS　甲羅SSS　ローブSSS　ドレスSS",
        "薄着SS　帽子SS　高級帽SSS　兜SSS　軽盾SS　盾SS",
        "Skills: 銃技　時魔法　聖技　闇技　マキナ　造技　カオス",
        "Passive: 聖技・闇技最大限威力アップ　全状態異常無効",
        "",
      ]],
    7449 => # 混沌の使徒
      [[
        "カオスの受胎に準じて受肉した物理法則の管理者達",
        "もはやアポトーシスの枠も越え、神に等しい力を有している",
        "戦闘においても、万物を超越した力を発揮",
        "圧倒的な力で、全てを混沌に還す",
      ],
      [
        "Equip: 服SS　胸当てSSS　甲羅SSS　ローブSSS　ドレスSS",
        "薄着SS　帽子SS　高級帽SSS　兜SSS　軽盾SS　盾SS",
        "Skills: 銃技　時魔法　聖技　闇技　マキナ　造技　カオス",
        "Passive: 聖技・闇技究極威力アップ　全状態異常無効　",
        "　　　　　　時間停止無視　カウンターで乾坤一擲発動",
      ]],
    7450 => # 創世の女神
      [[
        "原初の光とされる、究極の聖素生命体",
        "この世界を創世した女神として、天地に君臨する",
        "絶対者としての力を備え、邪神以外に及ぶ者はない",
        "究極の力を秘めた神聖スキルを修得できる",
      ],
      [
        "Equip: 服SS　武道着SS　鎧S　重鎧S　ローブSSS",
        "　　　　　ドレスSSS　薄着SSS　帽子SS　兜S　重兜S　魔帽SSS",
        "　　　　　高級帽SSS　軽盾SS　盾SS　重盾S",
        "Skills: 白魔法　時魔法　聖技",
        "Passive: 聖技究極威力アップ　聖耐性貫通　MP究極消費ダウン",
        "　　　　　　神代の肉体",
      ]],
    7451 => # 邪神
      [[
        "原初の闇とされる、究極の暗黒生命体",
        "邪神として、あらゆる魔物から崇められている",
        "その力は神そのものであり、女神以外に及ぶ者はない",
        "究極の力を秘めた暗黒スキルを修得できる",
      ],
      [
        "Equip: 服SS　武道着SS　鎧SSS　重鎧SSS　ローブS",
        "　　　　　ドレスS　薄着S　帽子SS　兜SSS　重兜SSS　魔帽S",
        "　　　　　高級帽SS　軽盾SSS　盾SSS　重盾SSS",
        "Skills: 剣技　尖剣技　鎌技　黒魔法　時魔法　闇技　魔技　獣技",
        "　　　　蛇技　触手技　翼技　虫技　植物技　自然感応　ブレス",
        "Passive: 闇技究極威力アップ　闇耐性貫通　SP究極消費ダウン",
        "　　　　　　闇属性スキルHP消費なし",
      ]],
    7452 => # 第三の神
      [[
        "混沌の力に覚醒し、女神と邪神に並ぶ力を持った三番目の神",
        "聖と闇の力を併せ持ち、混沌に属する力をも使用できる",
        "時間や空間に干渉する力を持つほか、空間から生命力を回帰",
        "攻防共に超越し、まさに神と呼ぶに相応しい力を行使する",
      ],
      [
        "Equip: 服SS　武道着SS　鎧S　重鎧S　ローブSSS",
        "　　　　　ドレスSSS　薄着SSS　帽子SS　兜S　重兜S　魔帽SSS",
        "　　　　　高級帽SSS　軽盾SS　盾SS　重盾SS",
        "Skills: 白魔法　黒魔法　時魔法　聖技　闇技　魔技　獣技　蛇技",
        "　　　　触手技　翼技　虫技　植物技　自然感応　ブレス　カオス",
        "Passive: 聖技・闇技究極威力アップ　聖・闇耐性貫通　SP・MP消費1/2",
        "　　　　　　闇の支配者　万能耐性25%アップ　時間停止無視",
      ]],
    7453 => # カオス
      [[
        "意志を持った混沌であり、時空そのものと同一である存在",
        "時間と空間の管理者として、混沌の狭間に存在する",
        "闇技や時魔法の最終奥義を修得し、時間を自在に操作可能",
        "超越者に相応しい、絶対にして究極の力を誇る",
      ],
      [
        "Equip: 全防具SSS",
        "Skills: 全スキル",
        "Passive: 聖技・闇技究極威力アップ　聖・闇耐性貫通",
        "　　　　　　生命回帰　魔導回帰　気力回帰　闇の支配者",
        "　　　　　　万能耐性50%アップ　時間停止無視　時間停止カウンター",
      ]],
    7454 => # 混沌の精霊
      [[
        "未知の侵蝕生物が媒介となり、混沌の瘴気から生じた精霊",
        "混沌を喰らう能力を備え、自身の体に蓄えたり放出する事が可能",
        "その体から伸びる無数の触手は、混沌そのものだとされる",
        "混沌の侵蝕および中和能力により、圧倒的な戦闘能力を誇る",
      ],
      [
        "Equip: 服SSS　胸当てSSS　甲羅SSS　ローブSSS　ドレスSS",
        "薄着SS　帽子SSS　高級帽SSS　兜SSS　軽盾SS　盾SS",
        "Skills: 銃技　時魔法　聖技　闇技　マキナ　触手技　造技",
        "　　　　自然感応　カオス",
        "Passive: 聖技・闇技究極威力アップ　全状態異常無効",
        "　　　　　　時間停止無視　カウンターでバレットタイム発動",
      ]],
    7455 => # デウスエクスマキナ
      [[
        "時間と空間を管理しているという究極の支配人形",
        "混沌の中で、永遠のまどろみに就いているとされる",
        "時空を支配する能力は、戦闘でも圧倒的な力を発揮",
        "闇の力をも自在に操り、空間の絶対者として君臨する",
      ],
      [
        "Equip: 服SSS　胸当てSSS　鎧SSS　重鎧SSS　甲羅S",
        "　　　　　ローブSS　ドレスSSS 薄着SSS　帽子SSS　兜SSS",
        "　　　　　重兜SSS　高級帽SSS　軽盾SS　盾SS　重盾SS",
        "Skills: 銃技　時魔法　聖技　闇技　踊る　歌う　マキナ",
        "　　　　御奉仕　魔技　造技　カオス",
        "Passive: 聖技・闇技究極威力アップ　究極食いしばり",
        "　　　　　　混沌属性ダメージ半減　時間停止無視",
        "　　　　　　カウンターでウィッチタイム発動",
      ]],
  }
  
end

