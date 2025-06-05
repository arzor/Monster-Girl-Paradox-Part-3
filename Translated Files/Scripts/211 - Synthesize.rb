# -*- encoding: utf-8 -*-
=begin
= 合成屋の設定

呼び出し方法は「スクリプト」から
call_synthesize(店ID)
です

=end

#==============================================================================
# ■ NWConst::Synthesize
#==============================================================================
module NWConst::Synthesize
  # レシピ一覧
  Recipes = {
    # レシピID
    1 => {
      :price => 17,
      :after => {:kind => :W, :id => 658},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 657, :num => 1},
        {:kind => :I, :id => 322, :num => 1},
      ],
    },
    3 => {
      :price => 12,
      :after => {:kind => :W, :id => 2},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 1, :num => 1},
        {:kind => :I, :id => 163, :num => 1},
      ],
    },
    4 => {
      :price => 12,
      :after => {:kind => :W, :id => 48},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 46, :num => 1},
        {:kind => :I, :id => 161, :num => 1},
      ],
    },
    5 => {
      :price => 15,
      :after => {:kind => :W, :id => 144},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 143, :num => 1},
        {:kind => :I, :id => 163, :num => 1},
      ],
    },
    6 => {
      :price => 18,
      :after => {:kind => :W, :id => 291},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 290, :num => 1},
        {:kind => :I, :id => 164, :num => 1},
      ],
    },
    7 => {
      :price => 15,
      :after => {:kind => :W, :id => 401},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 400, :num => 1},
        {:kind => :I, :id => 161, :num => 1},
      ],
    },
    8 => {
      :price => 18,
      :after => {:kind => :W, :id => 510},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 509, :num => 1},
        {:kind => :I, :id => 162, :num => 1},
      ],
    },
    9 => {
      :price => 18,
      :after => {:kind => :W, :id => 590},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 589, :num => 1},
        {:kind => :I, :id => 162, :num => 1},
      ],
    },
    10 => {
      :price => 20,
      :after => {:kind => :W, :id => 659},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 658, :num => 1},
        {:kind => :I, :id => 160, :num => 1},
      ],
    },
    11 => {
      :price => 14,
      :after => {:kind => :A, :id => 281},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 280, :num => 1},
        {:kind => :I, :id => 161, :num => 1},
      ],
    },
    12 => {
      :price => 19,
      :after => {:kind => :W, :id => 50},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 48, :num => 1},
        {:kind => :I, :id => 165, :num => 1},
      ],
    },
    13 => {
      :price => 18,
      :after => {:kind => :W, :id => 191},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 190, :num => 1},
        {:kind => :I, :id => 164, :num => 1},
      ],
    },
    14 => {
      :price => 15,
      :after => {:kind => :W, :id => 442},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 441, :num => 1},
        {:kind => :I, :id => 162, :num => 1},
      ],
    },
    15 => {
      :price => 16,
      :after => {:kind => :A, :id => 54},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 53, :num => 1},
        {:kind => :I, :id => 165, :num => 1},
      ],
    },
    16 => {
      :price => 8,
      :after => {:kind => :A, :id => 178},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 177, :num => 1},
        {:kind => :I, :id => 165, :num => 1},
      ],
    },
    17 => {
      :price => 10,
      :after => {:kind => :A, :id => 273},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 272, :num => 1},
        {:kind => :I, :id => 165, :num => 1},
      ],
    },
    18 => {
      :price => 35,
      :after => {:kind => :W, :id => 52},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 51, :num => 1},
        {:kind => :I, :id => 167, :num => 1},
      ],
    },
    19 => {
      :price => 38,
      :after => {:kind => :W, :id => 53},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 47, :num => 1},
        {:kind => :I, :id => 167, :num => 1},
      ],
    },
    20 => {
      :price => 35,
      :after => {:kind => :W, :id => 146},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 145, :num => 1},
        {:kind => :I, :id => 167, :num => 1},
      ],
    },
    21 => {
      :price => 35,
      :after => {:kind => :W, :id => 293},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 292, :num => 1},
        {:kind => :I, :id => 63, :num => 1},
      ],
    },
    22 => {
      :price => 28,
      :after => {:kind => :W, :id => 336},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 335, :num => 1},
        {:kind => :I, :id => 167, :num => 1},
      ],
    },
    23 => {
      :price => 45,
      :after => {:kind => :W, :id => 404},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 403, :num => 1},
        {:kind => :I, :id => 167, :num => 1},
      ],
    },
    24 => {
      :price => 45,
      :after => {:kind => :W, :id => 444},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 443, :num => 1},
        {:kind => :I, :id => 63, :num => 1},
      ],
    },
    25 => {
      :price => 55,
      :after => {:kind => :W, :id => 475},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 474, :num => 1},
        {:kind => :I, :id => 63, :num => 1},
      ],
    },
    26 => {
      :price => 48,
      :after => {:kind => :W, :id => 512},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 511, :num => 1},
        {:kind => :I, :id => 63, :num => 1},
      ],
    },
    27 => {
      :price => 45,
      :after => {:kind => :W, :id => 551},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 550, :num => 1},
        {:kind => :I, :id => 63, :num => 1},
      ],
    },
    28 => {
      :price => 35,
      :after => {:kind => :W, :id => 624},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 623, :num => 1},
        {:kind => :I, :id => 63, :num => 1},
      ],
    },
    29 => {
      :price => 60,
      :after => {:kind => :W, :id => 701},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 700, :num => 1},
        {:kind => :I, :id => 167, :num => 1},
      ],
    },
    30 => {
      :price => 65,
      :after => {:kind => :W, :id => 728},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 727, :num => 1},
        {:kind => :I, :id => 168, :num => 1},
      ],
    },
    31 => {
      :price => 88,
      :after => {:kind => :W, :id => 920},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 919, :num => 1},
        {:kind => :I, :id => 168, :num => 1},
      ],
    },
    32 => {
      :price => 35,
      :after => {:kind => :A, :id => 32},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 31, :num => 1},
        {:kind => :I, :id => 168, :num => 1},
      ],
    },
    33 => {
      :price => 25,
      :after => {:kind => :A, :id => 124},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 123, :num => 1},
        {:kind => :I, :id => 168, :num => 1},
      ],
    },
    34 => {
      :price => 30,
      :after => {:kind => :A, :id => 180},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 179, :num => 1},
        {:kind => :I, :id => 168, :num => 1},
      ],
    },
    35 => {
      :price => 22,
      :after => {:kind => :A, :id => 236},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 235, :num => 1},
        {:kind => :I, :id => 63, :num => 1},
      ],
    },
    36 => {
      :price => 28,
      :after => {:kind => :A, :id => 283},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 282, :num => 1},
        {:kind => :I, :id => 63, :num => 1},
      ],
    },
    37 => {
      :price => 75,
      :after => {:kind => :W, :id => 56},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 52, :num => 1},
        {:kind => :I, :id => 172, :num => 1},
      ],
    },
    38 => {
      :price => 85,
      :after => {:kind => :W, :id => 57},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 53, :num => 1},
        {:kind => :I, :id => 51, :num => 1},
        {:kind => :I, :id => 55, :num => 1},
        {:kind => :I, :id => 59, :num => 1},
      ],
    },
    39 => {
      :price => 72,
      :after => {:kind => :W, :id => 295},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 294, :num => 1},
        {:kind => :I, :id => 51, :num => 1},
      ],
    },
    40 => {
      :price => 72,
      :after => {:kind => :W, :id => 296},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 294, :num => 1},
        {:kind => :I, :id => 55, :num => 1},
      ],
    },
    41 => {
      :price => 72,
      :after => {:kind => :W, :id => 297},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 294, :num => 1},
        {:kind => :I, :id => 59, :num => 1},
      ],
    },
    42 => {
      :price => 118,
      :after => {:kind => :W, :id => 367},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 366, :num => 1},
        {:kind => :I, :id => 172, :num => 1},
      ],
    },
    43 => {
      :price => 105,
      :after => {:kind => :W, :id => 406},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 405, :num => 1},
        {:kind => :I, :id => 169, :num => 1},
      ],
    },
    44 => {
      :price => 88,
      :after => {:kind => :W, :id => 478},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 477, :num => 1},
        {:kind => :I, :id => 59, :num => 1},
      ],
    },
    45 => {
      :price => 85,
      :after => {:kind => :W, :id => 514},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 513, :num => 1},
        {:kind => :I, :id => 51, :num => 1},
      ],
    },
    46 => {
      :price => 85,
      :after => {:kind => :W, :id => 515},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 513, :num => 1},
        {:kind => :I, :id => 55, :num => 1},
      ],
    },
    47 => {
      :price => 85,
      :after => {:kind => :W, :id => 516},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 513, :num => 1},
        {:kind => :I, :id => 59, :num => 1},
      ],
    },
    48 => {
      :price => 95,
      :after => {:kind => :W, :id => 517},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 513, :num => 1},
        {:kind => :I, :id => 169, :num => 1},
      ],
    },
    49 => {
      :price => 88,
      :after => {:kind => :W, :id => 553},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 552, :num => 1},
        {:kind => :I, :id => 51, :num => 1},
      ],
    },
    50 => {
      :price => 88,
      :after => {:kind => :W, :id => 554},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 552, :num => 1},
        {:kind => :I, :id => 55, :num => 1},
      ],
    },
    51 => {
      :price => 88,
      :after => {:kind => :W, :id => 555},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 552, :num => 1},
        {:kind => :I, :id => 59, :num => 1},
      ],
    },
    52 => {
      :price => 104,
      :after => {:kind => :W, :id => 626},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 625, :num => 1},
        {:kind => :I, :id => 170, :num => 1},
      ],
    },
    53 => {
      :price => 95,
      :after => {:kind => :W, :id => 663},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 659, :num => 1},
        {:kind => :I, :id => 169, :num => 1},
      ],
    },
    54 => {
      :price => 128,
      :after => {:kind => :W, :id => 777},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 776, :num => 1},
        {:kind => :I, :id => 169, :num => 1},
      ],
    },
    55 => {
      :price => 150,
      :after => {:kind => :W, :id => 890},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 889, :num => 1},
        {:kind => :I, :id => 172, :num => 1},
      ],
    },
    56 => {
      :price => 87,
      :after => {:kind => :A, :id => 34},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 33, :num => 1},
        {:kind => :I, :id => 170, :num => 1},
      ],
    },
    57 => {
      :price => 50,
      :after => {:kind => :A, :id => 125},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 123, :num => 1},
        {:kind => :I, :id => 169, :num => 1},
      ],
    },
    58 => {
      :price => 60,
      :after => {:kind => :A, :id => 238},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 237, :num => 1},
        {:kind => :I, :id => 166, :num => 1},
      ],
    },
    59 => {
      :price => 68,
      :after => {:kind => :A, :id => 260},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 259, :num => 1},
        {:kind => :I, :id => 170, :num => 1},
      ],
    },
    60 => {
      :price => 58,
      :after => {:kind => :A, :id => 295},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 294, :num => 1},
        {:kind => :I, :id => 51, :num => 1},
      ],
    },
    61 => {
      :price => 58,
      :after => {:kind => :A, :id => 296},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 294, :num => 1},
        {:kind => :I, :id => 55, :num => 1},
      ],
    },
    63 => {
      :price => 75,
      :after => {:kind => :W, :id => 7},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 6, :num => 1},
        {:kind => :I, :id => 173, :num => 1},
      ],
    },
    64 => {
      :price => 80,
      :after => {:kind => :W, :id => 55},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 50, :num => 1},
        {:kind => :I, :id => 79, :num => 1},
      ],
    },
    65 => {
      :price => 110,
      :after => {:kind => :W, :id => 88},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 87, :num => 1},
        {:kind => :I, :id => 173, :num => 1},
      ],
    },
    66 => {
      :price => 92,
      :after => {:kind => :W, :id => 148},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 147, :num => 1},
        {:kind => :I, :id => 67, :num => 1},
      ],
    },
    67 => {
      :price => 140,
      :after => {:kind => :W, :id => 194},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 193, :num => 1},
        {:kind => :I, :id => 79, :num => 1},
      ],
    },
    68 => {
      :price => 77,
      :after => {:kind => :W, :id => 298},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 294, :num => 1},
        {:kind => :I, :id => 67, :num => 1},
      ],
    },
    69 => {
      :price => 102,
      :after => {:kind => :W, :id => 338},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 337, :num => 1},
        {:kind => :I, :id => 79, :num => 1},
      ],
    },
    70 => {
      :price => 115,
      :after => {:kind => :W, :id => 407},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 405, :num => 1},
        {:kind => :I, :id => 67, :num => 1},
      ],
    },
    71 => {
      :price => 96,
      :after => {:kind => :W, :id => 479},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 477, :num => 1},
        {:kind => :I, :id => 79, :num => 1},
      ],
    },
    72 => {
      :price => 118,
      :after => {:kind => :W, :id => 557},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 556, :num => 1},
        {:kind => :I, :id => 175, :num => 1},
      ],
    },
    74 => {
      :price => 134,
      :after => {:kind => :W, :id => 627},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 625, :num => 1},
        {:kind => :I, :id => 67, :num => 1},
      ],
    },
    75 => {
      :price => 104,
      :after => {:kind => :W, :id => 664},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 662, :num => 1},
        {:kind => :I, :id => 171, :num => 1},
      ],
    },
    76 => {
      :price => 150,
      :after => {:kind => :W, :id => 703},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 702, :num => 1},
        {:kind => :I, :id => 67, :num => 1},
      ],
    },
    77 => {
      :price => 104,
      :after => {:kind => :W, :id => 799},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 798, :num => 1},
        {:kind => :I, :id => 79, :num => 1},
      ],
    },
    78 => {
      :price => 140,
      :after => {:kind => :W, :id => 825},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 824, :num => 1},
        {:kind => :I, :id => 79, :num => 1},
      ],
    },
    79 => {
      :price => 110,
      :after => {:kind => :A, :id => 21},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 20, :num => 1},
        {:kind => :I, :id => 175, :num => 1},
      ],
    },
    80 => {
      :price => 88,
      :after => {:kind => :A, :id => 57},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 56, :num => 1},
        {:kind => :I, :id => 171, :num => 1},
      ],
    },
    81 => {
      :price => 82,
      :after => {:kind => :A, :id => 107},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 106, :num => 1},
        {:kind => :I, :id => 67, :num => 1},
      ],
    },
    82 => {
      :price => 430,
      :after => {:kind => :A, :id => 129},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 127, :num => 1},
        {:kind => :I, :id => 67, :num => 1},
      ],
    },
    83 => {
      :price => 60,
      :after => {:kind => :A, :id => 195},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 194, :num => 1},
        {:kind => :I, :id => 171, :num => 1},
      ],
    },
    84 => {
      :price => 80,
      :after => {:kind => :A, :id => 239},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 237, :num => 1},
        {:kind => :I, :id => 67, :num => 1},
      ],
    },
    85 => {
      :price => 48,
      :after => {:kind => :A, :id => 284},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 282, :num => 1},
        {:kind => :I, :id => 171, :num => 1},
      ],
    },
    86 => {
      :price => 65,
      :after => {:kind => :A, :id => 297},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 294, :num => 1},
        {:kind => :I, :id => 173, :num => 1},
      ],
    },
    87 => {
      :price => 120,
      :after => {:kind => :W, :id => 9},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 8, :num => 1},
        {:kind => :I, :id => 181, :num => 1},
      ],
    },
    88 => {
      :price => 160,
      :after => {:kind => :W, :id => 60},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 59, :num => 1},
        {:kind => :I, :id => 181, :num => 1},
      ],
    },
    89 => {
      :price => 120,
      :after => {:kind => :W, :id => 149},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 148, :num => 1},
        {:kind => :I, :id => 178, :num => 1},
      ],
    },
    90 => {
      :price => 150,
      :after => {:kind => :W, :id => 210},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 209, :num => 1},
        {:kind => :I, :id => 173, :num => 1},
      ],
    },
    91 => {
      :price => 77,
      :after => {:kind => :W, :id => 299},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 294, :num => 1},
        {:kind => :I, :id => 71, :num => 1},
      ],
    },
    92 => {
      :price => 148,
      :after => {:kind => :W, :id => 368},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 366, :num => 1},
        {:kind => :I, :id => 71, :num => 1},
      ],
    },
    93 => {
      :price => 125,
      :after => {:kind => :W, :id => 408},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 405, :num => 1},
        {:kind => :I, :id => 71, :num => 1},
      ],
    },
    94 => {
      :price => 128,
      :after => {:kind => :W, :id => 480},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 477, :num => 1},
        {:kind => :I, :id => 71, :num => 1},
      ],
    },
    95 => {
      :price => 150,
      :after => {:kind => :W, :id => 595},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 594, :num => 1},
        {:kind => :I, :id => 181, :num => 1},
      ],
    },
    96 => {
      :price => 164,
      :after => {:kind => :W, :id => 628},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 625, :num => 1},
        {:kind => :I, :id => 71, :num => 1},
      ],
    },
    97 => {
      :price => 180,
      :after => {:kind => :W, :id => 665},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 663, :num => 1},
        {:kind => :I, :id => 63, :num => 1},
        {:kind => :I, :id => 67, :num => 1},
        {:kind => :I, :id => 71, :num => 1},
      ],
    },
    98 => {
      :price => 99,
      :after => {:kind => :W, :id => 730},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 729, :num => 1},
        {:kind => :I, :id => 71, :num => 1},
      ],
    },
    99 => {
      :price => 139,
      :after => {:kind => :W, :id => 731},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 729, :num => 1},
        {:kind => :I, :id => 174, :num => 1},
      ],
    },
    100 => {
      :price => 150,
      :after => {:kind => :W, :id => 757},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 756, :num => 1},
        {:kind => :I, :id => 178, :num => 1},
      ],
    },
    101 => {
      :price => 107,
      :after => {:kind => :W, :id => 847},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 846, :num => 1},
        {:kind => :I, :id => 174, :num => 1},
      ],
    },
    102 => {
      :price => 120,
      :after => {:kind => :W, :id => 869},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 868, :num => 1},
        {:kind => :I, :id => 176, :num => 1},
      ],
    },
    103 => {
      :price => 70,
      :after => {:kind => :A, :id => 6},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 5, :num => 1},
        {:kind => :I, :id => 175, :num => 1},
      ],
    },
    104 => {
      :price => 107,
      :after => {:kind => :A, :id => 35},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 33, :num => 1},
        {:kind => :I, :id => 71, :num => 1},
      ],
    },
    105 => {
      :price => 148,
      :after => {:kind => :A, :id => 58},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 57, :num => 1},
        {:kind => :I, :id => 176, :num => 1},
      ],
    },
    106 => {
      :price => 430,
      :after => {:kind => :A, :id => 130},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 127, :num => 1},
        {:kind => :I, :id => 71, :num => 1},
      ],
    },
    107 => {
      :price => 180,
      :after => {:kind => :A, :id => 150},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 149, :num => 1},
        {:kind => :I, :id => 174, :num => 1},
      ],
    },
    108 => {
      :price => 150,
      :after => {:kind => :A, :id => 165},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 163, :num => 1},
        {:kind => :I, :id => 176, :num => 1},
      ],
    },
    109 => {
      :price => 60,
      :after => {:kind => :A, :id => 184},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 183, :num => 1},
        {:kind => :I, :id => 175, :num => 1},
      ],
    },
    110 => {
      :price => 100,
      :after => {:kind => :A, :id => 240},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 237, :num => 1},
        {:kind => :I, :id => 71, :num => 1},
      ],
    },
    111 => {
      :price => 75,
      :after => {:kind => :A, :id => 285},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 284, :num => 1},
        {:kind => :I, :id => 71, :num => 1},
      ],
    },
    112 => {
      :price => 240,
      :after => {:kind => :W, :id => 62},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 57, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    113 => {
      :price => 250,
      :after => {:kind => :W, :id => 90},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 89, :num => 1},
        {:kind => :I, :id => 182, :num => 1},
      ],
    },
    114 => {
      :price => 150,
      :after => {:kind => :W, :id => 150},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 147, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    115 => {
      :price => 200,
      :after => {:kind => :W, :id => 195},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 193, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    116 => {
      :price => 250,
      :after => {:kind => :W, :id => 212},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 211, :num => 1},
        {:kind => :I, :id => 182, :num => 1},
      ],
    },
    117 => {
      :price => 170,
      :after => {:kind => :W, :id => 301},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 300, :num => 1},
        {:kind => :I, :id => 182, :num => 1},
      ],
    },
    118 => {
      :price => 142,
      :after => {:kind => :W, :id => 339},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 338, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    119 => {
      :price => 240,
      :after => {:kind => :W, :id => 370},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 369, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    120 => {
      :price => 220,
      :after => {:kind => :W, :id => 410},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 55, :num => 1},
        {:kind => :I, :id => 184, :num => 1},
      ],
    },
    121 => {
      :price => 220,
      :after => {:kind => :W, :id => 411},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 406, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    122 => {
      :price => 200,
      :after => {:kind => :W, :id => 447},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 446, :num => 1},
        {:kind => :I, :id => 184, :num => 1},
      ],
    },
    123 => {
      :price => 200,
      :after => {:kind => :W, :id => 559},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 558, :num => 1},
        {:kind => :I, :id => 181, :num => 1},
      ],
    },
    124 => {
      :price => 230,
      :after => {:kind => :W, :id => 596},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 593, :num => 1},
        {:kind => :I, :id => 179, :num => 1},
      ],
    },
    125 => {
      :price => 184,
      :after => {:kind => :W, :id => 629},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 625, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    126 => {
      :price => 270,
      :after => {:kind => :W, :id => 667},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 665, :num => 1},
        {:kind => :I, :id => 177, :num => 1},
      ],
    },
    127 => {
      :price => 250,
      :after => {:kind => :W, :id => 668},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 666, :num => 1},
        {:kind => :I, :id => 183, :num => 1},
      ],
    },
    128 => {
      :price => 200,
      :after => {:kind => :W, :id => 704},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 703, :num => 1},
        {:kind => :I, :id => 184, :num => 1},
      ],
    },
    129 => {
      :price => 210,
      :after => {:kind => :W, :id => 732},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 729, :num => 1},
        {:kind => :I, :id => 181, :num => 1},
      ],
    },
    130 => {
      :price => 170,
      :after => {:kind => :W, :id => 778},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 776, :num => 1},
        {:kind => :I, :id => 183, :num => 1},
      ],
    },
    131 => {
      :price => 160,
      :after => {:kind => :W, :id => 826},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 824, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    132 => {
      :price => 200,
      :after => {:kind => :W, :id => 848},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 846, :num => 1},
        {:kind => :I, :id => 181, :num => 1},
      ],
    },
    133 => {
      :price => 220,
      :after => {:kind => :W, :id => 871},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 870, :num => 1},
        {:kind => :I, :id => 180, :num => 1},
      ],
    },
    134 => {
      :price => 340,
      :after => {:kind => :W, :id => 893},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 890, :num => 1},
        {:kind => :I, :id => 183, :num => 1},
      ],
    },
    135 => {
      :price => 250,
      :after => {:kind => :W, :id => 922},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 919, :num => 1},
        {:kind => :I, :id => 179, :num => 1},
      ],
    },
    136 => {
      :price => 137,
      :after => {:kind => :A, :id => 36},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 35, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    137 => {
      :price => 208,
      :after => {:kind => :A, :id => 59},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 58, :num => 1},
        {:kind => :I, :id => 179, :num => 1},
      ],
    },
    138 => {
      :price => 290,
      :after => {:kind => :A, :id => 72},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 71, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    139 => {
      :price => 350,
      :after => {:kind => :A, :id => 131},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 126, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    140 => {
      :price => 190,
      :after => {:kind => :A, :id => 166},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 164, :num => 1},
        {:kind => :I, :id => 181, :num => 1},
      ],
    },
    141 => {
      :price => 110,
      :after => {:kind => :A, :id => 196},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 195, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    142 => {
      :price => 180,
      :after => {:kind => :A, :id => 205},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 204, :num => 1},
        {:kind => :I, :id => 182, :num => 1},
      ],
    },
    143 => {
      :price => 250,
      :after => {:kind => :A, :id => 262},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 261, :num => 1},
        {:kind => :I, :id => 75, :num => 1},
      ],
    },
    144 => {
      :price => 150,
      :after => {:kind => :A, :id => 299},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 298, :num => 1},
        {:kind => :I, :id => 180, :num => 1},
      ],
    },
    145 => {
      :price => 185,
      :after => {:kind => :W, :id => 13},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 10, :num => 1},
        {:kind => :I, :id => 64, :num => 1},
      ],
    },
    146 => {
      :price => 250,
      :after => {:kind => :W, :id => 63},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 61, :num => 1},
        {:kind => :I, :id => 64, :num => 1},
      ],
    },
    147 => {
      :price => 480,
      :after => {:kind => :W, :id => 92},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 91, :num => 1},
        {:kind => :I, :id => 189, :num => 1},
      ],
    },
    148 => {
      :price => 310,
      :after => {:kind => :W, :id => 152},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 151, :num => 1},
        {:kind => :I, :id => 186, :num => 1},
      ],
    },
    149 => {
      :price => 280,
      :after => {:kind => :W, :id => 197},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 196, :num => 1},
        {:kind => :I, :id => 189, :num => 1},
      ],
    },
    150 => {
      :price => 350,
      :after => {:kind => :W, :id => 214},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 213, :num => 1},
        {:kind => :I, :id => 185, :num => 1},
      ],
    },
    151 => {
      :price => 250,
      :after => {:kind => :W, :id => 303},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 302, :num => 1},
        {:kind => :I, :id => 189, :num => 1},
      ],
    },
    152 => {
      :price => 250,
      :after => {:kind => :W, :id => 341},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 340, :num => 1},
        {:kind => :I, :id => 186, :num => 1},
      ],
    },
    153 => {
      :price => 480,
      :after => {:kind => :W, :id => 373},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 370, :num => 1},
        {:kind => :I, :id => 189, :num => 1},
      ],
    },
    154 => {
      :price => 320,
      :after => {:kind => :W, :id => 413},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 410, :num => 1},
        {:kind => :I, :id => 64, :num => 1},
      ],
    },
    155 => {
      :price => 450,
      :after => {:kind => :W, :id => 449},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 447, :num => 1},
        {:kind => :I, :id => 186, :num => 1},
      ],
    },
    156 => {
      :price => 280,
      :after => {:kind => :W, :id => 483},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 482, :num => 1},
        {:kind => :I, :id => 185, :num => 1},
      ],
    },
    157 => {
      :price => 340,
      :after => {:kind => :W, :id => 521},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 518, :num => 1},
        {:kind => :I, :id => 189, :num => 1},
      ],
    },
    158 => {
      :price => 400,
      :after => {:kind => :W, :id => 562},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 561, :num => 1},
        {:kind => :I, :id => 188, :num => 1},
      ],
    },
    159 => {
      :price => 330,
      :after => {:kind => :W, :id => 631},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 629, :num => 1},
        {:kind => :I, :id => 188, :num => 1},
      ],
    },
    160 => {
      :price => 330,
      :after => {:kind => :W, :id => 632},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 630, :num => 1},
        {:kind => :I, :id => 189, :num => 1},
      ],
    },
    161 => {
      :price => 430,
      :after => {:kind => :W, :id => 671},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 667, :num => 1},
        {:kind => :I, :id => 188, :num => 1},
      ],
    },
    162 => {
      :price => 400,
      :after => {:kind => :W, :id => 706},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 705, :num => 1},
        {:kind => :I, :id => 189, :num => 1},
      ],
    },
    163 => {
      :price => 330,
      :after => {:kind => :W, :id => 759},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 758, :num => 1},
        {:kind => :I, :id => 185, :num => 1},
      ],
    },
    164 => {
      :price => 410,
      :after => {:kind => :W, :id => 828},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 827, :num => 1},
        {:kind => :I, :id => 186, :num => 1},
      ],
    },
    165 => {
      :price => 330,
      :after => {:kind => :W, :id => 872},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 871, :num => 1},
        {:kind => :I, :id => 185, :num => 1},
      ],
    },
    166 => {
      :price => 510,
      :after => {:kind => :W, :id => 895},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 894, :num => 1},
        {:kind => :I, :id => 64, :num => 1},
      ],
    },
    167 => {
      :price => 330,
      :after => {:kind => :A, :id => 9},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 6, :num => 1},
        {:kind => :I, :id => 187, :num => 1},
      ],
    },
    168 => {
      :price => 310,
      :after => {:kind => :A, :id => 38},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 37, :num => 1},
        {:kind => :I, :id => 187, :num => 1},
      ],
    },
    169 => {
      :price => 380,
      :after => {:kind => :A, :id => 61},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 60, :num => 1},
        {:kind => :I, :id => 187, :num => 1},
      ],
    },
    170 => {
      :price => 380,
      :after => {:kind => :A, :id => 74},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 73, :num => 1},
        {:kind => :I, :id => 187, :num => 1},
      ],
    },
    171 => {
      :price => 430,
      :after => {:kind => :A, :id => 128},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 127, :num => 1},
        {:kind => :I, :id => 64, :num => 1},
      ],
    },
    172 => {
      :price => 450,
      :after => {:kind => :A, :id => 132},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 131, :num => 1},
        {:kind => :I, :id => 188, :num => 1},
      ],
    },
    173 => {
      :price => 130,
      :after => {:kind => :A, :id => 186},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 185, :num => 1},
        {:kind => :I, :id => 185, :num => 1},
      ],
    },
    174 => {
      :price => 290,
      :after => {:kind => :A, :id => 198},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 197, :num => 1},
        {:kind => :I, :id => 189, :num => 1},
      ],
    },
    175 => {
      :price => 180,
      :after => {:kind => :A, :id => 242},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 241, :num => 1},
        {:kind => :I, :id => 64, :num => 1},
      ],
    },
    176 => {
      :price => 190,
      :after => {:kind => :A, :id => 287},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 286, :num => 1},
        {:kind => :I, :id => 64, :num => 1},
      ],
    },
    177 => {
      :price => 300,
      :after => {:kind => :A, :id => 301},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 300, :num => 1},
        {:kind => :I, :id => 185, :num => 1},
      ],
    },
    178 => {
      :price => 420,
      :after => {:kind => :W, :id => 16},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 14, :num => 1},
        {:kind => :I, :id => 191, :num => 1},
      ],
    },
    179 => {
      :price => 500,
      :after => {:kind => :W, :id => 64},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 62, :num => 1},
        {:kind => :I, :id => 198, :num => 1},
      ],
    },
    180 => {
      :price => 700,
      :after => {:kind => :W, :id => 96},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 94, :num => 1},
        {:kind => :I, :id => 197, :num => 1},
      ],
    },
    181 => {
      :price => 400,
      :after => {:kind => :W, :id => 153},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 149, :num => 1},
        {:kind => :I, :id => 193, :num => 1},
      ],
    },
    182 => {
      :price => 550,
      :after => {:kind => :W, :id => 216},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 215, :num => 1},
        {:kind => :I, :id => 194, :num => 1},
      ],
    },
    183 => {
      :price => 550,
      :after => {:kind => :W, :id => 306},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 305, :num => 1},
        {:kind => :I, :id => 195, :num => 1},
      ],
    },
    184 => {
      :price => 300,
      :after => {:kind => :W, :id => 342},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 341, :num => 1},
        {:kind => :I, :id => 194, :num => 1},
      ],
    },
    185 => {
      :price => 730,
      :after => {:kind => :W, :id => 377},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 376, :num => 1},
        {:kind => :I, :id => 198, :num => 1},
      ],
    },
    186 => {
      :price => 450,
      :after => {:kind => :W, :id => 414},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 412, :num => 1},
        {:kind => :I, :id => 191, :num => 1},
      ],
    },
    187 => {
      :price => 520,
      :after => {:kind => :W, :id => 419},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 415, :num => 1},
        {:kind => :I, :id => 198, :num => 1},
      ],
    },
    188 => {
      :price => 500,
      :after => {:kind => :W, :id => 485},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 484, :num => 1},
        {:kind => :I, :id => 195, :num => 1},
      ],
    },
    189 => {
      :price => 680,
      :after => {:kind => :W, :id => 523},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 522, :num => 1},
        {:kind => :I, :id => 195, :num => 1},
      ],
    },
    190 => {
      :price => 600,
      :after => {:kind => :W, :id => 599},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 596, :num => 1},
        {:kind => :I, :id => 190, :num => 1},
      ],
    },
    191 => {
      :price => 450,
      :after => {:kind => :W, :id => 633},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 630, :num => 1},
        {:kind => :I, :id => 193, :num => 1},
      ],
    },
    192 => {
      :price => 450,
      :after => {:kind => :W, :id => 634},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 630, :num => 1},
        {:kind => :I, :id => 190, :num => 1},
      ],
    },
    193 => {
      :price => 460,
      :after => {:kind => :W, :id => 672},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 670, :num => 1},
        {:kind => :I, :id => 197, :num => 1},
      ],
    },
    194 => {
      :price => 500,
      :after => {:kind => :W, :id => 707},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 706, :num => 1},
        {:kind => :I, :id => 196, :num => 1},
      ],
    },
    195 => {
      :price => 370,
      :after => {:kind => :W, :id => 734},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 733, :num => 1},
        {:kind => :I, :id => 192, :num => 1},
      ],
    },
    196 => {
      :price => 380,
      :after => {:kind => :W, :id => 802},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 800, :num => 1},
        {:kind => :I, :id => 194, :num => 1},
      ],
    },
    197 => {
      :price => 450,
      :after => {:kind => :W, :id => 850},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 849, :num => 1},
        {:kind => :I, :id => 190, :num => 1},
      ],
    },
    198 => {
      :price => 430,
      :after => {:kind => :A, :id => 39},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 37, :num => 1},
        {:kind => :I, :id => 196, :num => 1},
      ],
    },
    199 => {
      :price => 650,
      :after => {:kind => :A, :id => 77},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 75, :num => 1},
        {:kind => :I, :id => 197, :num => 1},
      ],
    },
    200 => {
      :price => 310,
      :after => {:kind => :A, :id => 109},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 108, :num => 1},
        {:kind => :I, :id => 191, :num => 1},
      ],
    },
    201 => {
      :price => 340,
      :after => {:kind => :A, :id => 151},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 149, :num => 1},
        {:kind => :I, :id => 193, :num => 1},
      ],
    },
    202 => {
      :price => 350,
      :after => {:kind => :A, :id => 199},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 198, :num => 1},
        {:kind => :I, :id => 196, :num => 1},
      ],
    },
    203 => {
      :price => 500,
      :after => {:kind => :A, :id => 263},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 262, :num => 1},
        {:kind => :I, :id => 193, :num => 1},
      ],
    },
    204 => {
      :price => 100,
      :after => {:kind => :A, :id => 275},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 274, :num => 1},
        {:kind => :I, :id => 192, :num => 1},
      ],
    },
    205 => {
      :price => 220,
      :after => {:kind => :A, :id => 303},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 302, :num => 1},
        {:kind => :I, :id => 197, :num => 1},
      ],
    },
    206 => {
      :price => 500,
      :after => {:kind => :W, :id => 18},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 15, :num => 1},
        {:kind => :I, :id => 68, :num => 1},
      ],
    },
    207 => {
      :price => 730,
      :after => {:kind => :W, :id => 66},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 65, :num => 1},
        {:kind => :I, :id => 68, :num => 1},
      ],
    },
    208 => {
      :price => 1100,
      :after => {:kind => :W, :id => 126},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 125, :num => 1},
        {:kind => :I, :id => 68, :num => 1},
      ],
    },
    209 => {
      :price => 330,
      :after => {:kind => :W, :id => 198},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 197, :num => 1},
        {:kind => :I, :id => 68, :num => 1},
      ],
    },
    210 => {
      :price => 720,
      :after => {:kind => :W, :id => 217},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 216, :num => 1},
        {:kind => :I, :id => 68, :num => 1},
      ],
    },
    211 => {
      :price => 600,
      :after => {:kind => :W, :id => 375},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 374, :num => 1},
        {:kind => :I, :id => 68, :num => 1},
      ],
    },
    212 => {
      :price => 600,
      :after => {:kind => :W, :id => 486},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 485, :num => 1},
        {:kind => :I, :id => 199, :num => 1},
      ],
    },
    213 => {
      :price => 500,
      :after => {:kind => :W, :id => 564},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 563, :num => 1},
        {:kind => :I, :id => 199, :num => 1},
      ],
    },
    214 => {
      :price => 650,
      :after => {:kind => :W, :id => 673},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 668, :num => 1},
        {:kind => :I, :id => 200, :num => 1},
      ],
    },
    215 => {
      :price => 220,
      :after => {:kind => :W, :id => 780},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 778, :num => 1},
        {:kind => :I, :id => 200, :num => 1},
      ],
    },
    216 => {
      :price => 550,
      :after => {:kind => :W, :id => 803},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 802, :num => 1},
        {:kind => :I, :id => 199, :num => 1},
      ],
    },
    217 => {
      :price => 440,
      :after => {:kind => :W, :id => 873},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 872, :num => 1},
        {:kind => :I, :id => 68, :num => 1},
      ],
    },
    218 => {
      :price => 730,
      :after => {:kind => :W, :id => 898},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 893, :num => 1},
        {:kind => :I, :id => 200, :num => 1},
      ],
    },
    219 => {
      :price => 550,
      :after => {:kind => :W, :id => 923},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 922, :num => 1},
        {:kind => :I, :id => 199, :num => 1},
      ],
    },
    220 => {
      :price => 400,
      :after => {:kind => :A, :id => 62},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 60, :num => 1},
        {:kind => :I, :id => 68, :num => 1},
      ],
    },
    221 => {
      :price => 570,
      :after => {:kind => :A, :id => 133},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 127, :num => 1},
        {:kind => :I, :id => 199, :num => 1},
      ],
    },
    222 => {
      :price => 390,
      :after => {:kind => :A, :id => 207},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 206, :num => 1},
        {:kind => :I, :id => 68, :num => 1},
      ],
    },
    223 => {
      :price => 220,
      :after => {:kind => :A, :id => 243},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 241, :num => 1},
        {:kind => :I, :id => 68, :num => 1},
      ],
    },
    224 => {
      :price => 220,
      :after => {:kind => :A, :id => 288},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 286, :num => 1},
        {:kind => :I, :id => 68, :num => 1},
      ],
    },
    225 => {
      :price => 280,
      :after => {:kind => :W, :id => 19},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 15, :num => 1},
        {:kind => :I, :id => 72, :num => 1},
      ],
    },
    226 => {
      :price => 420,
      :after => {:kind => :W, :id => 67},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 65, :num => 1},
        {:kind => :I, :id => 72, :num => 1},
      ],
    },
    227 => {
      :price => 800,
      :after => {:kind => :W, :id => 127},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 125, :num => 1},
        {:kind => :I, :id => 72, :num => 1},
      ],
    },
    228 => {
      :price => 250,
      :after => {:kind => :W, :id => 199},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 197, :num => 1},
        {:kind => :I, :id => 72, :num => 1},
      ],
    },
    229 => {
      :price => 300,
      :after => {:kind => :W, :id => 345},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 343, :num => 1},
        {:kind => :I, :id => 72, :num => 1},
      ],
    },
    230 => {
      :price => 500,
      :after => {:kind => :W, :id => 418},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 413, :num => 1},
        {:kind => :I, :id => 203, :num => 1},
      ],
    },
    231 => {
      :price => 350,
      :after => {:kind => :W, :id => 601},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 599, :num => 1},
        {:kind => :I, :id => 202, :num => 1},
      ],
    },
    232 => {
      :price => 480,
      :after => {:kind => :W, :id => 676},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 671, :num => 1},
        {:kind => :I, :id => 202, :num => 1},
      ],
    },
    233 => {
      :price => 430,
      :after => {:kind => :W, :id => 709},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 708, :num => 1},
        {:kind => :I, :id => 72, :num => 1},
      ],
    },
    234 => {
      :price => 320,
      :after => {:kind => :W, :id => 761},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 760, :num => 1},
        {:kind => :I, :id => 203, :num => 1},
      ],
    },
    235 => {
      :price => 320,
      :after => {:kind => :W, :id => 830},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 829, :num => 1},
        {:kind => :I, :id => 203, :num => 1},
      ],
    },
    236 => {
      :price => 300,
      :after => {:kind => :W, :id => 875},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 874, :num => 1},
        {:kind => :I, :id => 203, :num => 1},
      ],
    },
    237 => {
      :price => 250,
      :after => {:kind => :A, :id => 41},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 40, :num => 1},
        {:kind => :I, :id => 204, :num => 1},
      ],
    },
    238 => {
      :price => 200,
      :after => {:kind => :A, :id => 63},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 60, :num => 1},
        {:kind => :I, :id => 72, :num => 1},
      ],
    },
    239 => {
      :price => 230,
      :after => {:kind => :A, :id => 79},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 78, :num => 1},
        {:kind => :I, :id => 201, :num => 1},
      ],
    },
    240 => {
      :price => 290,
      :after => {:kind => :A, :id => 134},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 126, :num => 1},
        {:kind => :I, :id => 204, :num => 1},
      ],
    },
    241 => {
      :price => 180,
      :after => {:kind => :A, :id => 209},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 208, :num => 1},
        {:kind => :I, :id => 201, :num => 1},
      ],
    },
    242 => {
      :price => 160,
      :after => {:kind => :A, :id => 245},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 244, :num => 1},
        {:kind => :I, :id => 204, :num => 1},
      ],
    },
    243 => {
      :price => 250,
      :after => {:kind => :A, :id => 265},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 264, :num => 1},
        {:kind => :I, :id => 204, :num => 1},
      ],
    },
    244 => {
      :price => 120,
      :after => {:kind => :A, :id => 289},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 286, :num => 1},
        {:kind => :I, :id => 72, :num => 1},
      ],
    },
    245 => {
      :price => 200,
      :after => {:kind => :A, :id => 305},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 304, :num => 1},
        {:kind => :I, :id => 201, :num => 1},
      ],
    },
    246 => {
      :price => 550,
      :after => {:kind => :W, :id => 68},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 65, :num => 1},
        {:kind => :I, :id => 207, :num => 1},
      ],
    },
    247 => {
      :price => 550,
      :after => {:kind => :W, :id => 100},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 97, :num => 1},
        {:kind => :I, :id => 60, :num => 1},
      ],
    },
    248 => {
      :price => 290,
      :after => {:kind => :W, :id => 155},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 154, :num => 1},
        {:kind => :I, :id => 205, :num => 1},
      ],
    },
    249 => {
      :price => 320,
      :after => {:kind => :W, :id => 308},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 307, :num => 1},
        {:kind => :I, :id => 207, :num => 1},
      ],
    },
    250 => {
      :price => 390,
      :after => {:kind => :W, :id => 310},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 309, :num => 1},
        {:kind => :I, :id => 206, :num => 1},
      ],
    },
    251 => {
      :price => 280,
      :after => {:kind => :W, :id => 344},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 343, :num => 1},
        {:kind => :I, :id => 207, :num => 1},
      ],
    },
    252 => {
      :price => 780,
      :after => {:kind => :W, :id => 422},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 417, :num => 1},
        {:kind => :I, :id => 60, :num => 1},
      ],
    },
    253 => {
      :price => 370,
      :after => {:kind => :W, :id => 452},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 451, :num => 1},
        {:kind => :I, :id => 207, :num => 1},
      ],
    },
    254 => {
      :price => 550,
      :after => {:kind => :W, :id => 490},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 488, :num => 1},
        {:kind => :I, :id => 208, :num => 1},
      ],
    },
    255 => {
      :price => 560,
      :after => {:kind => :W, :id => 527},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 525, :num => 1},
        {:kind => :I, :id => 208, :num => 1},
      ],
    },
    256 => {
      :price => 320,
      :after => {:kind => :W, :id => 566},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 565, :num => 1},
        {:kind => :I, :id => 205, :num => 1},
      ],
    },
    257 => {
      :price => 410,
      :after => {:kind => :W, :id => 637},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 632, :num => 1},
        {:kind => :I, :id => 206, :num => 1},
      ],
    },
    258 => {
      :price => 510,
      :after => {:kind => :W, :id => 677},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 675, :num => 1},
        {:kind => :I, :id => 60, :num => 1},
      ],
    },
    259 => {
      :price => 430,
      :after => {:kind => :W, :id => 710},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 708, :num => 1},
        {:kind => :I, :id => 60, :num => 1},
      ],
    },
    260 => {
      :price => 420,
      :after => {:kind => :W, :id => 737},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 731, :num => 1},
        {:kind => :I, :id => 209, :num => 1},
      ],
    },
    261 => {
      :price => 240,
      :after => {:kind => :W, :id => 783},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 781, :num => 1},
        {:kind => :I, :id => 208, :num => 1},
      ],
    },
    262 => {
      :price => 400,
      :after => {:kind => :W, :id => 806},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 804, :num => 1},
        {:kind => :I, :id => 208, :num => 1},
      ],
    },
    263 => {
      :price => 350,
      :after => {:kind => :W, :id => 852},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 848, :num => 1},
        {:kind => :I, :id => 205, :num => 1},
      ],
    },
    264 => {
      :price => 2000,
      :after => {:kind => :W, :id => 902},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 898, :num => 1},
        {:kind => :I, :id => 208, :num => 1},
      ],
    },
    265 => {
      :price => 440,
      :after => {:kind => :W, :id => 924},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 923, :num => 1},
        {:kind => :I, :id => 205, :num => 1},
      ],
    },
    266 => {
      :price => 180,
      :after => {:kind => :A, :id => 11},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 9, :num => 1},
        {:kind => :I, :id => 209, :num => 1},
      ],
    },
    267 => {
      :price => 220,
      :after => {:kind => :A, :id => 111},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 110, :num => 1},
        {:kind => :I, :id => 207, :num => 1},
      ],
    },
    268 => {
      :price => 50,
      :after => {:kind => :A, :id => 153},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 152, :num => 1},
        {:kind => :I, :id => 205, :num => 1},
      ],
    },
    269 => {
      :price => 180,
      :after => {:kind => :A, :id => 188},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 187, :num => 1},
        {:kind => :I, :id => 206, :num => 1},
      ],
    },
    270 => {
      :price => 180,
      :after => {:kind => :A, :id => 246},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 244, :num => 1},
        {:kind => :I, :id => 209, :num => 1},
      ],
    },
    271 => {
      :price => 580,
      :after => {:kind => :W, :id => 101},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 98, :num => 1},
        {:kind => :I, :id => 56, :num => 1},
      ],
    },
    272 => {
      :price => 1350,
      :after => {:kind => :W, :id => 129},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 128, :num => 1},
        {:kind => :I, :id => 60, :num => 1},
      ],
    },
    273 => {
      :price => 650,
      :after => {:kind => :W, :id => 201},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 200, :num => 1},
        {:kind => :I, :id => 60, :num => 1},
      ],
    },
    274 => {
      :price => 580,
      :after => {:kind => :W, :id => 221},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 220, :num => 1},
        {:kind => :I, :id => 56, :num => 1},
      ],
    },
    275 => {
      :price => 490,
      :after => {:kind => :W, :id => 312},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 311, :num => 1},
        {:kind => :I, :id => 56, :num => 1},
      ],
    },
    276 => {
      :price => 620,
      :after => {:kind => :W, :id => 381},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 379, :num => 1},
        {:kind => :I, :id => 56, :num => 1},
      ],
    },
    277 => {
      :price => 650,
      :after => {:kind => :W, :id => 421},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 418, :num => 1},
        {:kind => :I, :id => 210, :num => 1},
      ],
    },
    278 => {
      :price => 550,
      :after => {:kind => :W, :id => 454},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 453, :num => 1},
        {:kind => :I, :id => 210, :num => 1},
      ],
    },
    279 => {
      :price => 490,
      :after => {:kind => :W, :id => 568},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 567, :num => 1},
        {:kind => :I, :id => 210, :num => 1},
      ],
    },
    280 => {
      :price => 580,
      :after => {:kind => :W, :id => 604},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 601, :num => 1},
        {:kind => :I, :id => 211, :num => 1},
      ],
    },
    281 => {
      :price => 520,
      :after => {:kind => :W, :id => 639},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 638, :num => 1},
        {:kind => :I, :id => 210, :num => 1},
      ],
    },
    282 => {
      :price => 550,
      :after => {:kind => :W, :id => 739},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 738, :num => 1},
        {:kind => :I, :id => 211, :num => 1},
      ],
    },
    283 => {
      :price => 550,
      :after => {:kind => :W, :id => 854},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 853, :num => 1},
        {:kind => :I, :id => 212, :num => 1},
      ],
    },
    284 => {
      :price => 540,
      :after => {:kind => :W, :id => 925},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 924, :num => 1},
        {:kind => :I, :id => 211, :num => 1},
      ],
    },
    285 => {
      :price => 380,
      :after => {:kind => :A, :id => 113},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 112, :num => 1},
        {:kind => :I, :id => 212, :num => 1},
      ],
    },
    286 => {
      :price => 150,
      :after => {:kind => :A, :id => 290},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 286, :num => 1},
        {:kind => :I, :id => 212, :num => 1},
      ],
    },
    287 => {
      :price => 480,
      :after => {:kind => :W, :id => 22},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 10, :num => 1},
        {:kind => :I, :id => 217, :num => 1},
      ],
    },
    288 => {
      :price => 900,
      :after => {:kind => :W, :id => 70},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 64, :num => 1},
        {:kind => :I, :id => 76, :num => 1},
      ],
    },
    289 => {
      :price => 480,
      :after => {:kind => :W, :id => 158},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 152, :num => 1},
        {:kind => :I, :id => 217, :num => 1},
      ],
    },
    290 => {
      :price => 650,
      :after => {:kind => :W, :id => 222},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 219, :num => 1},
        {:kind => :I, :id => 76, :num => 1},
      ],
    },
    291 => {
      :price => 520,
      :after => {:kind => :W, :id => 313},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 303, :num => 1},
        {:kind => :I, :id => 213, :num => 1},
      ],
    },
    292 => {
      :price => 770,
      :after => {:kind => :W, :id => 382},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 373, :num => 1},
        {:kind => :I, :id => 213, :num => 1},
      ],
    },
    293 => {
      :price => 570,
      :after => {:kind => :W, :id => 455},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 454, :num => 1},
        {:kind => :I, :id => 76, :num => 1},
      ],
    },
    294 => {
      :price => 680,
      :after => {:kind => :W, :id => 491},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 490, :num => 1},
        {:kind => :I, :id => 216, :num => 1},
      ],
    },
    295 => {
      :price => 630,
      :after => {:kind => :W, :id => 528},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 521, :num => 1},
        {:kind => :I, :id => 213, :num => 1},
      ],
    },
    296 => {
      :price => 880,
      :after => {:kind => :W, :id => 530},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 527, :num => 1},
        {:kind => :I, :id => 76, :num => 1},
      ],
    },
    297 => {
      :price => 720,
      :after => {:kind => :W, :id => 570},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 569, :num => 1},
        {:kind => :I, :id => 76, :num => 1},
      ],
    },
    298 => {
      :price => 780,
      :after => {:kind => :W, :id => 680},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 676, :num => 1},
        {:kind => :I, :id => 217, :num => 1},
      ],
    },
    299 => {
      :price => 850,
      :after => {:kind => :W, :id => 712},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 707, :num => 1},
        {:kind => :I, :id => 215, :num => 1},
      ],
    },
    300 => {
      :price => 750,
      :after => {:kind => :W, :id => 764},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 763, :num => 1},
        {:kind => :I, :id => 215, :num => 1},
      ],
    },
    301 => {
      :price => 640,
      :after => {:kind => :W, :id => 808},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 803, :num => 1},
        {:kind => :I, :id => 217, :num => 1},
      ],
    },
    302 => {
      :price => 550,
      :after => {:kind => :W, :id => 877},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 876, :num => 1},
        {:kind => :I, :id => 214, :num => 1},
      ],
    },
    303 => {
      :price => 2500,
      :after => {:kind => :W, :id => 903},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 901, :num => 1},
        {:kind => :I, :id => 76, :num => 1},
      ],
    },
    304 => {
      :price => 280,
      :after => {:kind => :A, :id => 13},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 11, :num => 1},
        {:kind => :I, :id => 216, :num => 1},
      ],
    },
    305 => {
      :price => 450,
      :after => {:kind => :A, :id => 43},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 39, :num => 1},
        {:kind => :I, :id => 215, :num => 1},
      ],
    },
    306 => {
      :price => 420,
      :after => {:kind => :A, :id => 83},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 81, :num => 1},
        {:kind => :I, :id => 214, :num => 1},
      ],
    },
    307 => {
      :price => 350,
      :after => {:kind => :A, :id => 190},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 189, :num => 1},
        {:kind => :I, :id => 216, :num => 1},
      ],
    },
    308 => {
      :price => 450,
      :after => {:kind => :A, :id => 214},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 212, :num => 1},
        {:kind => :I, :id => 215, :num => 1},
      ],
    },
    309 => {
      :price => 410,
      :after => {:kind => :A, :id => 309},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 307, :num => 1},
        {:kind => :I, :id => 214, :num => 1},
      ],
    },
    310 => {
      :price => 1150,
      :after => {:kind => :W, :id => 72},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 70, :num => 1},
        {:kind => :I, :id => 80, :num => 1},
      ],
    },
    311 => {
      :price => 920,
      :after => {:kind => :W, :id => 105},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 103, :num => 1},
        {:kind => :I, :id => 80, :num => 1},
      ],
    },
    312 => {
      :price => 550,
      :after => {:kind => :W, :id => 159},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 153, :num => 1},
        {:kind => :I, :id => 220, :num => 1},
      ],
    },
    313 => {
      :price => 780,
      :after => {:kind => :W, :id => 223},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 202, :num => 1},
        {:kind => :I, :id => 80, :num => 1},
      ],
    },
    314 => {
      :price => 550,
      :after => {:kind => :W, :id => 314},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 311, :num => 1},
        {:kind => :I, :id => 221, :num => 1},
      ],
    },
    315 => {
      :price => 700,
      :after => {:kind => :W, :id => 348},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 346, :num => 1},
        {:kind => :I, :id => 220, :num => 1},
      ],
    },
    316 => {
      :price => 850,
      :after => {:kind => :W, :id => 383},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 380, :num => 1},
        {:kind => :I, :id => 80, :num => 1},
      ],
    },
    317 => {
      :price => 590,
      :after => {:kind => :W, :id => 456},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 449, :num => 1},
        {:kind => :I, :id => 221, :num => 1},
      ],
    },
    318 => {
      :price => 1200,
      :after => {:kind => :W, :id => 493},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 491, :num => 1},
        {:kind => :I, :id => 80, :num => 1},
      ],
    },
    319 => {
      :price => 750,
      :after => {:kind => :W, :id => 571},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 570, :num => 1},
        {:kind => :I, :id => 80, :num => 1},
      ],
    },
    320 => {
      :price => 570,
      :after => {:kind => :W, :id => 640},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 638, :num => 1},
        {:kind => :I, :id => 218, :num => 1},
      ],
    },
    321 => {
      :price => 870,
      :after => {:kind => :W, :id => 681},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 673, :num => 1},
        {:kind => :W, :id => 679, :num => 1},
        {:kind => :I, :id => 219, :num => 1},
      ],
    },
    322 => {
      :price => 1000,
      :after => {:kind => :W, :id => 713},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 711, :num => 1},
        {:kind => :I, :id => 220, :num => 1},
      ],
    },
    323 => {
      :price => 630,
      :after => {:kind => :W, :id => 740},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 739, :num => 1},
        {:kind => :I, :id => 80, :num => 1},
      ],
    },
    324 => {
      :price => 450,
      :after => {:kind => :W, :id => 785},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 784, :num => 1},
        {:kind => :I, :id => 80, :num => 1},
      ],
    },
    325 => {
      :price => 720,
      :after => {:kind => :W, :id => 833},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 832, :num => 1},
        {:kind => :I, :id => 221, :num => 1},
      ],
    },
    326 => {
      :price => 810,
      :after => {:kind => :W, :id => 856},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 855, :num => 1},
        {:kind => :I, :id => 220, :num => 1},
      ],
    },
    327 => {
      :price => 4200,
      :after => {:kind => :W, :id => 905},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 902, :num => 1},
        {:kind => :I, :id => 219, :num => 1},
      ],
    },
    328 => {
      :price => 680,
      :after => {:kind => :W, :id => 926},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 925, :num => 1},
        {:kind => :I, :id => 218, :num => 1},
      ],
    },
    329 => {
      :price => 550,
      :after => {:kind => :A, :id => 65},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 64, :num => 1},
        {:kind => :I, :id => 219, :num => 1},
      ],
    },
    330 => {
      :price => 120,
      :after => {:kind => :A, :id => 155},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 154, :num => 1},
        {:kind => :I, :id => 218, :num => 1},
      ],
    },
    331 => {
      :price => 320,
      :after => {:kind => :A, :id => 249},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 247, :num => 1},
        {:kind => :I, :id => 221, :num => 1},
      ],
    },
    332 => {
      :price => 300,
      :after => {:kind => :A, :id => 266},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 264, :num => 1},
        {:kind => :I, :id => 220, :num => 1},
      ],
    },
    333 => {
      :price => 820,
      :after => {:kind => :W, :id => 25},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 24, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    334 => {
      :price => 920,
      :after => {:kind => :W, :id => 71},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 69, :num => 1},
        {:kind => :I, :id => 223, :num => 1},
      ],
    },
    335 => {
      :price => 1700,
      :after => {:kind => :W, :id => 131},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 130, :num => 1},
        {:kind => :I, :id => 223, :num => 1},
      ],
    },
    336 => {
      :price => 1550,
      :after => {:kind => :W, :id => 203},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 202, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    337 => {
      :price => 850,
      :after => {:kind => :W, :id => 224},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 223, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    338 => {
      :price => 850,
      :after => {:kind => :W, :id => 247},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 244, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    339 => {
      :price => 1300,
      :after => {:kind => :W, :id => 424},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 423, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    340 => {
      :price => 680,
      :after => {:kind => :W, :id => 457},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 452, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    341 => {
      :price => 920,
      :after => {:kind => :W, :id => 531},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 528, :num => 1},
        {:kind => :I, :id => 223, :num => 1},
      ],
    },
    342 => {
      :price => 890,
      :after => {:kind => :W, :id => 606},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 604, :num => 1},
        {:kind => :I, :id => 223, :num => 1},
      ],
    },
    343 => {
      :price => 620,
      :after => {:kind => :W, :id => 641},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 638, :num => 1},
        {:kind => :I, :id => 223, :num => 1},
      ],
    },
    344 => {
      :price => 920,
      :after => {:kind => :W, :id => 879},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 878, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    345 => {
      :price => 4400,
      :after => {:kind => :W, :id => 906},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 904, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    346 => {
      :price => 870,
      :after => {:kind => :W, :id => 927},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 926, :num => 1},
        {:kind => :I, :id => 220, :num => 1},
      ],
    },
    347 => {
      :price => 550,
      :after => {:kind => :A, :id => 26},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 25, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    348 => {
      :price => 450,
      :after => {:kind => :A, :id => 114},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 113, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    349 => {
      :price => 550,
      :after => {:kind => :A, :id => 138},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 137, :num => 1},
        {:kind => :I, :id => 223, :num => 1},
      ],
    },
    350 => {
      :price => 550,
      :after => {:kind => :A, :id => 191},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 190, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    351 => {
      :price => 500,
      :after => {:kind => :A, :id => 216},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 215, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    352 => {
      :price => 550,
      :after => {:kind => :A, :id => 311},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 310, :num => 1},
        {:kind => :I, :id => 52, :num => 1},
      ],
    },
    353 => {
      :price => 1070,
      :after => {:kind => :W, :id => 28},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 13, :num => 1},
        {:kind => :I, :id => 232, :num => 1},
      ],
    },
    354 => {
      :price => 1650,
      :after => {:kind => :W, :id => 75},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 72, :num => 1},
        {:kind => :I, :id => 224, :num => 1},
      ],
    },
    355 => {
      :price => 1500,
      :after => {:kind => :W, :id => 108},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 105, :num => 1},
        {:kind => :W, :id => 107, :num => 1},
        {:kind => :I, :id => 227, :num => 1},
      ],
    },
    356 => {
      :price => 1900,
      :after => {:kind => :W, :id => 132},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 131, :num => 1},
        {:kind => :I, :id => 233, :num => 1},
      ],
    },
    357 => {
      :price => 1560,
      :after => {:kind => :W, :id => 162},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 161, :num => 1},
        {:kind => :I, :id => 61, :num => 1},
      ],
    },
    358 => {
      :price => 2050,
      :after => {:kind => :W, :id => 229},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 227, :num => 1},
        {:kind => :I, :id => 61, :num => 1},
      ],
    },
    359 => {
      :price => 1300,
      :after => {:kind => :W, :id => 275},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 274, :num => 1},
        {:kind => :I, :id => 226, :num => 1},
      ],
    },
    360 => {
      :price => 1700,
      :after => {:kind => :W, :id => 317},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 316, :num => 1},
        {:kind => :I, :id => 225, :num => 1},
      ],
    },
    361 => {
      :price => 1800,
      :after => {:kind => :W, :id => 352},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 351, :num => 1},
        {:kind => :I, :id => 224, :num => 1},
      ],
    },
    362 => {
      :price => 1400,
      :after => {:kind => :W, :id => 385},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 382, :num => 1},
        {:kind => :I, :id => 228, :num => 1},
      ],
    },
    363 => {
      :price => 1400,
      :after => {:kind => :W, :id => 425},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 411, :num => 1},
        {:kind => :I, :id => 229, :num => 1},
      ],
    },
    364 => {
      :price => 1500,
      :after => {:kind => :W, :id => 426},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 421, :num => 1},
        {:kind => :I, :id => 228, :num => 1},
      ],
    },
    365 => {
      :price => 1440,
      :after => {:kind => :W, :id => 460},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 455, :num => 1},
        {:kind => :I, :id => 228, :num => 1},
      ],
    },
    366 => {
      :price => 1200,
      :after => {:kind => :W, :id => 533},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 530, :num => 1},
        {:kind => :I, :id => 229, :num => 1},
      ],
    },
    367 => {
      :price => 1550,
      :after => {:kind => :W, :id => 574},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 573, :num => 1},
        {:kind => :I, :id => 222, :num => 1},
      ],
    },
    368 => {
      :price => 1800,
      :after => {:kind => :W, :id => 575},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 564, :num => 1},
        {:kind => :I, :id => 225, :num => 1},
      ],
    },
    369 => {
      :price => 1300,
      :after => {:kind => :W, :id => 608},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 605, :num => 1},
        {:kind => :I, :id => 222, :num => 1},
      ],
    },
    370 => {
      :price => 950,
      :after => {:kind => :W, :id => 643},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 642, :num => 1},
        {:kind => :I, :id => 225, :num => 1},
      ],
    },
    371 => {
      :price => 1350,
      :after => {:kind => :W, :id => 684},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 680, :num => 1},
        {:kind => :I, :id => 229, :num => 1},
      ],
    },
    372 => {
      :price => 1200,
      :after => {:kind => :W, :id => 742},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 741, :num => 1},
        {:kind => :I, :id => 226, :num => 1},
      ],
    },
    373 => {
      :price => 1600,
      :after => {:kind => :W, :id => 812},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 808, :num => 1},
        {:kind => :I, :id => 225, :num => 1},
      ],
    },
    374 => {
      :price => 1280,
      :after => {:kind => :W, :id => 859},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 858, :num => 1},
        {:kind => :I, :id => 232, :num => 1},
      ],
    },
    375 => {
      :price => 4600,
      :after => {:kind => :W, :id => 907},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 905, :num => 1},
        {:kind => :I, :id => 233, :num => 1},
      ],
    },
    376 => {
      :price => 1800,
      :after => {:kind => :W, :id => 928},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 927, :num => 1},
        {:kind => :I, :id => 232, :num => 1},
      ],
    },
    377 => {
      :price => 2400,
      :after => {:kind => :W, :id => 929},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 928, :num => 1},
        {:kind => :I, :id => 233, :num => 1},
      ],
    },
    378 => {
      :price => 450,
      :after => {:kind => :A, :id => 14},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 13, :num => 1},
        {:kind => :I, :id => 227, :num => 1},
      ],
    },
    379 => {
      :price => 770,
      :after => {:kind => :A, :id => 45},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 44, :num => 1},
        {:kind => :I, :id => 234, :num => 1},
      ],
    },
    380 => {
      :price => 750,
      :after => {:kind => :A, :id => 66},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 65, :num => 1},
        {:kind => :I, :id => 233, :num => 1},
      ],
    },
    381 => {
      :price => 700,
      :after => {:kind => :A, :id => 87},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 86, :num => 1},
        {:kind => :I, :id => 231, :num => 1},
      ],
    },
    382 => {
      :price => 920,
      :after => {:kind => :A, :id => 89},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 88, :num => 1},
        {:kind => :I, :id => 234, :num => 1},
      ],
    },
    383 => {
      :price => 770,
      :after => {:kind => :A, :id => 116},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 115, :num => 1},
        {:kind => :I, :id => 234, :num => 1},
      ],
    },
    384 => {
      :price => 660,
      :after => {:kind => :A, :id => 139},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 127, :num => 1},
        {:kind => :I, :id => 224, :num => 1},
      ],
    },
    385 => {
      :price => 350,
      :after => {:kind => :A, :id => 158},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 157, :num => 1},
        {:kind => :I, :id => 230, :num => 1},
      ],
    },
    386 => {
      :price => 350,
      :after => {:kind => :A, :id => 171},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 170, :num => 1},
        {:kind => :I, :id => 232, :num => 1},
      ],
    },
    387 => {
      :price => 740,
      :after => {:kind => :A, :id => 201},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 200, :num => 1},
        {:kind => :I, :id => 226, :num => 1},
      ],
    },
    388 => {
      :price => 620,
      :after => {:kind => :A, :id => 218},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 217, :num => 1},
        {:kind => :I, :id => 231, :num => 1},
      ],
    },
    389 => {
      :price => 400,
      :after => {:kind => :A, :id => 267},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 264, :num => 1},
        {:kind => :I, :id => 230, :num => 1},
      ],
    },
    390 => {
      :price => 350,
      :after => {:kind => :A, :id => 276},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 275, :num => 1},
        {:kind => :I, :id => 227, :num => 1},
      ],
    },
    391 => {
      :price => 730,
      :after => {:kind => :A, :id => 313},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 312, :num => 1},
        {:kind => :I, :id => 231, :num => 1},
      ],
    },
    392 => {
      :price => 1020,
      :after => {:kind => :W, :id => 27},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 26, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    393 => {
      :price => 1700,
      :after => {:kind => :W, :id => 76},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 74, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
      ],
    },
    394 => {
      :price => 2100,
      :after => {:kind => :W, :id => 133},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 132, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
      ],
    },
    395 => {
      :price => 1650,
      :after => {:kind => :W, :id => 163},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 161, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
      ],
    },
    396 => {
      :price => 990,
      :after => {:kind => :W, :id => 178},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 177, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    397 => {
      :price => 2200,
      :after => {:kind => :W, :id => 204},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 203, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
      ],
    },
    398 => {
      :price => 1950,
      :after => {:kind => :W, :id => 228},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 226, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
      ],
    },
    399 => {
      :price => 1800,
      :after => {:kind => :W, :id => 318},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 316, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    400 => {
      :price => 1500,
      :after => {:kind => :W, :id => 351},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 350, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
      ],
    },
    401 => {
      :price => 1830,
      :after => {:kind => :W, :id => 387},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 386, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
      ],
    },
    402 => {
      :price => 1500,
      :after => {:kind => :W, :id => 461},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 459, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    403 => {
      :price => 1650,
      :after => {:kind => :W, :id => 495},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 494, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    404 => {
      :price => 1680,
      :after => {:kind => :W, :id => 535},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 534, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    405 => {
      :price => 1900,
      :after => {:kind => :W, :id => 576},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 573, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    406 => {
      :price => 1550,
      :after => {:kind => :W, :id => 645},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 644, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    407 => {
      :price => 1500,
      :after => {:kind => :W, :id => 744},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 743, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    408 => {
      :price => 1600,
      :after => {:kind => :W, :id => 881},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 880, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    409 => {
      :price => 1200,
      :after => {:kind => :A, :id => 47},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 46, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
      ],
    },
    410 => {
      :price => 1200,
      :after => {:kind => :A, :id => 91},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 90, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
      ],
    },
    411 => {
      :price => 680,
      :after => {:kind => :A, :id => 140},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 135, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    412 => {
      :price => 820,
      :after => {:kind => :A, :id => 220},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 219, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    413 => {
      :price => 580,
      :after => {:kind => :A, :id => 252},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 251, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    414 => {
      :price => 900,
      :after => {:kind => :A, :id => 315},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 314, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
      ],
    },
    415 => {
      :price => 1450,
      :after => {:kind => :W, :id => 30},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 23, :num => 1},
        {:kind => :I, :id => 235, :num => 1},
      ],
    },
    416 => {
      :price => 1800,
      :after => {:kind => :W, :id => 77},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 74, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
      ],
    },
    417 => {
      :price => 1650,
      :after => {:kind => :W, :id => 109},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 106, :num => 1},
        {:kind => :I, :id => 237, :num => 1},
      ],
    },
    418 => {
      :price => 1700,
      :after => {:kind => :W, :id => 164},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 158, :num => 1},
        {:kind => :I, :id => 237, :num => 1},
      ],
    },
    419 => {
      :price => 2500,
      :after => {:kind => :W, :id => 205},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 201, :num => 1},
        {:kind => :I, :id => 236, :num => 1},
      ],
    },
    420 => {
      :price => 1600,
      :after => {:kind => :W, :id => 277},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 276, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
      ],
    },
    421 => {
      :price => 2500,
      :after => {:kind => :W, :id => 320},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 310, :num => 1},
        {:kind => :I, :id => 238, :num => 1},
      ],
    },
    422 => {
      :price => 2100,
      :after => {:kind => :W, :id => 388},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 386, :num => 1},
        {:kind => :I, :id => 236, :num => 1},
      ],
    },
    423 => {
      :price => 1700,
      :after => {:kind => :W, :id => 428},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 427, :num => 1},
        {:kind => :I, :id => 238, :num => 1},
      ],
    },
    424 => {
      :price => 1800,
      :after => {:kind => :W, :id => 462},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 461, :num => 1},
        {:kind => :I, :id => 236, :num => 1},
      ],
    },
    425 => {
      :price => 1800,
      :after => {:kind => :W, :id => 536},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 531, :num => 1},
        {:kind => :I, :id => 237, :num => 1},
      ],
    },
    426 => {
      :price => 1900,
      :after => {:kind => :W, :id => 610},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 606, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
      ],
    },
    427 => {
      :price => 1800,
      :after => {:kind => :W, :id => 646},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 644, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
      ],
    },
    428 => {
      :price => 1600,
      :after => {:kind => :W, :id => 686},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 672, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
      ],
    },
    429 => {
      :price => 2500,
      :after => {:kind => :W, :id => 716},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 712, :num => 1},
        {:kind => :I, :id => 238, :num => 1},
      ],
    },
    430 => {
      :price => 1600,
      :after => {:kind => :W, :id => 767},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 766, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
      ],
    },
    431 => {
      :price => 1500,
      :after => {:kind => :A, :id => 48},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 47, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
      ],
    },
    432 => {
      :price => 990,
      :after => {:kind => :A, :id => 118},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 114, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
      ],
    },
    433 => {
      :price => 720,
      :after => {:kind => :A, :id => 141},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 139, :num => 1},
        {:kind => :I, :id => 235, :num => 1},
      ],
    },
    434 => {
      :price => 670,
      :after => {:kind => :A, :id => 253},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 251, :num => 1},
        {:kind => :I, :id => 235, :num => 1},
      ],
    },
    435 => {
      :price => 2100,
      :after => {:kind => :W, :id => 78},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 75, :num => 1},
        {:kind => :I, :id => 241, :num => 1},
      ],
    },
    436 => {
      :price => 2000,
      :after => {:kind => :W, :id => 110},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 109, :num => 1},
        {:kind => :I, :id => 57, :num => 1},
      ],
    },
    437 => {
      :price => 2200,
      :after => {:kind => :W, :id => 165},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 161, :num => 1},
        {:kind => :I, :id => 57, :num => 1},
      ],
    },
    438 => {
      :price => 2400,
      :after => {:kind => :W, :id => 231},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 230, :num => 1},
        {:kind => :I, :id => 241, :num => 1},
      ],
    },
    439 => {
      :price => 1650,
      :after => {:kind => :W, :id => 278},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 276, :num => 1},
        {:kind => :I, :id => 57, :num => 1},
      ],
    },
    440 => {
      :price => 2000,
      :after => {:kind => :W, :id => 319},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 317, :num => 1},
        {:kind => :I, :id => 240, :num => 1},
      ],
    },
    441 => {
      :price => 2400,
      :after => {:kind => :W, :id => 389},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 387, :num => 1},
        {:kind => :I, :id => 57, :num => 1},
      ],
    },
    442 => {
      :price => 1800,
      :after => {:kind => :W, :id => 429},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 426, :num => 1},
        {:kind => :I, :id => 241, :num => 1},
      ],
    },
    443 => {
      :price => 1800,
      :after => {:kind => :W, :id => 496},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 495, :num => 1},
        {:kind => :I, :id => 241, :num => 1},
      ],
    },
    444 => {
      :price => 2500,
      :after => {:kind => :W, :id => 538},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 529, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
        {:kind => :I, :id => 57, :num => 1},
        {:kind => :I, :id => 61, :num => 1},
      ],
    },
    445 => {
      :price => 2200,
      :after => {:kind => :W, :id => 577},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 575, :num => 1},
        {:kind => :I, :id => 240, :num => 1},
      ],
    },
    446 => {
      :price => 1950,
      :after => {:kind => :W, :id => 647},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 643, :num => 1},
        {:kind => :I, :id => 240, :num => 1},
      ],
    },
    447 => {
      :price => 1800,
      :after => {:kind => :W, :id => 687},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 684, :num => 1},
        {:kind => :I, :id => 241, :num => 1},
      ],
    },
    448 => {
      :price => 2400,
      :after => {:kind => :W, :id => 790},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 788, :num => 1},
        {:kind => :I, :id => 241, :num => 1},
      ],
    },
    449 => {
      :price => 2500,
      :after => {:kind => :W, :id => 814},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 812, :num => 1},
        {:kind => :I, :id => 240, :num => 1},
      ],
    },
    450 => {
      :price => 1800,
      :after => {:kind => :W, :id => 882},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 881, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
        {:kind => :I, :id => 57, :num => 1},
        {:kind => :I, :id => 61, :num => 1},
      ],
    },
    451 => {
      :price => 8500,
      :after => {:kind => :W, :id => 910},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 907, :num => 1},
        {:kind => :I, :id => 240, :num => 1},
      ],
    },
    452 => {
      :price => 780,
      :after => {:kind => :A, :id => 15},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 14, :num => 1},
        {:kind => :I, :id => 241, :num => 1},
      ],
    },
    453 => {
      :price => 880,
      :after => {:kind => :A, :id => 27},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 26, :num => 1},
        {:kind => :I, :id => 241, :num => 1},
      ],
    },
    454 => {
      :price => 1200,
      :after => {:kind => :A, :id => 67},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 66, :num => 1},
        {:kind => :I, :id => 241, :num => 1},
      ],
    },
    455 => {
      :price => 1700,
      :after => {:kind => :A, :id => 93},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 92, :num => 1},
        {:kind => :I, :id => 241, :num => 1},
      ],
    },
    456 => {
      :price => 1300,
      :after => {:kind => :A, :id => 222},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 221, :num => 1},
        {:kind => :I, :id => 241, :num => 1},
      ],
    },
    457 => {
      :price => 1500,
      :after => {:kind => :A, :id => 317},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 316, :num => 1},
        {:kind => :I, :id => 240, :num => 1},
      ],
    },
    458 => {
      :price => 6200,
      :after => {:kind => :W, :id => 35},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 30, :num => 1},
        {:kind => :I, :id => 243, :num => 1},
      ],
    },
    459 => {
      :price => 6200,
      :after => {:kind => :W, :id => 34},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 28, :num => 1},
        {:kind => :I, :id => 249, :num => 1},
      ],
    },
    460 => {
      :price => 7200,
      :after => {:kind => :W, :id => 79},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 71, :num => 1},
        {:kind => :I, :id => 252, :num => 1},
      ],
    },
    461 => {
      :price => 8000,
      :after => {:kind => :W, :id => 113},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 92, :num => 1},
        {:kind => :I, :id => 247, :num => 1},
      ],
    },
    462 => {
      :price => 9300,
      :after => {:kind => :W, :id => 135},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 134, :num => 1},
        {:kind => :I, :id => 243, :num => 1},
      ],
    },
    463 => {
      :price => 7700,
      :after => {:kind => :W, :id => 167},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 164, :num => 1},
        {:kind => :I, :id => 247, :num => 1},
      ],
    },
    464 => {
      :price => 7700,
      :after => {:kind => :W, :id => 168},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 159, :num => 1},
        {:kind => :I, :id => 245, :num => 1},
      ],
    },
    465 => {
      :price => 9300,
      :after => {:kind => :W, :id => 234},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 222, :num => 1},
        {:kind => :I, :id => 247, :num => 1},
      ],
    },
    466 => {
      :price => 9300,
      :after => {:kind => :W, :id => 233},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 229, :num => 1},
        {:kind => :I, :id => 246, :num => 1},
      ],
    },
    467 => {
      :price => 8000,
      :after => {:kind => :W, :id => 260},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 250, :num => 1},
        {:kind => :I, :id => 243, :num => 1},
      ],
    },
    468 => {
      :price => 8000,
      :after => {:kind => :W, :id => 261},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 248, :num => 1},
        {:kind => :I, :id => 249, :num => 1},
      ],
    },
    469 => {
      :price => 7600,
      :after => {:kind => :W, :id => 324},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 319, :num => 1},
        {:kind => :I, :id => 253, :num => 1},
      ],
    },
    470 => {
      :price => 7600,
      :after => {:kind => :W, :id => 323},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 320, :num => 1},
        {:kind => :I, :id => 244, :num => 1},
      ],
    },
    471 => {
      :price => 6400,
      :after => {:kind => :W, :id => 355},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 353, :num => 1},
        {:kind => :I, :id => 253, :num => 1},
      ],
    },
    472 => {
      :price => 9700,
      :after => {:kind => :W, :id => 392},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 385, :num => 1},
        {:kind => :I, :id => 244, :num => 1},
      ],
    },
    473 => {
      :price => 9700,
      :after => {:kind => :W, :id => 391},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 389, :num => 1},
        {:kind => :I, :id => 253, :num => 1},
      ],
    },
    474 => {
      :price => 8500,
      :after => {:kind => :W, :id => 433},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 429, :num => 1},
        {:kind => :I, :id => 250, :num => 1},
      ],
    },
    475 => {
      :price => 8500,
      :after => {:kind => :W, :id => 432},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 425, :num => 1},
        {:kind => :I, :id => 249, :num => 1},
      ],
    },
    476 => {
      :price => 7100,
      :after => {:kind => :W, :id => 465},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 457, :num => 1},
        {:kind => :I, :id => 243, :num => 1},
      ],
    },
    477 => {
      :price => 7100,
      :after => {:kind => :W, :id => 464},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 460, :num => 1},
        {:kind => :I, :id => 250, :num => 1},
      ],
    },
    478 => {
      :price => 7800,
      :after => {:kind => :W, :id => 498},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 496, :num => 1},
        {:kind => :I, :id => 253, :num => 1},
      ],
    },
    479 => {
      :price => 7800,
      :after => {:kind => :W, :id => 499},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 493, :num => 1},
        {:kind => :I, :id => 249, :num => 1},
      ],
    },
    480 => {
      :price => 7800,
      :after => {:kind => :W, :id => 540},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 536, :num => 1},
        {:kind => :I, :id => 247, :num => 1},
      ],
    },
    481 => {
      :price => 7800,
      :after => {:kind => :W, :id => 541},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 538, :num => 1},
        {:kind => :I, :id => 253, :num => 1},
      ],
    },
    482 => {
      :price => 7800,
      :after => {:kind => :W, :id => 580},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 577, :num => 1},
        {:kind => :I, :id => 253, :num => 1},
      ],
    },
    483 => {
      :price => 7800,
      :after => {:kind => :W, :id => 579},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 568, :num => 1},
        {:kind => :I, :id => 245, :num => 1},
      ],
    },
    484 => {
      :price => 8500,
      :after => {:kind => :W, :id => 613},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 611, :num => 1},
        {:kind => :I, :id => 245, :num => 1},
      ],
    },
    485 => {
      :price => 8500,
      :after => {:kind => :W, :id => 612},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 611, :num => 1},
        {:kind => :I, :id => 250, :num => 1},
      ],
    },
    486 => {
      :price => 7400,
      :after => {:kind => :W, :id => 650},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 649, :num => 1},
        {:kind => :I, :id => 252, :num => 1},
      ],
    },
    487 => {
      :price => 7400,
      :after => {:kind => :W, :id => 651},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 649, :num => 1},
        {:kind => :I, :id => 243, :num => 1},
      ],
    },
    488 => {
      :price => 8200,
      :after => {:kind => :W, :id => 690},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 689, :num => 1},
        {:kind => :I, :id => 248, :num => 1},
      ],
    },
    489 => {
      :price => 8200,
      :after => {:kind => :W, :id => 691},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 683, :num => 1},
        {:kind => :W, :id => 686, :num => 1},
        {:kind => :I, :id => 244, :num => 1},
      ],
    },
    490 => {
      :price => 9900,
      :after => {:kind => :W, :id => 719},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 716, :num => 1},
        {:kind => :I, :id => 244, :num => 1},
      ],
    },
    491 => {
      :price => 7200,
      :after => {:kind => :W, :id => 748},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 737, :num => 1},
        {:kind => :I, :id => 242, :num => 1},
      ],
    },
    492 => {
      :price => 7200,
      :after => {:kind => :W, :id => 769},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 764, :num => 1},
        {:kind => :I, :id => 253, :num => 1},
      ],
    },
    493 => {
      :price => 7400,
      :after => {:kind => :W, :id => 838},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 830, :num => 1},
        {:kind => :I, :id => 250, :num => 1},
      ],
    },
    494 => {
      :price => 7800,
      :after => {:kind => :W, :id => 884},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 882, :num => 1},
        {:kind => :I, :id => 253, :num => 1},
      ],
    },
    495 => {
      :price => 9300,
      :after => {:kind => :W, :id => 931},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 929, :num => 1},
        {:kind => :I, :id => 242, :num => 1},
      ],
    },
    496 => {
      :price => 2700,
      :after => {:kind => :A, :id => 385},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 8, :num => 1},
        {:kind => :I, :id => 244, :num => 1},
      ],
    },
    497 => {
      :price => 3500,
      :after => {:kind => :A, :id => 28},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 27, :num => 1},
        {:kind => :I, :id => 247, :num => 1},
      ],
    },
    498 => {
      :price => 5000,
      :after => {:kind => :A, :id => 50},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 43, :num => 1},
        {:kind => :I, :id => 249, :num => 1},
      ],
    },
    499 => {
      :price => 4400,
      :after => {:kind => :A, :id => 95},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 94, :num => 1},
        {:kind => :I, :id => 252, :num => 1},
      ],
    },
    500 => {
      :price => 4400,
      :after => {:kind => :A, :id => 96},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 94, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    501 => {
      :price => 3500,
      :after => {:kind => :A, :id => 120},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 119, :num => 1},
        {:kind => :I, :id => 243, :num => 1},
      ],
    },
    502 => {
      :price => 3500,
      :after => {:kind => :A, :id => 533},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 119, :num => 1},
        {:kind => :I, :id => 250, :num => 1},
      ],
    },
    503 => {
      :price => 4000,
      :after => {:kind => :A, :id => 143},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 136, :num => 1},
        {:kind => :I, :id => 242, :num => 1},
      ],
    },
    504 => {
      :price => 9900,
      :after => {:kind => :A, :id => 160},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 150, :num => 1},
        {:kind => :I, :id => 242, :num => 1},
      ],
    },
    505 => {
      :price => 1400,
      :after => {:kind => :A, :id => 652},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 181, :num => 1},
        {:kind => :I, :id => 244, :num => 1},
      ],
    },
    506 => {
      :price => 3300,
      :after => {:kind => :A, :id => 224},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 223, :num => 1},
        {:kind => :I, :id => 252, :num => 1},
      ],
    },
    507 => {
      :price => 3300,
      :after => {:kind => :A, :id => 225},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 223, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    508 => {
      :price => 3700,
      :after => {:kind => :A, :id => 256},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 246, :num => 1},
        {:kind => :A, :id => 248, :num => 1},
        {:kind => :I, :id => 242, :num => 1},
      ],
    },
    509 => {
      :price => 2700,
      :after => {:kind => :A, :id => 824},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 273, :num => 1},
        {:kind => :I, :id => 252, :num => 1},
      ],
    },
    510 => {
      :price => 4100,
      :after => {:kind => :A, :id => 319},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 318, :num => 1},
        {:kind => :I, :id => 252, :num => 1},
      ],
    },
    511 => {
      :price => 4100,
      :after => {:kind => :A, :id => 320},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 318, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    512 => {
      :price => 16000,
      :after => {:kind => :W, :id => 912},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 911, :num => 1},
        {:kind => :I, :id => 253, :num => 1},
      ],
    },
    513 => {
      :price => 5500,
      :after => {:kind => :A, :id => 438},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 46, :num => 1},
        {:kind => :I, :id => 253, :num => 1},
      ],
    },
    514 => {
      :price => 9000,
      :after => {:kind => :W, :id => 114},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 96, :num => 1},
        {:kind => :W, :id => 110, :num => 1},
        {:kind => :I, :id => 247, :num => 1},
      ],
    },
    515 => {
      :price => 9900,
      :after => {:kind => :W, :id => 186},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 181, :num => 1},
        {:kind => :I, :id => 248, :num => 1},
      ],
    },
    516 => {
      :price => 8000,
      :after => {:kind => :W, :id => 4236},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4235, :num => 1},
        {:kind => :I, :id => 246, :num => 1},
      ],
    },
    517 => {
      :price => 5300,
      :after => {:kind => :W, :id => 791},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 790, :num => 1},
        {:kind => :I, :id => 249, :num => 1},
      ],
    },
    518 => {
      :price => 8000,
      :after => {:kind => :W, :id => 80},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 60, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    519 => {
      :price => 7800,
      :after => {:kind => :W, :id => 282},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 271, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    520 => {
      :price => 7900,
      :after => {:kind => :W, :id => 582},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 559, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    521 => {
      :price => 9000,
      :after => {:kind => :W, :id => 614},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 608, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    522 => {
      :price => 8000,
      :after => {:kind => :W, :id => 750},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 732, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    523 => {
      :price => 9800,
      :after => {:kind => :W, :id => 932},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 921, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    524 => {
      :price => 10800,
      :after => {:kind => :A, :id => 618},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 163, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    525 => {
      :price => 7300,
      :after => {:kind => :W, :id => 36},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 22, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    526 => {
      :price => 7300,
      :after => {:kind => :W, :id => 37},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 20, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    527 => {
      :price => 9100,
      :after => {:kind => :W, :id => 83},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 78, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    528 => {
      :price => 10500,
      :after => {:kind => :W, :id => 117},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 73, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    529 => {
      :price => 10500,
      :after => {:kind => :W, :id => 119},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 54, :num => 1},
        {:kind => :I, :id => 260, :num => 1},
      ],
    },
    530 => {
      :price => 9800,
      :after => {:kind => :W, :id => 170},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 155, :num => 1},
        {:kind => :I, :id => 255, :num => 1},
      ],
    },
    531 => {
      :price => 9800,
      :after => {:kind => :W, :id => 171},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 155, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    532 => {
      :price => 11700,
      :after => {:kind => :W, :id => 235},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 217, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    533 => {
      :price => 10000,
      :after => {:kind => :W, :id => 265},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 251, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    534 => {
      :price => 10000,
      :after => {:kind => :W, :id => 264},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 253, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    535 => {
      :price => 9500,
      :after => {:kind => :W, :id => 284},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 281, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    536 => {
      :price => 9500,
      :after => {:kind => :W, :id => 283},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 281, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    537 => {
      :price => 11000,
      :after => {:kind => :W, :id => 330},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 327, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    538 => {
      :price => 11000,
      :after => {:kind => :W, :id => 331},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 327, :num => 1},
        {:kind => :I, :id => 259, :num => 1},
      ],
    },
    539 => {
      :price => 8000,
      :after => {:kind => :W, :id => 357},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 354, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    540 => {
      :price => 12800,
      :after => {:kind => :W, :id => 395},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 375, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    541 => {
      :price => 11000,
      :after => {:kind => :W, :id => 435},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 414, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    542 => {
      :price => 11000,
      :after => {:kind => :W, :id => 436},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 419, :num => 1},
        {:kind => :I, :id => 260, :num => 1},
      ],
    },
    543 => {
      :price => 10000,
      :after => {:kind => :W, :id => 503},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 500, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    544 => {
      :price => 10000,
      :after => {:kind => :W, :id => 585},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 571, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    545 => {
      :price => 10000,
      :after => {:kind => :W, :id => 586},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 582, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    546 => {
      :price => 11700,
      :after => {:kind => :W, :id => 617},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 601, :num => 1},
        {:kind => :I, :id => 255, :num => 1},
      ],
    },
    547 => {
      :price => 11000,
      :after => {:kind => :W, :id => 694},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 690, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    548 => {
      :price => 11000,
      :after => {:kind => :W, :id => 695},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 687, :num => 1},
        {:kind => :I, :id => 258, :num => 1},
      ],
    },
    549 => {
      :price => 8800,
      :after => {:kind => :W, :id => 751},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 744, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    550 => {
      :price => 9000,
      :after => {:kind => :W, :id => 772},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 770, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    551 => {
      :price => 7000,
      :after => {:kind => :W, :id => 794},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 792, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    552 => {
      :price => 9300,
      :after => {:kind => :W, :id => 816},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 810, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    553 => {
      :price => 9000,
      :after => {:kind => :W, :id => 841},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 825, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    554 => {
      :price => 9000,
      :after => {:kind => :W, :id => 840},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 826, :num => 1},
        {:kind => :I, :id => 258, :num => 1},
      ],
    },
    555 => {
      :price => 9500,
      :after => {:kind => :W, :id => 865},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 850, :num => 1},
        {:kind => :I, :id => 255, :num => 1},
      ],
    },
    556 => {
      :price => 10000,
      :after => {:kind => :W, :id => 4790},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 885, :num => 1},
        {:kind => :I, :id => 255, :num => 1},
      ],
    },
    557 => {
      :price => 10000,
      :after => {:kind => :W, :id => 4789},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 883, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    558 => {
      :price => 20000,
      :after => {:kind => :W, :id => 914},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 908, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    559 => {
      :price => 20000,
      :after => {:kind => :W, :id => 913},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 909, :num => 1},
        {:kind => :I, :id => 260, :num => 1},
      ],
    },
    560 => {
      :price => 11700,
      :after => {:kind => :W, :id => 933},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 931, :num => 1},
        {:kind => :I, :id => 255, :num => 1},
      ],
    },
    561 => {
      :price => 3300,
      :after => {:kind => :A, :id => 388},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 15, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    562 => {
      :price => 4400,
      :after => {:kind => :A, :id => 418},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 21, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    563 => {
      :price => 4400,
      :after => {:kind => :A, :id => 419},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 417, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    564 => {
      :price => 6300,
      :after => {:kind => :A, :id => 471},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 67, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    565 => {
      :price => 6700,
      :after => {:kind => :A, :id => 101},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 85, :num => 1},
        {:kind => :A, :id => 89, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    566 => {
      :price => 6700,
      :after => {:kind => :A, :id => 102},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 77, :num => 1},
        {:kind => :I, :id => 247, :num => 1},
      ],
    },
    567 => {
      :price => 5000,
      :after => {:kind => :A, :id => 557},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 132, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    568 => {
      :price => 13200,
      :after => {:kind => :A, :id => 619},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 172, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    569 => {
      :price => 1700,
      :after => {:kind => :A, :id => 655},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 186, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    570 => {
      :price => 4700,
      :after => {:kind => :A, :id => 751},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 254, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    571 => {
      :price => 4700,
      :after => {:kind => :A, :id => 752},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 245, :num => 1},
        {:kind => :I, :id => 259, :num => 1},
      ],
    },
    572 => {
      :price => 5900,
      :after => {:kind => :A, :id => 785},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 267, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    573 => {
      :price => 5000,
      :after => {:kind => :A, :id => 841},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 291, :num => 1},
        {:kind => :I, :id => 259, :num => 1},
      ],
    },
    574 => {
      :price => 6500,
      :after => {:kind => :A, :id => 324},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 323, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    575 => {
      :price => 6500,
      :after => {:kind => :A, :id => 326},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 303, :num => 1},
        {:kind => :A, :id => 309, :num => 1},
        {:kind => :I, :id => 247, :num => 1},
      ],
    },
    576 => {
      :price => 9400,
      :after => {:kind => :W, :id => 84},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 81, :num => 1},
        {:kind => :I, :id => 260, :num => 1},
      ],
    },
    577 => {
      :price => 11500,
      :after => {:kind => :W, :id => 120},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 100, :num => 1},
        {:kind => :W, :id => 101, :num => 1},
        {:kind => :I, :id => 260, :num => 1},
      ],
    },
    578 => {
      :price => 11500,
      :after => {:kind => :W, :id => 4277},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 254, :num => 1},
        {:kind => :I, :id => 271, :num => 1},
      ],
    },
    579 => {
      :price => 8500,
      :after => {:kind => :W, :id => 358},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 347, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    580 => {
      :price => 7200,
      :after => {:kind => :A, :id => 488},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 82, :num => 1},
        {:kind => :I, :id => 271, :num => 1},
      ],
    },
    581 => {
      :price => 5800,
      :after => {:kind => :A, :id => 230},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 213, :num => 1},
        {:kind => :I, :id => 259, :num => 1},
      ],
    },
    582 => {
      :price => 6400,
      :after => {:kind => :A, :id => 787},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 266, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    583 => {
      :price => 7000,
      :after => {:kind => :A, :id => 327},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 308, :num => 1},
        {:kind => :I, :id => 254, :num => 1},
      ],
    },
    584 => {
      :price => 11500,
      :after => {:kind => :W, :id => 4278},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 263, :num => 1},
        {:kind => :I, :id => 260, :num => 1},
      ],
    },
    585 => {
      :price => 10500,
      :after => {:kind => :W, :id => 286},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 282, :num => 1},
        {:kind => :I, :id => 266, :num => 1},
      ],
    },
    586 => {
      :price => 12000,
      :after => {:kind => :W, :id => 438},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 431, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    587 => {
      :price => 75000,
      :after => {:kind => :W, :id => 4706},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 785, :num => 1},
        {:kind => :I, :id => 259, :num => 1},
      ],
    },
    588 => {
      :price => 10500,
      :after => {:kind => :W, :id => 4791},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 887, :num => 1},
        {:kind => :I, :id => 266, :num => 1},
      ],
    },
    589 => {
      :price => 3800,
      :after => {:kind => :A, :id => 391},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 12, :num => 1},
        {:kind => :A, :id => 16, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    590 => {
      :price => 7000,
      :after => {:kind => :A, :id => 442},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 440, :num => 1},
        {:kind => :I, :id => 260, :num => 1},
      ],
    },
    591 => {
      :price => 5800,
      :after => {:kind => :A, :id => 560},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 134, :num => 1},
        {:kind => :I, :id => 259, :num => 1},
      ],
    },
    592 => {
      :price => 15000,
      :after => {:kind => :A, :id => 621},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 618, :num => 1},
        {:kind => :I, :id => 266, :num => 1},
      ],
    },
    593 => {
      :price => 6700,
      :after => {:kind => :A, :id => 789},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 265, :num => 1},
        {:kind => :I, :id => 259, :num => 1},
      ],
    },
    594 => {
      :price => 8800,
      :after => {:kind => :W, :id => 39},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 29, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    595 => {
      :price => 8800,
      :after => {:kind => :W, :id => 40},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 37, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    596 => {
      :price => 10000,
      :after => {:kind => :W, :id => 85},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 82, :num => 1},
        {:kind => :I, :id => 264, :num => 1},
      ],
    },
    597 => {
      :price => 10000,
      :after => {:kind => :W, :id => 4109},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 82, :num => 1},
        {:kind => :I, :id => 271, :num => 1},
      ],
    },
    598 => {
      :price => 12000,
      :after => {:kind => :W, :id => 122},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 105, :num => 1},
        {:kind => :I, :id => 264, :num => 1},
      ],
    },
    599 => {
      :price => 12000,
      :after => {:kind => :W, :id => 121},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 108, :num => 1},
        {:kind => :I, :id => 271, :num => 1},
      ],
    },
    600 => {
      :price => 14000,
      :after => {:kind => :W, :id => 137},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 136, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    601 => {
      :price => 14000,
      :after => {:kind => :W, :id => 138},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 136, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    602 => {
      :price => 12000,
      :after => {:kind => :W, :id => 174},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 169, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    603 => {
      :price => 12000,
      :after => {:kind => :W, :id => 175},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 171, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    604 => {
      :price => 12600,
      :after => {:kind => :W, :id => 188},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 179, :num => 1},
        {:kind => :I, :id => 261, :num => 1},
      ],
    },
    605 => {
      :price => 12600,
      :after => {:kind => :W, :id => 187},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 180, :num => 1},
        {:kind => :I, :id => 271, :num => 1},
      ],
    },
    606 => {
      :price => 11000,
      :after => {:kind => :W, :id => 4238},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4237, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    607 => {
      :price => 11000,
      :after => {:kind => :W, :id => 4239},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4236, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    608 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4279},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 255, :num => 1},
        {:kind => :I, :id => 266, :num => 1},
      ],
    },
    609 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4280},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 256, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    610 => {
      :price => 11200,
      :after => {:kind => :W, :id => 287},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 272, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    611 => {
      :price => 11200,
      :after => {:kind => :W, :id => 288},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 270, :num => 1},
        {:kind => :I, :id => 271, :num => 1},
      ],
    },
    612 => {
      :price => 9200,
      :after => {:kind => :W, :id => 359},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 356, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    613 => {
      :price => 9200,
      :after => {:kind => :W, :id => 360},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 356, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    614 => {
      :price => 14800,
      :after => {:kind => :W, :id => 396},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 377, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    615 => {
      :price => 14800,
      :after => {:kind => :W, :id => 397},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 381, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    616 => {
      :price => 12800,
      :after => {:kind => :W, :id => 439},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 434, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    617 => {
      :price => 12800,
      :after => {:kind => :W, :id => 4414},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 437, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    618 => {
      :price => 9800,
      :after => {:kind => :W, :id => 470},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 462, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    619 => {
      :price => 9800,
      :after => {:kind => :W, :id => 469},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 464, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    620 => {
      :price => 11200,
      :after => {:kind => :W, :id => 505},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 502, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    621 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4494},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 543, :num => 1},
        {:kind => :I, :id => 261, :num => 1},
      ],
    },
    622 => {
      :price => 12000,
      :after => {:kind => :W, :id => 546},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 533, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    623 => {
      :price => 11200,
      :after => {:kind => :W, :id => 4527},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 578, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    624 => {
      :price => 11200,
      :after => {:kind => :W, :id => 587},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 581, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    625 => {
      :price => 13800,
      :after => {:kind => :W, :id => 620},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 602, :num => 1},
        {:kind => :W, :id => 606, :num => 1},
        {:kind => :I, :id => 264, :num => 1},
      ],
    },
    626 => {
      :price => 13800,
      :after => {:kind => :W, :id => 4556},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 610, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    627 => {
      :price => 10400,
      :after => {:kind => :W, :id => 654},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 648, :num => 1},
        {:kind => :I, :id => 261, :num => 1},
      ],
    },
    628 => {
      :price => 10400,
      :after => {:kind => :W, :id => 655},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 645, :num => 1},
        {:kind => :I, :id => 271, :num => 1},
      ],
    },
    629 => {
      :price => 13400,
      :after => {:kind => :W, :id => 697},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 692, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    630 => {
      :price => 15200,
      :after => {:kind => :W, :id => 723},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 720, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    631 => {
      :price => 15200,
      :after => {:kind => :W, :id => 722},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 720, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    632 => {
      :price => 10000,
      :after => {:kind => :W, :id => 4658},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 749, :num => 1},
        {:kind => :I, :id => 266, :num => 1},
      ],
    },
    633 => {
      :price => 10000,
      :after => {:kind => :W, :id => 4659},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4656, :num => 1},
        {:kind => :I, :id => 271, :num => 1},
      ],
    },
    634 => {
      :price => 10000,
      :after => {:kind => :W, :id => 4687},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 769, :num => 1},
        {:kind => :I, :id => 264, :num => 1},
      ],
    },
    635 => {
      :price => 10000,
      :after => {:kind => :W, :id => 4686},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 761, :num => 1},
        {:kind => :I, :id => 271, :num => 1},
      ],
    },
    636 => {
      :price => 8000,
      :after => {:kind => :W, :id => 4707},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 780, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    637 => {
      :price => 10800,
      :after => {:kind => :W, :id => 818},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 816, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    638 => {
      :price => 10800,
      :after => {:kind => :W, :id => 819},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 817, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    639 => {
      :price => 10400,
      :after => {:kind => :W, :id => 4766},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 852, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    640 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4794},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4790, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    641 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4793},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4789, :num => 1},
        {:kind => :I, :id => 264, :num => 1},
      ],
    },
    642 => {
      :price => 24000,
      :after => {:kind => :W, :id => 4814},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 914, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    643 => {
      :price => 24000,
      :after => {:kind => :W, :id => 917},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 913, :num => 1},
        {:kind => :I, :id => 271, :num => 1},
      ],
    },
    644 => {
      :price => 4200,
      :after => {:kind => :A, :id => 393},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 386, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    645 => {
      :price => 4200,
      :after => {:kind => :A, :id => 394},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 388, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    646 => {
      :price => 5000,
      :after => {:kind => :A, :id => 421},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 27, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    647 => {
      :price => 5000,
      :after => {:kind => :A, :id => 422},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 27, :num => 1},
        {:kind => :I, :id => 266, :num => 1},
      ],
    },
    648 => {
      :price => 7700,
      :after => {:kind => :A, :id => 445},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 439, :num => 1},
        {:kind => :I, :id => 261, :num => 1},
      ],
    },
    649 => {
      :price => 7700,
      :after => {:kind => :A, :id => 446},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 441, :num => 1},
        {:kind => :I, :id => 259, :num => 1},
      ],
    },
    650 => {
      :price => 8000,
      :after => {:kind => :A, :id => 490},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 93, :num => 1},
        {:kind => :I, :id => 264, :num => 1},
      ],
    },
    651 => {
      :price => 8000,
      :after => {:kind => :A, :id => 489},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 91, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    652 => {
      :price => 4800,
      :after => {:kind => :A, :id => 536},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 120, :num => 1},
        {:kind => :I, :id => 264, :num => 1},
      ],
    },
    653 => {
      :price => 4800,
      :after => {:kind => :A, :id => 537},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 533, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    654 => {
      :price => 6000,
      :after => {:kind => :A, :id => 559},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 142, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    655 => {
      :price => 6000,
      :after => {:kind => :A, :id => 561},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 145, :num => 1},
        {:kind => :I, :id => 259, :num => 1},
      ],
    },
    656 => {
      :price => 15800,
      :after => {:kind => :A, :id => 594},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 158, :num => 1},
        {:kind => :A, :id => 593, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    657 => {
      :price => 15800,
      :after => {:kind => :A, :id => 595},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 158, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    658 => {
      :price => 17000,
      :after => {:kind => :A, :id => 623},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 170, :num => 1},
        {:kind => :I, :id => 266, :num => 1},
      ],
    },
    659 => {
      :price => 2000,
      :after => {:kind => :A, :id => 658},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 188, :num => 1},
        {:kind => :A, :id => 191, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    660 => {
      :price => 2000,
      :after => {:kind => :A, :id => 659},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 657, :num => 1},
        {:kind => :I, :id => 259, :num => 1},
      ],
    },
    661 => {
      :price => 4700,
      :after => {:kind => :A, :id => 689},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 686, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    662 => {
      :price => 6000,
      :after => {:kind => :A, :id => 232},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 228, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    663 => {
      :price => 6000,
      :after => {:kind => :A, :id => 231},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 222, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    664 => {
      :price => 5400,
      :after => {:kind => :A, :id => 754},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 255, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    665 => {
      :price => 5400,
      :after => {:kind => :A, :id => 755},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 257, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    666 => {
      :price => 7000,
      :after => {:kind => :A, :id => 790},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 785, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    667 => {
      :price => 7000,
      :after => {:kind => :A, :id => 791},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 788, :num => 1},
        {:kind => :I, :id => 271, :num => 1},
      ],
    },
    668 => {
      :price => 6300,
      :after => {:kind => :A, :id => 844},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 840, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    669 => {
      :price => 7800,
      :after => {:kind => :A, :id => 329},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 299, :num => 1},
        {:kind => :A, :id => 319, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    670 => {
      :price => 7800,
      :after => {:kind => :A, :id => 330},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 306, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    671 => {
      :price => 9200,
      :after => {:kind => :W, :id => 41},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 27, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    672 => {
      :price => 11500,
      :after => {:kind => :W, :id => 332},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 328, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    673 => {
      :price => 14000,
      :after => {:kind => :W, :id => 4607},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 673, :num => 1},
        {:kind => :W, :id => 681, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    674 => {
      :price => 14000,
      :after => {:kind => :W, :id => 934},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 933, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    675 => {
      :price => 7800,
      :after => {:kind => :A, :id => 447},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 438, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    676 => {
      :price => 8000,
      :after => {:kind => :A, :id => 331},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 317, :num => 1},
        {:kind => :I, :id => 264, :num => 1},
        {:kind => :I, :id => 265, :num => 1},
      ],
    },
    677 => {
      :price => 13000,
      :after => {:kind => :W, :id => 4281},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 262, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    678 => {
      :price => 11000,
      :after => {:kind => :W, :id => 4444},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 466, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    679 => {
      :price => 12300,
      :after => {:kind => :W, :id => 4495},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 537, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    680 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4528},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 585, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    681 => {
      :price => 11000,
      :after => {:kind => :W, :id => 4660},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 748, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    682 => {
      :price => 11000,
      :after => {:kind => :W, :id => 4767},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 863, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    683 => {
      :price => 8000,
      :after => {:kind => :A, :id => 448},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 444, :num => 1},
        {:kind => :I, :id => 263, :num => 1},
      ],
    },
    684 => {
      :price => 5400,
      :after => {:kind => :A, :id => 690},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 687, :num => 1},
        {:kind => :I, :id => 261, :num => 1},
      ],
    },
    685 => {
      :price => 11000,
      :after => {:kind => :W, :id => 44},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 35, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    686 => {
      :price => 11000,
      :after => {:kind => :W, :id => 43},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 34, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    687 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4110},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 68, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    688 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4111},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 80, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    689 => {
      :price => 14000,
      :after => {:kind => :W, :id => 4130},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 115, :num => 1},
        {:kind => :I, :id => 268, :num => 1},
      ],
    },
    690 => {
      :price => 14000,
      :after => {:kind => :W, :id => 123},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 119, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    691 => {
      :price => 16000,
      :after => {:kind => :W, :id => 139},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 133, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    692 => {
      :price => 13000,
      :after => {:kind => :W, :id => 4187},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 170, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    693 => {
      :price => 13000,
      :after => {:kind => :W, :id => 4188},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 173, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    694 => {
      :price => 17000,
      :after => {:kind => :W, :id => 240},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 234, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    695 => {
      :price => 17000,
      :after => {:kind => :W, :id => 239},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 231, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    696 => {
      :price => 14000,
      :after => {:kind => :W, :id => 4282},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 258, :num => 1},
        {:kind => :I, :id => 268, :num => 1},
      ],
    },
    697 => {
      :price => 14000,
      :after => {:kind => :W, :id => 4283},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 257, :num => 1},
        {:kind => :I, :id => 270, :num => 1},
      ],
    },
    698 => {
      :price => 14000,
      :after => {:kind => :W, :id => 4310},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 284, :num => 1},
        {:kind => :I, :id => 268, :num => 1},
      ],
    },
    699 => {
      :price => 14000,
      :after => {:kind => :W, :id => 4309},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 283, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    700 => {
      :price => 13000,
      :after => {:kind => :W, :id => 4333},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4332, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    701 => {
      :price => 13000,
      :after => {:kind => :W, :id => 4334},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 326, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    702 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4369},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 355, :num => 1},
        {:kind => :I, :id => 264, :num => 1},
      ],
    },
    703 => {
      :price => 16500,
      :after => {:kind => :W, :id => 398},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 394, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    704 => {
      :price => 15000,
      :after => {:kind => :W, :id => 4415},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 433, :num => 1},
        {:kind => :I, :id => 268, :num => 1},
      ],
    },
    705 => {
      :price => 15000,
      :after => {:kind => :W, :id => 4416},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 432, :num => 1},
        {:kind => :I, :id => 256, :num => 1},
      ],
    },
    706 => {
      :price => 11900,
      :after => {:kind => :W, :id => 4446},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 465, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    707 => {
      :price => 11900,
      :after => {:kind => :W, :id => 4445},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 467, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    708 => {
      :price => 12500,
      :after => {:kind => :W, :id => 507},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 503, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    709 => {
      :price => 12500,
      :after => {:kind => :W, :id => 4469},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 504, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    710 => {
      :price => 13000,
      :after => {:kind => :W, :id => 4497},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 542, :num => 1},
        {:kind => :I, :id => 268, :num => 1},
      ],
    },
    711 => {
      :price => 13000,
      :after => {:kind => :W, :id => 4498},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4496, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    712 => {
      :price => 12500,
      :after => {:kind => :W, :id => 4529},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 584, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    713 => {
      :price => 12500,
      :after => {:kind => :W, :id => 4530},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 584, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    714 => {
      :price => 15000,
      :after => {:kind => :W, :id => 4557},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 615, :num => 1},
        {:kind => :I, :id => 270, :num => 1},
      ],
    },
    715 => {
      :price => 12200,
      :after => {:kind => :W, :id => 4587},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 647, :num => 1},
        {:kind => :I, :id => 268, :num => 1},
      ],
    },
    716 => {
      :price => 12200,
      :after => {:kind => :W, :id => 4588},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 651, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    717 => {
      :price => 14300,
      :after => {:kind => :W, :id => 4608},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 694, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    718 => {
      :price => 14300,
      :after => {:kind => :W, :id => 4609},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 695, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    719 => {
      :price => 16800,
      :after => {:kind => :W, :id => 4636},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 717, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    720 => {
      :price => 16800,
      :after => {:kind => :W, :id => 4635},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 713, :num => 1},
        {:kind => :I, :id => 270, :num => 1},
      ],
    },
    721 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4661},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 751, :num => 1},
        {:kind => :W, :id => 752, :num => 1},
        {:kind => :I, :id => 268, :num => 1},
      ],
    },
    722 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4662},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 745, :num => 1},
        {:kind => :W, :id => 4657, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    723 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4688},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4685, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    724 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4689},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 771, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    725 => {
      :price => 9300,
      :after => {:kind => :W, :id => 4708},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 791, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    726 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4728},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 814, :num => 1},
        {:kind => :I, :id => 264, :num => 1},
      ],
    },
    727 => {
      :price => 12200,
      :after => {:kind => :W, :id => 4746},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 839, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    728 => {
      :price => 12200,
      :after => {:kind => :W, :id => 4747},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4744, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    729 => {
      :price => 12500,
      :after => {:kind => :W, :id => 4796},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4792, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    730 => {
      :price => 12500,
      :after => {:kind => :W, :id => 4795},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 886, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    731 => {
      :price => 29000,
      :after => {:kind => :W, :id => 4816},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 910, :num => 1},
        {:kind => :I, :id => 264, :num => 1},
      ],
    },
    732 => {
      :price => 16000,
      :after => {:kind => :W, :id => 936},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 934, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    733 => {
      :price => 4700,
      :after => {:kind => :A, :id => 397},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 392, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    734 => {
      :price => 6000,
      :after => {:kind => :A, :id => 424},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 29, :num => 1},
        {:kind => :I, :id => 268, :num => 1},
      ],
    },
    735 => {
      :price => 6000,
      :after => {:kind => :A, :id => 423},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 24, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    736 => {
      :price => 8400,
      :after => {:kind => :A, :id => 450},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 49, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    737 => {
      :price => 8400,
      :after => {:kind => :A, :id => 451},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 49, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    738 => {
      :price => 8600,
      :after => {:kind => :A, :id => 475},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 472, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    739 => {
      :price => 9300,
      :after => {:kind => :A, :id => 492},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 101, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    740 => {
      :price => 9300,
      :after => {:kind => :A, :id => 493},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 100, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    741 => {
      :price => 6000,
      :after => {:kind => :A, :id => 538},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 534, :num => 1},
        {:kind => :I, :id => 268, :num => 1},
      ],
    },
    742 => {
      :price => 6000,
      :after => {:kind => :A, :id => 539},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 535, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    743 => {
      :price => 7000,
      :after => {:kind => :A, :id => 563},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 141, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    744 => {
      :price => 7000,
      :after => {:kind => :A, :id => 562},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 557, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    745 => {
      :price => 16800,
      :after => {:kind => :A, :id => 597},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 155, :num => 1},
        {:kind => :A, :id => 159, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    746 => {
      :price => 18600,
      :after => {:kind => :A, :id => 625},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 620, :num => 1},
        {:kind => :A, :id => 622, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    747 => {
      :price => 2400,
      :after => {:kind => :A, :id => 661},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 654, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    748 => {
      :price => 2400,
      :after => {:kind => :A, :id => 662},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 652, :num => 1},
        {:kind => :I, :id => 270, :num => 1},
      ],
    },
    749 => {
      :price => 6100,
      :after => {:kind => :A, :id => 692},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 688, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    750 => {
      :price => 7500,
      :after => {:kind => :A, :id => 710},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 214, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    751 => {
      :price => 6100,
      :after => {:kind => :A, :id => 756},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 751, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    752 => {
      :price => 6100,
      :after => {:kind => :A, :id => 757},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 253, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    753 => {
      :price => 4700,
      :after => {:kind => :A, :id => 827},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 826, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    754 => {
      :price => 7300,
      :after => {:kind => :A, :id => 846},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 287, :num => 1},
        {:kind => :A, :id => 288, :num => 1},
        {:kind => :A, :id => 289, :num => 1},
      ],
    },
    755 => {
      :price => 8400,
      :after => {:kind => :A, :id => 875},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 324, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    756 => {
      :price => 8400,
      :after => {:kind => :A, :id => 876},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 330, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    757 => {
      :price => 12000,
      :after => {:kind => :W, :id => 4081},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 41, :num => 1},
        {:kind => :I, :id => 267, :num => 1},
      ],
    },
    758 => {
      :price => 12200,
      :after => {:kind => :W, :id => 4769},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 866, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    759 => {
      :price => 32000,
      :after => {:kind => :W, :id => 4817},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 915, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    760 => {
      :price => 2500,
      :after => {:kind => :A, :id => 663},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 656, :num => 1},
        {:kind => :I, :id => 268, :num => 1},
      ],
    },
    761 => {
      :price => 7800,
      :after => {:kind => :A, :id => 711},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 229, :num => 1},
        {:kind => :I, :id => 262, :num => 1},
      ],
    },
    762 => {
      :price => 8000,
      :after => {:kind => :A, :id => 794},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 792, :num => 1},
        {:kind => :I, :id => 268, :num => 1},
      ],
    },
    763 => {
      :price => 8500,
      :after => {:kind => :A, :id => 847},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 842, :num => 1},
        {:kind => :I, :id => 269, :num => 1},
      ],
    },
    764 => {
      :price => 14500,
      :after => {:kind => :W, :id => 4085},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 31, :num => 1},
        {:kind => :I, :id => 275, :num => 1},
      ],
    },
    765 => {
      :price => 14500,
      :after => {:kind => :W, :id => 4086},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 32, :num => 1},
        {:kind => :I, :id => 284, :num => 1},
      ],
    },
    766 => {
      :price => 14500,
      :after => {:kind => :W, :id => 4087},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4082, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    767 => {
      :price => 17500,
      :after => {:kind => :W, :id => 4115},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 84, :num => 1},
        {:kind => :W, :id => 93, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    768 => {
      :price => 19000,
      :after => {:kind => :W, :id => 4135},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 117, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    769 => {
      :price => 19000,
      :after => {:kind => :W, :id => 4136},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 102, :num => 1},
        {:kind => :W, :id => 120, :num => 1},
        {:kind => :I, :id => 284, :num => 1},
      ],
    },
    770 => {
      :price => 21000,
      :after => {:kind => :W, :id => 4137},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 123, :num => 1},
        {:kind => :W, :id => 4130, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    771 => {
      :price => 23000,
      :after => {:kind => :W, :id => 141},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 140, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    772 => {
      :price => 23000,
      :after => {:kind => :W, :id => 4166},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 135, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    773 => {
      :price => 24000,
      :after => {:kind => :W, :id => 4167},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 137, :num => 1},
        {:kind => :W, :id => 138, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    774 => {
      :price => 17000,
      :after => {:kind => :W, :id => 4192},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 168, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    775 => {
      :price => 17000,
      :after => {:kind => :W, :id => 4193},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4189, :num => 1},
        {:kind => :I, :id => 275, :num => 1},
      ],
    },
    776 => {
      :price => 18000,
      :after => {:kind => :W, :id => 4194},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 169, :num => 1},
        {:kind => :W, :id => 171, :num => 1},
        {:kind => :W, :id => 4185, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    777 => {
      :price => 18900,
      :after => {:kind => :W, :id => 4217},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 178, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    778 => {
      :price => 18900,
      :after => {:kind => :W, :id => 4218},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 186, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    779 => {
      :price => 16500,
      :after => {:kind => :W, :id => 4241},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 204, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    780 => {
      :price => 16500,
      :after => {:kind => :W, :id => 4242},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 205, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    781 => {
      :price => 22000,
      :after => {:kind => :W, :id => 4256},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 241, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    782 => {
      :price => 22000,
      :after => {:kind => :W, :id => 4257},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 236, :num => 1},
        {:kind => :W, :id => 238, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    783 => {
      :price => 19000,
      :after => {:kind => :W, :id => 4284},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 243, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    784 => {
      :price => 19000,
      :after => {:kind => :W, :id => 4285},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 243, :num => 1},
        {:kind => :I, :id => 284, :num => 1},
      ],
    },
    785 => {
      :price => 17500,
      :after => {:kind => :W, :id => 4314},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4308, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    786 => {
      :price => 17500,
      :after => {:kind => :W, :id => 4313},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4308, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    787 => {
      :price => 17200,
      :after => {:kind => :W, :id => 4339},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 324, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    788 => {
      :price => 17200,
      :after => {:kind => :W, :id => 4340},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 314, :num => 1},
        {:kind => :I, :id => 274, :num => 1},
      ],
    },
    789 => {
      :price => 17200,
      :after => {:kind => :W, :id => 4338},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 323, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    790 => {
      :price => 14500,
      :after => {:kind => :W, :id => 4373},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 357, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    791 => {
      :price => 14500,
      :after => {:kind => :W, :id => 4372},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4368, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    792 => {
      :price => 23200,
      :after => {:kind => :W, :id => 4393},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 392, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    793 => {
      :price => 23200,
      :after => {:kind => :W, :id => 4394},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 391, :num => 1},
        {:kind => :I, :id => 287, :num => 1},
      ],
    },
    794 => {
      :price => 20200,
      :after => {:kind => :W, :id => 4421},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 435, :num => 1},
        {:kind => :I, :id => 274, :num => 1},
      ],
    },
    795 => {
      :price => 20200,
      :after => {:kind => :W, :id => 4420},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4416, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    796 => {
      :price => 15700,
      :after => {:kind => :W, :id => 4450},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 456, :num => 1},
        {:kind => :I, :id => 274, :num => 1},
      ],
    },
    797 => {
      :price => 15700,
      :after => {:kind => :W, :id => 4449},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 469, :num => 1},
        {:kind => :I, :id => 284, :num => 1},
      ],
    },
    798 => {
      :price => 17800,
      :after => {:kind => :W, :id => 4473},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 498, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    799 => {
      :price => 17800,
      :after => {:kind => :W, :id => 4472},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 499, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    800 => {
      :price => 17800,
      :after => {:kind => :W, :id => 4474},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 506, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    801 => {
      :price => 17800,
      :after => {:kind => :W, :id => 4503},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 540, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    802 => {
      :price => 17800,
      :after => {:kind => :W, :id => 4504},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 541, :num => 1},
        {:kind => :I, :id => 283, :num => 1},
      ],
    },
    803 => {
      :price => 17800,
      :after => {:kind => :W, :id => 4534},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 580, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    804 => {
      :price => 17800,
      :after => {:kind => :W, :id => 4533},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 579, :num => 1},
        {:kind => :I, :id => 285, :num => 1},
      ],
    },
    805 => {
      :price => 20000,
      :after => {:kind => :W, :id => 4560},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 620, :num => 1},
        {:kind => :I, :id => 275, :num => 1},
      ],
    },
    806 => {
      :price => 20000,
      :after => {:kind => :W, :id => 4561},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 619, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    807 => {
      :price => 21000,
      :after => {:kind => :W, :id => 4562},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 612, :num => 1},
        {:kind => :W, :id => 613, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    808 => {
      :price => 16600,
      :after => {:kind => :W, :id => 4593},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 650, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    809 => {
      :price => 16600,
      :after => {:kind => :W, :id => 4592},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 655, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    810 => {
      :price => 19500,
      :after => {:kind => :W, :id => 4613},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4608, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    811 => {
      :price => 19500,
      :after => {:kind => :W, :id => 4614},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4610, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    812 => {
      :price => 19500,
      :after => {:kind => :W, :id => 4615},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 691, :num => 1},
        {:kind => :W, :id => 693, :num => 1},
        {:kind => :W, :id => 696, :num => 1},
        {:kind => :I, :id => 283, :num => 1},
      ],
    },
    813 => {
      :price => 22400,
      :after => {:kind => :W, :id => 4619},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4609, :num => 1},
        {:kind => :I, :id => 283, :num => 1},
      ],
    },
    814 => {
      :price => 23800,
      :after => {:kind => :W, :id => 4640},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 723, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    815 => {
      :price => 23800,
      :after => {:kind => :W, :id => 4639},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4635, :num => 1},
        {:kind => :I, :id => 287, :num => 1},
      ],
    },
    816 => {
      :price => 16000,
      :after => {:kind => :W, :id => 4667},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4660, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    817 => {
      :price => 16000,
      :after => {:kind => :W, :id => 4666},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4659, :num => 1},
        {:kind => :I, :id => 284, :num => 1},
      ],
    },
    818 => {
      :price => 17000,
      :after => {:kind => :W, :id => 4668},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4661, :num => 1},
        {:kind => :W, :id => 4662, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    819 => {
      :price => 16000,
      :after => {:kind => :W, :id => 4693},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4687, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    820 => {
      :price => 16000,
      :after => {:kind => :W, :id => 4692},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4686, :num => 1},
        {:kind => :I, :id => 284, :num => 1},
      ],
    },
    821 => {
      :price => 13000,
      :after => {:kind => :W, :id => 4711},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4707, :num => 1},
        {:kind => :I, :id => 278, :num => 1},
      ],
    },
    822 => {
      :price => 13000,
      :after => {:kind => :W, :id => 4712},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 793, :num => 1},
        {:kind => :I, :id => 283, :num => 1},
      ],
    },
    823 => {
      :price => 17200,
      :after => {:kind => :W, :id => 4732},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 813, :num => 1},
        {:kind => :I, :id => 274, :num => 1},
      ],
    },
    824 => {
      :price => 17200,
      :after => {:kind => :W, :id => 4733},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4727, :num => 1},
        {:kind => :I, :id => 286, :num => 1},
      ],
    },
    825 => {
      :price => 16600,
      :after => {:kind => :W, :id => 4752},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 833, :num => 1},
        {:kind => :I, :id => 274, :num => 1},
      ],
    },
    826 => {
      :price => 16600,
      :after => {:kind => :W, :id => 4751},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 838, :num => 1},
        {:kind => :I, :id => 283, :num => 1},
      ],
    },
    827 => {
      :price => 16600,
      :after => {:kind => :W, :id => 4773},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 864, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    828 => {
      :price => 16600,
      :after => {:kind => :W, :id => 4774},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 859, :num => 1},
        {:kind => :I, :id => 285, :num => 1},
      ],
    },
    829 => {
      :price => 16800,
      :after => {:kind => :W, :id => 4799},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4797, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    830 => {
      :price => 16800,
      :after => {:kind => :W, :id => 4798},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 884, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    831 => {
      :price => 36000,
      :after => {:kind => :W, :id => 4819},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4814, :num => 1},
        {:kind => :I, :id => 278, :num => 1},
      ],
    },
    832 => {
      :price => 36000,
      :after => {:kind => :W, :id => 4818},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 917, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    833 => {
      :price => 38000,
      :after => {:kind => :W, :id => 4820},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4816, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    834 => {
      :price => 22000,
      :after => {:kind => :W, :id => 4841},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 930, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    835 => {
      :price => 22000,
      :after => {:kind => :W, :id => 4840},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 935, :num => 1},
        {:kind => :I, :id => 284, :num => 1},
      ],
    },
    836 => {
      :price => 6000,
      :after => {:kind => :A, :id => 400},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 390, :num => 1},
        {:kind => :I, :id => 278, :num => 1},
      ],
    },
    837 => {
      :price => 6000,
      :after => {:kind => :A, :id => 399},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 389, :num => 1},
        {:kind => :I, :id => 285, :num => 1},
      ],
    },
    838 => {
      :price => 6100,
      :after => {:kind => :A, :id => 401},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 391, :num => 1},
        {:kind => :A, :id => 393, :num => 1},
        {:kind => :A, :id => 394, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    839 => {
      :price => 7200,
      :after => {:kind => :A, :id => 426},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 418, :num => 1},
        {:kind => :I, :id => 275, :num => 1},
      ],
    },
    840 => {
      :price => 7200,
      :after => {:kind => :A, :id => 427},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 422, :num => 1},
        {:kind => :I, :id => 287, :num => 1},
      ],
    },
    841 => {
      :price => 12000,
      :after => {:kind => :A, :id => 454},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 443, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    842 => {
      :price => 12000,
      :after => {:kind => :A, :id => 455},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 450, :num => 1},
        {:kind => :A, :id => 451, :num => 1},
        {:kind => :I, :id => 275, :num => 1},
      ],
    },
    843 => {
      :price => 11400,
      :after => {:kind => :A, :id => 476},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 475, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    844 => {
      :price => 11400,
      :after => {:kind => :A, :id => 477},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 473, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    845 => {
      :price => 12500,
      :after => {:kind => :A, :id => 496},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 495, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    846 => {
      :price => 12500,
      :after => {:kind => :A, :id => 498},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 497, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    847 => {
      :price => 13000,
      :after => {:kind => :A, :id => 499},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 102, :num => 1},
        {:kind => :I, :id => 275, :num => 1},
      ],
    },
    848 => {
      :price => 7700,
      :after => {:kind => :A, :id => 542},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 533, :num => 1},
        {:kind => :I, :id => 285, :num => 1},
      ],
    },
    849 => {
      :price => 9000,
      :after => {:kind => :A, :id => 565},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 143, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    850 => {
      :price => 9000,
      :after => {:kind => :A, :id => 566},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 146, :num => 1},
        {:kind => :I, :id => 285, :num => 1},
      ],
    },
    851 => {
      :price => 9500,
      :after => {:kind => :A, :id => 567},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 138, :num => 1},
        {:kind => :I, :id => 275, :num => 1},
      ],
    },
    852 => {
      :price => 23800,
      :after => {:kind => :A, :id => 599},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 591, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    853 => {
      :price => 23800,
      :after => {:kind => :A, :id => 600},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 598, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    854 => {
      :price => 23800,
      :after => {:kind => :A, :id => 601},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 161, :num => 1},
        {:kind => :I, :id => 285, :num => 1},
      ],
    },
    855 => {
      :price => 24000,
      :after => {:kind => :A, :id => 628},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 617, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    856 => {
      :price => 24000,
      :after => {:kind => :A, :id => 629},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 174, :num => 1},
        {:kind => :I, :id => 283, :num => 1},
      ],
    },
    857 => {
      :price => 30000,
      :after => {:kind => :A, :id => 630},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 619, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    858 => {
      :price => 3000,
      :after => {:kind => :A, :id => 666},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 658, :num => 1},
        {:kind => :I, :id => 275, :num => 1},
      ],
    },
    859 => {
      :price => 3000,
      :after => {:kind => :A, :id => 667},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 655, :num => 1},
        {:kind => :I, :id => 284, :num => 1},
      ],
    },
    860 => {
      :price => 7800,
      :after => {:kind => :A, :id => 693},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 199, :num => 1},
        {:kind => :I, :id => 275, :num => 1},
      ],
    },
    861 => {
      :price => 7800,
      :after => {:kind => :A, :id => 694},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 201, :num => 1},
        {:kind => :I, :id => 286, :num => 1},
      ],
    },
    862 => {
      :price => 9500,
      :after => {:kind => :A, :id => 716},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 715, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    863 => {
      :price => 9500,
      :after => {:kind => :A, :id => 718},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 717, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    864 => {
      :price => 9800,
      :after => {:kind => :A, :id => 719},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 709, :num => 1},
        {:kind => :I, :id => 283, :num => 1},
      ],
    },
    865 => {
      :price => 8000,
      :after => {:kind => :A, :id => 762},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 252, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    866 => {
      :price => 8000,
      :after => {:kind => :A, :id => 763},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 249, :num => 1},
        {:kind => :I, :id => 274, :num => 1},
      ],
    },
    867 => {
      :price => 8000,
      :after => {:kind => :A, :id => 761},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 753, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    868 => {
      :price => 10500,
      :after => {:kind => :A, :id => 796},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 269, :num => 1},
        {:kind => :I, :id => 275, :num => 1},
      ],
    },
    869 => {
      :price => 10500,
      :after => {:kind => :A, :id => 797},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 785, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    870 => {
      :price => 6000,
      :after => {:kind => :A, :id => 828},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 277, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    871 => {
      :price => 6000,
      :after => {:kind => :A, :id => 829},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 276, :num => 1},
        {:kind => :I, :id => 283, :num => 1},
      ],
    },
    872 => {
      :price => 9000,
      :after => {:kind => :A, :id => 849},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 848, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    873 => {
      :price => 9000,
      :after => {:kind => :A, :id => 850},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 292, :num => 1},
        {:kind => :I, :id => 285, :num => 1},
      ],
    },
    874 => {
      :price => 12000,
      :after => {:kind => :A, :id => 880},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 879, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    875 => {
      :price => 12000,
      :after => {:kind => :A, :id => 882},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 881, :num => 1},
        {:kind => :I, :id => 281, :num => 1},
      ],
    },
    876 => {
      :price => 12400,
      :after => {:kind => :A, :id => 883},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 326, :num => 1},
        {:kind => :I, :id => 275, :num => 1},
      ],
    },
    877 => {
      :price => 18000,
      :after => {:kind => :W, :id => 4341},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 332, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    878 => {
      :price => 19500,
      :after => {:kind => :W, :id => 4616},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4607, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    879 => {
      :price => 38000,
      :after => {:kind => :W, :id => 4821},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4817, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    880 => {
      :price => 12500,
      :after => {:kind => :A, :id => 456},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 447, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    881 => {
      :price => 9500,
      :after => {:kind => :A, :id => 568},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 558, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    882 => {
      :price => 10500,
      :after => {:kind => :A, :id => 851},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 847, :num => 1},
        {:kind => :I, :id => 279, :num => 1},
      ],
    },
    883 => {
      :price => 19000,
      :after => {:kind => :W, :id => 4243},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 206, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    884 => {
      :price => 23000,
      :after => {:kind => :W, :id => 4288},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 259, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    885 => {
      :price => 19800,
      :after => {:kind => :W, :id => 4344},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 325, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    886 => {
      :price => 26500,
      :after => {:kind => :W, :id => 4397},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 393, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    887 => {
      :price => 20000,
      :after => {:kind => :W, :id => 4197},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 172, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    888 => {
      :price => 23000,
      :after => {:kind => :W, :id => 4289},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 264, :num => 1},
        {:kind => :W, :id => 265, :num => 1},
        {:kind => :W, :id => 4277, :num => 1},
        {:kind => :W, :id => 4279, :num => 1},
        {:kind => :W, :id => 4280, :num => 1},
        {:kind => :W, :id => 4282, :num => 1},
        {:kind => :W, :id => 4283, :num => 1},
      ],
    },
    889 => {
      :price => 19000,
      :after => {:kind => :W, :id => 4345},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 322, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    890 => {
      :price => 22700,
      :after => {:kind => :W, :id => 4424},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4415, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    891 => {
      :price => 19000,
      :after => {:kind => :W, :id => 4507},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4497, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    892 => {
      :price => 22500,
      :after => {:kind => :W, :id => 4565},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 614, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    893 => {
      :price => 19500,
      :after => {:kind => :W, :id => 4671},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 750, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    894 => {
      :price => 23000,
      :after => {:kind => :W, :id => 4842},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 938, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    895 => {
      :price => 14000,
      :after => {:kind => :A, :id => 500},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 99, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    896 => {
      :price => 29000,
      :after => {:kind => :A, :id => 631},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 623, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    897 => {
      :price => 9200,
      :after => {:kind => :A, :id => 764},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 756, :num => 1},
        {:kind => :A, :id => 757, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    898 => {
      :price => 12500,
      :after => {:kind => :A, :id => 798},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 784, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    899 => {
      :price => 7200,
      :after => {:kind => :A, :id => 830},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 825, :num => 1},
        {:kind => :I, :id => 280, :num => 1},
      ],
    },
    900 => {
      :price => 13500,
      :after => {:kind => :A, :id => 884},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 872, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    901 => {
      :price => 13000,
      :after => {:kind => :A, :id => 885},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 328, :num => 1},
        {:kind => :I, :id => 272, :num => 1},
      ],
    },
    902 => {
      :price => 23000,
      :after => {:kind => :W, :id => 4140},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 116, :num => 1},
        {:kind => :I, :id => 276, :num => 1},
      ],
    },
    903 => {
      :price => 23000,
      :after => {:kind => :W, :id => 4141},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 118, :num => 1},
        {:kind => :I, :id => 276, :num => 1},
      ],
    },
    904 => {
      :price => 18500,
      :after => {:kind => :W, :id => 4537},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 587, :num => 1},
        {:kind => :W, :id => 4527, :num => 1},
        {:kind => :I, :id => 276, :num => 1},
      ],
    },
    905 => {
      :price => 22700,
      :after => {:kind => :W, :id => 4566},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 618, :num => 1},
        {:kind => :I, :id => 284, :num => 1},
      ],
    },
    906 => {
      :price => 18000,
      :after => {:kind => :W, :id => 4800},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4793, :num => 1},
        {:kind => :I, :id => 282, :num => 1},
      ],
    },
    907 => {
      :price => 8900,
      :after => {:kind => :A, :id => 428},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 421, :num => 1},
        {:kind => :I, :id => 284, :num => 1},
      ],
    },
    908 => {
      :price => 11000,
      :after => {:kind => :A, :id => 569},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 559, :num => 1},
        {:kind => :I, :id => 283, :num => 1},
      ],
    },
    909 => {
      :price => 29000,
      :after => {:kind => :A, :id => 632},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 624, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    910 => {
      :price => 12500,
      :after => {:kind => :A, :id => 799},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 790, :num => 1},
        {:kind => :I, :id => 287, :num => 1},
      ],
    },
    911 => {
      :price => 13300,
      :after => {:kind => :A, :id => 887},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 325, :num => 1},
        {:kind => :I, :id => 276, :num => 1},
      ],
    },
    912 => {
      :price => 13000,
      :after => {:kind => :A, :id => 886},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 329, :num => 1},
        {:kind => :I, :id => 277, :num => 1},
      ],
    },
    913 => {
      :price => 18000,
      :after => {:kind => :W, :id => 4112},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 83, :num => 1},
        {:kind => :I, :id => 273, :num => 1},
      ],
    },
    914 => {
      :price => 20000,
      :after => {:kind => :W, :id => 4118},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4112, :num => 1},
        {:kind => :W, :id => 4114, :num => 1},
        {:kind => :I, :id => 289, :num => 1},
        {:kind => :I, :id => 290, :num => 1},
      ],
    },
    915 => {
      :price => 14000,
      :after => {:kind => :A, :id => 501},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 97, :num => 1},
        {:kind => :I, :id => 276, :num => 1},
      ],
    },
    916 => {
      :price => 11000,
      :after => {:kind => :A, :id => 720},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 226, :num => 1},
        {:kind => :I, :id => 276, :num => 1},
      ],
    },
    917 => {
      :price => 13800,
      :after => {:kind => :A, :id => 888},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 321, :num => 1},
        {:kind => :I, :id => 276, :num => 1},
      ],
    },
    918 => {
      :price => 19500,
      :after => {:kind => :W, :id => 4091},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 40, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    919 => {
      :price => 22000,
      :after => {:kind => :W, :id => 4120},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 79, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    920 => {
      :price => 24000,
      :after => {:kind => :W, :id => 4142},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 113, :num => 1},
        {:kind => :W, :id => 122, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    921 => {
      :price => 23000,
      :after => {:kind => :W, :id => 4200},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 175, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    922 => {
      :price => 28000,
      :after => {:kind => :W, :id => 4260},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 235, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    923 => {
      :price => 25000,
      :after => {:kind => :W, :id => 4291},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4285, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    924 => {
      :price => 23500,
      :after => {:kind => :W, :id => 4318},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4309, :num => 1},
        {:kind => :W, :id => 4310, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    925 => {
      :price => 22000,
      :after => {:kind => :W, :id => 4347},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 330, :num => 1},
        {:kind => :W, :id => 331, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    926 => {
      :price => 19000,
      :after => {:kind => :W, :id => 4377},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4372, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    927 => {
      :price => 31000,
      :after => {:kind => :W, :id => 4399},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 395, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    928 => {
      :price => 27000,
      :after => {:kind => :W, :id => 4426},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4420, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    929 => {
      :price => 23500,
      :after => {:kind => :W, :id => 4478},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4473, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    930 => {
      :price => 23000,
      :after => {:kind => :W, :id => 4509},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4503, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    931 => {
      :price => 23000,
      :after => {:kind => :W, :id => 4540},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4529, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    932 => {
      :price => 26000,
      :after => {:kind => :W, :id => 4568},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4562, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    933 => {
      :price => 22000,
      :after => {:kind => :W, :id => 4595},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4592, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    934 => {
      :price => 25000,
      :after => {:kind => :W, :id => 4621},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4614, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    935 => {
      :price => 22000,
      :after => {:kind => :W, :id => 4696},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4688, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    936 => {
      :price => 17000,
      :after => {:kind => :W, :id => 4715},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4711, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    937 => {
      :price => 21200,
      :after => {:kind => :W, :id => 4754},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4747, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    938 => {
      :price => 22000,
      :after => {:kind => :W, :id => 4776},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4767, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    939 => {
      :price => 28000,
      :after => {:kind => :W, :id => 4843},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 936, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    940 => {
      :price => 9600,
      :after => {:kind => :A, :id => 429},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 426, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    941 => {
      :price => 16000,
      :after => {:kind => :A, :id => 459},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 448, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    942 => {
      :price => 17000,
      :after => {:kind => :A, :id => 505},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 489, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    943 => {
      :price => 10000,
      :after => {:kind => :A, :id => 544},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 537, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    944 => {
      :price => 30400,
      :after => {:kind => :A, :id => 603},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 592, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    945 => {
      :price => 32000,
      :after => {:kind => :A, :id => 635},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 628, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    946 => {
      :price => 4000,
      :after => {:kind => :A, :id => 668},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 662, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    947 => {
      :price => 12000,
      :after => {:kind => :A, :id => 725},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 231, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    948 => {
      :price => 11000,
      :after => {:kind => :A, :id => 766},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 762, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    949 => {
      :price => 15200,
      :after => {:kind => :A, :id => 894},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 883, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    950 => {
      :price => 21000,
      :after => {:kind => :W, :id => 4092},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 38, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    951 => {
      :price => 27500,
      :after => {:kind => :W, :id => 4143},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4131, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    952 => {
      :price => 31000,
      :after => {:kind => :W, :id => 4171},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4167, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    953 => {
      :price => 25000,
      :after => {:kind => :W, :id => 4202},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4187, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    954 => {
      :price => 30000,
      :after => {:kind => :W, :id => 4222},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4218, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    955 => {
      :price => 25000,
      :after => {:kind => :W, :id => 4245},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4238, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    956 => {
      :price => 28000,
      :after => {:kind => :W, :id => 4292},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4278, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    957 => {
      :price => 26000,
      :after => {:kind => :W, :id => 4319},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4313, :num => 1},
        {:kind => :W, :id => 4314, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    958 => {
      :price => 24500,
      :after => {:kind => :W, :id => 4349},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 293, :num => 1},
        {:kind => :W, :id => 295, :num => 1},
        {:kind => :W, :id => 296, :num => 1},
        {:kind => :W, :id => 297, :num => 1},
        {:kind => :W, :id => 298, :num => 1},
        {:kind => :W, :id => 299, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    959 => {
      :price => 34000,
      :after => {:kind => :W, :id => 4400},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 398, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    960 => {
      :price => 25500,
      :after => {:kind => :W, :id => 4479},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4469, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    961 => {
      :price => 25000,
      :after => {:kind => :W, :id => 4510},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4494, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    962 => {
      :price => 32000,
      :after => {:kind => :W, :id => 4570},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4556, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    963 => {
      :price => 36000,
      :after => {:kind => :W, :id => 4643},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 719, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    964 => {
      :price => 23000,
      :after => {:kind => :W, :id => 4673},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4658, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    965 => {
      :price => 24000,
      :after => {:kind => :W, :id => 4735},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4728, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    966 => {
      :price => 23500,
      :after => {:kind => :W, :id => 4755},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4755, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    967 => {
      :price => 24000,
      :after => {:kind => :W, :id => 4777},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 865, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    968 => {
      :price => 24500,
      :after => {:kind => :W, :id => 4802},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4796, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    969 => {
      :price => 54000,
      :after => {:kind => :W, :id => 4825},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4819, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    970 => {
      :price => 9000,
      :after => {:kind => :A, :id => 402},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 399, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    971 => {
      :price => 17000,
      :after => {:kind => :A, :id => 460},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 445, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    972 => {
      :price => 18000,
      :after => {:kind => :A, :id => 479},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 476, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    973 => {
      :price => 18500,
      :after => {:kind => :A, :id => 506},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 499, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    974 => {
      :price => 10000,
      :after => {:kind => :A, :id => 545},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 538, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    975 => {
      :price => 13500,
      :after => {:kind => :A, :id => 570},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 560, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    976 => {
      :price => 34000,
      :after => {:kind => :A, :id => 604},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 596, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    977 => {
      :price => 36000,
      :after => {:kind => :A, :id => 936},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 621, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    978 => {
      :price => 45000,
      :after => {:kind => :A, :id => 669},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 667, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    979 => {
      :price => 12000,
      :after => {:kind => :A, :id => 698},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 689, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    980 => {
      :price => 13500,
      :after => {:kind => :A, :id => 726},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 232, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    981 => {
      :price => 11500,
      :after => {:kind => :A, :id => 768},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 758, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    982 => {
      :price => 15500,
      :after => {:kind => :A, :id => 803},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 787, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    983 => {
      :price => 9000,
      :after => {:kind => :A, :id => 831},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 827, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    984 => {
      :price => 13500,
      :after => {:kind => :A, :id => 854},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 841, :num => 1},
        {:kind => :A, :id => 846, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    985 => {
      :price => 22000,
      :after => {:kind => :W, :id => 4093},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 43, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    986 => {
      :price => 25000,
      :after => {:kind => :W, :id => 4121},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4111, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    987 => {
      :price => 30000,
      :after => {:kind => :W, :id => 4145},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4135, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    988 => {
      :price => 35000,
      :after => {:kind => :W, :id => 4172},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4166, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    989 => {
      :price => 27500,
      :after => {:kind => :W, :id => 4203},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 167, :num => 1},
        {:kind => :W, :id => 174, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    990 => {
      :price => 31500,
      :after => {:kind => :W, :id => 4223},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4217, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    991 => {
      :price => 35000,
      :after => {:kind => :W, :id => 4261},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4256, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    992 => {
      :price => 27000,
      :after => {:kind => :W, :id => 4350},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4340, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    993 => {
      :price => 23000,
      :after => {:kind => :W, :id => 4378},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 352, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    994 => {
      :price => 32000,
      :after => {:kind => :W, :id => 4427},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4421, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    995 => {
      :price => 24500,
      :after => {:kind => :W, :id => 4454},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4444, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    996 => {
      :price => 28000,
      :after => {:kind => :W, :id => 4480},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 501, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    997 => {
      :price => 28000,
      :after => {:kind => :W, :id => 4511},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4500, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    998 => {
      :price => 28000,
      :after => {:kind => :W, :id => 4541},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 586, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    999 => {
      :price => 26000,
      :after => {:kind => :W, :id => 4596},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4593, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1000 => {
      :price => 31000,
      :after => {:kind => :W, :id => 4623},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4615, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1001 => {
      :price => 25000,
      :after => {:kind => :W, :id => 4697},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4689, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1002 => {
      :price => 20000,
      :after => {:kind => :W, :id => 4716},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 794, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1003 => {
      :price => 26000,
      :after => {:kind => :W, :id => 4778},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4766, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1004 => {
      :price => 35000,
      :after => {:kind => :W, :id => 4845},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 932, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1005 => {
      :price => 10000,
      :after => {:kind => :A, :id => 403},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 385, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1006 => {
      :price => 12000,
      :after => {:kind => :A, :id => 430},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 419, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1007 => {
      :price => 19000,
      :after => {:kind => :A, :id => 461},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 449, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1008 => {
      :price => 20000,
      :after => {:kind => :A, :id => 507},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 491, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1009 => {
      :price => 12000,
      :after => {:kind => :A, :id => 546},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 539, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1010 => {
      :price => 38000,
      :after => {:kind => :A, :id => 605},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 595, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1011 => {
      :price => 15000,
      :after => {:kind => :A, :id => 727},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 708, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1012 => {
      :price => 13000,
      :after => {:kind => :A, :id => 769},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 752, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1013 => {
      :price => 17500,
      :after => {:kind => :A, :id => 804},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 795, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1014 => {
      :price => 19000,
      :after => {:kind => :A, :id => 895},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 873, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1015 => {
      :price => 57000,
      :after => {:kind => :W, :id => 4824},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4821, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1016 => {
      :price => 20000,
      :after => {:kind => :A, :id => 457},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 456, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1017 => {
      :price => 5000,
      :after => {:kind => :A, :id => 670},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 663, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1018 => {
      :price => 15500,
      :after => {:kind => :A, :id => 892},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 890, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1019 => {
      :price => 33000,
      :after => {:kind => :W, :id => 4146},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 114, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1020 => {
      :price => 30000,
      :after => {:kind => :W, :id => 4204},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4193, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1021 => {
      :price => 31000,
      :after => {:kind => :W, :id => 4247},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4240, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1022 => {
      :price => 40000,
      :after => {:kind => :W, :id => 4262},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 237, :num => 1},
        {:kind => :W, :id => 4269, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1023 => {
      :price => 34000,
      :after => {:kind => :W, :id => 4293},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4284, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1024 => {
      :price => 30000,
      :after => {:kind => :W, :id => 4320},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 285, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1025 => {
      :price => 30000,
      :after => {:kind => :W, :id => 4351},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4338, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1026 => {
      :price => 40000,
      :after => {:kind => :W, :id => 4401},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 396, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1027 => {
      :price => 26500,
      :after => {:kind => :W, :id => 4455},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4446, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1028 => {
      :price => 31000,
      :after => {:kind => :W, :id => 4512},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 544, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1029 => {
      :price => 35000,
      :after => {:kind => :W, :id => 4571},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4569, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1030 => {
      :price => 29000,
      :after => {:kind => :W, :id => 4597},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4588, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1031 => {
      :price => 41000,
      :after => {:kind => :W, :id => 4644},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4639, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1032 => {
      :price => 30000,
      :after => {:kind => :W, :id => 4736},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4732, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1033 => {
      :price => 28500,
      :after => {:kind => :W, :id => 4756},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4751, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1034 => {
      :price => 28500,
      :after => {:kind => :W, :id => 4779},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4769, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1035 => {
      :price => 30000,
      :after => {:kind => :W, :id => 4804},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4791, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1036 => {
      :price => 61000,
      :after => {:kind => :W, :id => 4826},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4818, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1037 => {
      :price => 21000,
      :after => {:kind => :A, :id => 462},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 442, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1038 => {
      :price => 21000,
      :after => {:kind => :A, :id => 480},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 477, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1039 => {
      :price => 17500,
      :after => {:kind => :A, :id => 571},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 567, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1040 => {
      :price => 40000,
      :after => {:kind => :A, :id => 606},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 597, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1041 => {
      :price => 44000,
      :after => {:kind => :A, :id => 638},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 174, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1042 => {
      :price => 5500,
      :after => {:kind => :A, :id => 671},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 664, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1043 => {
      :price => 14500,
      :after => {:kind => :A, :id => 699},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 693, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1044 => {
      :price => 14200,
      :after => {:kind => :A, :id => 770},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 754, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1045 => {
      :price => 16500,
      :after => {:kind => :A, :id => 855},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 845, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1046 => {
      :price => 27000,
      :after => {:kind => :W, :id => 4095},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 44, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1047 => {
      :price => 30000,
      :after => {:kind => :W, :id => 4122},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4110, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1048 => {
      :price => 36500,
      :after => {:kind => :W, :id => 4148},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 112, :num => 1},
        {:kind => :W, :id => 4132, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1049 => {
      :price => 42000,
      :after => {:kind => :W, :id => 4173},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 139, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1050 => {
      :price => 37800,
      :after => {:kind => :W, :id => 4224},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 187, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1051 => {
      :price => 43000,
      :after => {:kind => :W, :id => 4264},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4257, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1052 => {
      :price => 70000,
      :after => {:kind => :W, :id => 4295},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4281, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1053 => {
      :price => 34500,
      :after => {:kind => :W, :id => 4322},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 286, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1054 => {
      :price => 33000,
      :after => {:kind => :W, :id => 4353},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4333, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1055 => {
      :price => 28000,
      :after => {:kind => :W, :id => 4380},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 359, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1056 => {
      :price => 45000,
      :after => {:kind => :W, :id => 4404},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4394, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1057 => {
      :price => 39000,
      :after => {:kind => :W, :id => 4430},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4414, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1058 => {
      :price => 34000,
      :after => {:kind => :W, :id => 4482},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 505, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1059 => {
      :price => 34000,
      :after => {:kind => :W, :id => 4514},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4495, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1060 => {
      :price => 34000,
      :after => {:kind => :W, :id => 4543},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4533, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1061 => {
      :price => 41000,
      :after => {:kind => :W, :id => 4573},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4561, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1062 => {
      :price => 38000,
      :after => {:kind => :W, :id => 4625},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4617, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1063 => {
      :price => 31000,
      :after => {:kind => :W, :id => 4675},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4666, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1064 => {
      :price => 25000,
      :after => {:kind => :W, :id => 4719},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4706, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1065 => {
      :price => 32000,
      :after => {:kind => :W, :id => 4758},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4752, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1066 => {
      :price => 42000,
      :after => {:kind => :W, :id => 4846},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4840, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1067 => {
      :price => 12000,
      :after => {:kind => :A, :id => 404},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 397, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1068 => {
      :price => 14400,
      :after => {:kind => :A, :id => 431},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 423, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1069 => {
      :price => 23000,
      :after => {:kind => :A, :id => 464},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 446, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1070 => {
      :price => 24500,
      :after => {:kind => :A, :id => 510},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 490, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1071 => {
      :price => 15000,
      :after => {:kind => :A, :id => 549},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 538, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1072 => {
      :price => 48000,
      :after => {:kind => :A, :id => 639},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 625, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1073 => {
      :price => 6000,
      :after => {:kind => :A, :id => 673},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 667, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1074 => {
      :price => 15600,
      :after => {:kind => :A, :id => 700},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 694, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1075 => {
      :price => 19000,
      :after => {:kind => :A, :id => 730},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 710, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1076 => {
      :price => 16200,
      :after => {:kind => :A, :id => 773},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 761, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1077 => {
      :price => 21000,
      :after => {:kind => :A, :id => 805},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 789, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1078 => {
      :price => 12000,
      :after => {:kind => :A, :id => 832},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 828, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1079 => {
      :price => 23000,
      :after => {:kind => :A, :id => 899},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 876, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1080 => {
      :price => 28800,
      :after => {:kind => :W, :id => 4096},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4087, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1081 => {
      :price => 40000,
      :after => {:kind => :W, :id => 4149},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4137, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1082 => {
      :price => 40000,
      :after => {:kind => :W, :id => 4150},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4137, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1083 => {
      :price => 35000,
      :after => {:kind => :W, :id => 4206},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4194, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1084 => {
      :price => 37800,
      :after => {:kind => :W, :id => 4225},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 188, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1085 => {
      :price => 35000,
      :after => {:kind => :W, :id => 4248},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4239, :num => 1},
        {:kind => :W, :id => 4241, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1086 => {
      :price => 45500,
      :after => {:kind => :W, :id => 4267},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 240, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1087 => {
      :price => 35000,
      :after => {:kind => :W, :id => 4354},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4338, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1088 => {
      :price => 48000,
      :after => {:kind => :W, :id => 4405},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4393, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1089 => {
      :price => 41000,
      :after => {:kind => :W, :id => 4431},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 436, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1090 => {
      :price => 32500,
      :after => {:kind => :W, :id => 4458},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4445, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1091 => {
      :price => 37000,
      :after => {:kind => :W, :id => 4483},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4474, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1092 => {
      :price => 36000,
      :after => {:kind => :W, :id => 4516},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4498, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1093 => {
      :price => 36000,
      :after => {:kind => :W, :id => 4517},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 546, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1094 => {
      :price => 34500,
      :after => {:kind => :W, :id => 4600},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4587, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1095 => {
      :price => 34000,
      :after => {:kind => :W, :id => 4700},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 772, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1096 => {
      :price => 26500,
      :after => {:kind => :W, :id => 4720},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4708, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1097 => {
      :price => 34500,
      :after => {:kind => :W, :id => 4781},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4773, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1098 => {
      :price => 13000,
      :after => {:kind => :A, :id => 405},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 395, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1099 => {
      :price => 13000,
      :after => {:kind => :A, :id => 406},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 395, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1100 => {
      :price => 24500,
      :after => {:kind => :A, :id => 482},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 471, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1101 => {
      :price => 26000,
      :after => {:kind => :A, :id => 512},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 499, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1102 => {
      :price => 15500,
      :after => {:kind => :A, :id => 550},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 536, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1103 => {
      :price => 20000,
      :after => {:kind => :A, :id => 573},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 562, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1104 => {
      :price => 50000,
      :after => {:kind => :A, :id => 609},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 601, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1105 => {
      :price => 51000,
      :after => {:kind => :A, :id => 640},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 630, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1106 => {
      :price => 6800,
      :after => {:kind => :A, :id => 674},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 660, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1107 => {
      :price => 20000,
      :after => {:kind => :A, :id => 731},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 713, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1108 => {
      :price => 17300,
      :after => {:kind => :A, :id => 774},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 755, :num => 1},
        {:kind => :A, :id => 767, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1109 => {
      :price => 22300,
      :after => {:kind => :A, :id => 807},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 786, :num => 1},
        {:kind => :A, :id => 791, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1110 => {
      :price => 20000,
      :after => {:kind => :A, :id => 858},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 844, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1111 => {
      :price => 24500,
      :after => {:kind => :A, :id => 900},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 874, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1112 => {
      :price => 30800,
      :after => {:kind => :W, :id => 4098},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 39, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1113 => {
      :price => 35000,
      :after => {:kind => :W, :id => 4123},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 85, :num => 1},
        {:kind => :W, :id => 4109, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1114 => {
      :price => 42000,
      :after => {:kind => :W, :id => 4151},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4144, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1115 => {
      :price => 49000,
      :after => {:kind => :W, :id => 4174},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 141, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1116 => {
      :price => 38500,
      :after => {:kind => :W, :id => 4208},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4188, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1117 => {
      :price => 44100,
      :after => {:kind => :W, :id => 4226},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4220, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1118 => {
      :price => 49000,
      :after => {:kind => :W, :id => 4268},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 239, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1119 => {
      :price => 42000,
      :after => {:kind => :W, :id => 4297},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 261, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1120 => {
      :price => 39200,
      :after => {:kind => :W, :id => 4323},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 288, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1121 => {
      :price => 32800,
      :after => {:kind => :W, :id => 4382},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 360, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1122 => {
      :price => 39200,
      :after => {:kind => :W, :id => 4518},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4499, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1123 => {
      :price => 39200,
      :after => {:kind => :W, :id => 4545},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4528, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1124 => {
      :price => 44800,
      :after => {:kind => :W, :id => 4574},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4557, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1125 => {
      :price => 36400,
      :after => {:kind => :W, :id => 4601},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 653, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1126 => {
      :price => 43400,
      :after => {:kind => :W, :id => 4626},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4613, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1127 => {
      :price => 53200,
      :after => {:kind => :W, :id => 4647},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4641, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1128 => {
      :price => 35000,
      :after => {:kind => :W, :id => 4676},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4663, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1129 => {
      :price => 28000,
      :after => {:kind => :W, :id => 4721},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4712, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1130 => {
      :price => 37800,
      :after => {:kind => :W, :id => 4738},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 819, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1131 => {
      :price => 36400,
      :after => {:kind => :W, :id => 4759},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 836, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1132 => {
      :price => 36400,
      :after => {:kind => :W, :id => 4782},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4768, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1133 => {
      :price => 39200,
      :after => {:kind => :W, :id => 4805},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4798, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1134 => {
      :price => 49000,
      :after => {:kind => :W, :id => 4847},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 937, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1135 => {
      :price => 16800,
      :after => {:kind => :A, :id => 432},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 424, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1136 => {
      :price => 26600,
      :after => {:kind => :A, :id => 465},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 454, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1137 => {
      :price => 26600,
      :after => {:kind => :A, :id => 483},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 474, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1138 => {
      :price => 16800,
      :after => {:kind => :A, :id => 552},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 536, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1139 => {
      :price => 20000,
      :after => {:kind => :A, :id => 574},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 563, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1140 => {
      :price => 53200,
      :after => {:kind => :A, :id => 610},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 600, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1141 => {
      :price => 7000,
      :after => {:kind => :A, :id => 675},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 661, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1142 => {
      :price => 18200,
      :after => {:kind => :A, :id => 701},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 691, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1143 => {
      :price => 24500,
      :after => {:kind => :A, :id => 808},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 796, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1144 => {
      :price => 21000,
      :after => {:kind => :A, :id => 860},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 850, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1145 => {
      :price => 33300,
      :after => {:kind => :W, :id => 4100},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 36, :num => 1},
        {:kind => :W, :id => 42, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1146 => {
      :price => 45000,
      :after => {:kind => :W, :id => 4152},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 121, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1147 => {
      :price => 41000,
      :after => {:kind => :W, :id => 4249},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4242, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1148 => {
      :price => 45000,
      :after => {:kind => :W, :id => 4298},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 266, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1149 => {
      :price => 41500,
      :after => {:kind => :W, :id => 4324},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 287, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1150 => {
      :price => 40000,
      :after => {:kind => :W, :id => 4355},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4339, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1151 => {
      :price => 56000,
      :after => {:kind => :W, :id => 4406},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4402, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1152 => {
      :price => 34300,
      :after => {:kind => :W, :id => 4459},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4449, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1153 => {
      :price => 42500,
      :after => {:kind => :W, :id => 4486},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 507, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1154 => {
      :price => 42000,
      :after => {:kind => :W, :id => 4519},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 545, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1155 => {
      :price => 42000,
      :after => {:kind => :W, :id => 4546},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4534, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1156 => {
      :price => 48500,
      :after => {:kind => :W, :id => 4576},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4560, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1157 => {
      :price => 38000,
      :after => {:kind => :W, :id => 4702},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4692, :num => 1},
        {:kind => :W, :id => 4693, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1158 => {
      :price => 38500,
      :after => {:kind => :W, :id => 4761},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4746, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1159 => {
      :price => 39800,
      :after => {:kind => :W, :id => 4783},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4774, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1160 => {
      :price => 75000,
      :after => {:kind => :W, :id => 4829},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 912, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1161 => {
      :price => 15000,
      :after => {:kind => :A, :id => 407},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 396, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1162 => {
      :price => 28000,
      :after => {:kind => :A, :id => 466},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 50, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1163 => {
      :price => 30000,
      :after => {:kind => :A, :id => 514},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 492, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1164 => {
      :price => 56300,
      :after => {:kind => :A, :id => 611},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 599, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1165 => {
      :price => 60000,
      :after => {:kind => :A, :id => 641},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 627, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1166 => {
      :price => 7500,
      :after => {:kind => :A, :id => 676},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 666, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1167 => {
      :price => 19400,
      :after => {:kind => :A, :id => 702},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 690, :num => 1},
        {:kind => :A, :id => 693, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1168 => {
      :price => 22000,
      :after => {:kind => :A, :id => 733},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 719, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1169 => {
      :price => 20000,
      :after => {:kind => :A, :id => 775},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 757, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1170 => {
      :price => 26000,
      :after => {:kind => :A, :id => 809},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 270, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1171 => {
      :price => 15000,
      :after => {:kind => :A, :id => 834},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 829, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1172 => {
      :price => 28000,
      :after => {:kind => :A, :id => 902},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 875, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1173 => {
      :price => 35200,
      :after => {:kind => :W, :id => 4101},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4085, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1174 => {
      :price => 35200,
      :after => {:kind => :W, :id => 4102},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4086, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1175 => {
      :price => 40000,
      :after => {:kind => :W, :id => 4124},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4115, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1176 => {
      :price => 48000,
      :after => {:kind => :W, :id => 4154},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4153, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1177 => {
      :price => 56000,
      :after => {:kind => :W, :id => 4175},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 156, :num => 1},
        {:kind => :W, :id => 4186, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1178 => {
      :price => 44000,
      :after => {:kind => :W, :id => 4209},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4192, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1179 => {
      :price => 50400,
      :after => {:kind => :W, :id => 4227},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4221, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1180 => {
      :price => 57000,
      :after => {:kind => :W, :id => 4270},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4265, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1181 => {
      :price => 48000,
      :after => {:kind => :W, :id => 4299},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 260, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1182 => {
      :price => 44800,
      :after => {:kind => :W, :id => 4325},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 279, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1183 => {
      :price => 44800,
      :after => {:kind => :W, :id => 4326},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 280, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1184 => {
      :price => 43500,
      :after => {:kind => :W, :id => 4356},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 329, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1185 => {
      :price => 37000,
      :after => {:kind => :W, :id => 4383},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4369, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1186 => {
      :price => 59200,
      :after => {:kind => :W, :id => 4407},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 397, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1187 => {
      :price => 52500,
      :after => {:kind => :W, :id => 4434},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 439, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1188 => {
      :price => 45500,
      :after => {:kind => :W, :id => 4487},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4472, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1189 => {
      :price => 44800,
      :after => {:kind => :W, :id => 4520},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4504, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1190 => {
      :price => 44800,
      :after => {:kind => :W, :id => 4547},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4530, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1191 => {
      :price => 51200,
      :after => {:kind => :W, :id => 4578},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 617, :num => 1},
        {:kind => :W, :id => 4577, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1192 => {
      :price => 41600,
      :after => {:kind => :W, :id => 4603},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 652, :num => 1},
        {:kind => :W, :id => 654, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1193 => {
      :price => 49600,
      :after => {:kind => :W, :id => 4627},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 697, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1194 => {
      :price => 61000,
      :after => {:kind => :W, :id => 4649},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4640, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1195 => {
      :price => 40000,
      :after => {:kind => :W, :id => 4678},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4668, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1196 => {
      :price => 33000,
      :after => {:kind => :W, :id => 4723},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4717, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1197 => {
      :price => 43200,
      :after => {:kind => :W, :id => 4739},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 818, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1198 => {
      :price => 42300,
      :after => {:kind => :W, :id => 4762},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 840, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1199 => {
      :price => 42000,
      :after => {:kind => :W, :id => 4784},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 861, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1200 => {
      :price => 44800,
      :after => {:kind => :W, :id => 4807},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4794, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1201 => {
      :price => 56000,
      :after => {:kind => :W, :id => 4849},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4844, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1202 => {
      :price => 16000,
      :after => {:kind => :A, :id => 409},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 401, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1203 => {
      :price => 19200,
      :after => {:kind => :A, :id => 493},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 28, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1204 => {
      :price => 31000,
      :after => {:kind => :A, :id => 467},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 455, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1205 => {
      :price => 32000,
      :after => {:kind => :A, :id => 516},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 493, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1206 => {
      :price => 20000,
      :after => {:kind => :A, :id => 554},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 542, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1207 => {
      :price => 24000,
      :after => {:kind => :A, :id => 576},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 144, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1208 => {
      :price => 62800,
      :after => {:kind => :A, :id => 613},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 156, :num => 1},
        {:kind => :A, :id => 594, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1209 => {
      :price => 64000,
      :after => {:kind => :A, :id => 642},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 629, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1210 => {
      :price => 8000,
      :after => {:kind => :A, :id => 677},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 659, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1211 => {
      :price => 20800,
      :after => {:kind => :A, :id => 703},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 692, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1212 => {
      :price => 24500,
      :after => {:kind => :A, :id => 734},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 722, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1213 => {
      :price => 20000,
      :after => {:kind => :A, :id => 776},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 756, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1214 => {
      :price => 38000,
      :after => {:kind => :A, :id => 811},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 268, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1215 => {
      :price => 30800,
      :after => {:kind => :A, :id => 903},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 878, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1216 => {
      :price => 37500,
      :after => {:kind => :W, :id => 4103},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4081, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1217 => {
      :price => 57000,
      :after => {:kind => :W, :id => 4357},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4335, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1218 => {
      :price => 61600,
      :after => {:kind => :W, :id => 4808},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4799, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1219 => {
      :price => 85000,
      :after => {:kind => :W, :id => 4828},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4824, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1220 => {
      :price => 94000,
      :after => {:kind => :W, :id => 4832},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4828, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1221 => {
      :price => 20000,
      :after => {:kind => :A, :id => 410},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 400, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1222 => {
      :price => 38000,
      :after => {:kind => :A, :id => 468},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 457, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1223 => {
      :price => 30000,
      :after => {:kind => :A, :id => 577},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 568, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1224 => {
      :price => 32000,
      :after => {:kind => :A, :id => 578},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 568, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1225 => {
      :price => 80000,
      :after => {:kind => :A, :id => 643},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 626, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1226 => {
      :price => 10000,
      :after => {:kind => :A, :id => 678},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 670, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1227 => {
      :price => 26000,
      :after => {:kind => :A, :id => 704},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 696, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1228 => {
      :price => 24000,
      :after => {:kind => :A, :id => 861},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 851, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1229 => {
      :price => 31000,
      :after => {:kind => :A, :id => 904},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 331, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1230 => {
      :price => 42000,
      :after => {:kind => :A, :id => 905},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 892, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1231 => {
      :price => 59400,
      :after => {:kind => :W, :id => 4740},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4733, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1232 => {
      :price => 92000,
      :after => {:kind => :W, :id => 4833},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4830, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1233 => {
      :price => 92000,
      :after => {:kind => :W, :id => 4834},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4831, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },

#1234欠番

    1235 => {
      :price => 21000,
      :after => {:kind => :A, :id => 411},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 405, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1236 => {
      :price => 21000,
      :after => {:kind => :A, :id => 412},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 406, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1237 => {
      :price => 11000,
      :after => {:kind => :A, :id => 679},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 674, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1238 => {
      :price => 49000,
      :after => {:kind => :W, :id => 4155},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4136, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1239 => {
      :price => 62000,
      :after => {:kind => :W, :id => 4176},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4172, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1242 => {
      :price => 48000,
      :after => {:kind => :W, :id => 4250},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4243, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1243 => {
      :price => 55000,
      :after => {:kind => :W, :id => 4300},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4289, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1244 => {
      :price => 55000,
      :after => {:kind => :W, :id => 4301},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4288, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1245 => {
      :price => 48600,
      :after => {:kind => :W, :id => 4358},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4344, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1246 => {
      :price => 41400,
      :after => {:kind => :W, :id => 4384},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 358, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1247 => {
      :price => 66600,
      :after => {:kind => :W, :id => 4408},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4397, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1248 => {
      :price => 54000,
      :after => {:kind => :W, :id => 4435},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4424, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1249 => {
      :price => 57500,
      :after => {:kind => :W, :id => 4579},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4566, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1250 => {
      :price => 34000,
      :after => {:kind => :A, :id => 517},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 488, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1251 => {
      :price => 34000,
      :after => {:kind => :A, :id => 518},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 98, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1252 => {
      :price => 26000,
      :after => {:kind => :A, :id => 735},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 230, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1253 => {
      :price => 26500,
      :after => {:kind => :A, :id => 736},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 227, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1254 => {
      :price => 33000,
      :after => {:kind => :A, :id => 906},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 327, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1255 => {
      :price => 33000,
      :after => {:kind => :A, :id => 907},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 322, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1256 => {
      :price => 77000,
      :after => {:kind => :W, :id => 4271},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4262, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1257 => {
      :price => 59400,
      :after => {:kind => :W, :id => 4359},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4341, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1258 => {
      :price => 61600,
      :after => {:kind => :W, :id => 4809},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4800, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1259 => {
      :price => 26000,
      :after => {:kind => :A, :id => 434},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 428, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1260 => {
      :price => 33000,
      :after => {:kind => :A, :id => 579},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 569, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1261 => {
      :price => 82000,
      :after => {:kind => :A, :id => 644},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 632, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1262 => {
      :price => 40000,
      :after => {:kind => :A, :id => 812},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 799, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1263 => {
      :price => 42000,
      :after => {:kind => :A, :id => 908},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 886, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1264 => {
      :price => 70400,
      :after => {:kind => :W, :id => 4580},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4564, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1265 => {
      :price => 50000,
      :after => {:kind => :W, :id => 4679},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4671, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1266 => {
      :price => 75000,
      :after => {:kind => :W, :id => 4850},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4842, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1267 => {
      :price => 22000,
      :after => {:kind => :A, :id => 413},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 387, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1268 => {
      :price => 82000,
      :after => {:kind => :A, :id => 645},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 645, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1269 => {
      :price => 40000,
      :after => {:kind => :A, :id => 813},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 798, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1270 => {
      :price => 39600,
      :after => {:kind => :W, :id => 4105},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4088, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1271 => {
      :price => 39600,
      :after => {:kind => :W, :id => 4106},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4089, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1272 => {
      :price => 45000,
      :after => {:kind => :W, :id => 4125},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4116, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1273 => {
      :price => 45000,
      :after => {:kind => :W, :id => 4126},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4117, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1274 => {
      :price => 54000,
      :after => {:kind => :W, :id => 4158},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4138, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1275 => {
      :price => 54000,
      :after => {:kind => :W, :id => 4159},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4139, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1276 => {
      :price => 63000,
      :after => {:kind => :W, :id => 4179},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4168, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1277 => {
      :price => 63000,
      :after => {:kind => :W, :id => 4180},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4169, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1278 => {
      :price => 49500,
      :after => {:kind => :W, :id => 4212},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4195, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1279 => {
      :price => 49500,
      :after => {:kind => :W, :id => 4213},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4196, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1280 => {
      :price => 56700,
      :after => {:kind => :W, :id => 4230},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 183, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1281 => {
      :price => 56700,
      :after => {:kind => :W, :id => 4231},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 184, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1282 => {
      :price => 63000,
      :after => {:kind => :W, :id => 4273},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4258, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1283 => {
      :price => 63000,
      :after => {:kind => :W, :id => 4274},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4259, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1284 => {
      :price => 54000,
      :after => {:kind => :W, :id => 4303},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4286, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1285 => {
      :price => 54000,
      :after => {:kind => :W, :id => 4304},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4287, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1286 => {
      :price => 50400,
      :after => {:kind => :W, :id => 4328},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4315, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1287 => {
      :price => 50400,
      :after => {:kind => :W, :id => 4329},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4316, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1288 => {
      :price => 48600,
      :after => {:kind => :W, :id => 4363},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4342, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1289 => {
      :price => 48600,
      :after => {:kind => :W, :id => 4364},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4343, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1290 => {
      :price => 41400,
      :after => {:kind => :W, :id => 4386},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4374, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1291 => {
      :price => 41400,
      :after => {:kind => :W, :id => 4387},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4375, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1292 => {
      :price => 66600,
      :after => {:kind => :W, :id => 4411},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4395, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1293 => {
      :price => 66600,
      :after => {:kind => :W, :id => 4412},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4396, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1294 => {
      :price => 57600,
      :after => {:kind => :W, :id => 4438},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4422, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1295 => {
      :price => 57600,
      :after => {:kind => :W, :id => 4439},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4423, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1296 => {
      :price => 44100,
      :after => {:kind => :W, :id => 4462},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4451, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1297 => {
      :price => 44100,
      :after => {:kind => :W, :id => 4463},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4452, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1298 => {
      :price => 50400,
      :after => {:kind => :W, :id => 4489},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4475, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1299 => {
      :price => 50400,
      :after => {:kind => :W, :id => 4490},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4476, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1300 => {
      :price => 50400,
      :after => {:kind => :W, :id => 4522},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4505, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1301 => {
      :price => 50400,
      :after => {:kind => :W, :id => 4523},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4506, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1302 => {
      :price => 50400,
      :after => {:kind => :W, :id => 4549},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4535, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1303 => {
      :price => 50400,
      :after => {:kind => :W, :id => 4550},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4536, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1304 => {
      :price => 57600,
      :after => {:kind => :W, :id => 4582},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4563, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1305 => {
      :price => 57600,
      :after => {:kind => :W, :id => 4583},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4564, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1306 => {
      :price => 55800,
      :after => {:kind => :W, :id => 4630},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4617, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1307 => {
      :price => 55800,
      :after => {:kind => :W, :id => 4631},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4618, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1308 => {
      :price => 68400,
      :after => {:kind => :W, :id => 4651},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 721, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1309 => {
      :price => 45000,
      :after => {:kind => :W, :id => 4681},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4669, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1310 => {
      :price => 45000,
      :after => {:kind => :W, :id => 4682},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4670, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1311 => {
      :price => 85000,
      :after => {:kind => :W, :id => 4836},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4822, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1312 => {
      :price => 85000,
      :after => {:kind => :W, :id => 4835},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4823, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1313 => {
      :price => 44000,
      :after => {:kind => :A, :id => 520},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 507, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1314 => {
      :price => 36000,
      :after => {:kind => :A, :id => 521},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 494, :num => 1},
        {:kind => :A, :id => 508, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1315 => {
      :price => 27000,
      :after => {:kind => :A, :id => 738},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 727, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1316 => {
      :price => 27000,
      :after => {:kind => :A, :id => 739},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 714, :num => 1},
        {:kind => :A, :id => 728, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1317 => {
      :price => 38000,
      :after => {:kind => :A, :id => 910},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 885, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1318 => {
      :price => 38000,
      :after => {:kind => :A, :id => 911},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 877, :num => 1},
        {:kind => :A, :id => 897, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1319 => {
      :price => 44400,
      :after => {:kind => :W, :id => 4107},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4097, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1320 => {
      :price => 60000,
      :after => {:kind => :W, :id => 4160},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4141, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1321 => {
      :price => 70000,
      :after => {:kind => :W, :id => 4181},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4177, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1322 => {
      :price => 63000,
      :after => {:kind => :W, :id => 4232},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 185, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1323 => {
      :price => 70000,
      :after => {:kind => :W, :id => 4275},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4266, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1324 => {
      :price => 60000,
      :after => {:kind => :W, :id => 4305},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4296, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1325 => {
      :price => 54000,
      :after => {:kind => :W, :id => 4365},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4345, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1326 => {
      :price => 65000,
      :after => {:kind => :W, :id => 4440},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 438, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1327 => {
      :price => 49000,
      :after => {:kind => :W, :id => 4464},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 468, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1328 => {
      :price => 56000,
      :after => {:kind => :W, :id => 4491},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4485, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1329 => {
      :price => 56000,
      :after => {:kind => :W, :id => 4551},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 583, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1330 => {
      :price => 64000,
      :after => {:kind => :W, :id => 4584},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 616, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1331 => {
      :price => 52000,
      :after => {:kind => :W, :id => 4605},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4589, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1332 => {
      :price => 43400,
      :after => {:kind => :W, :id => 4632},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4619, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1333 => {
      :price => 76000,
      :after => {:kind => :W, :id => 4652},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4648, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1334 => {
      :price => 50000,
      :after => {:kind => :W, :id => 4704},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4694, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1335 => {
      :price => 40000,
      :after => {:kind => :W, :id => 4725},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4713, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1336 => {
      :price => 54000,
      :after => {:kind => :W, :id => 4742},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4729, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1337 => {
      :price => 52000,
      :after => {:kind => :W, :id => 4764},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4748, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1338 => {
      :price => 52000,
      :after => {:kind => :W, :id => 4786},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4770, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1339 => {
      :price => 56000,
      :after => {:kind => :W, :id => 4811},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4795, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1340 => {
      :price => 90000,
      :after => {:kind => :W, :id => 4837},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4820, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1341 => {
      :price => 70000,
      :after => {:kind => :W, :id => 4851},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4841, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1342 => {
      :price => 20000,
      :after => {:kind => :A, :id => 414},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 408, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1343 => {
      :price => 24000,
      :after => {:kind => :A, :id => 435},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 425, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1344 => {
      :price => 40000,
      :after => {:kind => :A, :id => 522},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 511, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1345 => {
      :price => 50000,
      :after => {:kind => :W, :id => 4127},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4112, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1346 => {
      :price => 65000,
      :after => {:kind => :W, :id => 4162},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4148, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1347 => {
      :price => 69300,
      :after => {:kind => :W, :id => 4233},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4226, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1348 => {
      :price => 44000,
      :after => {:kind => :A, :id => 523},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 501, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1349 => {
      :price => 30000,
      :after => {:kind => :A, :id => 740},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 720, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1350 => {
      :price => 40000,
      :after => {:kind => :A, :id => 913},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 888, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1351 => {
      :price => 66000,
      :after => {:kind => :W, :id => 4163},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4148, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1352 => {
      :price => 61600,
      :after => {:kind => :W, :id => 4553},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4537, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1353 => {
      :price => 48000,
      :after => {:kind => :A, :id => 524},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 504, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1354 => {
      :price => 47000,
      :after => {:kind => :A, :id => 525},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 493, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1355 => {
      :price => 33000,
      :after => {:kind => :A, :id => 581},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 566, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1356 => {
      :price => 85000,
      :after => {:kind => :A, :id => 646},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 634, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1357 => {
      :price => 84000,
      :after => {:kind => :A, :id => 647},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 645, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1358 => {
      :price => 84000,
      :after => {:kind => :A, :id => 648},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 630, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1359 => {
      :price => 84000,
      :after => {:kind => :A, :id => 649},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 626, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1360 => {
      :price => 36000,
      :after => {:kind => :A, :id => 741},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 724, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1361 => {
      :price => 35000,
      :after => {:kind => :A, :id => 742},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 711, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1362 => {
      :price => 28600,
      :after => {:kind => :A, :id => 779},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 763, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1363 => {
      :price => 45000,
      :after => {:kind => :A, :id => 814},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 801, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1364 => {
      :price => 42000,
      :after => {:kind => :A, :id => 815},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 798, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1365 => {
      :price => 42000,
      :after => {:kind => :A, :id => 816},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 797, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1366 => {
      :price => 42000,
      :after => {:kind => :A, :id => 817},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 794, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1367 => {
      :price => 22000,
      :after => {:kind => :A, :id => 835},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 828, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1368 => {
      :price => 22000,
      :after => {:kind => :A, :id => 836},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 824, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1369 => {
      :price => 30000,
      :after => {:kind => :A, :id => 864},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 849, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1370 => {
      :price => 45000,
      :after => {:kind => :A, :id => 914},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 893, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1371 => {
      :price => 45000,
      :after => {:kind => :A, :id => 915},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 887, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1372 => {
      :price => 44000,
      :after => {:kind => :A, :id => 916},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 904, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1373 => {
      :price => 44000,
      :after => {:kind => :A, :id => 917},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 904, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1374 => {
      :price => 62000,
      :after => {:kind => :W, :id => 4633},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4622, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1375 => {
      :price => 50000,
      :after => {:kind => :W, :id => 4683},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 1375, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1376 => {
      :price => 77000,
      :after => {:kind => :W, :id => 4853},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4334, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1377 => {
      :price => 22200,
      :after => {:kind => :A, :id => 415},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 398, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1378 => {
      :price => 26200,
      :after => {:kind => :A, :id => 436},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 427, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1379 => {
      :price => 48000,
      :after => {:kind => :A, :id => 526},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 500, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1380 => {
      :price => 34000,
      :after => {:kind => :A, :id => 582},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 565, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1381 => {
      :price => 33000,
      :after => {:kind => :A, :id => 583},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 566, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1382 => {
      :price => 33000,
      :after => {:kind => :A, :id => 584},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 561, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1383 => {
      :price => 88000,
      :after => {:kind => :A, :id => 650},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 645, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1384 => {
      :price => 11000,
      :after => {:kind => :A, :id => 682},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 665, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1385 => {
      :price => 36000,
      :after => {:kind => :A, :id => 743},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 712, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1386 => {
      :price => 28600,
      :after => {:kind => :A, :id => 780},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 256, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1387 => {
      :price => 41000,
      :after => {:kind => :A, :id => 818},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 813, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1388 => {
      :price => 41000,
      :after => {:kind => :A, :id => 819},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 793, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1389 => {
      :price => 41000,
      :after => {:kind => :A, :id => 820},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 802, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1390 => {
      :price => 20000,
      :after => {:kind => :A, :id => 837},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 830, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1391 => {
      :price => 21000,
      :after => {:kind => :A, :id => 838},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 824, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1392 => {
      :price => 30000,
      :after => {:kind => :A, :id => 865},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 849, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1393 => {
      :price => 45000,
      :after => {:kind => :A, :id => 918},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 884, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1394 => {
      :price => 62300,
      :after => {:kind => :W, :id => 4554},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4538, :num => 1},
        {:kind => :W, :id => 4544, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1395 => {
      :price => 83600,
      :after => {:kind => :A, :id => 615},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 602, :num => 1},
        {:kind => :A, :id => 608, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1396 => {
      :price => 46000,
      :after => {:kind => :A, :id => 821},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 800, :num => 1},
        {:kind => :A, :id => 806, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1397 => {
      :price => 35000,
      :after => {:kind => :A, :id => 866},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 852, :num => 1},
        {:kind => :A, :id => 857, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1398 => {
      :price => 60500,
      :after => {:kind => :W, :id => 4214},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4197, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1399 => {
      :price => 50600,
      :after => {:kind => :W, :id => 4389},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4373, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1400 => {
      :price => 61600,
      :after => {:kind => :W, :id => 4525},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4507, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1401 => {
      :price => 83600,
      :after => {:kind => :W, :id => 4654},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4636, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1402 => {
      :price => 61600,
      :after => {:kind => :W, :id => 4812},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4801, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1403 => {
      :price => 49000,
      :after => {:kind => :A, :id => 527},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 500, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1404 => {
      :price => 35000,
      :after => {:kind => :A, :id => 585},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 1404, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1405 => {
      :price => 37000,
      :after => {:kind => :A, :id => 744},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 712, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1406 => {
      :price => 30000,
      :after => {:kind => :A, :id => 781},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 764, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1407 => {
      :price => 46000,
      :after => {:kind => :A, :id => 919},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 884, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1408 => {
      :price => 46000,
      :after => {:kind => :A, :id => 920},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 885, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1409 => {
      :price => 62000,
      :after => {:kind => :W, :id => 4215},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4198, :num => 1},
        {:kind => :W, :id => 4207, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1410 => {
      :price => 50000,
      :after => {:kind => :A, :id => 528},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 502, :num => 1},
        {:kind => :A, :id => 513, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1411 => {
      :price => 38200,
      :after => {:kind => :A, :id => 745},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 721, :num => 1},
        {:kind => :A, :id => 732, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1412 => {
      :price => 47000,
      :after => {:kind => :A, :id => 921},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 889, :num => 1},
        {:kind => :A, :id => 901, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1413 => {
      :price => 80000,
      :after => {:kind => :W, :id => 4128},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4118, :num => 1},
        {:kind => :W, :id => 4127, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1414 => {
      :price => 66000,
      :after => {:kind => :W, :id => 4164},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4148, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1415 => {
      :price => 77000,
      :after => {:kind => :W, :id => 4182},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4178, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1416 => {
      :price => 80000,
      :after => {:kind => :W, :id => 4183},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4174, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1417 => {
      :price => 60000,
      :after => {:kind => :W, :id => 4366},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4361, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1418 => {
      :price => 70400,
      :after => {:kind => :W, :id => 4442},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4417, :num => 1},
        {:kind => :W, :id => 4436, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1419 => {
      :price => 53900,
      :after => {:kind => :W, :id => 4466},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 470, :num => 1},
        {:kind => :W, :id => 4450, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1420 => {
      :price => 54200,
      :after => {:kind => :W, :id => 4467},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 468, :num => 1},
        {:kind => :W, :id => 4460, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1425 => {
      :price => 41800,
      :after => {:kind => :A, :id => 486},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 485, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1426 => {
      :price => 48000,
      :after => {:kind => :A, :id => 529},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 502, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1427 => {
      :price => 49000,
      :after => {:kind => :A, :id => 530},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 501, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1428 => {
      :price => 50000,
      :after => {:kind => :A, :id => 531},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 501, :num => 1},
        {:kind => :A, :id => 503, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1429 => {
      :price => 35000,
      :after => {:kind => :A, :id => 586},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 580, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1430 => {
      :price => 36000,
      :after => {:kind => :A, :id => 587},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 580, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1431 => {
      :price => 36000,
      :after => {:kind => :A, :id => 588},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 580, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1432 => {
      :price => 36000,
      :after => {:kind => :A, :id => 589},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 580, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1433 => {
      :price => 11500,
      :after => {:kind => :A, :id => 683},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 680, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1434 => {
      :price => 11500,
      :after => {:kind => :A, :id => 684},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 681, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1435 => {
      :price => 28600,
      :after => {:kind => :A, :id => 706},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 705, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1436 => {
      :price => 38000,
      :after => {:kind => :A, :id => 746},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 721, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1437 => {
      :price => 38000,
      :after => {:kind => :A, :id => 747},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 720, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1438 => {
      :price => 40000,
      :after => {:kind => :A, :id => 748},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 720, :num => 1},
        {:kind => :A, :id => 723, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1439 => {
      :price => 32000,
      :after => {:kind => :A, :id => 782},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 777, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1440 => {
      :price => 46000,
      :after => {:kind => :A, :id => 822},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 721, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1441 => {
      :price => 36000,
      :after => {:kind => :A, :id => 867},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 863, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1442 => {
      :price => 36000,
      :after => {:kind => :A, :id => 868},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 863, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1443 => {
      :price => 36000,
      :after => {:kind => :A, :id => 869},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 863, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1444 => {
      :price => 36000,
      :after => {:kind => :A, :id => 870},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 863, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1445 => {
      :price => 47000,
      :after => {:kind => :A, :id => 922},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 889, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1446 => {
      :price => 48000,
      :after => {:kind => :A, :id => 923},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 888, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1447 => {
      :price => 50000,
      :after => {:kind => :A, :id => 924},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 891, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1448 => {
      :price => 60500,
      :after => {:kind => :W, :id => 4252},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4247, :num => 1},
        {:kind => :I, :id => 2, :num => 1},
      ],
    },
    1451 => { # 炎耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3141},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
      ],
    },
    1452 => { # 氷耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3147},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 57, :num => 1},
      ],
    },
    1453 => { # 雷耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3153},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 61, :num => 1},
      ],
    },
    1454 => { # 風耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3159},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
      ],
    },
    1455 => { # 土耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3165},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
      ],
    },
    1456 => { # 水耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3171},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    1457 => { # 聖耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3177},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 77, :num => 1},
      ],
    },
    1458 => { # 闇耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3183},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 81, :num => 1},
      ],
    },
    1459 => { # 音波耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3189},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 17, :num => 3},
      ],
    },
    1460 => { # バイオ耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3195},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 13, :num => 3},
      ],
    },
    1461 => { # 剣士のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3728},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 111, :num => 1},
      ],
    },
    1462 => { # 竜騎士のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3734},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 232, :num => 1},
      ],
    },
    1463 => { # フェンサーのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3740},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 166, :num => 1},
      ],
    },
    1464 => { # 重戦士のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3746},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 390, :num => 1},
      ],
    },
    1465 => { # 侍のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3752},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 262, :num => 1},
      ],
    },
    1466 => { # 武道家のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3758},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 321, :num => 1},
      ],
    },
    1467 => { # 盾騎士のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3764},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :A, :id => 318, :num => 1},
      ],
    },
    1468 => { # 魔物使いのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3770},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 611, :num => 1},
      ],
    },
    1469 => { # バトルマスターのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3776},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 111, :num => 2},
      ],
    },
    1470 => { # 黒魔道士のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3782},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 539, :num => 1},
      ],
    },
    1471 => { # 時魔道士のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3788},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 539, :num => 1},
      ],
    },
    1472 => { # 白魔道士のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3794},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 497, :num => 1},
      ],
    },
    1473 => { # 召喚士のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3800},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 539, :num => 1},
      ],
    },
    1474 => { # 陰陽師のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3806},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 539, :num => 1},
      ],
    },
    1475 => { # 狩人のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3812},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 578, :num => 1},
      ],
    },
    1476 => { # ガンナーのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3818},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 909, :num => 1},
      ],
    },
    1477 => { # シーフのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3824},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 33, :num => 1},
      ],
    },
    1478 => { # 忍者のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3830},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 281, :num => 1},
      ],
    },
    1479 => { # 踊り子のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3836},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 746, :num => 1},
      ],
    },
    1480 => { # 吟遊詩人のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3842},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 649, :num => 1},
      ],
    },
    1481 => { # 娼婦のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3848},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :A, :id => 172, :num => 1},
      ],
    },
    1482 => { # サイコソルジャーための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3854},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :A, :id => 172, :num => 1},
      ],
    },
    1483 => { # 魔導学者のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3860},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 4788, :num => 1},
      ],
    },
    1484 => { # 錬金術士のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3866},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 4788, :num => 1},
      ],
    },
    1485 => { # 魔導司書のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3872},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 4788, :num => 1},
      ],
    },
    1486 => { # 技師のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3878},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 909, :num => 1},
      ],
    },
    1487 => { # 魔芸師のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3884},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 463, :num => 1},
      ],
    },
    1488 => { # 商人のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3890},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 789, :num => 1},
      ],
    },
    1489 => { # ギャンブラーのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3896},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 837, :num => 1},
      ],
    },
    1490 => { # 話術士のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3902},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 689, :num => 1},
      ],
    },
    1491 => { # 料理人のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3908},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 768, :num => 1},
      ],
    },
    1492 => { # 医者のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3914},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 815, :num => 1},
      ],
    },
    1493 => { # メイドのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3920},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 862, :num => 1},
      ],
    },
    1494 => { # 海賊のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3926},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 136, :num => 1},
      ],
    },
    1495 => { # 妖術師のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3956},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 539, :num => 1},
      ],
    },
    1496 => { # 炎属性強化の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2863},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
      ],
    },
    1497 => { # 氷属性強化の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2868},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 57, :num => 1},
      ],
    },
    1498 => { # 雷属性強化の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2873},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 61, :num => 1},
      ],
    },
    1499 => { # 風属性強化の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2878},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 65, :num => 1},
      ],
    },
    1500 => { # 土属性強化の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2883},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 69, :num => 1},
      ],
    },
    1501 => { # 水属性強化の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2888},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 73, :num => 1},
      ],
    },
    1502 => { # 聖属性強化の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2893},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 77, :num => 1},
      ],
    },
    1503 => { # 闇属性強化の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2898},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 81, :num => 1},
      ],
    },
    1504 => { # 音波属性強化の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2903},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 17, :num => 3},
      ],
    },
    1505 => { # バイオ属性強化の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2908},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 13, :num => 3},
      ],
    },
    1506 => { # 回復属性強化の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2913},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 3, :num => 1},
      ],
    },
    1507 => { # 人間特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2189},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 109, :num => 1},
      ],
    },
    1508 => { # 妖魔特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2193},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 243, :num => 1},
      ],
    },
    1509 => { # 亜人特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2197},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 260, :num => 1},
      ],
    },
    1510 => { # 淫魔特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2201},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    1511 => { # 吸血鬼特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2205},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 224, :num => 1},
      ],
    },
    1512 => { # 人魚特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2209},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 204, :num => 1},
      ],
    },
    1513 => { # エルフ特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2213},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 230, :num => 1},
      ],
    },
    1514 => { # 妖精特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2217},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 229, :num => 1},
      ],
    },
    1515 => { # スライム特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2221},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 218, :num => 1},
      ],
    },
    1516 => { # 魔獣特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2225},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 244, :num => 1},
      ],
    },
    1517 => { # 妖狐特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2229},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 242, :num => 1},
      ],
    },
    1518 => { # ラミア特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2233},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 245, :num => 1},
      ],
    },
    1519 => { # スキュラ特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2237},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 255, :num => 1},
      ],
    },
    1520 => { # ハーピー特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2241},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 227, :num => 1},
      ],
    },
    1521 => { # 竜特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2245},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 247, :num => 1},
      ],
    },
    1522 => { # 陸棲種特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2249},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 194, :num => 1},
      ],
    },
    1523 => { # 海棲種特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2253},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 226, :num => 1},
      ],
    },
    1524 => { # 虫特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2257},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 261, :num => 1},
      ],
    },
    1525 => { # 植物特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2261},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    1526 => { # ゾンビ特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2265},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 221, :num => 1},
      ],
    },
    1527 => { # ゴースト特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2269},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 185, :num => 1},
      ],
    },
    1528 => { # ドール特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2273},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 233, :num => 1},
      ],
    },
    1529 => { # キメラ特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2277},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 240, :num => 1},
      ],
    },
    1530 => { # 天使特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2281},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 252, :num => 1},
      ],
    },
    1531 => { # 巨人特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2285},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 228, :num => 1},
      ],
    },
    1532 => { # ロイド特攻の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2165},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 233, :num => 1},
      ],
    },
    1533 => { # 炎耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3142},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3141, :num => 2},
      ],
    },
    1534 => { # 氷耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3148},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3147, :num => 2},
      ],
    },
    1535 => { # 雷耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3154},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3153, :num => 2},
      ],
    },
    1536 => { # 風耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3160},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3159, :num => 2},
      ],
    },
    1537 => { # 土耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3166},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3165, :num => 2},
      ],
    },
    1538 => { # 水耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3172},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3171, :num => 2},
      ],
    },
    1539 => { # 聖耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3178},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3177, :num => 2},
      ],
    },
    1540 => { # 闇耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3184},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3183, :num => 2},
      ],
    },
    1541 => { # 音波耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3190},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3189, :num => 2},
      ],
    },
    1542 => { # バイオ耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3196},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3195, :num => 2},
      ],
    },
    1543 => { # 炎属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2864},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2863, :num => 2},
      ],
    },
    1544 => { # 氷属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2869},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2868, :num => 2},
      ],
    },
    1545 => { # 雷属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2874},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2873, :num => 2},
      ],
    },
    1546 => { # 風属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2879},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2878, :num => 2},
      ],
    },
    1547 => { # 土属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2884},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2883, :num => 2},
      ],
    },
    1548 => { # 水属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2889},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2888, :num => 2},
      ],
    },
    1549 => { # 聖属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2894},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2893, :num => 2},
      ],
    },
    1550 => { # 闇属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2899},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2898, :num => 2},
      ],
    },
    1551 => { # 音波属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2904},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2903, :num => 2},
      ],
    },
    1552 => { # バイオ属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2909},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2908, :num => 2},
      ],
    },
    1553 => { # 回復属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2914},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2913, :num => 2},
      ],
    },
    1554 => { # 人間特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2190},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2189, :num => 2},
      ],
    },
    1555 => { # 妖魔特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2194},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2193, :num => 2},
      ],
    },
    1556 => { # 亜人特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2198},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2197, :num => 2},
      ],
    },
    1557 => { # 淫魔特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2202},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2201, :num => 2},
      ],
    },
    1558 => { # 吸血鬼特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2206},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2205, :num => 2},
      ],
    },
    1559 => { # 人魚特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2210},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2209, :num => 2},
      ],
    },
    1560 => { # エルフ特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2214},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2213, :num => 2},
      ],
    },
    1561 => { # 妖精特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2218},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2217, :num => 2},
      ],
    },
    1562 => { # スライム特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2222},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2221, :num => 2},
      ],
    },
    1563 => { # 魔獣特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2226},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2225, :num => 2},
      ],
    },
    1564 => { # 妖狐特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2230},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2229, :num => 2},
      ],
    },
    1565 => { # ラミア特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2234},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2233, :num => 2},
      ],
    },
    1566 => { # スキュラ特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2238},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2237, :num => 2},
      ],
    },
    1567 => { # ハーピー特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2242},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2241, :num => 2},
      ],
    },
    1568 => { # 竜特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2246},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2245, :num => 2},
      ],
    },
    1569 => { # 陸棲種特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2250},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2249, :num => 2},
      ],
    },
    1570 => { # 海棲種特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2254},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2253, :num => 2},
      ],
    },
    1571 => { # 虫特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2258},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2257, :num => 2},
      ],
    },
    1572 => { # 植物特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2262},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2261, :num => 2},
      ],
    },
    1573 => { # ゾンビ特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2266},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2265, :num => 2},
      ],
    },
    1574 => { # ゴースト特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2270},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2269, :num => 2},
      ],
    },
    1575 => { # ドール特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2274},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2273, :num => 2},
      ],
    },
    1576 => { # キメラ特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2278},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2277, :num => 2},
      ],
    },
    1577 => { # 天使特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2282},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2281, :num => 2},
      ],
    },
    1578 => { # 巨人特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2286},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2285, :num => 2},
      ],
    },
    1579 => { # ロイド特攻の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2166},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2165, :num => 2},
      ],
    },
    1580 => { # 剣士のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3729},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3728, :num => 2},
      ],
    },
    1581 => { # 竜騎士のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3735},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3734, :num => 2},
      ],
    },
    1582 => { # フェンサーのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3741},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3740, :num => 2},
      ],
    },
    1583 => { # 重戦士のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3747},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3746, :num => 2},
      ],
    },
    1584 => { # 侍のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3753},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3752, :num => 2},
      ],
    },
    1585 => { # 武道家のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3759},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3758, :num => 2},
      ],
    },
    1586 => { # 盾騎士のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3765},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3764, :num => 2},
      ],
    },
    1587 => { # 魔物使いのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3771},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3770, :num => 2},
      ],
    },
    1588 => { # バトルマスターのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3777},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3776, :num => 2},
      ],
    },
    1589 => { # 黒魔道士のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3783},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3782, :num => 2},
      ],
    },
    1590 => { # 時魔道士のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3789},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3788, :num => 2},
      ],
    },
    1591 => { # 白魔道士のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3795},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3794, :num => 2},
      ],
    },
    1592 => { # 召喚士のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3801},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3800, :num => 2},
      ],
    },
    1593 => { # 陰陽師のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3807},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3806, :num => 2},
      ],
    },
    1594 => { # 狩人のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3813},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3812, :num => 2},
      ],
    },
    1595 => { # ガンナーのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3819},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3818, :num => 2},
      ],
    },
    1596 => { # シーフのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3825},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3824, :num => 2},
      ],
    },
    1597 => { # 忍者のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3831},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3830, :num => 2},
      ],
    },
    1598 => { # 踊り子のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3837},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3836, :num => 2},
      ],
    },
    1599 => { # 吟遊詩人のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3843},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3842, :num => 2},
      ],
    },
    1600 => { # 娼婦のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3849},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3848, :num => 2},
      ],
    },
    1601 => { # サイコソルジャーためのの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3855},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3854, :num => 2},
      ],
    },
    1602 => { # 魔導学者のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3861},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3860, :num => 2},
      ],
    },
    1603 => { # 錬金術士のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3867},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3866, :num => 2},
      ],
    },
    1604 => { # 魔導司書のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3873},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3872, :num => 2},
      ],
    },
    1605 => { # 技師のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3879},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3878, :num => 2},
      ],
    },
    1606 => { # 魔芸師のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3885},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3884, :num => 2},
      ],
    },
    1607 => { # 商人のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3891},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3890, :num => 2},
      ],
    },
    1608 => { # ギャンブラーのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3897},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3896, :num => 2},
      ],
    },
    1609 => { # 話術士のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3903},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3902, :num => 2},
      ],
    },
    1610 => { # 料理人のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3909},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3908, :num => 2},
      ],
    },
    1611 => { # 医者のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3915},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3914, :num => 2},
      ],
    },
    1612 => { # メイドのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3921},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3920, :num => 2},
      ],
    },
    1613 => { # 海賊のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3927},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3926, :num => 2},
      ],
    },
    1614 => { # 妖術師のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3957},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3956, :num => 2},
      ],
    },
    1615 => { # 即死耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3221},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 12, :num => 1},
      ],
    },
    1616 => { # 昇天耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3223},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 12, :num => 1},
      ],
    },
    1617 => { # 絶頂耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3225},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 12, :num => 1},
      ],
    },
    1618 => { # 毒耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3230},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 13, :num => 3},
      ],
    },
    1619 => { # 暗闇耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3232},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 14, :num => 3},
      ],
    },
    1620 => { # 沈黙耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3234},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 15, :num => 3},
      ],
    },
    1621 => { # 混乱耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3236},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 16, :num => 3},
      ],
    },
    1622 => { # 睡眠耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3238},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 16, :num => 3},
      ],
    },
    1623 => { # 麻痺耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3240},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 17, :num => 3},
      ],
    },
    1624 => { # バーン耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3242},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 22, :num => 3},
      ],
    },
    1625 => { # フリーズ耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3244},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 22, :num => 3},
      ],
    },
    1626 => { # ショック耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3246},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 22, :num => 3},
      ],
    },
    1627 => { # スロウ耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3248},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 4, :num => 3},
      ],
    },
    1628 => { # ストップ耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3250},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 4, :num => 3},
      ],
    },
    1629 => { # ミニマム耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3252},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 18, :num => 3},
      ],
    },
    1630 => { # ゾンビ耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3254},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 19, :num => 3},
      ],
    },
    1631 => { # 石化耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3256},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 20, :num => 3},
      ],
    },
    1632 => { # 消化耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3258},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 22, :num => 3},
      ],
    },
    1633 => { # スタン耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3260},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 8, :num => 2},
      ],
    },
    1634 => { # ヌルヌル耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3262},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 21, :num => 3},
      ],
    },
    1635 => { # 敏感耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3264},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 21, :num => 3},
      ],
    },
    1636 => { # 恍惚耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3266},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 21, :num => 3},
      ],
    },
    1637 => { # 誘惑耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3268},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 21, :num => 3},
      ],
    },
    1638 => { # 失禁耐性の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3270},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 21, :num => 3},
      ],
    },
    1639 => { # 即死付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2527},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 224, :num => 1},
      ],
    },
    1640 => { # 昇天付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2532},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 249, :num => 1},
      ],
    },
    1641 => { # 絶頂付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2537},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    1642 => { # 毒付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2542},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 217, :num => 1},
      ],
    },
    1643 => { # 暗闇付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2547},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 238, :num => 1},
      ],
    },
    1644 => { # 沈黙付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2552},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 230, :num => 1},
      ],
    },
    1645 => { # 混乱付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2557},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 205, :num => 1},
      ],
    },
    1646 => { # 睡眠付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2562},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 229, :num => 1},
      ],
    },
    1647 => { # 麻痺付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2567},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 261, :num => 1},
      ],
    },
    1648 => { # バーン付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2572},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 53, :num => 1},
      ],
    },
    1649 => { # フリーズ付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2577},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 57, :num => 1},
      ],
    },
    1650 => { # ショック付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2582},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 61, :num => 1},
      ],
    },
    1651 => { # スロウ付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2587},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 200, :num => 1},
      ],
    },
    1652 => { # ストップ付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2592},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 200, :num => 1},
      ],
    },
    1653 => { # ミニマム付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2597},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 229, :num => 1},
      ],
    },
    1654 => { # ゾンビ付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2602},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 221, :num => 1},
      ],
    },
    1655 => { # 石化付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2607},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 220, :num => 1},
      ],
    },
    1656 => { # 消化付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2612},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 218, :num => 1},
      ],
    },
    1657 => { # スタン付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2617},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 245, :num => 1},
      ],
    },
    1658 => { # ヌルヌル付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2622},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 165, :num => 1},
      ],
    },
    1659 => { # 敏感付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2627},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    1660 => { # 恍惚付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2632},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    1661 => { # 誘惑付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2637},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    1662 => { # 失禁付加の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2642},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    1663 => { # ワームサマナーのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3968},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 109, :num => 1},
      ],
    },
    1664 => { # 妖魔のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3974},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 243, :num => 1},
      ],
    },
    1665 => { # 妖怪のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3980},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 260, :num => 1},
      ],
    },
    1666 => { # サキュバスのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3986},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 251, :num => 1},
      ],
    },
    1667 => { # 吸血鬼のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3992},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 224, :num => 1},
      ],
    },
    1668 => { # 人魚のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3998},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 204, :num => 1},
      ],
    },
    1669 => { # エルフのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4004},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 230, :num => 1},
      ],
    },
    1670 => { # フェアリーのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4010},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 229, :num => 1},
      ],
    },
    1671 => { # スライムのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4016},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 218, :num => 1},
      ],
    },
    1672 => { # 魔獣のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4022},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 244, :num => 1},
      ],
    },
    1673 => { # 妖狐のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4028},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 242, :num => 1},
      ],
    },
    1674 => { # ラミアのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4034},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 245, :num => 1},
      ],
    },
    1675 => { # スキュラのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4040},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 255, :num => 1},
      ],
    },
    1676 => { # ハーピーのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4046},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 227, :num => 1},
      ],
    },
    1677 => { # ドラゴンのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4052},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 247, :num => 1},
      ],
    },
    1678 => { # 陸棲種のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4058},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 194, :num => 1},
      ],
    },
    1679 => { # 海棲種のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4064},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 226, :num => 1},
      ],
    },
    1680 => { # 妖虫のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4070},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 261, :num => 1},
      ],
    },
    1681 => { # アルラウネのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4076},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    1682 => { # ゾンビのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4082},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 221, :num => 1},
      ],
    },
    1683 => { # ゴーストのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4088},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 185, :num => 1},
      ],
    },
    1684 => { # ドールのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4094},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 233, :num => 1},
      ],
    },
    1685 => { # キメラのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4100},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 240, :num => 1},
      ],
    },
    1686 => { # 天使のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4106},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 252, :num => 1},
      ],
    },
    1687 => { # ロイドのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4112},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 233, :num => 1},
      ],
    },
    1688 => { # 巨人のための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4118},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 228, :num => 1},
      ],
    },
    1689 => { # アポトーシスのための秘石
      :price => 1000,
      :after => {:kind => :I, :id => 4124},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 253, :num => 1},
      ],
    },
    1690 => { # 短剣技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2310},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 33, :num => 1},
      ],
    },
    1691 => { # 剣技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2315},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 111, :num => 1},
      ],
    },
    1692 => { # 尖剣技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2320},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 166, :num => 1},
      ],
    },
    1693 => { # 刀技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2325},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 263, :num => 1},
      ],
    },
    1694 => { # 槍技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2330},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 232, :num => 1},
      ],
    },
    1695 => { # 斧技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2335},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 390, :num => 1},
      ],
    },
    1696 => { # 棍技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2340},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 430, :num => 1},
      ],
    },
    1697 => { # 鎌技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2345},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 463, :num => 1},
      ],
    },
    1698 => { # 弓技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2350},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 578, :num => 1},
      ],
    },
    1699 => { # 鞭技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2355},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 611, :num => 1},
      ],
    },
    1700 => { # 投擲技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2360},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 689, :num => 1},
      ],
    },
    1701 => { # 鉄球技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2365},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 718, :num => 1},
      ],
    },
    1702 => { # 扇技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2370},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 746, :num => 1},
      ],
    },
    1703 => { # 銃技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2375},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 909, :num => 1},
      ],
    },
    1704 => { # 多武器技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2380},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 111, :num => 2},
      ],
    },
    1705 => { # 格闘の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2385},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 321, :num => 1},
      ],
    },
    1706 => { # 盗賊技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2647},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 33, :num => 1},
      ],
    },
    1707 => { # 忍術の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2652},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 281, :num => 1},
      ],
    },
    1708 => { # 海賊技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2657},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 136, :num => 1},
      ],
    },
    1709 => { # ヒーロー技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2662},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 321, :num => 1},
      ],
    },
    1710 => { # 商技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2667},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 789, :num => 1},
      ],
    },
    1711 => { # EXアイテムの秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2672},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 789, :num => 1},
      ],
    },
    1712 => { # オラクルの秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2677},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 837, :num => 1},
      ],
    },
    1713 => { # 踊りの秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2682},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 746, :num => 1},
      ],
    },
    1714 => { # 歌の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2687},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 649, :num => 1},
      ],
    },
    1715 => { # 話術の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2692},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 689, :num => 1},
      ],
    },
    1716 => { # マキナの秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2697},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 909, :num => 1},
      ],
    },
    1717 => { # 料理の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2702},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 768, :num => 1},
      ],
    },
    1718 => { # 医術の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2707},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 815, :num => 1},
      ],
    },
    1719 => { # 御奉仕の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2712},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 862, :num => 1},
      ],
    },
    1720 => { # 王技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2717},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :A, :id => 269, :num => 1},
      ],
    },
    1721 => { # 勇者技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2722},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 81, :num => 1},
      ],
    },
    1722 => { # 淫技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2727},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :A, :id => 172, :num => 1},
      ],
    },
    1723 => { # 白魔法の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2918},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 497, :num => 1},
      ],
    },
    1724 => { # 黒魔法の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2923},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 539, :num => 1},
      ],
    },
    1725 => { # 時魔法の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2928},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 539, :num => 1},
      ],
    },
    1726 => { # 召喚の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2933},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 539, :num => 1},
      ],
    },
    1727 => { # 聖技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2938},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 77, :num => 1},
      ],
    },
    1728 => { # 闇技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2943},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 81, :num => 1},
      ],
    },
    1729 => { # 魔法剣の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2948},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 181, :num => 1},
      ],
    },
    1730 => { # 陰陽術の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2953},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 539, :num => 1},
      ],
    },
    1731 => { # 魔導科学の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2958},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 4788, :num => 1},
      ],
    },
    1732 => { # 錬金術の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2963},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 4788, :num => 1},
      ],
    },
    1733 => { # 魔本術の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 2968},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 4788, :num => 1},
      ],
    },
    1734 => { # サイコの秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3009},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :A, :id => 172, :num => 1},
      ],
    },
    1735 => { # 魔技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3444},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 243, :num => 1},
      ],
    },
    1736 => { # 海技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3449},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 204, :num => 1},
      ],
    },
    1737 => { # 粘液技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3454},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 218, :num => 1},
      ],
    },
    1738 => { # 獣技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3459},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 244, :num => 1},
      ],
    },
    1739 => { # 蛇技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3464},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 245, :num => 1},
      ],
    },
    1740 => { # 触手技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3469},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 255, :num => 1},
      ],
    },
    1741 => { # 翼技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3474},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 227, :num => 1},
      ],
    },
    1742 => { # 虫技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3479},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 261, :num => 1},
      ],
    },
    1743 => { # 植物技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3484},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 257, :num => 1},
      ],
    },
    1744 => { # 屍技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3489},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 221, :num => 1},
      ],
    },
    1745 => { # 造技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3494},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 233, :num => 1},
      ],
    },
    1746 => { # 自然感応の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3499},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 229, :num => 1},
      ],
    },
    1747 => { # ブレスの秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3504},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 247, :num => 1},
      ],
    },
    1748 => { # 特技の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3509},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :I, :id => 8, :num => 1},
      ],
    },
    1749 => { # 装備武器の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3514},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 539, :num => 1},
      ],
    },
    1750 => { # 即死付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2528},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2527, :num => 2},
      ],
    },
    1751 => { # 昇天付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2533},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2532, :num => 2},
      ],
    },
    1752 => { # 絶頂付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2538},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2537, :num => 2},
      ],
    },
    1753 => { # 毒付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2543},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2542, :num => 2},
      ],
    },
    1754 => { # 暗闇付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2548},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2547, :num => 2},
      ],
    },
    1755 => { # 沈黙付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2553},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2552, :num => 2},
      ],
    },
    1756 => { # 混乱付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2558},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2557, :num => 2},
      ],
    },
    1757 => { # 睡眠付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2563},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2562, :num => 2},
      ],
    },
    1758 => { # 麻痺付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2568},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2567, :num => 2},
      ],
    },
    1759 => { # バーン付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2573},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2572, :num => 2},
      ],
    },
    1760 => { # フリーズ付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2578},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2577, :num => 2},
      ],
    },
    1761 => { # ショック付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2583},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2582, :num => 2},
      ],
    },
    1762 => { # スロウ付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2588},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2587, :num => 2},
      ],
    },
    1763 => { # ストップ付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2593},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2592, :num => 2},
      ],
    },
    1764 => { # ミニマム付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2598},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2597, :num => 2},
      ],
    },
    1765 => { # ゾンビ付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2603},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2602, :num => 2},
      ],
    },
    1766 => { # 石化付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2608},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2607, :num => 2},
      ],
    },
    1767 => { # 消化付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2613},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2612, :num => 2},
      ],
    },
    1768 => { # スタン付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2618},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2617, :num => 2},
      ],
    },
    1769 => { # ヌルヌル付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2623},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2622, :num => 2},
      ],
    },
    1770 => { # 敏感付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2628},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2627, :num => 2},
      ],
    },
    1771 => { # 恍惚付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2633},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2632, :num => 2},
      ],
    },
    1772 => { # 誘惑付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2638},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2637, :num => 2},
      ],
    },
    1773 => { # 失禁付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2643},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2642, :num => 2},
      ],
    },
    1774 => { # 即死耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3222},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3221, :num => 2},
      ],
    },
    1775 => { # 昇天耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3224},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3223, :num => 2},
      ],
    },
    1776 => { # 絶頂耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3226},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3225, :num => 2},
      ],
    },
    1777 => { # 毒耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3231},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3230, :num => 2},
      ],
    },
    1778 => { # 暗闇耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3233},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3232, :num => 2},
      ],
    },
    1779 => { # 沈黙耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3235},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3234, :num => 2},
      ],
    },
    1780 => { # 混乱耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3237},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3236, :num => 2},
      ],
    },
    1781 => { # 睡眠耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3239},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3238, :num => 2},
      ],
    },
    1782 => { # 麻痺耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3241},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3240, :num => 2},
      ],
    },
    1783 => { # バーン耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3243},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3242, :num => 2},
      ],
    },
    1784 => { # フリーズ耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3245},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3244, :num => 2},
      ],
    },
    1785 => { # ショック耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3247},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3246, :num => 2},
      ],
    },
    1786 => { # スロウ耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3249},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3248, :num => 2},
      ],
    },
    1787 => { # ストップ耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3251},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3250, :num => 2},
      ],
    },
    1788 => { # ミニマム耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3253},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3252, :num => 2},
      ],
    },
    1789 => { # ゾンビ耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3255},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3254, :num => 2},
      ],
    },
    1790 => { # 石化耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3257},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3256, :num => 2},
      ],
    },
    1791 => { # 消化耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3259},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3258, :num => 2},
      ],
    },
    1792 => { # スタン耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3261},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3260, :num => 2},
      ],
    },
    1793 => { # ヌルヌル耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3263},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3262, :num => 2},
      ],
    },
    1794 => { # 敏感耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3265},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3264, :num => 2},
      ],
    },
    1795 => { # 恍惚耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3267},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3266, :num => 2},
      ],
    },
    1796 => { # 誘惑耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3269},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3268, :num => 2},
      ],
    },
    1797 => { # 失禁耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3271},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3270, :num => 2},
      ],
    },
    1798 => { # 短剣技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2311},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2310, :num => 2},
      ],
    },
    1799 => { # 剣技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2316},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2315, :num => 2},
      ],
    },
    1800 => { # 尖剣技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2321},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2320, :num => 2},
      ],
    },
    1801 => { # 刀技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2326},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2325, :num => 2},
      ],
    },
    1802 => { # 槍技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2331},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2330, :num => 2},
      ],
    },
    1803 => { # 斧技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2336},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2335, :num => 2},
      ],
    },
    1804 => { # 棍技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2341},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2340, :num => 2},
      ],
    },
    1805 => { # 鎌技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2346},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2345, :num => 2},
      ],
    },
    1806 => { # 弓技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2351},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2350, :num => 2},
      ],
    },
    1807 => { # 鞭技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2356},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2355, :num => 2},
      ],
    },
    1808 => { # 投擲技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2361},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2360, :num => 2},
      ],
    },
    1809 => { # 鉄球技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2366},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2365, :num => 2},
      ],
    },
    1810 => { # 扇技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2371},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2370, :num => 2},
      ],
    },
    1811 => { # 銃技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2376},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2375, :num => 2},
      ],
    },
    1812 => { # 多武器技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2381},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2380, :num => 2},
      ],
    },
    1813 => { # 格闘の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2386},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2385, :num => 2},
      ],
    },
    1814 => { # 盗賊技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2648},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2647, :num => 2},
      ],
    },
    1815 => { # 忍術の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2653},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2652, :num => 2},
      ],
    },
    1816 => { # 海賊技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2658},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2657, :num => 2},
      ],
    },
    1817 => { # ヒーロー技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2663},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2662, :num => 2},
      ],
    },
    1818 => { # 商技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2668},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2667, :num => 2},
      ],
    },
    1819 => { # EXアイテムの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2673},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2672, :num => 2},
      ],
    },
    1820 => { # オラクルの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2678},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2677, :num => 2},
      ],
    },
    1821 => { # 踊りの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2683},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2682, :num => 2},
      ],
    },
    1822 => { # 歌の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2688},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2687, :num => 2},
      ],
    },
    1823 => { # 話術の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2693},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2692, :num => 2},
      ],
    },
    1824 => { # マキナの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2698},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2697, :num => 2},
      ],
    },
    1825 => { # 料理の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2703},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2702, :num => 2},
      ],
    },
    1826 => { # 医術の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2708},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2707, :num => 2},
      ],
    },
    1827 => { # 御奉仕の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2713},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2712, :num => 2},
      ],
    },
    1828 => { # 王技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2718},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2717, :num => 2},
      ],
    },
    1829 => { # 勇者技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2723},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2722, :num => 2},
      ],
    },
    1830 => { # 淫技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2728},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2727, :num => 2},
      ],
    },
    1831 => { # 白魔法の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2919},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2918, :num => 2},
      ],
    },
    1832 => { # 黒魔法の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2924},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2923, :num => 2},
      ],
    },
    1833 => { # 時魔法の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2929},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2928, :num => 2},
      ],
    },
    1834 => { # 召喚の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2934},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2933, :num => 2},
      ],
    },
    1835 => { # 聖技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2939},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2938, :num => 2},
      ],
    },
    1836 => { # 闇技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2944},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2943, :num => 2},
      ],
    },
    1837 => { # 魔法剣の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2949},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2948, :num => 2},
      ],
    },
    1838 => { # 陰陽術の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2954},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2953, :num => 2},
      ],
    },
    1839 => { # 魔導科学の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2959},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2958, :num => 2},
      ],
    },
    1840 => { # 錬金術の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2964},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2963, :num => 2},
      ],
    },
    1841 => { # 魔本術の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2969},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2968, :num => 2},
      ],
    },
    1842 => { # サイコの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3010},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3009, :num => 2},
      ],
    },
    1843 => { # 魔技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3445},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3444, :num => 2},
      ],
    },
    1844 => { # 海技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3450},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3449, :num => 2},
      ],
    },
    1845 => { # 粘液技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3455},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3454, :num => 2},
      ],
    },
    1846 => { # 獣技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3460},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3459, :num => 2},
      ],
    },
    1847 => { # 蛇技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3465},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3464, :num => 2},
      ],
    },
    1848 => { # 触手技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3470},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3469, :num => 2},
      ],
    },
    1849 => { # 翼技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3475},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3474, :num => 2},
      ],
    },
    1850 => { # 虫技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3480},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3479, :num => 2},
      ],
    },
    1851 => { # 植物技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3485},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3484, :num => 2},
      ],
    },
    1852 => { # 屍技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3490},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3489, :num => 2},
      ],
    },
    1853 => { # 造技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3495},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3494, :num => 2},
      ],
    },
    1854 => { # 自然感応の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3500},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3499, :num => 2},
      ],
    },
    1855 => { # ブレスの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3505},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3504, :num => 2},
      ],
    },
    1856 => { # 特技の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3510},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3509, :num => 2},
      ],
    },
    1857 => { # 装備武器の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3515},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3514, :num => 2},
      ],
    },
    1858 => { # ワームサマナーのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3969},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3968, :num => 2},
      ],
    },
    1859 => { # 妖魔のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3975},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3974, :num => 2},
      ],
    },
    1860 => { # 妖怪のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3981},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3980, :num => 2},
      ],
    },
    1861 => { # サキュバスのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3987},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3986, :num => 2},
      ],
    },
    1862 => { # 吸血鬼のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3993},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3992, :num => 2},
      ],
    },
    1863 => { # 人魚のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3999},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3998, :num => 2},
      ],
    },
    1864 => { # エルフのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4005},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4004, :num => 2},
      ],
    },
    1865 => { # フェアリーのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4011},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4010, :num => 2},
      ],
    },
    1866 => { # スライムのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4017},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4016, :num => 2},
      ],
    },
    1867 => { # 魔獣のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4023},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4022, :num => 2},
      ],
    },
    1868 => { # 妖狐のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4029},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4028, :num => 2},
      ],
    },
    1869 => { # ラミアのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4035},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4034, :num => 2},
      ],
    },
    1870 => { # スキュラのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4041},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4040, :num => 2},
      ],
    },
    1871 => { # ハーピーのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4047},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4046, :num => 2},
      ],
    },
    1872 => { # ドラゴンのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4053},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4052, :num => 2},
      ],
    },
    1873 => { # 陸棲種のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4059},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4058, :num => 2},
      ],
    },
    1874 => { # 海棲種のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4065},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4064, :num => 2},
      ],
    },
    1875 => { # 妖虫のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4071},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4070, :num => 2},
      ],
    },
    1876 => { # アルラウネのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4077},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4076, :num => 2},
      ],
    },
    1877 => { # ゾンビのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4083},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4082, :num => 2},
      ],
    },
    1878 => { # ゴーストのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4089},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4088, :num => 2},
      ],
    },
    1879 => { # ドールのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4095},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4094, :num => 2},
      ],
    },
    1880 => { # キメラのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4101},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4100, :num => 2},
      ],
    },
    1881 => { # 天使のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4107},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4106, :num => 2},
      ],
    },
    1882 => { # ロイドのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4113},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4112, :num => 2},
      ],
    },
    1883 => { # 巨人のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4119},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4118, :num => 2},
      ],
    },
    1884 => { # アポトーシスのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4125},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4124, :num => 2},
      ],
    },
    1885 => { # 炎属性付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2289},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 53, :num => 3},
      ],
    },
    1886 => { # 氷属性付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2290},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 57, :num => 3},
      ],
    },
    1887 => { # 雷属性付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2291},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 61, :num => 3},
      ],
    },
    1888 => { # 風属性付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2292},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 65, :num => 3},
      ],
    },
    1889 => { # 土属性付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2293},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 69, :num => 3},
      ],
    },
    1890 => { # 水属性付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2294},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 73, :num => 3},
      ],
    },
    1891 => { # 聖属性付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2295},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 77, :num => 3},
      ],
    },
    1892 => { # 闇属性付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2296},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 81, :num => 3},
      ],
    },
    1893 => { # 音波属性付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2297},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 17, :num => 5},
      ],
    },
    1894 => { # バイオ属性付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2298},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 13, :num => 5},
      ],
    },
    1895 => { # 快楽属性付加の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2299},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 266, :num => 5},
      ],
    },
    1896 => { # HPの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2102},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2101, :num => 2},
      ],
    },
    1897 => { # MPの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2834},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2833, :num => 2},
      ],
    },
    1898 => { # SPの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2490},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2489, :num => 2},
      ],
    },
    1899 => { # 力の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2112},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2111, :num => 2},
      ],
    },
    1900 => { # 魔力の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2844},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2843, :num => 2},
      ],
    },
    1901 => { # 守りの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3058},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3057, :num => 2},
      ],
    },
    1902 => { # 精神の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3068},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3067, :num => 2},
      ],
    },
    1903 => { # 素早さの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2500},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2499, :num => 2},
      ],
    },
    1904 => { # 器用さの大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2510},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2509, :num => 2},
      ],
    },
    1905 => { # 妖術の秘石
      :price => 1000,
      :after => {:kind => :I, :id => 3568},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 91, :num => 1},
        {:kind => :W, :id => 467, :num => 1},
      ],
    },
    1906 => { # 妖術の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3569},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3568, :num => 2},
      ],
    },
    1907 => { # 王のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3933},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3932, :num => 2},
      ],
    },
    1908 => { # 勇者のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3939},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3938, :num => 2},
      ],
    },
    1909 => { # ヒーローのための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3945},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3944, :num => 2},
      ],
    },
    1910 => { # 魔法少女のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3951},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3950, :num => 2},
      ],
    },
    1911 => { # 魔神のための大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3963},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3962, :num => 2},
      ],
    },
    1912 => { # 物理耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3130},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3129, :num => 2},
      ],
    },
    1913 => { # 快楽耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 3136},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3135, :num => 2},
      ],
    },
    1914 => { # 核熱耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4282},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3142, :num => 2},
      ],
    },
    1915 => { # 量子耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4288},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3148, :num => 2},
      ],
    },
    1916 => { # イオン耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4294},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3154, :num => 2},
      ],
    },
    1917 => { # ハドロン耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4300},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3160, :num => 2},
      ],
    },
    1918 => { # テラ耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4306},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3166, :num => 2},
      ],
    },
    1919 => { # ナノ耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4312},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3172, :num => 2},
      ],
    },
    1920 => { # 永劫耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4318},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3178, :num => 2},
      ],
    },
    1921 => { # 終焉耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4324},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3184, :num => 2},
      ],
    },
    1922 => { # 銀河耐性の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4264},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 3178, :num => 1},
        {:kind => :I, :id => 3184, :num => 1},
      ],
    },
    1923 => { # 物理強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2301},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2300, :num => 2},
      ],
    },
    1924 => { # 快楽強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 2859},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2858, :num => 2},
      ],
    },
    1925 => { # 核熱強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4202},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2864, :num => 2},
      ],
    },
    1926 => { # 量子強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4207},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2869, :num => 2},
      ],
    },
    1927 => { # イオン強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4212},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2874, :num => 2},
      ],
    },
    1928 => { # ハドロン強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4217},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2879, :num => 2},
      ],
    },
    1929 => { # テラ強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4222},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2884, :num => 2},
      ],
    },
    1930 => { # ナノ強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4227},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2889, :num => 2},
      ],
    },
    1931 => { # 永劫強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4232},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2894, :num => 2},
      ],
    },
    1932 => { # 終焉強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4237},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2899, :num => 2},
      ],
    },
    1933 => { # 銀河強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4187},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2894, :num => 1},
        {:kind => :I, :id => 2899, :num => 1},
      ],
    },
    1934 => { # 無属性強化の大秘石
      :price => 3000,
      :after => {:kind => :I, :id => 4183},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4182, :num => 2},
      ],
    },
    2000 => { # 熱風剣ドラグネスウィンド
      :price => 19500,
      :after => {:kind => :W, :id => 4091},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 40, :num => 1},
        {:kind => :I, :id => 821, :num => 1},
      ],
    },
    2001 => { # アークエンハンス
      :price => 22000,
      :after => {:kind => :W, :id => 4120},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 79, :num => 1},
        {:kind => :I, :id => 825, :num => 1},
      ],
    },
    2002 => { # アロンダイトディフェンダー
      :price => 24000,
      :after => {:kind => :W, :id => 4142},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 113, :num => 1},
        {:kind => :W, :id => 122, :num => 1},
        {:kind => :I, :id => 824, :num => 1},
      ],
    },
    2003 => { # ソレイユ
      :price => 23000,
      :after => {:kind => :W, :id => 4200},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 175, :num => 1},
        {:kind => :I, :id => 824, :num => 1},
      ],
    },
    2004 => { # 方天画戟・無双
      :price => 28000,
      :after => {:kind => :W, :id => 4260},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 235, :num => 1},
        {:kind => :I, :id => 825, :num => 1},
      ],
    },
    2005 => { # 無尽無銘・詠人不知
      :price => 25000,
      :after => {:kind => :W, :id => 4291},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4285, :num => 1},
        {:kind => :I, :id => 825, :num => 1},
      ],
    },
    2006 => { # 聖魔流星
      :price => 23500,
      :after => {:kind => :W, :id => 4318},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4309, :num => 1},
        {:kind => :W, :id => 4310, :num => 1},
        {:kind => :I, :id => 825, :num => 1},
      ],
    },
    2007 => { # 格闘王・不敗蒼華
      :price => 22000,
      :after => {:kind => :W, :id => 4347},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 330, :num => 1},
        {:kind => :W, :id => 331, :num => 1},
        {:kind => :I, :id => 825, :num => 1},
      ],
    },
    2008 => { # ルー・ガルー
      :price => 19000,
      :after => {:kind => :W, :id => 4377},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4372, :num => 1},
        {:kind => :I, :id => 825, :num => 1},
      ],
    },
    2009 => { # マックスブレイカー
      :price => 31000,
      :after => {:kind => :W, :id => 4399},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 395, :num => 1},
        {:kind => :I, :id => 821, :num => 1},
      ],
    },
    2010 => { # 聖棍ギルアンヘル
      :price => 27000,
      :after => {:kind => :W, :id => 4426},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4420, :num => 1},
        {:kind => :I, :id => 824, :num => 1},
      ],
    },
    2011 => { # アルテマトリニティ
      :price => 23500,
      :after => {:kind => :W, :id => 4478},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4473, :num => 1},
        {:kind => :I, :id => 824, :num => 1},
      ],
    },
    2012 => { # アルテマドラグナー
      :price => 23000,
      :after => {:kind => :W, :id => 4509},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4503, :num => 1},
        {:kind => :I, :id => 824, :num => 1},
      ],
    },
    2013 => { # 滅竜神弓
      :price => 23000,
      :after => {:kind => :W, :id => 4540},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4529, :num => 1},
        {:kind => :I, :id => 825, :num => 1},
      ],
    },
    2014 => { # ルミナスレイン
      :price => 26000,
      :after => {:kind => :W, :id => 4568},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4562, :num => 1},
        {:kind => :I, :id => 823, :num => 1},
      ],
    },
    2015 => { # レインボーハープ
      :price => 22000,
      :after => {:kind => :W, :id => 4595},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4592, :num => 1},
        {:kind => :I, :id => 823, :num => 1},
      ],
    },
    2016 => { # 奇跡の三日月
      :price => 25000,
      :after => {:kind => :W, :id => 4621},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4614, :num => 1},
        {:kind => :I, :id => 823, :num => 1},
      ],
    },
    2017 => { # セブンスターナイフ
      :price => 22000,
      :after => {:kind => :W, :id => 4696},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4688, :num => 1},
        {:kind => :I, :id => 822, :num => 1},
      ],
    },
    2018 => { # 富岳
      :price => 17000,
      :after => {:kind => :W, :id => 4715},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4711, :num => 1},
        {:kind => :I, :id => 821, :num => 1},
      ],
    },
    2019 => { # フェアリーカーニバル
      :price => 21200,
      :after => {:kind => :W, :id => 4754},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4747, :num => 1},
        {:kind => :I, :id => 822, :num => 1},
      ],
    },
    2020 => { # ハイノーブル
      :price => 22000,
      :after => {:kind => :W, :id => 4776},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4767, :num => 1},
        {:kind => :I, :id => 824, :num => 1},
      ],
    },
    2021 => { # 疾風セレナーデ
      :price => 28000,
      :after => {:kind => :W, :id => 4843},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 936, :num => 1},
        {:kind => :I, :id => 821, :num => 1},
      ],
    },
    2022 => { # 影衣
      :price => 9600,
      :after => {:kind => :A, :id => 429},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 426, :num => 1},
        {:kind => :I, :id => 825, :num => 1},
      ],
    },
    2023 => { # ラストアーク
      :price => 16000,
      :after => {:kind => :A, :id => 459},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 448, :num => 1},
        {:kind => :I, :id => 821, :num => 1},
      ],
    },
    2024 => { # 八色万華鎧
      :price => 17000,
      :after => {:kind => :A, :id => 505},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 489, :num => 1},
        {:kind => :I, :id => 823, :num => 1},
      ],
    },
    2025 => { # 森羅万象の甲羅
      :price => 10000,
      :after => {:kind => :A, :id => 544},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 537, :num => 1},
        {:kind => :I, :id => 822, :num => 1},
      ],
    },
    2026 => { # シンデレラ
      :price => 30400,
      :after => {:kind => :A, :id => 603},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 592, :num => 1},
        {:kind => :I, :id => 823, :num => 1},
      ],
    },
    2027 => { # 四精霊のビスチェ
      :price => 32000,
      :after => {:kind => :A, :id => 635},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 628, :num => 1},
        {:kind => :I, :id => 822, :num => 1},
      ],
    },
    2028 => { # アルセーヌ
      :price => 4000,
      :after => {:kind => :A, :id => 668},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 662, :num => 1},
        {:kind => :I, :id => 822, :num => 1},
      ],
    },
    2029 => { # 光の竜虎
      :price => 12000,
      :after => {:kind => :A, :id => 725},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 231, :num => 1},
        {:kind => :I, :id => 823, :num => 1},
      ],
    },
    2030 => { # 四精霊のロンド
      :price => 11000,
      :after => {:kind => :A, :id => 766},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 762, :num => 1},
        {:kind => :I, :id => 822, :num => 1},
      ],
    },
    2031 => { # ドラゴンエンパイア
      :price => 15200,
      :after => {:kind => :A, :id => 894},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 883, :num => 1},
        {:kind => :I, :id => 821, :num => 1},
      ],
    },
    2032 => { # 義賊の宝剣
      :price => 21000,
      :after => {:kind => :W, :id => 4092},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 38, :num => 1},
        {:kind => :I, :id => 829, :num => 1},
      ],
    },
    2033 => { # エルフィンブリンガー
      :price => 27500,
      :after => {:kind => :W, :id => 4143},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4131, :num => 1},
        {:kind => :I, :id => 830, :num => 1},
      ],
    },
    2034 => { # 聖剣マキシマムタイタス
      :price => 31000,
      :after => {:kind => :W, :id => 4171},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4167, :num => 1},
        {:kind => :I, :id => 829, :num => 1},
      ],
    },
    2035 => { # 闇薔薇
      :price => 25000,
      :after => {:kind => :W, :id => 4202},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4187, :num => 1},
        {:kind => :I, :id => 831, :num => 1},
      ],
    },
    2036 => { # アークフォース
      :price => 30000,
      :after => {:kind => :W, :id => 4222},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4218, :num => 1},
        {:kind => :I, :id => 826, :num => 1},
      ],
    },
    2037 => { # アルファケンタウリ
      :price => 25000,
      :after => {:kind => :W, :id => 4245},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4238, :num => 1},
        {:kind => :I, :id => 830, :num => 1},
      ],
    },
    2038 => { # 天剣天誅
      :price => 28000,
      :after => {:kind => :W, :id => 4292},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4278, :num => 1},
        {:kind => :I, :id => 826, :num => 1},
      ],
    },
    2039 => { # 斬神斬魔
      :price => 26000,
      :after => {:kind => :W, :id => 4319},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4313, :num => 1},
        {:kind => :W, :id => 4314, :num => 1},
        {:kind => :I, :id => 826, :num => 1},
      ],
    },
    2040 => { # 七色魔爪
      :price => 24500,
      :after => {:kind => :W, :id => 4349},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 295, :num => 1},
        {:kind => :W, :id => 296, :num => 1},
        {:kind => :W, :id => 297, :num => 1},
        {:kind => :W, :id => 293, :num => 1},
        {:kind => :W, :id => 298, :num => 1},
        {:kind => :W, :id => 299, :num => 1},
        {:kind => :I, :id => 830, :num => 1},
      ],
    },
    2041 => { # オメガベルセルク
      :price => 34000,
      :after => {:kind => :W, :id => 4400},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 398, :num => 1},
        {:kind => :I, :id => 830, :num => 1},
      ],
    },
    2042 => { # 乙姫
      :price => 25500,
      :after => {:kind => :W, :id => 4479},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4469, :num => 1},
        {:kind => :I, :id => 827, :num => 1},
      ],
    },
    2043 => { # ゴーストファンタスティック
      :price => 25000,
      :after => {:kind => :W, :id => 4510},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4494, :num => 1},
        {:kind => :I, :id => 827, :num => 1},
      ],
    },
    2044 => { # 竜鞭クィーンロード
      :price => 32000,
      :after => {:kind => :W, :id => 4570},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4556, :num => 1},
        {:kind => :I, :id => 827, :num => 1},
      ],
    },
    2045 => { # ジェノサイドブレイカー
      :price => 36000,
      :after => {:kind => :W, :id => 4643},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 719, :num => 1},
        {:kind => :I, :id => 830, :num => 1},
      ],
    },
    2046 => { # シラクサ
      :price => 23000,
      :after => {:kind => :W, :id => 4673},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4658, :num => 1},
        {:kind => :I, :id => 826, :num => 1},
      ],
    },
    2047 => { # サージャンブレイドΩ
      :price => 24000,
      :after => {:kind => :W, :id => 4735},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4728, :num => 1},
        {:kind => :I, :id => 828, :num => 1},
      ],
    },
    2048 => { # 魂のデュエリスト
      :price => 23500,
      :after => {:kind => :W, :id => 4755},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4745, :num => 1},
        {:kind => :I, :id => 829, :num => 1},
      ],
    },
    2049 => { # 蛸蝕祭
      :price => 24000,
      :after => {:kind => :W, :id => 4777},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 865, :num => 1},
        {:kind => :I, :id => 827, :num => 1},
      ],
    },
    2050 => { # トリスメギストス
      :price => 24500,
      :after => {:kind => :W, :id => 4802},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4796, :num => 1},
        {:kind => :I, :id => 826, :num => 1},
      ],
    },
    2051 => { # エクゼキューショナー
      :price => 54000,
      :after => {:kind => :W, :id => 4825},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4819, :num => 1},
        {:kind => :I, :id => 828, :num => 1},
      ],
    },
    2052 => { # ナイチンゲール
      :price => 9000,
      :after => {:kind => :A, :id => 402},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 399, :num => 1},
        {:kind => :I, :id => 829, :num => 1},
      ],
    },
    2053 => { # ワールドトレーダー
      :price => 17000,
      :after => {:kind => :A, :id => 460},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 445, :num => 1},
        {:kind => :I, :id => 831, :num => 1},
      ],
    },
    2054 => { # エレメントガード
      :price => 18000,
      :after => {:kind => :A, :id => 479},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 476, :num => 1},
        {:kind => :I, :id => 831, :num => 1},
      ],
    },
    2055 => { # 飛竜鎧
      :price => 18500,
      :after => {:kind => :A, :id => 506},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 499, :num => 1},
        {:kind => :I, :id => 829, :num => 1},
      ],
    },
    2056 => { # ヌルヌール
      :price => 11000,
      :after => {:kind => :A, :id => 545},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 538, :num => 1},
        {:kind => :I, :id => 828, :num => 1},
      ],
    },
    2057 => { # ニライカナイ
      :price => 13500,
      :after => {:kind => :A, :id => 570},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 560, :num => 1},
        {:kind => :I, :id => 827, :num => 1},
      ],
    },
    2058 => { # 黒ノ衣
      :price => 34000,
      :after => {:kind => :A, :id => 604},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 596, :num => 1},
        {:kind => :I, :id => 831, :num => 1},
      ],
    },
    2059 => { # エロスの化身
      :price => 36000,
      :after => {:kind => :A, :id => 636},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 621, :num => 1},
        {:kind => :I, :id => 826, :num => 1},
      ],
    },
    2060 => { # ベレニケハット
      :price => 4500,
      :after => {:kind => :A, :id => 669},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 667, :num => 1},
        {:kind => :I, :id => 827, :num => 1},
      ],
    },
    2061 => { # イェニ・チェリ
      :price => 12000,
      :after => {:kind => :A, :id => 698},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 689, :num => 1},
        {:kind => :I, :id => 831, :num => 1},
      ],
    },
    2062 => { # 桜花闇修羅兜
      :price => 13500,
      :after => {:kind => :A, :id => 726},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 232, :num => 1},
        {:kind => :I, :id => 829, :num => 1},
      ],
    },
    2063 => { # サイ・ワーム
      :price => 11500,
      :after => {:kind => :A, :id => 768},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 758, :num => 1},
        {:kind => :I, :id => 827, :num => 1},
      ],
    },
    2064 => { # 千蛇の女王
      :price => 15500,
      :after => {:kind => :A, :id => 803},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 787, :num => 1},
        {:kind => :I, :id => 828, :num => 1},
      ],
    },
    2065 => { # カッサンドラ
      :price => 9000,
      :after => {:kind => :A, :id => 831},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 827, :num => 1},
        {:kind => :I, :id => 831, :num => 1},
      ],
    },
    2066 => { # ミカガミトリニティ
      :price => 16500,
      :after => {:kind => :A, :id => 854},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 841, :num => 1},
        {:kind => :A, :id => 846, :num => 1},
        {:kind => :I, :id => 828, :num => 1},
      ],
    },
    2067 => { # 誘惑剣アシュモラ
      :price => 22000,
      :after => {:kind => :W, :id => 4093},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 43, :num => 1},
        {:kind => :I, :id => 836, :num => 1},
      ],
    },
    2068 => { # 堕剣レムルサクバス
      :price => 25000,
      :after => {:kind => :W, :id => 4121},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4111, :num => 1},
        {:kind => :I, :id => 836, :num => 1},
      ],
    },
    2069 => { # 聖剣エンジェルスター
      :price => 30000,
      :after => {:kind => :W, :id => 4145},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4135, :num => 1},
        {:kind => :I, :id => 836, :num => 1},
      ],
    },
    2070 => { # 斬鉄剣・星旺
      :price => 35000,
      :after => {:kind => :W, :id => 4172},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4166, :num => 1},
        {:kind => :I, :id => 836, :num => 1},
      ],
    },
    2071 => { # 聖竜千鳥
      :price => 27500,
      :after => {:kind => :W, :id => 4203},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 167, :num => 1},
        {:kind => :W, :id => 174, :num => 1},
        {:kind => :I, :id => 836, :num => 1},
      ],
    },
    2072 => { # 宝剣・三魔四精
      :price => 31500,
      :after => {:kind => :W, :id => 4223},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4217, :num => 1},
        {:kind => :I, :id => 834, :num => 1},
      ],
    },
    2073 => { # ヴァルキュリア
      :price => 35000,
      :after => {:kind => :W, :id => 4261},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4256, :num => 1},
        {:kind => :I, :id => 833, :num => 1},
      ],
    },
    2074 => { # 最終冥王拳
      :price => 27000,
      :after => {:kind => :W, :id => 4350},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4340, :num => 1},
        {:kind => :I, :id => 835, :num => 1},
      ],
    },
    2075 => { # 神祖の牙
      :price => 23000,
      :after => {:kind => :W, :id => 4378},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 352, :num => 1},
        {:kind => :I, :id => 835, :num => 1},
      ],
    },
    2076 => { # ペルセポネー
      :price => 32000,
      :after => {:kind => :W, :id => 4427},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4421, :num => 1},
        {:kind => :I, :id => 835, :num => 1},
      ],
    },
    2077 => { # 滅・妖狩斬魂鎌
      :price => 24500,
      :after => {:kind => :W, :id => 4454},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4444, :num => 1},
        {:kind => :I, :id => 834, :num => 1},
      ],
    },
    2078 => { # オーバーエリシクル
      :price => 28000,
      :after => {:kind => :W, :id => 4480},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 501, :num => 1},
        {:kind => :I, :id => 832, :num => 1},
      ],
    },
    2079 => { # マスターワーム
      :price => 28000,
      :after => {:kind => :W, :id => 4511},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4500, :num => 1},
        {:kind => :I, :id => 835, :num => 1},
      ],
    },
    2080 => { # エルフィンオルド
      :price => 28000,
      :after => {:kind => :W, :id => 4541},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 586, :num => 1},
        {:kind => :I, :id => 834, :num => 1},
      ],
    },
    2081 => { # バンシィ
      :price => 26000,
      :after => {:kind => :W, :id => 4596},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4593, :num => 1},
        {:kind => :I, :id => 832, :num => 1},
      ],
    },
    2082 => { # トリニティエッジ
      :price => 31000,
      :after => {:kind => :W, :id => 4623},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4615, :num => 1},
        {:kind => :I, :id => 832, :num => 1},
      ],
    },
    2083 => { # ブギーマン
      :price => 25000,
      :after => {:kind => :W, :id => 4697},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4689, :num => 1},
        {:kind => :I, :id => 835, :num => 1},
      ],
    },
    2084 => { # ヴァンピールリッチ
      :price => 20000,
      :after => {:kind => :W, :id => 4716},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 794, :num => 1},
        {:kind => :I, :id => 834, :num => 1},
      ],
    },
    2085 => { # 究極麗皿・雪月花
      :price => 26000,
      :after => {:kind => :W, :id => 4778},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4766, :num => 1},
        {:kind => :I, :id => 832, :num => 1},
      ],
    },
    2086 => { # くのいちの妖壺
      :price => 35000,
      :after => {:kind => :W, :id => 4845},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 932, :num => 1},
        {:kind => :I, :id => 834, :num => 1},
      ],
    },
    2087 => { # サンタナ
      :price => 10000,
      :after => {:kind => :A, :id => 403},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 385, :num => 1},
        {:kind => :I, :id => 833, :num => 1},
      ],
    },
    2088 => { # エメラルドハート
      :price => 12000,
      :after => {:kind => :A, :id => 430},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 419, :num => 1},
        {:kind => :I, :id => 834, :num => 1},
      ],
    },
    2089 => { # 触手装甲
      :price => 19000,
      :after => {:kind => :A, :id => 461},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 449, :num => 1},
        {:kind => :I, :id => 835, :num => 1},
      ],
    },
    2090 => { # 真・覇竜の鎧
      :price => 20000,
      :after => {:kind => :A, :id => 507},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 491, :num => 1},
        {:kind => :I, :id => 833, :num => 1},
      ],
    },
    2091 => { # マイティビートル
      :price => 12000,
      :after => {:kind => :A, :id => 546},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 539, :num => 1},
        {:kind => :I, :id => 835, :num => 1},
      ],
    },
    2092 => { # コノハナサクヤ
      :price => 38000,
      :after => {:kind => :A, :id => 605},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 595, :num => 1},
        {:kind => :I, :id => 832, :num => 1},
      ],
    },
    2093 => { # 真・覇竜の兜
      :price => 15000,
      :after => {:kind => :A, :id => 727},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 708, :num => 1},
        {:kind => :I, :id => 833, :num => 1},
      ],
    },
    2094 => { # マーメイドロード
      :price => 13000,
      :after => {:kind => :A, :id => 769},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 752, :num => 1},
        {:kind => :I, :id => 832, :num => 1},
      ],
    },
    2095 => { # 天啓のティアラ
      :price => 17500,
      :after => {:kind => :A, :id => 804},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 795, :num => 1},
        {:kind => :I, :id => 834, :num => 1},
      ],
    },
    2096 => { # 真・覇竜の盾
      :price => 19000,
      :after => {:kind => :A, :id => 895},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 873, :num => 1},
        {:kind => :I, :id => 833, :num => 1},
      ],
    },
    2097 => { # アルテマパルサー
      :price => 57000,
      :after => {:kind => :W, :id => 4824},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4821, :num => 1},
        {:kind => :I, :id => 842, :num => 1},
      ],
    },
    2098 => { # ヒルベルト変換装甲
      :price => 20000,
      :after => {:kind => :A, :id => 457},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 456, :num => 1},
        {:kind => :I, :id => 842, :num => 1},
      ],
    },
    2099 => { # アドバンスドバイザー
      :price => 5000,
      :after => {:kind => :A, :id => 670},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 663, :num => 1},
        {:kind => :I, :id => 842, :num => 1},
      ],
    },
    2100 => { # アンチカオスプレート
      :price => 15500,
      :after => {:kind => :A, :id => 892},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 890, :num => 1},
        {:kind => :I, :id => 842, :num => 1},
      ],
    },
    2101 => { # 魔剣ドラゴンロード
      :price => 33000,
      :after => {:kind => :W, :id => 4146},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 114, :num => 1},
        {:kind => :I, :id => 838, :num => 1},
      ],
    },
    2102 => { # 夢牙
      :price => 30000,
      :after => {:kind => :W, :id => 4204},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4193, :num => 1},
        {:kind => :I, :id => 837, :num => 1},
      ],
    },
    2103 => { # 自作ガンランス・改
      :price => 31000,
      :after => {:kind => :W, :id => 4247},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4240, :num => 1},
        {:kind => :I, :id => 841, :num => 1},
      ],
    },
    2104 => { # 聖槍ロンギヌス・ダブル
      :price => 40000,
      :after => {:kind => :W, :id => 4262},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 237, :num => 2},
        {:kind => :I, :id => 841, :num => 1},
      ],
    },
    2105 => { # 五光
      :price => 34000,
      :after => {:kind => :W, :id => 4293},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4284, :num => 1},
        {:kind => :I, :id => 837, :num => 1},
      ],
    },
    2106 => { # 狐影
      :price => 30000,
      :after => {:kind => :W, :id => 4320},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 285, :num => 1},
        {:kind => :I, :id => 838, :num => 1},
      ],
    },
    2107 => { # 聖爪バロン
      :price => 30000,
      :after => {:kind => :W, :id => 4351},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4338, :num => 1},
        {:kind => :I, :id => 841, :num => 1},
      ],
    },
    2108 => { # ナノ分解魔神斧
      :price => 40000,
      :after => {:kind => :W, :id => 4401},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 396, :num => 1},
        {:kind => :I, :id => 840, :num => 1},
      ],
    },
    2109 => { # ヘルソウル
      :price => 26500,
      :after => {:kind => :W, :id => 4455},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4446, :num => 1},
        {:kind => :I, :id => 839, :num => 1},
      ],
    },
    2110 => { # ツインスパークル
      :price => 31000,
      :after => {:kind => :W, :id => 4512},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 544, :num => 1},
        {:kind => :I, :id => 840, :num => 1},
      ],
    },
    2111 => { # 沙羅双樹
      :price => 35000,
      :after => {:kind => :W, :id => 4571},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4569, :num => 1},
        {:kind => :I, :id => 840, :num => 1},
      ],
    },
    2112 => { # ミレニアム
      :price => 29000,
      :after => {:kind => :W, :id => 4597},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4588, :num => 1},
        {:kind => :I, :id => 841, :num => 1},
      ],
    },
    2113 => { # サーペンタリウス
      :price => 41000,
      :after => {:kind => :W, :id => 4644},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4639, :num => 1},
        {:kind => :I, :id => 838, :num => 1},
      ],
    },
    2114 => { # ヘルヘイム
      :price => 30000,
      :after => {:kind => :W, :id => 4736},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4732, :num => 1},
        {:kind => :I, :id => 839, :num => 1},
      ],
    },
    2115 => { # 太極陰陽混沌札
      :price => 28500,
      :after => {:kind => :W, :id => 4756},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4751, :num => 1},
        {:kind => :I, :id => 839, :num => 1},
      ],
    },
    2116 => { # スペリオル
      :price => 28500,
      :after => {:kind => :W, :id => 4779},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4769, :num => 1},
        {:kind => :I, :id => 838, :num => 1},
      ],
    },
    2117 => { # カーマスートラ
      :price => 30000,
      :after => {:kind => :W, :id => 4804},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4791, :num => 1},
        {:kind => :I, :id => 840, :num => 1},
      ],
    },
    2118 => { # エグゼター
      :price => 61000,
      :after => {:kind => :W, :id => 4826},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4818, :num => 1},
        {:kind => :I, :id => 837, :num => 1},
      ],
    },
    2119 => { # タイドタイガー
      :price => 21000,
      :after => {:kind => :A, :id => 462},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 442, :num => 1},
        {:kind => :I, :id => 837, :num => 1},
      ],
    },
    2120 => { # ハインの輝黒鎧
      :price => 21000,
      :after => {:kind => :A, :id => 480},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 477, :num => 1},
        {:kind => :I, :id => 841, :num => 1},
      ],
    },
    2121 => { # 魔装バハムートロード
      :price => 17500,
      :after => {:kind => :A, :id => 571},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 567, :num => 1},
        {:kind => :I, :id => 838, :num => 1},
      ],
    },
    2122 => { # ニヴルヘイム
      :price => 40000,
      :after => {:kind => :A, :id => 606},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 597, :num => 1},
        {:kind => :I, :id => 839, :num => 1},
      ],
    },
    2123 => { # 超神乳のブラ
      :price => 44000,
      :after => {:kind => :A, :id => 638},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 174, :num => 1},
        {:kind => :I, :id => 838, :num => 1},
      ],
    },
    2124 => { # 蒼穹の大翼
      :price => 5500,
      :after => {:kind => :A, :id => 671},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 664, :num => 1},
        {:kind => :I, :id => 840, :num => 1},
      ],
    },
    2125 => { # 螺旋竜角兜
      :price => 14500,
      :after => {:kind => :A, :id => 699},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 693, :num => 1},
        {:kind => :I, :id => 837, :num => 1},
      ],
    },
    2126 => { # 神竜のサークレット
      :price => 14200,
      :after => {:kind => :A, :id => 770},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 754, :num => 1},
        {:kind => :I, :id => 837, :num => 1},
      ],
    },
    2127 => { # ルーンガード
      :price => 16500,
      :after => {:kind => :A, :id => 855},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 845, :num => 1},
        {:kind => :I, :id => 837, :num => 1},
      ],
    },
    2128 => { # エンドオブアサシン
      :price => 27000,
      :after => {:kind => :W, :id => 4095},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 44, :num => 1},
        {:kind => :I, :id => 843, :num => 1},
      ],
    },
    2129 => { # 陰陽五行相剋
      :price => 30000,
      :after => {:kind => :W, :id => 4122},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4110, :num => 1},
        {:kind => :I, :id => 845, :num => 1},
      ],
    },
    2130 => { # 英雄剣ハインリヒ
      :price => 36500,
      :after => {:kind => :W, :id => 4148},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 112, :num => 1},
        {:kind => :W, :id => 4132, :num => 1},
        {:kind => :I, :id => 846, :num => 1},
      ],
    },
    2131 => { # 魔剣バスタードオメガ
      :price => 42000,
      :after => {:kind => :W, :id => 4173},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 139, :num => 1},
        {:kind => :I, :id => 843, :num => 1},
      ],
    },
    2132 => { # ホワイトアリア
      :price => 37800,
      :after => {:kind => :W, :id => 4224},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 187, :num => 1},
        {:kind => :I, :id => 846, :num => 1},
      ],
    },
    2133 => { # ファランクス
      :price => 43000,
      :after => {:kind => :W, :id => 4264},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4257, :num => 1},
        {:kind => :I, :id => 847, :num => 1},
      ],
    },
    2134 => { # 鍾馗
      :price => 37000,
      :after => {:kind => :W, :id => 4295},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4281, :num => 1},
        {:kind => :I, :id => 843, :num => 1},
      ],
    },
    2135 => { # 狂悦
      :price => 34500,
      :after => {:kind => :W, :id => 4322},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 286, :num => 1},
        {:kind => :I, :id => 844, :num => 1},
      ],
    },
    2136 => { # ヴィジランテ
      :price => 33000,
      :after => {:kind => :W, :id => 4353},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4333, :num => 1},
        {:kind => :I, :id => 845, :num => 1},
      ],
    },
    2137 => { # Tレックス
      :price => 28000,
      :after => {:kind => :W, :id => 4380},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 359, :num => 1},
        {:kind => :I, :id => 845, :num => 1},
      ],
    },
    2138 => { # 聖斧アトラスクロス
      :price => 45000,
      :after => {:kind => :W, :id => 4404},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4394, :num => 1},
        {:kind => :I, :id => 846, :num => 1},
      ],
    },
    2139 => { # 鬼哭
      :price => 39000,
      :after => {:kind => :W, :id => 4430},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4414, :num => 1},
        {:kind => :I, :id => 843, :num => 1},
      ],
    },
    2140 => { # コスモス
      :price => 34000,
      :after => {:kind => :W, :id => 4482},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 505, :num => 1},
        {:kind => :I, :id => 847, :num => 1},
      ],
    },
    2141 => { # セイブザクィーン
      :price => 34000,
      :after => {:kind => :W, :id => 4514},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4495, :num => 1},
        {:kind => :I, :id => 844, :num => 1},
      ],
    },
    2142 => { # ハンターオブハンター
      :price => 34000,
      :after => {:kind => :W, :id => 4543},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4533, :num => 1},
        {:kind => :I, :id => 847, :num => 1},
      ],
    },
    2143 => { # 聖鞭プリンシパリティ
      :price => 41000,
      :after => {:kind => :W, :id => 4573},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4561, :num => 1},
        {:kind => :I, :id => 846, :num => 1},
      ],
    },
    2144 => { # 不倶戴天
      :price => 38000,
      :after => {:kind => :W, :id => 4625},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4616, :num => 1},
        {:kind => :I, :id => 843, :num => 1},
      ],
    },
    2145 => { # 風林火山
      :price => 31000,
      :after => {:kind => :W, :id => 4675},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4666, :num => 1},
        {:kind => :I, :id => 844, :num => 1},
      ],
    },
    2146 => { # タックスヘイブン
      :price => 25000,
      :after => {:kind => :W, :id => 4719},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4706, :num => 1},
        {:kind => :I, :id => 845, :num => 1},
      ],
    },
    2147 => { # デッドマンズハンド
      :price => 32000,
      :after => {:kind => :W, :id => 4758},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4752, :num => 1},
        {:kind => :I, :id => 843, :num => 1},
      ],
    },
    2148 => { # 失楽
      :price => 42000,
      :after => {:kind => :W, :id => 4846},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4840, :num => 1},
        {:kind => :I, :id => 844, :num => 1},
      ],
    },
    2149 => { # ガンスリンガーコート
      :price => 12000,
      :after => {:kind => :A, :id => 404},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 397, :num => 1},
        {:kind => :I, :id => 847, :num => 1},
      ],
    },
    2150 => { # 天剣の衣
      :price => 14400,
      :after => {:kind => :A, :id => 431},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 423, :num => 1},
        {:kind => :I, :id => 846, :num => 1},
      ],
    },
    2151 => { # バッカニア
      :price => 23000,
      :after => {:kind => :A, :id => 464},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 446, :num => 1},
        {:kind => :I, :id => 845, :num => 1},
      ],
    },
    2152 => { # グロリアスオメガ
      :price => 24500,
      :after => {:kind => :A, :id => 510},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 490, :num => 1},
        {:kind => :I, :id => 843, :num => 1},
      ],
    },
    2153 => { # ナノデバイス
      :price => 15000,
      :after => {:kind => :A, :id => 549},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 538, :num => 1},
        {:kind => :I, :id => 847, :num => 1},
      ],
    },
    2154 => { # レッドロマンス
      :price => 48000,
      :after => {:kind => :A, :id => 639},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 625, :num => 1},
        {:kind => :I, :id => 844, :num => 1},
      ],
    },
    2155 => { # クィーンロイヤル
      :price => 60000,
      :after => {:kind => :A, :id => 673},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 667, :num => 1},
        {:kind => :I, :id => 844, :num => 1},
      ],
    },
    2156 => { # マスターパイレーツ
      :price => 15600,
      :after => {:kind => :A, :id => 700},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 694, :num => 1},
        {:kind => :I, :id => 845, :num => 1},
      ],
    },
    2157 => { # 神武者の兜
      :price => 19000,
      :after => {:kind => :A, :id => 730},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 710, :num => 1},
        {:kind => :I, :id => 846, :num => 1},
      ],
    },
    2158 => { # テラソーサラー
      :price => 16200,
      :after => {:kind => :A, :id => 773},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 761, :num => 1},
        {:kind => :I, :id => 844, :num => 1},
      ],
    },
    2159 => { # アトランティス
      :price => 21000,
      :after => {:kind => :A, :id => 805},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 789, :num => 1},
        {:kind => :I, :id => 844, :num => 1},
      ],
    },
    2160 => { # ライトエレメント・プラス
      :price => 12000,
      :after => {:kind => :A, :id => 832},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 828, :num => 1},
        {:kind => :I, :id => 844, :num => 1},
      ],
    },
    2161 => { # アルテマアサルト
      :price => 23000,
      :after => {:kind => :A, :id => 899},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 876, :num => 1},
        {:kind => :I, :id => 843, :num => 1},
      ],
    },
    2162 => { # 夜の女王
      :price => 28800,
      :after => {:kind => :W, :id => 4096},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4087, :num => 1},
        {:kind => :I, :id => 850, :num => 1},
      ],
    },
    2163 => { # 極・隼の剣
      :price => 40000,
      :after => {:kind => :W, :id => 4149},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4137, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2164 => { # 轟天はかぶさ
      :price => 40000,
      :after => {:kind => :W, :id => 4150},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4137, :num => 1},
        {:kind => :I, :id => 849, :num => 1},
      ],
    },
    2165 => { # 三魔滅天
      :price => 35000,
      :after => {:kind => :W, :id => 4206},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4194, :num => 1},
        {:kind => :I, :id => 849, :num => 1},
      ],
    },
    2166 => { # 漆黒の魔剣
      :price => 37800,
      :after => {:kind => :W, :id => 4225},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 188, :num => 1},
        {:kind => :I, :id => 850, :num => 1},
      ],
    },
    2167 => { # 聖槍ドミニオン
      :price => 35000,
      :after => {:kind => :W, :id => 4248},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4239, :num => 1},
        {:kind => :W, :id => 4241, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2168 => { # 飛黒輝
      :price => 45500,
      :after => {:kind => :W, :id => 4267},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 240, :num => 1},
        {:kind => :I, :id => 849, :num => 1},
      ],
    },
    2169 => { # ウルヴァリン
      :price => 35000,
      :after => {:kind => :W, :id => 4354},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4338, :num => 1},
        {:kind => :I, :id => 849, :num => 1},
      ],
    },
    2170 => { # 九首牛魔羅王
      :price => 48000,
      :after => {:kind => :W, :id => 4405},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4393, :num => 1},
        {:kind => :I, :id => 849, :num => 1},
      ],
    },
    2171 => { # 虚無金槌
      :price => 41000,
      :after => {:kind => :W, :id => 4431},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 436, :num => 1},
        {:kind => :I, :id => 851, :num => 1},
      ],
    },
    2172 => { # あやかし蒼魔
      :price => 32500,
      :after => {:kind => :W, :id => 4458},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4445, :num => 1},
        {:kind => :I, :id => 850, :num => 1},
      ],
    },
    2173 => { # デミウルゴス∞
      :price => 37000,
      :after => {:kind => :W, :id => 4483},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4474, :num => 1},
        {:kind => :I, :id => 852, :num => 1},
      ],
    },
    2174 => { # 究極魔法少女のロッド
      :price => 36000,
      :after => {:kind => :W, :id => 4516},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4498, :num => 1},
        {:kind => :I, :id => 852, :num => 1},
      ],
    },
    2175 => { # 聖杖メシアン
      :price => 36000,
      :after => {:kind => :W, :id => 4517},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 546, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2176 => { # オメガの竪琴
      :price => 34500,
      :after => {:kind => :W, :id => 4600},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4587, :num => 1},
        {:kind => :I, :id => 851, :num => 1},
      ],
    },
    2177 => { # アルトツヴァイ
      :price => 34000,
      :after => {:kind => :W, :id => 4700},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 772, :num => 1},
        {:kind => :I, :id => 852, :num => 1},
      ],
    },
    2178 => { # 聖算具ソフィア
      :price => 26500,
      :after => {:kind => :W, :id => 4720},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4708, :num => 1},
        {:kind => :I, :id => 851, :num => 1},
      ],
    },
    2179 => { # ルミナスレジェンド
      :price => 34500,
      :after => {:kind => :W, :id => 4781},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4773, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2180 => { # 求道者の白衣
      :price => 13000,
      :after => {:kind => :A, :id => 405},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 395, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2181 => { # 求道者の黒衣
      :price => 13000,
      :after => {:kind => :A, :id => 406},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 395, :num => 1},
        {:kind => :I, :id => 850, :num => 1},
      ],
    },
    2182 => { # ゴッドクロス
      :price => 24500,
      :after => {:kind => :A, :id => 482},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 471, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2183 => { # 灰燼の王
      :price => 26000,
      :after => {:kind => :A, :id => 512},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 499, :num => 1},
        {:kind => :I, :id => 849, :num => 1},
      ],
    },
    2184 => { # ガイアガーダー
      :price => 15500,
      :after => {:kind => :A, :id => 550},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 536, :num => 1},
        {:kind => :I, :id => 852, :num => 1},
      ],
    },
    2185 => { # 永劫のローブ
      :price => 20000,
      :after => {:kind => :A, :id => 573},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 562, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2186 => { # マテリアルガール
      :price => 50000,
      :after => {:kind => :A, :id => 609},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 601, :num => 1},
        {:kind => :I, :id => 851, :num => 1},
      ],
    },
    2187 => { # マーベルレオタード
      :price => 51000,
      :after => {:kind => :A, :id => 640},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 630, :num => 1},
        {:kind => :I, :id => 851, :num => 1},
      ],
    },
    2188 => { # 求道者の黒頭巾
      :price => 6800,
      :after => {:kind => :A, :id => 674},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 660, :num => 1},
        {:kind => :I, :id => 852, :num => 1},
      ],
    },
    2189 => { # 支配する者
      :price => 20000,
      :after => {:kind => :A, :id => 731},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 713, :num => 1},
        {:kind => :I, :id => 852, :num => 1},
      ],
    },
    2190 => { # 天罰神雷のサークレット
      :price => 17300,
      :after => {:kind => :A, :id => 774},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 755, :num => 1},
        {:kind => :A, :id => 767, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2191 => { # フェニックスクラウン
      :price => 22300,
      :after => {:kind => :A, :id => 807},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 786, :num => 1},
        {:kind => :A, :id => 791, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2192 => { # 毘沙門天
      :price => 20000,
      :after => {:kind => :A, :id => 858},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 844, :num => 1},
        {:kind => :I, :id => 849, :num => 1},
      ],
    },
    2193 => { # ダブルキャップシールド
      :price => 24500,
      :after => {:kind => :A, :id => 900},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 874, :num => 1},
        {:kind => :I, :id => 851, :num => 1},
      ],
    },
    2194 => { # マハーデーヴィー
      :price => 30800,
      :after => {:kind => :W, :id => 4098},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 39, :num => 1},
        {:kind => :I, :id => 854, :num => 1},
      ],
    },
    2195 => { # ナイトフライヤ
      :price => 35000,
      :after => {:kind => :W, :id => 4123},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 85, :num => 1},
        {:kind => :W, :id => 4109, :num => 1},
        {:kind => :I, :id => 853, :num => 1},
      ],
    },
    2196 => { # 獅子王剣
      :price => 42000,
      :after => {:kind => :W, :id => 4151},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4144, :num => 1},
        {:kind => :I, :id => 855, :num => 1},
      ],
    },
    2197 => { # リベリオン
      :price => 49000,
      :after => {:kind => :W, :id => 4174},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 141, :num => 1},
        {:kind => :I, :id => 853, :num => 1},
      ],
    },
    2198 => { # アンファンテリブル
      :price => 38500,
      :after => {:kind => :W, :id => 4208},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4188, :num => 1},
        {:kind => :I, :id => 855, :num => 1},
      ],
    },
    2199 => { # 魔王殺し改
      :price => 44100,
      :after => {:kind => :W, :id => 4226},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4220, :num => 1},
        {:kind => :I, :id => 853, :num => 1},
      ],
    },
    2200 => { # クルセイダー
      :price => 49000,
      :after => {:kind => :W, :id => 4268},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 239, :num => 1},
        {:kind => :I, :id => 855, :num => 1},
      ],
    },
    2201 => { # 雷切
      :price => 42000,
      :after => {:kind => :W, :id => 4297},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 261, :num => 1},
        {:kind => :I, :id => 855, :num => 1},
      ],
    },
    2202 => { # 羅刹
      :price => 39200,
      :after => {:kind => :W, :id => 4323},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 288, :num => 1},
        {:kind => :I, :id => 853, :num => 1},
      ],
    },
    2203 => { # ドラゴンクライ
      :price => 32800,
      :after => {:kind => :W, :id => 4382},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 360, :num => 1},
        {:kind => :I, :id => 854, :num => 1},
      ],
    },
    2204 => { # 夢真彗星
      :price => 39200,
      :after => {:kind => :W, :id => 4518},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4499, :num => 1},
        {:kind => :I, :id => 854, :num => 1},
      ],
    },
    2205 => { # 黄泉ノ星
      :price => 39200,
      :after => {:kind => :W, :id => 4545},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4528, :num => 1},
        {:kind => :I, :id => 853, :num => 1},
      ],
    },
    2206 => { # 女王の懲罰
      :price => 44800,
      :after => {:kind => :W, :id => 4574},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4557, :num => 1},
        {:kind => :I, :id => 855, :num => 1},
      ],
    },
    2207 => { # ローレライ
      :price => 36400,
      :after => {:kind => :W, :id => 4601},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 653, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2208 => { # ブーメランオブギャラクシー
      :price => 43400,
      :after => {:kind => :W, :id => 4626},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4613, :num => 1},
        {:kind => :I, :id => 852, :num => 1},
      ],
    },
    2209 => { # 天帝球
      :price => 53200,
      :after => {:kind => :W, :id => 4647},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4641, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2210 => { # 月喰い
      :price => 35000,
      :after => {:kind => :W, :id => 4676},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4663, :num => 1},
        {:kind => :I, :id => 853, :num => 1},
      ],
    },
    2211 => { # 石油王
      :price => 28000,
      :after => {:kind => :W, :id => 4721},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4712, :num => 1},
        {:kind => :I, :id => 852, :num => 1},
      ],
    },
    2212 => { # アウトブレイク
      :price => 37800,
      :after => {:kind => :W, :id => 4738},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 819, :num => 1},
        {:kind => :I, :id => 852, :num => 1},
      ],
    },
    2213 => { # ジョーカー
      :price => 36400,
      :after => {:kind => :W, :id => 4759},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 836, :num => 1},
        {:kind => :I, :id => 852, :num => 1},
      ],
    },
    2214 => { # デメテル
      :price => 36400,
      :after => {:kind => :W, :id => 4782},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4768, :num => 1},
        {:kind => :I, :id => 855, :num => 1},
      ],
    },
    2215 => { # インフィニティセンス
      :price => 39200,
      :after => {:kind => :W, :id => 4805},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4798, :num => 1},
        {:kind => :I, :id => 852, :num => 1},
      ],
    },
    2216 => { # イシスの聖膣
      :price => 49000,
      :after => {:kind => :W, :id => 4847},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 937, :num => 1},
        {:kind => :I, :id => 855, :num => 1},
      ],
    },
    2217 => { # アンリミテッドアサルト
      :price => 16800,
      :after => {:kind => :A, :id => 432},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 424, :num => 1},
        {:kind => :I, :id => 855, :num => 1},
      ],
    },
    2218 => { # ヘルメスガード
      :price => 26600,
      :after => {:kind => :A, :id => 465},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 454, :num => 1},
        {:kind => :I, :id => 854, :num => 1},
      ],
    },
    2219 => { # メンアットアームズ
      :price => 26600,
      :after => {:kind => :A, :id => 483},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 474, :num => 1},
        {:kind => :I, :id => 854, :num => 1},
      ],
    },
    2220 => { # 魔甲アルケロン
      :price => 16800,
      :after => {:kind => :A, :id => 552},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 536, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2221 => { # 終焉のローブ
      :price => 20000,
      :after => {:kind => :A, :id => 574},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 563, :num => 1},
        {:kind => :I, :id => 854, :num => 1},
      ],
    },
    2222 => { # 守護天使のドレス
      :price => 53200,
      :after => {:kind => :A, :id => 610},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 600, :num => 1},
        {:kind => :I, :id => 855, :num => 1},
      ],
    },
    2223 => { # ブーストメイデン
      :price => 7000,
      :after => {:kind => :A, :id => 675},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 661, :num => 1},
        {:kind => :I, :id => 848, :num => 1},
      ],
    },
    2224 => { # ジャスティスメット
      :price => 18200,
      :after => {:kind => :A, :id => 701},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 691, :num => 1},
        {:kind => :I, :id => 854, :num => 1},
      ],
    },
    2225 => { # 竜姫炎皇の王冠
      :price => 24500,
      :after => {:kind => :A, :id => 808},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 796, :num => 1},
        {:kind => :I, :id => 854, :num => 1},
      ],
    },
    2226 => { # セカンドイージス
      :price => 21000,
      :after => {:kind => :A, :id => 860},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 850, :num => 1},
        {:kind => :I, :id => 854, :num => 1},
      ],
    },
    2227 => { # 慈悲と裁き
      :price => 33300,
      :after => {:kind => :W, :id => 4100},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 36, :num => 1},
        {:kind => :W, :id => 42, :num => 1},
        {:kind => :I, :id => 856, :num => 1},
      ],
    },
    2228 => { # 輝鏡剣ペルセウス
      :price => 45000,
      :after => {:kind => :W, :id => 4152},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 121, :num => 1},
        {:kind => :I, :id => 859, :num => 1},
      ],
    },
    2229 => { # 蝕魔蛭蟲槍
      :price => 41000,
      :after => {:kind => :W, :id => 4249},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4242, :num => 1},
        {:kind => :I, :id => 860, :num => 1},
      ],
    },
    2230 => { # 鏡水
      :price => 45000,
      :after => {:kind => :W, :id => 4298},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 266, :num => 1},
        {:kind => :I, :id => 858, :num => 1},
      ],
    },
    2231 => { # 修羅
      :price => 41500,
      :after => {:kind => :W, :id => 4324},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 287, :num => 1},
        {:kind => :I, :id => 856, :num => 1},
      ],
    },
    2232 => { # 死亡遊戯
      :price => 40000,
      :after => {:kind => :W, :id => 4355},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4339, :num => 1},
        {:kind => :I, :id => 859, :num => 1},
      ],
    },
    2233 => { # 冥帝斧
      :price => 56000,
      :after => {:kind => :W, :id => 4406},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4402, :num => 1},
        {:kind => :I, :id => 859, :num => 1},
      ],
    },
    2234 => { # 克己覇道
      :price => 34300,
      :after => {:kind => :W, :id => 4459},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4449, :num => 1},
        {:kind => :I, :id => 856, :num => 1},
      ],
    },
    2235 => { # オメガアデプタス
      :price => 42500,
      :after => {:kind => :W, :id => 4486},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 507, :num => 1},
        {:kind => :I, :id => 858, :num => 1},
      ],
    },
    2236 => { # 黙示の刻
      :price => 42000,
      :after => {:kind => :W, :id => 4519},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 545, :num => 1},
        {:kind => :I, :id => 858, :num => 1},
      ],
    },
    2237 => { # アポカリプスキラー
      :price => 42000,
      :after => {:kind => :W, :id => 4546},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4534, :num => 1},
        {:kind => :I, :id => 857, :num => 1},
      ],
    },
    2238 => { # 九頭竜
      :price => 48500,
      :after => {:kind => :W, :id => 4576},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4560, :num => 1},
        {:kind => :I, :id => 858, :num => 1},
      ],
    },
    2239 => { # 那由多の神おろし
      :price => 38000,
      :after => {:kind => :W, :id => 4702},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4692, :num => 1},
        {:kind => :W, :id => 4693, :num => 1},
        {:kind => :I, :id => 856, :num => 1},
      ],
    },
    2240 => { # ファンタジスタ
      :price => 38500,
      :after => {:kind => :W, :id => 4761},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4746, :num => 1},
        {:kind => :I, :id => 858, :num => 1},
      ],
    },
    2241 => { # 馘華皿サロメ
      :price => 39800,
      :after => {:kind => :W, :id => 4783},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4774, :num => 1},
        {:kind => :I, :id => 858, :num => 1},
      ],
    },
    2242 => { # 冥府の魔銃
      :price => 75000,
      :after => {:kind => :W, :id => 4829},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 912, :num => 1},
        {:kind => :I, :id => 856, :num => 1},
      ],
    },
    2243 => { # ジャスティススーツ
      :price => 15000,
      :after => {:kind => :A, :id => 407},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 396, :num => 1},
        {:kind => :I, :id => 860, :num => 1},
      ],
    },
    2244 => { # アトラス
      :price => 28000,
      :after => {:kind => :A, :id => 466},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 50, :num => 1},
        {:kind => :I, :id => 859, :num => 1},
      ],
    },
    2245 => { # ヘビーパワード
      :price => 30000,
      :after => {:kind => :A, :id => 514},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 492, :num => 1},
        {:kind => :I, :id => 859, :num => 1},
      ],
    },
    2246 => { # グランドマスタードレス
      :price => 56300,
      :after => {:kind => :A, :id => 611},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 599, :num => 1},
        {:kind => :I, :id => 860, :num => 1},
      ],
    },
    2247 => { # ラブアンドガイア
      :price => 60000,
      :after => {:kind => :A, :id => 641},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 627, :num => 1},
        {:kind => :I, :id => 858, :num => 1},
      ],
    },
    2248 => { # 紅闘気
      :price => 7500,
      :after => {:kind => :A, :id => 676},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 666, :num => 1},
        {:kind => :I, :id => 858, :num => 1},
      ],
    },
    2249 => { # 竜角神速の兜
      :price => 19400,
      :after => {:kind => :A, :id => 702},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 690, :num => 1},
        {:kind => :A, :id => 693, :num => 1},
        {:kind => :I, :id => 859, :num => 1},
      ],
    },
    2250 => { # ハイセキュリティー
      :price => 22000,
      :after => {:kind => :A, :id => 733},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 719, :num => 1},
        {:kind => :I, :id => 857, :num => 1},
      ],
    },
    2251 => { # 闇の法王
      :price => 20000,
      :after => {:kind => :A, :id => 775},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 757, :num => 1},
        {:kind => :I, :id => 856, :num => 1},
      ],
    },
    2252 => { # パンスペルミア
      :price => 26000,
      :after => {:kind => :A, :id => 809},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 270, :num => 1},
        {:kind => :I, :id => 857, :num => 1},
      ],
    },
    2253 => { # リフレクター
      :price => 15000,
      :after => {:kind => :A, :id => 834},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 829, :num => 1},
        {:kind => :I, :id => 857, :num => 1},
      ],
    },
    2254 => { # ガーディアン
      :price => 28000,
      :after => {:kind => :A, :id => 902},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 875, :num => 1},
        {:kind => :I, :id => 857, :num => 1},
      ],
    },
    2255 => { # 疾風刃フレイ
      :price => 35200,
      :after => {:kind => :W, :id => 4101},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4085, :num => 1},
        {:kind => :I, :id => 933, :num => 1},
      ],
    },
    2256 => { # 雷鳴刃フレイヤ
      :price => 35200,
      :after => {:kind => :W, :id => 4102},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4086, :num => 1},
        {:kind => :I, :id => 932, :num => 1},
      ],
    },
    2257 => { # マスターソード
      :price => 40000,
      :after => {:kind => :W, :id => 4124},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4115, :num => 1},
        {:kind => :I, :id => 862, :num => 1},
      ],
    },
    2258 => { # インフィニティ
      :price => 48000,
      :after => {:kind => :W, :id => 4154},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4153, :num => 1},
        {:kind => :I, :id => 935, :num => 1},
      ],
    },
    2259 => { # ドレッドノート
      :price => 56000,
      :after => {:kind => :W, :id => 4175},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 156, :num => 1},
        {:kind => :W, :id => 4186, :num => 1},
        {:kind => :I, :id => 935, :num => 1},
      ],
    },
    2260 => { # ダークドリーム
      :price => 44000,
      :after => {:kind => :W, :id => 4209},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4192, :num => 1},
        {:kind => :I, :id => 861, :num => 1},
      ],
    },
    2261 => { # V.
      :price => 50400,
      :after => {:kind => :W, :id => 4227},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4221, :num => 1},
        {:kind => :I, :id => 865, :num => 1},
      ],
    },
    2262 => { # 幾星槍
      :price => 57000,
      :after => {:kind => :W, :id => 4270},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4265, :num => 1},
        {:kind => :I, :id => 933, :num => 1},
      ],
    },
    2263 => { # 塵桜
      :price => 48000,
      :after => {:kind => :W, :id => 4299},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 260, :num => 1},
        {:kind => :I, :id => 861, :num => 1},
      ],
    },
    2264 => { # 破邪・干将
      :price => 44800,
      :after => {:kind => :W, :id => 4325},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 279, :num => 1},
        {:kind => :I, :id => 864, :num => 1},
      ],
    },
    2265 => { # 神祁・莫耶
      :price => 44800,
      :after => {:kind => :W, :id => 4326},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 280, :num => 1},
        {:kind => :I, :id => 863, :num => 1},
      ],
    },
    2266 => { # カイザーハート
      :price => 43500,
      :after => {:kind => :W, :id => 4356},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 329, :num => 1},
        {:kind => :I, :id => 930, :num => 1},
      ],
    },
    2267 => { # 裂帛
      :price => 37000,
      :after => {:kind => :W, :id => 4383},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4369, :num => 1},
        {:kind => :I, :id => 863, :num => 1},
      ],
    },
    2268 => { # 巨人の遺産
      :price => 59200,
      :after => {:kind => :W, :id => 4407},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 397, :num => 1},
        {:kind => :I, :id => 865, :num => 1},
      ],
    },
    2269 => { # クロマニヨン
      :price => 52500,
      :after => {:kind => :W, :id => 4434},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 439, :num => 1},
        {:kind => :I, :id => 865, :num => 1},
      ],
    },
    2270 => { # アヴェ・マリア
      :price => 45500,
      :after => {:kind => :W, :id => 4487},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4472, :num => 1},
        {:kind => :I, :id => 864, :num => 1},
      ],
    },
    2271 => { # アルテマウィザード
      :price => 44800,
      :after => {:kind => :W, :id => 4520},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4504, :num => 1},
        {:kind => :I, :id => 862, :num => 1},
      ],
    },
    2272 => { # 侵蝕蛭蟲弓
      :price => 44800,
      :after => {:kind => :W, :id => 4547},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4530, :num => 1},
        {:kind => :I, :id => 935, :num => 1},
      ],
    },
    2273 => { # テンタクルヘル
      :price => 51200,
      :after => {:kind => :W, :id => 4578},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 617, :num => 1},
        {:kind => :W, :id => 4577, :num => 1},
        {:kind => :I, :id => 861, :num => 1},
      ],
    },
    2274 => { # 冥琴アヌビス
      :price => 41600,
      :after => {:kind => :W, :id => 4603},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 652, :num => 1},
        {:kind => :W, :id => 654, :num => 1},
        {:kind => :I, :id => 931, :num => 1},
      ],
    },
    2275 => { # カリ・ユガ
      :price => 49600,
      :after => {:kind => :W, :id => 4627},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 697, :num => 1},
        {:kind => :I, :id => 865, :num => 1},
      ],
    },
    2276 => { # 滅神球
      :price => 61000,
      :after => {:kind => :W, :id => 4649},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4640, :num => 1},
        {:kind => :I, :id => 861, :num => 1},
      ],
    },
    2277 => { # 月と太陽・天地明察
      :price => 40000,
      :after => {:kind => :W, :id => 4678},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4668, :num => 1},
        {:kind => :I, :id => 934, :num => 1},
      ],
    },
    2278 => { # オルタナティブ
      :price => 33000,
      :after => {:kind => :W, :id => 4723},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4717, :num => 1},
        {:kind => :I, :id => 864, :num => 1},
      ],
    },
    2279 => { # ヒポクラテスの誓い
      :price => 43200,
      :after => {:kind => :W, :id => 4739},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 818, :num => 1},
        {:kind => :I, :id => 864, :num => 1},
      ],
    },
    2280 => { # 光と闇のカード
      :price => 42300,
      :after => {:kind => :W, :id => 4762},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 840, :num => 1},
        {:kind => :W, :id => 841, :num => 1},
        {:kind => :I, :id => 861, :num => 1},
      ],
    },
    2281 => { # 狂酔皿ディオニュソス
      :price => 42000,
      :after => {:kind => :W, :id => 4784},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 861, :num => 1},
        {:kind => :I, :id => 861, :num => 1},
      ],
    },
    2282 => { # 第九絶滅
      :price => 44800,
      :after => {:kind => :W, :id => 4807},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4794, :num => 1},
        {:kind => :I, :id => 865, :num => 1},
      ],
    },
    2283 => { # ディストピア
      :price => 56000,
      :after => {:kind => :W, :id => 4849},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4844, :num => 1},
        {:kind => :I, :id => 865, :num => 1},
      ],
    },
    2284 => { # カムイ
      :price => 16000,
      :after => {:kind => :A, :id => 409},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 401, :num => 1},
        {:kind => :I, :id => 862, :num => 1},
      ],
    },
    2285 => { # 怒りのドラゴン
      :price => 19200,
      :after => {:kind => :A, :id => 433},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 28, :num => 1},
        {:kind => :I, :id => 863, :num => 1},
      ],
    },
    2286 => { # 神竜の胸当て
      :price => 31000,
      :after => {:kind => :A, :id => 467},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 455, :num => 1},
        {:kind => :I, :id => 863, :num => 1},
      ],
    },
    2287 => { # 楯無
      :price => 32000,
      :after => {:kind => :A, :id => 516},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 493, :num => 1},
        {:kind => :I, :id => 932, :num => 1},
      ],
    },
    2288 => { # リボンズシェル
      :price => 20000,
      :after => {:kind => :A, :id => 554},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 542, :num => 1},
        {:kind => :I, :id => 864, :num => 1},
      ],
    },
    2289 => { # プラネットガイア
      :price => 24000,
      :after => {:kind => :A, :id => 576},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 144, :num => 1},
        {:kind => :I, :id => 934, :num => 1},
      ],
    },
    2290 => { # 究極神姫のドレス
      :price => 62800,
      :after => {:kind => :A, :id => 613},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 156, :num => 1},
        {:kind => :A, :id => 594, :num => 1},
        {:kind => :I, :id => 864, :num => 1},
      ],
    },
    2291 => { # 深き混沌のブラ
      :price => 64000,
      :after => {:kind => :A, :id => 642},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 629, :num => 1},
        {:kind => :I, :id => 865, :num => 1},
      ],
    },
    2292 => { # パイレーツクィーン
      :price => 8000,
      :after => {:kind => :A, :id => 677},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 659, :num => 1},
        {:kind => :I, :id => 935, :num => 1},
      ],
    },
    2293 => { # 栄輝の兜
      :price => 20800,
      :after => {:kind => :A, :id => 703},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 692, :num => 1},
        {:kind => :I, :id => 863, :num => 1},
      ],
    },
    2294 => { # 究極超重滅兜
      :price => 24500,
      :after => {:kind => :A, :id => 734},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 722, :num => 1},
        {:kind => :I, :id => 863, :num => 1},
      ],
    },
    2295 => { # ライトディライト
      :price => 20000,
      :after => {:kind => :A, :id => 776},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 756, :num => 1},
        {:kind => :I, :id => 864, :num => 1},
      ],
    },
    2296 => { # 花嫁のヴェール
      :price => 38000,
      :after => {:kind => :A, :id => 811},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 268, :num => 1},
        {:kind => :I, :id => 864, :num => 1},
      ],
    },
    2297 => { # 羅生門
      :price => 30800,
      :after => {:kind => :A, :id => 903},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 878, :num => 1},
        {:kind => :I, :id => 932, :num => 1},
      ],
    },
    2298 => { # 聖嗣刃エリヤ
      :price => 39600,
      :after => {:kind => :W, :id => 4105},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4088, :num => 1},
        {:kind => :I, :id => 936, :num => 1},
      ],
    },
    2299 => { # 凍戯刃ロキ
      :price => 39600,
      :after => {:kind => :W, :id => 4106},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4089, :num => 1},
        {:kind => :I, :id => 931, :num => 1},
      ],
    },
    2300 => { # 不朽剣ジークフリート
      :price => 45000,
      :after => {:kind => :W, :id => 4125},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4116, :num => 1},
        {:kind => :I, :id => 871, :num => 1},
      ],
    },
    2301 => { # 天韻剣ヘイムダル
      :price => 45000,
      :after => {:kind => :W, :id => 4126},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4117, :num => 1},
        {:kind => :I, :id => 872, :num => 1},
      ],
    },
    2302 => { # 黎明剣ギルガメシュ
      :price => 54000,
      :after => {:kind => :W, :id => 4158},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4138, :num => 1},
        {:kind => :I, :id => 873, :num => 1},
      ],
    },
    2303 => { # 万廻剣クロノス
      :price => 54000,
      :after => {:kind => :W, :id => 4159},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4139, :num => 1},
        {:kind => :I, :id => 869, :num => 1},
      ],
    },
    2304 => { # 滅神剣シヴァ
      :price => 63000,
      :after => {:kind => :W, :id => 4179},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4168, :num => 1},
        {:kind => :I, :id => 931, :num => 1},
      ],
    },
    2305 => { # 覇炎剣アレス
      :price => 63000,
      :after => {:kind => :W, :id => 4180},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4169, :num => 1},
        {:kind => :I, :id => 930, :num => 1},
      ],
    },
    2306 => { # 流炎剣メルクリウス
      :price => 49500,
      :after => {:kind => :W, :id => 4212},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4195, :num => 1},
        {:kind => :I, :id => 930, :num => 1},
      ],
    },
    2307 => { # 氷魂剣ブリュンヒルド
      :price => 49500,
      :after => {:kind => :W, :id => 4213},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4196, :num => 1},
        {:kind => :I, :id => 931, :num => 1},
      ],
    },
    2308 => { # 滅身剣クラウ・ソラス
      :price => 56700,
      :after => {:kind => :W, :id => 4230},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 183, :num => 1},
        {:kind => :I, :id => 871, :num => 1},
      ],
    },
    2309 => { # 呪叫剣テュルフィング
      :price => 56700,
      :after => {:kind => :W, :id => 4231},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 184, :num => 1},
        {:kind => :I, :id => 870, :num => 1},
      ],
    },
    2310 => { # 蒼海矛ポセイドン
      :price => 63000,
      :after => {:kind => :W, :id => 4273},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4258, :num => 1},
        {:kind => :I, :id => 935, :num => 1},
      ],
    },
    2311 => { # 滅穿槍ゲイボルグ
      :price => 63000,
      :after => {:kind => :W, :id => 4274},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4259, :num => 1},
        {:kind => :I, :id => 874, :num => 1},
      ],
    },
    2312 => { # 九魂七支刀
      :price => 54000,
      :after => {:kind => :W, :id => 4303},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4286, :num => 1},
        {:kind => :I, :id => 936, :num => 1},
      ],
    },
    2313 => { # 暴雄刀スサノオ
      :price => 54000,
      :after => {:kind => :W, :id => 4304},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4287, :num => 1},
        {:kind => :I, :id => 870, :num => 1},
      ],
    },
    2314 => { # 死刻刃イザナミ
      :price => 50400,
      :after => {:kind => :W, :id => 4328},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4316, :num => 1},
        {:kind => :I, :id => 937, :num => 1},
      ],
    },
    2315 => { # 生刻刃イザナギ
      :price => 50400,
      :after => {:kind => :W, :id => 4329},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4315, :num => 1},
        {:kind => :I, :id => 936, :num => 1},
      ],
    },
    2316 => { # 獄炎拳アグニ
      :price => 48600,
      :after => {:kind => :W, :id => 4363},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4342, :num => 1},
        {:kind => :I, :id => 930, :num => 1},
      ],
    },
    2317 => { # 地母拳キュベレ
      :price => 48600,
      :after => {:kind => :W, :id => 4364},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4343, :num => 1},
        {:kind => :I, :id => 869, :num => 1},
      ],
    },
    2318 => { # 終狼牙フェンリル
      :price => 41400,
      :after => {:kind => :W, :id => 4386},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4374, :num => 1},
        {:kind => :I, :id => 872, :num => 1},
      ],
    },
    2319 => { # 覇竜牙バハムート
      :price => 41400,
      :after => {:kind => :W, :id => 4387},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4375, :num => 1},
        {:kind => :I, :id => 874, :num => 1},
      ],
    },
    2320 => { # 征服斧イスカンダル
      :price => 66600,
      :after => {:kind => :W, :id => 4411},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4395, :num => 1},
        {:kind => :I, :id => 874, :num => 1},
      ],
    },
    2321 => { # 蹂躙斧グラシャラボラス
      :price => 66600,
      :after => {:kind => :W, :id => 4412},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4396, :num => 1},
        {:kind => :I, :id => 873, :num => 1},
      ],
    },
    2322 => { # 憤怒棍ヘラクレス
      :price => 57600,
      :after => {:kind => :W, :id => 4438},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4422, :num => 1},
        {:kind => :I, :id => 870, :num => 1},
      ],
    },
    2323 => { # 英傑棍ダグザ
      :price => 57600,
      :after => {:kind => :W, :id => 4439},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4423, :num => 1},
        {:kind => :I, :id => 871, :num => 1},
      ],
    },
    2324 => { # 冥獄鎌ハデス
      :price => 44100,
      :after => {:kind => :W, :id => 4462},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4451, :num => 1},
        {:kind => :I, :id => 937, :num => 1},
      ],
    },
    2325 => { # 光獄鎌ヘル
      :price => 44100,
      :after => {:kind => :W, :id => 4463},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4452, :num => 1},
        {:kind => :I, :id => 936, :num => 1},
      ],
    },
    2326 => { # 神鳴杖ホルス
      :price => 50400,
      :after => {:kind => :W, :id => 4489},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4475, :num => 1},
        {:kind => :I, :id => 936, :num => 1},
      ],
    },
    2327 => { # 誓刻杖トト
      :price => 50400,
      :after => {:kind => :W, :id => 4490},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4476, :num => 1},
        {:kind => :I, :id => 870, :num => 1},
      ],
    },
    2328 => { # 創世杖ブラフマー
      :price => 50400,
      :after => {:kind => :W, :id => 4522},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4505, :num => 1},
        {:kind => :I, :id => 936, :num => 1},
      ],
    },
    2329 => { # 虐悪杖アーリマン
      :price => 50400,
      :after => {:kind => :W, :id => 4523},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4506, :num => 1},
        {:kind => :I, :id => 937, :num => 1},
      ],
    },
    2330 => { # 滅魔弓ヴィシュヌ
      :price => 50400,
      :after => {:kind => :W, :id => 4549},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4535, :num => 1},
        {:kind => :I, :id => 872, :num => 1},
      ],
    },
    2331 => { # 雷帝弓インドラ
      :price => 50400,
      :after => {:kind => :W, :id => 4550},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4536, :num => 1},
        {:kind => :I, :id => 932, :num => 1},
      ],
    },
    2332 => { # 螺神鞭ペンテシレア
      :price => 57600,
      :after => {:kind => :W, :id => 4582},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4563, :num => 1},
        {:kind => :I, :id => 870, :num => 1},
      ],
    },
    2333 => { # 傾枷鞭アルテミシア
      :price => 57600,
      :after => {:kind => :W, :id => 4583},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4564, :num => 1},
        {:kind => :I, :id => 869, :num => 1},
      ],
    },
    2334 => { # 詠眠輪ヒュプノス
      :price => 55800,
      :after => {:kind => :W, :id => 4630},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4617, :num => 1},
        {:kind => :I, :id => 869, :num => 1},
      ],
    },
    2335 => { # 死柱輪タナトス
      :price => 55800,
      :after => {:kind => :W, :id => 4631},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4618, :num => 1},
        {:kind => :I, :id => 937, :num => 1},
      ],
    },
    2336 => { # 巨蛇球ヨルムンガンド
      :price => 68400,
      :after => {:kind => :W, :id => 4651},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 721, :num => 1},
        {:kind => :I, :id => 869, :num => 1},
      ],
    },
    2337 => { # 常陽扇アマテラス
      :price => 45000,
      :after => {:kind => :W, :id => 4681},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4669, :num => 1},
        {:kind => :I, :id => 936, :num => 1},
      ],
    },
    2338 => { # 月禁扇ツクヨミ
      :price => 45000,
      :after => {:kind => :W, :id => 4682},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4670, :num => 1},
        {:kind => :I, :id => 937, :num => 1},
      ],
    },
    2339 => { # 禁霊銃ネピリム終式
      :price => 85000,
      :after => {:kind => :W, :id => 4835},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4822, :num => 1},
        {:kind => :I, :id => 871, :num => 1},
      ],
    },
    2340 => { # 讐霊銃ネメシス零式
      :price => 85000,
      :after => {:kind => :W, :id => 4836},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4823, :num => 1},
        {:kind => :I, :id => 869, :num => 1},
      ],
    },
    2341 => { # 覇竜炎帝の鎧
      :price => 44000,
      :after => {:kind => :A, :id => 520},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 507, :num => 1},
        {:kind => :I, :id => 873, :num => 1},
      ],
    },
    2342 => { # 冥兜黄泉桜鎧
      :price => 36000,
      :after => {:kind => :A, :id => 521},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 494, :num => 1},
        {:kind => :A, :id => 508, :num => 1},
        {:kind => :I, :id => 872, :num => 1},
      ],
    },
    2343 => { # 覇竜炎帝の兜
      :price => 27000,
      :after => {:kind => :A, :id => 738},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 727, :num => 1},
        {:kind => :I, :id => 873, :num => 1},
      ],
    },
    2344 => { # 冥兜黄泉神守
      :price => 25000,
      :after => {:kind => :A, :id => 739},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 714, :num => 1},
        {:kind => :A, :id => 728, :num => 1},
        {:kind => :I, :id => 872, :num => 1},
      ],
    },
    2345 => { # 覇竜炎帝の盾
      :price => 38000,
      :after => {:kind => :A, :id => 910},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 895, :num => 1},
        {:kind => :I, :id => 873, :num => 1},
      ],
    },
    2346 => { # 冥兜黄泉雲盾
      :price => 36000,
      :after => {:kind => :A, :id => 911},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 877, :num => 1},
        {:kind => :A, :id => 897, :num => 1},
        {:kind => :I, :id => 872, :num => 1},
      ],
    },
    2347 => { # カンナギ
      :price => 49000,
      :after => {:kind => :W, :id => 4155},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4136, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2348 => { # 斬鉄剣・曙光
      :price => 62000,
      :after => {:kind => :W, :id => 4176},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4172, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2349 => { # 邪皇七星剣
      :price => 55000,
      :after => {:kind => :W, :id => 4300},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4289, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2350 => { # 四聖西覇白虎の牙
      :price => 41400,
      :after => {:kind => :W, :id => 4384},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 358, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2351 => { # 四海大聖如意棒
      :price => 54000,
      :after => {:kind => :W, :id => 4435},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4424, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2352 => { # 太極・封神禁鞭
      :price => 57500,
      :after => {:kind => :W, :id => 4579},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4566, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2353 => { # 四聖南覇朱雀の鎧
      :price => 34000,
      :after => {:kind => :A, :id => 517},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 488, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2354 => { # 源氏の鎧・マガツ
      :price => 34000,
      :after => {:kind => :A, :id => 518},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 98, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2355 => { # 四聖東覇青龍の兜
      :price => 26000,
      :after => {:kind => :A, :id => 735},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 230, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2356 => { # 源氏の兜・マガツ
      :price => 26000,
      :after => {:kind => :A, :id => 736},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 227, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2357 => { # 四聖北覇玄武の盾
      :price => 33000,
      :after => {:kind => :A, :id => 906},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 327, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2358 => { # 源氏の盾・マガツ
      :price => 33000,
      :after => {:kind => :A, :id => 907},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 322, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2359 => { # 真・絶風槍シルフ
      :price => 48000,
      :after => {:kind => :W, :id => 4250},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4243, :num => 1},
        {:kind => :I, :id => 868, :num => 1},
      ],
    },
    2360 => { # 真・鏡水刀ウンディーネ
      :price => 55000,
      :after => {:kind => :W, :id => 4301},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4288, :num => 1},
        {:kind => :I, :id => 868, :num => 1},
      ],
    },
    2361 => { # 真・灼炎拳サラマンダー
      :price => 48600,
      :after => {:kind => :W, :id => 4358},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4344, :num => 1},
        {:kind => :I, :id => 868, :num => 1},
      ],
    },
    2362 => { # 真・烈土斧ノーム
      :price => 66600,
      :after => {:kind => :W, :id => 4408},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4397, :num => 1},
        {:kind => :I, :id => 868, :num => 1},
      ],
    },
    2363 => { # 魔閃剣グラム
      :price => 44000,
      :after => {:kind => :W, :id => 4107},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4097, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 881, :num => 1},
      ],
    },
    2364 => { # 聖皇剣エクスカリバー
      :price => 60000,
      :after => {:kind => :W, :id => 4160},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4141, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 883, :num => 1},
      ],
    },
    2365 => { # 輝炎剣レーヴァテイン
      :price => 70000,
      :after => {:kind => :W, :id => 4181},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4177, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 879, :num => 1},
      ],
    },
    2366 => { # 無詠剣エテメンアンキ
      :price => 63000,
      :after => {:kind => :W, :id => 4232},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 185, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 881, :num => 1},
      ],
    },
    2367 => { # 覇界槍グングニル
      :price => 70000,
      :after => {:kind => :W, :id => 4275},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4266, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 883, :num => 1},
      ],
    },
    2368 => { # 統皇刀フツノミタマ
      :price => 60000,
      :after => {:kind => :W, :id => 4305},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4296, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 881, :num => 1},
      ],
    },
    2369 => { # 邪神拳ソウルジハード
      :price => 54000,
      :after => {:kind => :W, :id => 4365},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4345, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 879, :num => 1},
      ],
    },
    2370 => { # 雷神のミョルニル
      :price => 65000,
      :after => {:kind => :W, :id => 4440},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 438, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 880, :num => 1},
      ],
    },
    2371 => { # 冥府黄泉舞鎌
      :price => 49000,
      :after => {:kind => :W, :id => 4464},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 468, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 881, :num => 1},
      ],
    },
    2372 => { # 神雷杖ゼウス
      :price => 56000,
      :after => {:kind => :W, :id => 4491},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4485, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 880, :num => 1},
      ],
    },
    2373 => { # 輝月弓アルテミス
      :price => 56000,
      :after => {:kind => :W, :id => 4551},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 583, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 880, :num => 1},
      ],
    },
    2374 => { # 世喰鞭ウロボロス
      :price => 64000,
      :after => {:kind => :W, :id => 4584},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 616, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 882, :num => 1},
      ],
    },
    2375 => { # アポロン・ケイオス
      :price => 52000,
      :after => {:kind => :W, :id => 4605},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4589, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 879, :num => 1},
      ],
    },
    2376 => { # オサカナウェポン
      :price => 43400,
      :after => {:kind => :W, :id => 4632},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4619, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 881, :num => 1},
      ],
    },
    2377 => { # 覇球ミドガルズオルム
      :price => 76000,
      :after => {:kind => :W, :id => 4652},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4648, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 882, :num => 1},
      ],
    },
    2378 => { # 豊伽刃ヘスティア
      :price => 50000,
      :after => {:kind => :W, :id => 4704},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4694, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 883, :num => 1},
      ],
    },
    2379 => { # 神算盤ヘルメス
      :price => 40000,
      :after => {:kind => :W, :id => 4725},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4713, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 883, :num => 1},
      ],
    },
    2380 => { # 癒水刃ブリギット
      :price => 54000,
      :after => {:kind => :W, :id => 4742},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4729, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 881, :num => 1},
      ],
    },
    2381 => { # 覇禁札ラー
      :price => 52000,
      :after => {:kind => :W, :id => 4764},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4748, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 879, :num => 1},
      ],
    },
    2382 => { # 五穀皿・神農
      :price => 52000,
      :after => {:kind => :W, :id => 4786},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4770, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 882, :num => 1},
      ],
    },
    2383 => { # カオスレコード
      :price => 56000,
      :after => {:kind => :W, :id => 4811},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4795, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 882, :num => 1},
      ],
    },
    2384 => { # 真アルティメイトマスケット
      :price => 90000,
      :after => {:kind => :W, :id => 4837},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4820, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 880, :num => 1},
      ],
    },
    2385 => { # 淫欲禍アフロディーテ
      :price => 70000,
      :after => {:kind => :W, :id => 4851},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4841, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 882, :num => 1},
      ],
    },
    2386 => { # ブレイブフルフォース
      :price => 20000,
      :after => {:kind => :A, :id => 414},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 408, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 879, :num => 1},
      ],
    },
    2387 => { # 神闘衣オシリス
      :price => 24000,
      :after => {:kind => :A, :id => 435},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 425, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 880, :num => 1},
      ],
    },
    2388 => { # 覇天鎧アテナ
      :price => 40000,
      :after => {:kind => :A, :id => 522},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 511, :num => 1},
        {:kind => :I, :id => 878, :num => 1},
        {:kind => :I, :id => 883, :num => 1},
      ],
    },
    2389 => { # イオンブレード
      :price => 37500,
      :after => {:kind => :W, :id => 4103},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4081, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2390 => { # フレデリカ兵装XIII終式
      :price => 57000,
      :after => {:kind => :W, :id => 4357},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4335, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2391 => { # プリンキピア
      :price => 61600,
      :after => {:kind => :W, :id => 4808},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4799, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2392 => { # メギドファイア
      :price => 85000,
      :after => {:kind => :W, :id => 4828},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4824, :num => 1},
        {:kind => :I, :id => 851, :num => 1},
      ],
    },
    2393 => { # ドゥームズデイ
      :price => 94000,
      :after => {:kind => :W, :id => 4832},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4828, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2394 => { # プロトコルゼロ
      :price => 20000,
      :after => {:kind => :A, :id => 410},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 400, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2395 => { # ヒルベルト増幅装甲・最終型
      :price => 38000,
      :after => {:kind => :A, :id => 468},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 457, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2396 => { # フィロソフィア
      :price => 30000,
      :after => {:kind => :A, :id => 577},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 568, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2397 => { # デバイスロード
      :price => 32000,
      :after => {:kind => :A, :id => 578},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 568, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2398 => { # サイボーグビキニ
      :price => 80000,
      :after => {:kind => :A, :id => 643},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 626, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2399 => { # 量子観測バイザー
      :price => 10000,
      :after => {:kind => :A, :id => 678},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 670, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2400 => { # CHエクスコンバーター
      :price => 26000,
      :after => {:kind => :A, :id => 704},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 696, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2401 => { # メガビームシールド
      :price => 24000,
      :after => {:kind => :A, :id => 861},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 851, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2402 => { # 絶対防御の盾
      :price => 31000,
      :after => {:kind => :A, :id => 904},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 331, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2403 => { # アンチカオスプレート・最終型
      :price => 42000,
      :after => {:kind => :A, :id => 905},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 892, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2404 => { # アルテイストの誇り
      :price => 59400,
      :after => {:kind => :W, :id => 4740},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4733, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2405 => { # 傀儡炸筒・影瑠璃
      :price => 92000,
      :after => {:kind => :W, :id => 4833},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4830, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2406 => { # 傀儡炸筒・紬舞
      :price => 92000,
      :after => {:kind => :W, :id => 4834},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4831, :num => 1},
        {:kind => :I, :id => 866, :num => 1},
      ],
    },
    2407 => { # 求道者の白衣・瞑目
      :price => 21000,
      :after => {:kind => :A, :id => 411},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 405, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2408 => { # 求道者の黒衣・紬碧
      :price => 21000,
      :after => {:kind => :A, :id => 412},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 406, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2409 => { # 求道者の黒頭巾・流影
      :price => 11000,
      :after => {:kind => :A, :id => 679},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 674, :num => 1},
        {:kind => :I, :id => 867, :num => 1},
      ],
    },
    2410 => { # 天軍聖剣
      :price => 66000,
      :after => {:kind => :W, :id => 4163},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4140, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2411 => { # ガンランスΩ
      :price => 60500,
      :after => {:kind => :W, :id => 4252},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4247, :num => 1},
        {:kind => :I, :id => 875, :num => 1},
      ],
    },
    2412 => { # 聖槍ロンギヌス・トリプル
      :price => 77000,
      :after => {:kind => :W, :id => 4271},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4262, :num => 1},
        {:kind => :W, :id => 4269, :num => 1},
        {:kind => :I, :id => 875, :num => 1},
      ],
    },
    2413 => { # グラビティハンドΩ
      :price => 59400,
      :after => {:kind => :W, :id => 4359},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4341, :num => 1},
        {:kind => :I, :id => 875, :num => 1},
      ],
    },
    2414 => { # 明星聖弓
      :price => 61600,
      :after => {:kind => :W, :id => 4553},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4537, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2415 => { # 創世弓イリアスハート
      :price => 62300,
      :after => {:kind => :W, :id => 4554},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4544, :num => 1},
        {:kind => :I, :id => 889, :num => 1},
      ],
    },
    2416 => { # グノーシス黙示録
      :price => 61600,
      :after => {:kind => :W, :id => 4809},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4800, :num => 1},
        {:kind => :I, :id => 875, :num => 1},
      ],
    },
    2417 => { # シオンの闘衣
      :price => 26000,
      :after => {:kind => :A, :id => 434},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 428, :num => 1},
        {:kind => :I, :id => 875, :num => 1},
      ],
    },
    2418 => { # 天軍聖鎧
      :price => 48000,
      :after => {:kind => :A, :id => 524},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 504, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2419 => { # グノーシスローブ
      :price => 33000,
      :after => {:kind => :A, :id => 579},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 569, :num => 1},
        {:kind => :I, :id => 875, :num => 1},
      ],
    },
    2420 => { # 聖百合のローブ
      :price => 33000,
      :after => {:kind => :A, :id => 581},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 566, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2421 => { # 創世開闢女神のドレス
      :price => 83600,
      :after => {:kind => :A, :id => 615},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 602, :num => 1},
        {:kind => :A, :id => 608, :num => 1},
        {:kind => :I, :id => 889, :num => 1},
      ],
    },
    2422 => { # トリプルエデンの衣
      :price => 82000,
      :after => {:kind => :A, :id => 644},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 632, :num => 1},
        {:kind => :I, :id => 875, :num => 1},
      ],
    },
    2423 => { # 聖衣・黙示二十七ノ明星
      :price => 85000,
      :after => {:kind => :A, :id => 646},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 634, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2424 => { # 聖母の薄衣
      :price => 84000,
      :after => {:kind => :A, :id => 647},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 645, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2425 => { # ディーノサイド
      :price => 84000,
      :after => {:kind => :A, :id => 648},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 630, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2426 => { # ナノレオタード
      :price => 84000,
      :after => {:kind => :A, :id => 649},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 626, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2427 => { # 天軍聖兜
      :price => 36000,
      :after => {:kind => :A, :id => 741},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 724, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2428 => { # 最終神機ヘッドXA
      :price => 35000,
      :after => {:kind => :A, :id => 742},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 711, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2429 => { # サードアイ
      :price => 28600,
      :after => {:kind => :A, :id => 779},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 763, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2430 => { # 熾天使の冠・聖天歓喜
      :price => 40000,
      :after => {:kind => :A, :id => 812},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 799, :num => 1},
        {:kind => :I, :id => 875, :num => 1},
      ],
    },
    2431 => { # 聖冠・福音二十四ノ明星
      :price => 45000,
      :after => {:kind => :A, :id => 814},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 801, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2432 => { # 聖母の魔冠
      :price => 42000,
      :after => {:kind => :A, :id => 815},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 798, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2433 => { # 聖百合のティアラ
      :price => 42000,
      :after => {:kind => :A, :id => 816},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 797, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2434 => { # シリコンギア
      :price => 42000,
      :after => {:kind => :A, :id => 817},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 794, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2435 => { # 創世開闢女神のティアラ
      :price => 46000,
      :after => {:kind => :A, :id => 821},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 800, :num => 1},
        {:kind => :A, :id => 806, :num => 1},
        {:kind => :I, :id => 889, :num => 1},
      ],
    },
    2436 => { # マザートーラー
      :price => 22000,
      :after => {:kind => :A, :id => 835},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 828, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2437 => { # シャーデンフロイデ
      :price => 22000,
      :after => {:kind => :A, :id => 836},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 824, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2438 => { # オーディガス
      :price => 30000,
      :after => {:kind => :A, :id => 864},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 849, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2439 => { # 創世開闢女神の盾
      :price => 35000,
      :after => {:kind => :A, :id => 866},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 852, :num => 1},
        {:kind => :A, :id => 857, :num => 1},
        {:kind => :I, :id => 889, :num => 1},
      ],
    },
    2440 => { # 熾天使の盾・破邪顕正
      :price => 42000,
      :after => {:kind => :A, :id => 908},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 886, :num => 1},
        {:kind => :I, :id => 875, :num => 1},
      ],
    },
    2441 => { # 天軍聖盾
      :price => 45000,
      :after => {:kind => :A, :id => 914},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 893, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2442 => { # 聖盾・外典十二ノ明星
      :price => 45000,
      :after => {:kind => :A, :id => 915},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 887, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2443 => { # 神機シールドORS
      :price => 44000,
      :after => {:kind => :A, :id => 916},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 904, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2444 => { # ハイディフレクター
      :price => 44000,
      :after => {:kind => :A, :id => 917},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 904, :num => 1},
        {:kind => :I, :id => 885, :num => 1},
      ],
    },
    2445 => { # 魔皇剣ブラッディローズ
      :price => 60500,
      :after => {:kind => :W, :id => 4214},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4197, :num => 1},
        {:kind => :I, :id => 884, :num => 1},
      ],
    },
    2446 => { # 邪神剣アリスフィーズ
      :price => 62000,
      :after => {:kind => :W, :id => 4215},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4207, :num => 1},
        {:kind => :I, :id => 890, :num => 1},
      ],
    },
    2447 => { # アポカリプス・アリス
      :price => 50600,
      :after => {:kind => :W, :id => 4389},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4373, :num => 1},
        {:kind => :I, :id => 884, :num => 1},
      ],
    },
    2448 => { # 邪皇杖アリスクロニクル
      :price => 56000,
      :after => {:kind => :W, :id => 4525},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4507, :num => 1},
        {:kind => :I, :id => 884, :num => 1},
      ],
    },
    2449 => { # リリスナイトメア
      :price => 70400,
      :after => {:kind => :W, :id => 4580},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4565, :num => 1},
        {:kind => :I, :id => 876, :num => 1},
      ],
    },
    2450 => { # カナデブーメラン
      :price => 62000,
      :after => {:kind => :W, :id => 4633},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4622, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2451 => { # 邪神の鉄球
      :price => 83600,
      :after => {:kind => :W, :id => 4654},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4636, :num => 1},
        {:kind => :I, :id => 884, :num => 1},
      ],
    },
    2452 => { # アスタロトドリーム
      :price => 50000,
      :after => {:kind => :W, :id => 4679},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4671, :num => 1},
        {:kind => :I, :id => 876, :num => 1},
      ],
    },
    2453 => { # 白面金毛九尾扇
      :price => 50000,
      :after => {:kind => :W, :id => 4683},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4667, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2454 => { # 邪神覇皇の書
      :price => 61600,
      :after => {:kind => :W, :id => 4812},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4801, :num => 1},
        {:kind => :I, :id => 884, :num => 1},
      ],
    },
    2455 => { # ナイトメアセーター
      :price => 22000,
      :after => {:kind => :A, :id => 413},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 387, :num => 1},
        {:kind => :I, :id => 876, :num => 1},
      ],
    },
    2456 => { # 侵蝕され尽くしたコート
      :price => 22200,
      :after => {:kind => :A, :id => 415},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 398, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2457 => { # リリスの魔装束
      :price => 26200,
      :after => {:kind => :A, :id => 436},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 427, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2458 => { # 魔閤覇王鎧
      :price => 48000,
      :after => {:kind => :A, :id => 526},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 500, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2459 => { # 魔帝衣グレゴリア
      :price => 49000,
      :after => {:kind => :A, :id => 527},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 500, :num => 1},
        {:kind => :I, :id => 884, :num => 1},
      ],
    },
    2460 => { # 邪神覇皇の鎧
      :price => 50000,
      :after => {:kind => :A, :id => 528},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 502, :num => 1},
        {:kind => :A, :id => 513, :num => 1},
        {:kind => :I, :id => 890, :num => 1},
      ],
    },
    2461 => { # 九尾の魔装
      :price => 34000,
      :after => {:kind => :A, :id => 582},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 565, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2462 => { # 千樹華音のローブ
      :price => 33000,
      :after => {:kind => :A, :id => 583},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 566, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2463 => { # カナデローブ
      :price => 33000,
      :after => {:kind => :A, :id => 584},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 561, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2464 => { # 終末ワンダーランド
      :price => 35000,
      :after => {:kind => :A, :id => 585},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 564, :num => 1},
        {:kind => :I, :id => 884, :num => 1},
      ],
    },
    2465 => { # ナイトメアビスチェ
      :price => 82000,
      :after => {:kind => :A, :id => 645},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 631, :num => 1},
        {:kind => :I, :id => 876, :num => 1},
      ],
    },
    2466 => { # バビロンの大淫婦
      :price => 88000,
      :after => {:kind => :A, :id => 650},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 645, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2467 => { # 侵蝕され尽くした帽子
      :price => 11000,
      :after => {:kind => :A, :id => 682},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 665, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2468 => { # 魔閤覇王兜
      :price => 36000,
      :after => {:kind => :A, :id => 743},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 712, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2469 => { # 魔を統べる者の兜
      :price => 37000,
      :after => {:kind => :A, :id => 744},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 712, :num => 1},
        {:kind => :I, :id => 884, :num => 1},
      ],
    },
    2470 => { # 邪神覇皇の兜
      :price => 38200,
      :after => {:kind => :A, :id => 745},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 721, :num => 1},
        {:kind => :A, :id => 732, :num => 1},
        {:kind => :I, :id => 890, :num => 1},
      ],
    },
    2471 => { # 上弦の月
      :price => 28600,
      :after => {:kind => :A, :id => 780},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 256, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2472 => { # 神魔兎々
      :price => 30000,
      :after => {:kind => :A, :id => 781},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 764, :num => 1},
        {:kind => :I, :id => 884, :num => 1},
      ],
    },
    2473 => { # ナイトメアティアラ
      :price => 40000,
      :after => {:kind => :A, :id => 813},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 798, :num => 1},
        {:kind => :I, :id => 876, :num => 1},
      ],
    },
    2474 => { # アルカディア
      :price => 41000,
      :after => {:kind => :A, :id => 818},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 813, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2475 => { # ナノクラウンジェル
      :price => 41000,
      :after => {:kind => :A, :id => 819},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 793, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2476 => { # 世界樹の冠
      :price => 41000,
      :after => {:kind => :A, :id => 820},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 802, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2477 => { # サイ・フィールド
      :price => 20000,
      :after => {:kind => :A, :id => 837},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 830, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2478 => { # ユグドラシルの盾
      :price => 21000,
      :after => {:kind => :A, :id => 838},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 824, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2479 => { # 月天装
      :price => 30000,
      :after => {:kind => :A, :id => 865},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 849, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2480 => { # 魔閤覇王盾
      :price => 45000,
      :after => {:kind => :A, :id => 918},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 884, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    2481 => { # 十六魔王闇盾
      :price => 46000,
      :after => {:kind => :A, :id => 919},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 884, :num => 1},
        {:kind => :I, :id => 884, :num => 1},
      ],
    },
    2482 => { # 鏡の国のアリス
      :price => 46000,
      :after => {:kind => :A, :id => 920},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 885, :num => 1},
        {:kind => :I, :id => 884, :num => 1},
      ],
    },
    2483 => { # 邪神覇皇の盾
      :price => 47000,
      :after => {:kind => :A, :id => 921},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 889, :num => 1},
        {:kind => :A, :id => 901, :num => 1},
        {:kind => :I, :id => 890, :num => 1},
      ],
    },
    2484 => { # 暗黒剣エンドハイロウ
      :price => 60000,
      :after => {:kind => :W, :id => 4127},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4112, :num => 1},
        {:kind => :I, :id => 877, :num => 1},
      ],
    },
    2485 => { # 最終英雄剣ハインリヒ
      :price => 65000,
      :after => {:kind => :W, :id => 4162},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4148, :num => 1},
        {:kind => :I, :id => 877, :num => 1},
      ],
    },
    2486 => { # 魔王殺し・終式
      :price => 69300,
      :after => {:kind => :W, :id => 4233},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4226, :num => 1},
        {:kind => :I, :id => 877, :num => 1},
      ],
    },
    2487 => { # 英雄の輝鎧
      :price => 44000,
      :after => {:kind => :A, :id => 523},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 501, :num => 1},
        {:kind => :I, :id => 877, :num => 1},
      ],
    },
    2488 => { # 英雄の輝兜
      :price => 30000,
      :after => {:kind => :A, :id => 740},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 720, :num => 1},
        {:kind => :I, :id => 877, :num => 1},
      ],
    },
    2489 => { # 英雄の輝盾
      :price => 40000,
      :after => {:kind => :A, :id => 913},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 888, :num => 1},
        {:kind => :I, :id => 877, :num => 1},
      ],
    },
    2490 => { # 混沌剣カオスハイロウ
      :price => 99900,
      :after => {:kind => :W, :id => 4128},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4118, :num => 1},
        {:kind => :W, :id => 4127, :num => 1},
        {:kind => :I, :id => 888, :num => 1},
      ],
    },
    2491 => { # 英雄剣イデア・ルカス
      :price => 66000,
      :after => {:kind => :W, :id => 4164},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4148, :num => 1},
        {:kind => :I, :id => 888, :num => 1},
      ],
    },
    2492 => { # 紅廻剣クレオ・アドラ
      :price => 77000,
      :after => {:kind => :W, :id => 4182},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4178, :num => 1},
        {:kind => :I, :id => 888, :num => 1},
      ],
    },
    2493 => { # 魔神剣リベリオン
      :price => 80000,
      :after => {:kind => :W, :id => 4183},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4174, :num => 1},
        {:kind => :I, :id => 888, :num => 1},
      ],
    },
    2494 => { # 白廻爪アピロ・ラゴス
      :price => 60000,
      :after => {:kind => :W, :id => 4366},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4361, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2495 => { # 輪廻棍エクスソニア
      :price => 70400,
      :after => {:kind => :W, :id => 4442},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4436, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2496 => { # 永劫と終焉の鎌
      :price => 53900,
      :after => {:kind => :W, :id => 4466},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 470, :num => 1},
        {:kind => :W, :id => 4450, :num => 1},
        {:kind => :I, :id => 888, :num => 1},
      ],
    },
    2497 => { # 黒廻鎌ニフタ・テロス
      :price => 54200,
      :after => {:kind => :W, :id => 4467},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4460, :num => 1},
        {:kind => :W, :id => 4464, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2498 => { # 紅星の鎧
      :price => 41800,
      :after => {:kind => :A, :id => 486},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 485, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2499 => { # 魔神の鎧
      :price => 48000,
      :after => {:kind => :A, :id => 529},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 502, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2500 => { # 英雄の夢幻鎧
      :price => 49000,
      :after => {:kind => :A, :id => 530},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 501, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2501 => { # 混沌英雄の鎧
      :price => 50000,
      :after => {:kind => :A, :id => 531},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 501, :num => 1},
        {:kind => :A, :id => 503, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2502 => { # 永劫と終焉のローブ
      :price => 35000,
      :after => {:kind => :A, :id => 586},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 573, :num => 1},
        {:kind => :A, :id => 574, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2503 => { # 輪廻のローブ
      :price => 36000,
      :after => {:kind => :A, :id => 587},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 580, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2504 => { # 神々の足跡
      :price => 36000,
      :after => {:kind => :A, :id => 588},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 580, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2505 => { # 奈落の纏
      :price => 36000,
      :after => {:kind => :A, :id => 589},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 580, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2506 => { # 永劫の白兎帽
      :price => 11500,
      :after => {:kind => :A, :id => 683},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 680, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2507 => { # 終焉の死神フード
      :price => 11500,
      :after => {:kind => :A, :id => 684},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 681, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2508 => { # 紅星の兜
      :price => 28600,
      :after => {:kind => :A, :id => 706},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 705, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2509 => { # 魔神の兜
      :price => 38000,
      :after => {:kind => :A, :id => 746},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 721, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2510 => { # 英雄の夢幻兜
      :price => 38000,
      :after => {:kind => :A, :id => 747},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 720, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2511 => { # 混沌英雄の兜
      :price => 40000,
      :after => {:kind => :A, :id => 748},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 720, :num => 1},
        {:kind => :A, :id => 723, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2512 => { # 輪廻のサークレット
      :price => 32000,
      :after => {:kind => :A, :id => 782},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 777, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2513 => { # 魔神のティアラ
      :price => 46000,
      :after => {:kind => :A, :id => 822},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 721, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2514 => { # 輪廻の盾
      :price => 36000,
      :after => {:kind => :A, :id => 867},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 863, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2515 => { # 永劫の盾
      :price => 36000,
      :after => {:kind => :A, :id => 868},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 863, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2516 => { # 終焉の盾
      :price => 36000,
      :after => {:kind => :A, :id => 869},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 863, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2517 => { # 紅星の盾
      :price => 36000,
      :after => {:kind => :A, :id => 870},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 863, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2518 => { # 魔神の盾
      :price => 47000,
      :after => {:kind => :A, :id => 922},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 889, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2519 => { # 英雄の夢幻盾
      :price => 48000,
      :after => {:kind => :A, :id => 923},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 888, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    2520 => { # 混沌英雄の盾
      :price => 50000,
      :after => {:kind => :A, :id => 924},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :A, :id => 888, :num => 1},
        {:kind => :A, :id => 891, :num => 1},
        {:kind => :I, :id => 887, :num => 1},
      ],
    },
    3001 => { # 銀河に親しむ者の大秘石
      :price => 6000,
      :after => {:kind => :I, :id => 3668},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4187, :num => 2},
        {:kind => :I, :id => 4264, :num => 2},
      ],
    },
    3002 => { # 修羅に親しむ者の大秘石
      :price => 6000,
      :after => {:kind => :I, :id => 3673},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4192, :num => 2},
        {:kind => :I, :id => 4270, :num => 2},
      ],
    },
    3003 => { # 悪夢に親しむ者の大秘石
      :price => 6000,
      :after => {:kind => :I, :id => 3678},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4197, :num => 2},
        {:kind => :I, :id => 4276, :num => 2},
      ],
    },
    3004 => { # 核熱に親しむ者の大秘石
      :price => 6000,
      :after => {:kind => :I, :id => 3683},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4202, :num => 2},
        {:kind => :I, :id => 4282, :num => 2},
      ],
    },
    3005 => { # 量子に親しむ者の大秘石
      :price => 6000,
      :after => {:kind => :I, :id => 3688},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4207, :num => 2},
        {:kind => :I, :id => 4288, :num => 2},
      ],
    },
    3006 => { # イオンに親しむ者の大秘石
      :price => 6000,
      :after => {:kind => :I, :id => 3693},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4212, :num => 2},
        {:kind => :I, :id => 4294, :num => 2},
      ],
    },
    3007 => { # ハドロンに親しむ者の大秘石
      :price => 6000,
      :after => {:kind => :I, :id => 3698},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4217, :num => 2},
        {:kind => :I, :id => 4300, :num => 2},
      ],
    },
    3008 => { # テラに親しむ者の大秘石
      :price => 6000,
      :after => {:kind => :I, :id => 3703},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4222, :num => 2},
        {:kind => :I, :id => 4306, :num => 2},
      ],
    },
    3009 => { # ナノに親しむ者の大秘石
      :price => 6000,
      :after => {:kind => :I, :id => 3708},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4227, :num => 2},
        {:kind => :I, :id => 4312, :num => 2},
      ],
    },
    3010 => { # 永劫に親しむ者の大秘石
      :price => 6000,
      :after => {:kind => :I, :id => 3713},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4232, :num => 2},
        {:kind => :I, :id => 4318, :num => 2},
      ],
    },
    3011 => { # 終焉に親しむ者の大秘石
      :price => 6000,
      :after => {:kind => :I, :id => 3718},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 4237, :num => 2},
        {:kind => :I, :id => 4324, :num => 2},
      ],
    },
    3012 => { # 魔を嫌う者の大秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2451},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2450, :num => 2},
      ],
    },
    3013 => { # 緑を嫌う者の大秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2456},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2455, :num => 2},
      ],
    },
    3014 => { # 海を嫌う者の大秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2461},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2460, :num => 2},
      ],
    },
    3015 => { # 牙を嫌う者の大秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2466},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2465, :num => 2},
      ],
    },
    3016 => { # 羽を嫌う者の大秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2471},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2470, :num => 2},
      ],
    },
    3017 => { # 死を嫌う者の大秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2476},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2475, :num => 2},
      ],
    },
    3018 => { # 無を嫌う者の大秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2481},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 92, :num => 1},
        {:kind => :I, :id => 2480, :num => 2},
      ],
    },
    3019 => { # HPの超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2103},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2102, :num => 2},
      ],
    },
    3020 => { # MPの超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2835},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2834, :num => 2},
      ],
    },
    3021 => { # SPの超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2491},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2490, :num => 2},
      ],
    },
    3022 => { # 力の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2113},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2112, :num => 2},
      ],
    },
    3023 => { # 守りの超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3059},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3058, :num => 2},
      ],
    },
    3024 => { # 魔力の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2845},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2844, :num => 2},
      ],
    },
    3025 => { # 精神の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3069},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3068, :num => 2},
      ],
    },
    3026 => { # 素早さの超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2501},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2500, :num => 2},
      ],
    },
    3027 => { # 器用さの超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2511},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2510, :num => 2},
      ],
    },
    3028 => { # 銀河強化の超秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4188},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 4187, :num => 2},
      ],
    },
    3029 => { # 修羅強化の超秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4193},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 4192, :num => 2},
      ],
    },
    3030 => { # ナイトメア強化の超秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4198},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 4197, :num => 2},
      ],
    },
    3031 => { # 核熱強化の超秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4203},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 4202, :num => 2},
      ],
    },
    3032 => { # 量子強化の超秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4208},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 4207, :num => 2},
      ],
    },
    3033 => { # イオン強化の超秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4213},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 4212, :num => 2},
      ],
    },
    3034 => { # ハドロン強化の超秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4218},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 4217, :num => 2},
      ],
    },
    3035 => { # テラ強化の超秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4223},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 4222, :num => 2},
      ],
    },
    3036 => { # ナノ強化の超秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4228},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 4227, :num => 2},
      ],
    },
    3037 => { # 永劫強化の超秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4233},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 4232, :num => 2},
      ],
    },
    3038 => { # 終焉強化の超秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4238},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 4237, :num => 2},
      ],
    },
    3039 => { # 即死付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2529},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2528, :num => 2},
      ],
    },
    3040 => { # 昇天付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2534},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2533, :num => 2},
      ],
    },
    3041 => { # 絶頂付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2539},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2538, :num => 2},
      ],
    },
    3042 => { # 毒付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2544},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2543, :num => 2},
      ],
    },
    3043 => { # 暗闇付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2549},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2548, :num => 2},
      ],
    },
    3044 => { # 沈黙付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2554},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2553, :num => 2},
      ],
    },
    3045 => { # 混乱付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2559},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2558, :num => 2},
      ],
    },
    3046 => { # 睡眠付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2564},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2563, :num => 2},
      ],
    },
    3047 => { # 麻痺付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2569},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2568, :num => 2},
      ],
    },
    3048 => { # バーン付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2574},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2573, :num => 2},
      ],
    },
    3049 => { # フリーズ付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2579},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2578, :num => 2},
      ],
    },
    3050 => { # ショック付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2584},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2583, :num => 2},
      ],
    },
    3051 => { # スロウ付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2589},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2588, :num => 2},
      ],
    },
    3052 => { # ストップ付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2594},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2593, :num => 2},
      ],
    },
    3053 => { # ミニマム付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2599},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2598, :num => 2},
      ],
    },
    3054 => { # ゾンビ付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2604},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2603, :num => 2},
      ],
    },
    3055 => { # 石化付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2609},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2608, :num => 2},
      ],
    },
    3056 => { # 消化付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2614},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2613, :num => 2},
      ],
    },
    3057 => { # スタン付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2619},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2618, :num => 2},
      ],
    },
    3058 => { # ヌルヌル付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2624},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2623, :num => 2},
      ],
    },
    3059 => { # 敏感付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2629},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2628, :num => 2},
      ],
    },
    3060 => { # 恍惚付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2634},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2633, :num => 2},
      ],
    },
    3061 => { # 誘惑付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2639},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2638, :num => 2},
      ],
    },
    3062 => { # 失禁付加の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2644},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 2643, :num => 2},
      ],
    },
    3063 => { # 物理に親しむ者の超秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3604},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3603, :num => 2},
      ],
    },
    3064 => { # 快楽に親しむ者の超秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3609},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3608, :num => 2},
      ],
    },
    3065 => { # 炎に親しむ者の超秘石
      :price => 15000,
      :after => {:kind => :I, :id => 3614},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3613, :num => 2},
      ],
    },
    3066 => { # 氷に親しむ者の超秘石
      :price => 15000,
      :after => {:kind => :I, :id => 3619},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3618, :num => 2},
      ],
    },
    3067 => { # 雷に親しむ者の超秘石
      :price => 15000,
      :after => {:kind => :I, :id => 3624},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3623, :num => 2},
      ],
    },
    3068 => { # 風に親しむ者の超秘石
      :price => 15000,
      :after => {:kind => :I, :id => 3629},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3628, :num => 2},
      ],
    },
    3069 => { # 土に親しむ者の超秘石
      :price => 15000,
      :after => {:kind => :I, :id => 3634},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3633, :num => 2},
      ],
    },
    3070 => { # 水に親しむ者の超秘石
      :price => 15000,
      :after => {:kind => :I, :id => 3639},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3638, :num => 2},
      ],
    },
    3071 => { # 光に親しむ者の超秘石
      :price => 15000,
      :after => {:kind => :I, :id => 3644},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3643, :num => 2},
      ],
    },
    3072 => { # 闇に親しむ者の超秘石
      :price => 15000,
      :after => {:kind => :I, :id => 3649},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3648, :num => 2},
      ],
    },
    3073 => { # 音波に親しむ者の超秘石
      :price => 15000,
      :after => {:kind => :I, :id => 3654},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3653, :num => 2},
      ],
    },
    3074 => { # バイオに親しむ者の超秘石
      :price => 15000,
      :after => {:kind => :I, :id => 3659},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3658, :num => 2},
      ],
    },
    3075 => { # 癒しに親しむ者の超秘石
      :price => 15000,
      :after => {:kind => :I, :id => 3664},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3663, :num => 2},
      ],
    },
    3076 => { # 短剣技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2390},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1628, :num => 1},
      ],
    },
    3077 => { # 剣技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2391},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1629, :num => 1},
      ],
    },
    3078 => { # 尖剣技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2392},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1630, :num => 1},
      ],
    },
    3079 => { # 刀技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2393},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1631, :num => 1},
      ],
    },
    3080 => { # 槍技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2394},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1632, :num => 1},
      ],
    },
    3081 => { # 斧技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2395},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1633, :num => 1},
      ],
    },
    3082 => { # 棍技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2396},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1634, :num => 1},
      ],
    },
    3083 => { # 鎌技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2397},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1635, :num => 1},
      ],
    },
    3084 => { # 弓技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2398},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1636, :num => 1},
      ],
    },
    3085 => { # 鞭技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2399},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1637, :num => 1},
      ],
    },
    3086 => { # 投擲技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2400},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1638, :num => 1},
      ],
    },
    3087 => { # 鉄球技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2401},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1639, :num => 1},
      ],
    },
    3088 => { # 扇技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2402},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1640, :num => 1},
      ],
    },
    3089 => { # 銃技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2403},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1641, :num => 1},
      ],
    },
    3090 => { # 多武器技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2404},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1642, :num => 1},
      ],
    },
    3091 => { # 格闘使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2405},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1643, :num => 1},
      ],
    },
    3092 => { # 踊る使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2739},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1658, :num => 1},
      ],
    },
    3093 => { # 歌う使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2740},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1659, :num => 1},
      ],
    },
    3094 => { # 話す使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2741},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1660, :num => 1},
      ],
    },
    3095 => { # マキナ使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2742},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1664, :num => 1},
      ],
    },
    3096 => { # 料理使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2743},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1665, :num => 1},
      ],
    },
    3097 => { # 医術使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2744},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1666, :num => 1},
      ],
    },
    3098 => { # 御奉仕使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2745},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1667, :num => 1},
      ],
    },
    3099 => { # 王技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2746},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1668, :num => 1},
      ],
    },
    3100 => { # 勇者技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2747},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1669, :num => 1},
      ],
    },
    3101 => { # 淫技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2748},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1670, :num => 1},
      ],
    },
    3102 => { # 白魔法使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2973},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1644, :num => 1},
      ],
    },
    3103 => { # 黒魔法使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2974},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1645, :num => 1},
      ],
    },
    3104 => { # 時魔法使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2975},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1646, :num => 1},
      ],
    },
    3105 => { # 召喚使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2976},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1647, :num => 1},
      ],
    },
    3106 => { # 聖技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2977},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1648, :num => 1},
      ],
    },
    3107 => { # 闇技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2978},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1649, :num => 1},
      ],
    },
    3108 => { # 魔法剣使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2979},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1650, :num => 1},
      ],
    },
    3109 => { # 陰陽術使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2980},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1651, :num => 1},
      ],
    },
    3110 => { # 魔導科学使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2981},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1661, :num => 1},
      ],
    },
    3111 => { # 錬金術使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2982},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1662, :num => 1},
      ],
    },
    3112 => { # 魔本術使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2983},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1663, :num => 1},
      ],
    },
    3113 => { # サイコ使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3019},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 5215, :num => 1},
      ],
    },
    3114 => { # 魔技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3519},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1671, :num => 1},
      ],
    },
    3115 => { # 海技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3520},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1672, :num => 1},
      ],
    },
    3116 => { # 粘液技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3521},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1673, :num => 1},
      ],
    },
    3117 => { # 獣技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3522},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1674, :num => 1},
      ],
    },
    3118 => { # 蛇技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3523},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1675, :num => 1},
      ],
    },
    3119 => { # 触手技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3524},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1676, :num => 1},
      ],
    },
    3120 => { # 翼技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3525},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1677, :num => 1},
      ],
    },
    3121 => { # 虫技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3526},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1678, :num => 1},
      ],
    },
    3122 => { # 植物技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3527},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1679, :num => 1},
      ],
    },
    3123 => { # 屍技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3528},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1680, :num => 1},
      ],
    },
    3124 => { # 造技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3529},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1681, :num => 1},
      ],
    },
    3125 => { # 自然感応使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3530},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1682, :num => 1},
      ],
    },
    3126 => { # 巨技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3579},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 5217, :num => 1},
      ],
    },
    3127 => { # 妖術使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3578},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 5216, :num => 1},
      ],
    },
    3128 => { # 物理耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3131},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3130, :num => 2},
      ],
    },
    3129 => { # 快楽耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3137},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3136, :num => 2},
      ],
    },
    3130 => { # 炎耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3143},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3142, :num => 2},
      ],
    },
    3131 => { # 氷耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3149},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3148, :num => 2},
      ],
    },
    3132 => { # 雷耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3155},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3154, :num => 2},
      ],
    },
    3133 => { # 風耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3161},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3160, :num => 2},
      ],
    },
    3134 => { # 土耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3167},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3166, :num => 2},
      ],
    },
    3135 => { # 水耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3173},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3172, :num => 2},
      ],
    },
    3136 => { # 聖耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3179},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3178, :num => 2},
      ],
    },
    3137 => { # 闇耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3185},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3184, :num => 2},
      ],
    },
    3138 => { # 音波耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3191},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3190, :num => 2},
      ],
    },
    3139 => { # バイオ耐性の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3197},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :I, :id => 3196, :num => 2},
      ],
    },
    3140 => { # 物理無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3132},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3131, :num => 2},
      ],
    },
    3141 => { # 快楽無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3138},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3137, :num => 2},
      ],
    },
    3142 => { # 炎無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3144},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3143, :num => 2},
      ],
    },
    3143 => { # 氷無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3150},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3149, :num => 2},
      ],
    },
    3144 => { # 雷無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3156},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3155, :num => 2},
      ],
    },
    3145 => { # 風無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3162},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3161, :num => 2},
      ],
    },
    3146 => { # 土無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3168},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3167, :num => 2},
      ],
    },
    3147 => { # 水無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3174},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3173, :num => 2},
      ],
    },
    3148 => { # 聖無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3180},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3179, :num => 2},
      ],
    },
    3149 => { # 闇無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3186},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3185, :num => 2},
      ],
    },
    3150 => { # 音波無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3192},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3191, :num => 2},
      ],
    },
    3151 => { # バイオ無効の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3198},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3197, :num => 2},
      ],
    },
    3152 => { # 物理強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2302},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2301, :num => 2},
      ],
    },
    3153 => { # 快楽強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2860},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2859, :num => 2},
      ],
    },
    3154 => { # 炎強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2865},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2864, :num => 2},
      ],
    },
    3155 => { # 氷強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2870},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2869, :num => 2},
      ],
    },
    3156 => { # 雷強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2875},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2874, :num => 2},
      ],
    },
    3157 => { # 風強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2880},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2879, :num => 2},
      ],
    },
    3158 => { # 土強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2885},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2884, :num => 2},
      ],
    },
    3159 => { # 水強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2890},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2889, :num => 2},
      ],
    },
    3160 => { # 聖強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2895},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2894, :num => 2},
      ],
    },
    3161 => { # 闇強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2900},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2899, :num => 2},
      ],
    },
    3162 => { # 音波強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2905},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2904, :num => 2},
      ],
    },
    3163 => { # バイオ強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2910},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2909, :num => 2},
      ],
    },
    3164 => { # 回復強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2915},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2914, :num => 2},
      ],
    },
    3165 => { # 短剣技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2312},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2311, :num => 2},
      ],
    },
    3166 => { # 剣技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2317},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2316, :num => 2},
      ],
    },
    3167 => { # 尖剣技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2322},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2321, :num => 2},
      ],
    },
    3168 => { # 刀技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2327},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2326, :num => 2},
      ],
    },
    3169 => { # 槍技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2332},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2331, :num => 2},
      ],
    },
    3170 => { # 斧技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2337},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2336, :num => 2},
      ],
    },
    3171 => { # 棍技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2342},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2341, :num => 2},
      ],
    },
    3172 => { # 鎌技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2347},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2346, :num => 2},
      ],
    },
    3173 => { # 弓技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2352},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2351, :num => 2},
      ],
    },
    3174 => { # 鞭技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2357},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2356, :num => 2},
      ],
    },
    3175 => { # 投擲技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2362},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2361, :num => 2},
      ],
    },
    3176 => { # 鉄球技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2367},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2366, :num => 2},
      ],
    },
    3177 => { # 扇技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2372},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2371, :num => 2},
      ],
    },
    3178 => { # 銃技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2377},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2376, :num => 2},
      ],
    },
    3179 => { # 多武器技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2382},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2381, :num => 2},
      ],
    },
    3180 => { # 格闘の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2387},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2386, :num => 2},
      ],
    },
    3181 => { # 盗賊技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2649},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2648, :num => 2},
      ],
    },
    3182 => { # 忍術の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2654},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2653, :num => 2},
      ],
    },
    3183 => { # 海賊技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2659},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2658, :num => 2},
      ],
    },
    3184 => { # ヒーロー技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2664},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2663, :num => 2},
      ],
    },
    3185 => { # 商技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2669},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2668, :num => 2},
      ],
    },
    3186 => { # EXアイテムの絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2674},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2673, :num => 2},
      ],
    },
    3187 => { # オラクルの絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2679},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2678, :num => 2},
      ],
    },
    3188 => { # 踊りの絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2684},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2683, :num => 2},
      ],
    },
    3189 => { # 歌の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2689},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2688, :num => 2},
      ],
    },
    3190 => { # 話術の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2694},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2693, :num => 2},
      ],
    },
    3191 => { # マキナの絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2699},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2698, :num => 2},
      ],
    },
    3192 => { # 料理の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2704},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2703, :num => 2},
      ],
    },
    3193 => { # 医術の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2709},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2708, :num => 2},
      ],
    },
    3194 => { # 御奉仕の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2714},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2713, :num => 2},
      ],
    },
    3195 => { # 王技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2719},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2718, :num => 2},
      ],
    },
    3196 => { # 勇者技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2724},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2723, :num => 2},
      ],
    },
    3197 => { # 淫技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2729},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2728, :num => 2},
      ],
    },
    3198 => { # 白魔法の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2920},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2919, :num => 2},
      ],
    },
    3199 => { # 黒魔法の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2925},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2924, :num => 2},
      ],
    },
    3200 => { # 時魔法の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2930},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2929, :num => 2},
      ],
    },
    3201 => { # 召喚の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2935},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2934, :num => 2},
      ],
    },
    3202 => { # 聖技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2940},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2939, :num => 2},
      ],
    },
    3203 => { # 闇技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2945},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2944, :num => 2},
      ],
    },
    3204 => { # 魔法剣の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2950},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2949, :num => 2},
      ],
    },
    3205 => { # 陰陽術の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2955},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2954, :num => 2},
      ],
    },
    3206 => { # 魔導科学の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2960},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2959, :num => 2},
      ],
    },
    3207 => { # 錬金術の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2965},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2964, :num => 2},
      ],
    },
    3208 => { # 魔本術の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2970},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2969, :num => 2},
      ],
    },
    3209 => { # サイコの絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3011},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3010, :num => 2},
      ],
    },
    3210 => { # 魔技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3446},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3445, :num => 2},
      ],
    },
    3211 => { # 海技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3451},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3450, :num => 2},
      ],
    },
    3212 => { # 粘液技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3456},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3455, :num => 2},
      ],
    },
    3213 => { # 獣技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3461},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3460, :num => 2},
      ],
    },
    3214 => { # 蛇技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3466},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3465, :num => 2},
      ],
    },
    3215 => { # 触手技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3471},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3470, :num => 2},
      ],
    },
    3216 => { # 翼技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3476},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3475, :num => 2},
      ],
    },
    3217 => { # 虫技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3481},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3480, :num => 2},
      ],
    },
    3218 => { # 植物技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3486},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3485, :num => 2},
      ],
    },
    3219 => { # 屍技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3491},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3490, :num => 2},
      ],
    },
    3220 => { # 造技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3496},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3495, :num => 2},
      ],
    },
    3221 => { # 自然感応の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3501},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3500, :num => 2},
      ],
    },
    3222 => { # ブレスの絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3506},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3505, :num => 2},
      ],
    },
    3223 => { # 巨技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3575},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3574, :num => 2},
      ],
    },
    3224 => { # 妖術の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3570},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3569, :num => 2},
      ],
    },
    3225 => { # 特技の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3511},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3510, :num => 2},
      ],
    },
    3226 => { # 装備武器の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3516},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3515, :num => 2},
      ],
    },
    3227 => { # 即死付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2530},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2529, :num => 2},
      ],
    },
    3228 => { # 昇天付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2535},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2534, :num => 2},
      ],
    },
    3229 => { # 絶頂付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2540},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2539, :num => 2},
      ],
    },
    3230 => { # 毒付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2545},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2544, :num => 2},
      ],
    },
    3231 => { # 暗闇付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2550},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2549, :num => 2},
      ],
    },
    3232 => { # 沈黙付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2555},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2554, :num => 2},
      ],
    },
    3233 => { # 混乱付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2560},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2559, :num => 2},
      ],
    },
    3234 => { # 睡眠付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2565},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2564, :num => 2},
      ],
    },
    3235 => { # 麻痺付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2570},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2569, :num => 2},
      ],
    },
    3236 => { # バーン付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2575},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2574, :num => 2},
      ],
    },
    3237 => { # フリーズ付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2580},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2579, :num => 2},
      ],
    },
    3238 => { # ショック付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2585},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2584, :num => 2},
      ],
    },
    3239 => { # スロウ付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2590},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2589, :num => 2},
      ],
    },
    3240 => { # ストップ付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2595},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2594, :num => 2},
      ],
    },
    3241 => { # ミニマム付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2600},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2599, :num => 2},
      ],
    },
    3242 => { # ゾンビ付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2605},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2604, :num => 2},
      ],
    },
    3243 => { # 石化付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2610},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2609, :num => 2},
      ],
    },
    3244 => { # 消化付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2615},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2614, :num => 2},
      ],
    },
    3245 => { # スタン付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2620},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2619, :num => 2},
      ],
    },
    3246 => { # ヌルヌル付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2625},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2624, :num => 2},
      ],
    },
    3247 => { # 敏感付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2630},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2629, :num => 2},
      ],
    },
    3248 => { # 恍惚付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2635},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2634, :num => 2},
      ],
    },
    3249 => { # 誘惑付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2640},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2639, :num => 2},
      ],
    },
    3250 => { # 失禁付加の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 2645},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2644, :num => 2},
      ],
    },
    3251 => { # ワームサマナーのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3970},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3969, :num => 2},
      ],
    },
    3252 => { # 妖魔のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3976},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3975, :num => 2},
      ],
    },
    3253 => { # 妖怪のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3982},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3981, :num => 2},
      ],
    },
    3254 => { # サキュバスのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3988},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3987, :num => 2},
      ],
    },
    3255 => { # 吸血鬼のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3994},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3993, :num => 2},
      ],
    },
    3256 => { # 人魚のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4000},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3999, :num => 2},
      ],
    },
    3257 => { # エルフのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4006},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4005, :num => 2},
      ],
    },
    3258 => { # フェアリーのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4012},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4011, :num => 2},
      ],
    },
    3259 => { # スライムのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4018},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4017, :num => 2},
      ],
    },
    3260 => { # 魔獣のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4024},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4023, :num => 2},
      ],
    },
    3261 => { # 妖狐のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4030},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4029, :num => 2},
      ],
    },
    3262 => { # ラミアのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4036},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4035, :num => 2},
      ],
    },
    3263 => { # スキュラのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4042},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4041, :num => 2},
      ],
    },
    3264 => { # ハーピーのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4048},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4047, :num => 2},
      ],
    },
    3265 => { # ドラゴンのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4054},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4053, :num => 2},
      ],
    },
    3266 => { # 陸棲種のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4060},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4059, :num => 2},
      ],
    },
    3267 => { # 海棲種のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4066},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4065, :num => 2},
      ],
    },
    3268 => { # 妖虫のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4072},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4071, :num => 2},
      ],
    },
    3269 => { # アルラウネのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4078},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4077, :num => 2},
      ],
    },
    3270 => { # ゾンビのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4084},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4083, :num => 2},
      ],
    },
    3271 => { # ゴーストのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4090},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4089, :num => 2},
      ],
    },
    3272 => { # ドールのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4096},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4095, :num => 2},
      ],
    },
    3273 => { # キメラのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4102},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4101, :num => 2},
      ],
    },
    3274 => { # 天使のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4108},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4107, :num => 2},
      ],
    },
    3275 => { # ロイドのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4114},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4113, :num => 2},
      ],
    },
    3276 => { # 巨人のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4120},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4119, :num => 2},
      ],
    },
    3277 => { # アポトーシスのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 4126},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4125, :num => 2},
      ],
    },
    3278 => { # 魔神のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3964},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3963, :num => 2},
      ],
    },
    3279 => { # 剣士のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3730},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3729, :num => 2},
      ],
    },
    3280 => { # 竜騎士のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3736},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3735, :num => 2},
      ],
    },
    3281 => { # フェンサーのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3742},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3741, :num => 2},
      ],
    },
    3282 => { # 重戦士のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3748},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3747, :num => 2},
      ],
    },
    3283 => { # 侍のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3754},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3753, :num => 2},
      ],
    },
    3284 => { # 武道家のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3760},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3759, :num => 2},
      ],
    },
    3285 => { # 盾騎士のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3766},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3765, :num => 2},
      ],
    },
    3286 => { # 魔物使いのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3772},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3771, :num => 2},
      ],
    },
    3287 => { # バトルマスターのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3778},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3777, :num => 2},
      ],
    },
    3288 => { # 黒魔道士のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3784},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3783, :num => 2},
      ],
    },
    3289 => { # 時魔道士のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3790},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3789, :num => 2},
      ],
    },
    3290 => { # 白魔道士のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3796},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3795, :num => 2},
      ],
    },
    3291 => { # 召喚士のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3802},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3801, :num => 2},
      ],
    },
    3292 => { # 陰陽師のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3808},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3807, :num => 2},
      ],
    },
    3293 => { # 狩人のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3814},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3813, :num => 2},
      ],
    },
    3294 => { # ガンナーのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3820},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3819, :num => 2},
      ],
    },
    3295 => { # シーフのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3826},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3825, :num => 2},
      ],
    },
    3296 => { # 忍者のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3832},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3831, :num => 2},
      ],
    },
    3297 => { # 踊り子のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3838},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3837, :num => 2},
      ],
    },
    3298 => { # 吟遊詩人のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3844},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3843, :num => 2},
      ],
    },
    3299 => { # 娼婦のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3850},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3849, :num => 2},
      ],
    },
    3300 => { # サイコソルジャーのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3856},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3855, :num => 2},
      ],
    },
    3301 => { # 魔導学者のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3862},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3861, :num => 2},
      ],
    },
    3302 => { # 錬金術士のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3868},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3867, :num => 2},
      ],
    },
    3303 => { # 魔導司書のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3874},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3873, :num => 2},
      ],
    },
    3304 => { # 技師のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3880},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3879, :num => 2},
      ],
    },
    3305 => { # 魔芸師のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3886},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3885, :num => 2},
      ],
    },
    3306 => { # 商人のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3892},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3891, :num => 2},
      ],
    },
    3307 => { # ギャンブラーのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3898},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3897, :num => 2},
      ],
    },
    3308 => { # 話術士のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3904},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3903, :num => 2},
      ],
    },
    3309 => { # 料理人のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3910},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3909, :num => 2},
      ],
    },
    3310 => { # 医者のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3916},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3915, :num => 2},
      ],
    },
    3311 => { # メイドのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3922},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3921, :num => 2},
      ],
    },
    3312 => { # 海賊のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3928},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3927, :num => 2},
      ],
    },
    3313 => { # 王のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3934},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3933, :num => 2},
      ],
    },
    3314 => { # 勇者のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3940},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3939, :num => 2},
      ],
    },
    3314 => { # ヒーローのための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3946},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3945, :num => 2},
      ],
    },
    3315 => { # 魔法少女のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3952},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3951, :num => 2},
      ],
    },
    3316 => { # 妖術師のための絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3958},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3957, :num => 2},
      ],
    },
    3317 => { # 森強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3423},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3422, :num => 2},
      ],
    },
    3318 => { # 砂漠強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3427},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3426, :num => 2},
      ],
    },
    3319 => { # 海強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3429},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3428, :num => 2},
      ],
    },
    3320 => { # 深海強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3431},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3430, :num => 2},
      ],
    },
    3321 => { # 洞窟強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3433},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3432, :num => 2},
      ],
    },
    3322 => { # 市街強化の絶秘石
      :price => 30000,
      :after => {:kind => :I, :id => 3437},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3436, :num => 2},
      ],
    },
    3323 => { # 銀河耐性の絶秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4265},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4264, :num => 2},
      ],
    },
    3324 => { # 修羅耐性の絶秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4271},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4270, :num => 2},
      ],
    },
    3325 => { # ナイトメア耐性の絶秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4277},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4276, :num => 2},
      ],
    },
    3326 => { # 核熱耐性の絶秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4283},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4282, :num => 2},
      ],
    },
    3327 => { # 量子耐性の絶秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4289},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4288, :num => 2},
      ],
    },
    3328 => { # イオン耐性の絶秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4295},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4294, :num => 2},
      ],
    },
    3329 => { # ハドロン耐性の絶秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4301},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4300, :num => 2},
      ],
    },
    3330 => { # テラ耐性の絶秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4307},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4306, :num => 2},
      ],
    },
    3331 => { # ナノ耐性の絶秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4313},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4312, :num => 2},
      ],
    },
    3332 => { # 永劫耐性の絶秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4319},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4318, :num => 2},
      ],
    },
    3333 => { # 終焉耐性の絶秘石
      :price => 50000,
      :after => {:kind => :I, :id => 4325},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 4324, :num => 2},
      ],
    },
    3334 => { # HPの絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 2104},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2103, :num => 2},
      ],
    },
    3335 => { # MPの絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 2836},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2835, :num => 2},
      ],
    },
    3336 => { # SPの絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 2492},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2491, :num => 2},
      ],
    },
    3337 => { # 力の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 2114},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2113, :num => 2},
      ],
    },
    3338 => { # 守りの絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3060},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3059, :num => 2},
      ],
    },
    3339 => { # 魔力の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 2846},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2845, :num => 2},
      ],
    },
    3340 => { # 精神の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3070},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3069, :num => 2},
      ],
    },
    3341 => { # 素早さの絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 2502},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2501, :num => 2},
      ],
    },
    3342 => { # 器用さの絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 2512},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 2511, :num => 2},
      ],
    },
    3343 => { # 銀河に親しむ者の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3669},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3668, :num => 2},
      ],
    },
    3344 => { # 修羅に親しむ者の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3674},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3673, :num => 2},
      ],
    },
    3345 => { # 悪夢に親しむ者の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3679},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3678, :num => 2},
      ],
    },
    3346 => { # 核熱に親しむ者の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3684},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3683, :num => 2},
      ],
    },
    3347 => { # 量子に親しむ者の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3689},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3688, :num => 2},
      ],
    },
    3348 => { # イオンに親しむ者の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3694},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3693, :num => 2},
      ],
    },
    3349 => { # ハドロンに親しむ者の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3699},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3698, :num => 2},
      ],
    },
    3350 => { # テラに親しむ者の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3704},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3703, :num => 2},
      ],
    },
    3351 => { # ナノに親しむ者の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3709},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3708, :num => 2},
      ],
    },
    3352 => { # 永劫に親しむ者の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3714},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3713, :num => 2},
      ],
    },
    3353 => { # 終焉に親しむ者の絶秘石
      :price => 60000,
      :after => {:kind => :I, :id => 3719},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 94, :num => 1},
        {:kind => :I, :id => 3718, :num => 2},
      ],
    },
    3354 => { # 盗賊技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2733},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1652, :num => 1},
      ],
    },
    3355 => { # 忍術使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2734},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1653, :num => 1},
      ],
    },
    3356 => { # 海賊技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2735},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1654, :num => 1},
      ],
    },
    3357 => { # 商技使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2736},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1655, :num => 1},
      ],
    },
    3358 => { # EXアイテム使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2737},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1656, :num => 1},
      ],
    },
    3359 => { # オラクル使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 2738},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1657, :num => 1},
      ],
    },
    3360 => { # ブレス使用可能の超秘石
      :price => 10000,
      :after => {:kind => :I, :id => 3531},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 93, :num => 1},
        {:kind => :A, :id => 1683, :num => 1},
      ],
    },
    3361 => { # HPの極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 2105},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 2104, :num => 2},
      ],
    },
    3362 => { # MPの極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 2837},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 2836, :num => 2},
      ],
    },
    3363 => { # SPの極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 2493},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 2492, :num => 2},
      ],
    },
    3364 => { # 力の極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 2115},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 2114, :num => 2},
      ],
    },
    3365 => { # 守りの極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 3061},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 3060, :num => 2},
      ],
    },
    3366 => { # 魔力の極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 2847},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 2846, :num => 2},
      ],
    },
    3367 => { # 精神の極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 3071},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 3070, :num => 2},
      ],
    },
    3368 => { # 素早さの極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 2503},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 2502, :num => 2},
      ],
    },
    3369 => { # 器用さの極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 2513},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 2512, :num => 2},
      ],
    },
    3370 => { # 狙う者の極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 2125},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 2124, :num => 2},
      ],
    },
    3371 => { # 会心の極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 2130},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 2129, :num => 2},
      ],
    },
    3372 => { # 反撃の極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 2135},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 2134, :num => 2},
      ],
    },
    3373 => { # 魔法反撃の極秘石
      :price => 200000,
      :after => {:kind => :I, :id => 2140},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 2139, :num => 2},
      ],
    },
    3374 => { # 銀河強化の極秘石
      :price => 300000,
      :after => {:kind => :I, :id => 4189},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 4188, :num => 2},
      ],
    },
    3375 => { # 修羅強化の極秘石
      :price => 300000,
      :after => {:kind => :I, :id => 4194},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 4193, :num => 2},
      ],
    },
    3376 => { # ナイトメア強化の極秘石
      :price => 300000,
      :after => {:kind => :I, :id => 4199},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 4198, :num => 2},
      ],
    },
    3377 => { # 核熱強化の極秘石
      :price => 300000,
      :after => {:kind => :I, :id => 4204},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 4203, :num => 2},
      ],
    },
    3378 => { # 量子強化の極秘石
      :price => 300000,
      :after => {:kind => :I, :id => 4209},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 4208, :num => 2},
      ],
    },
    3379 => { # イオン強化の極秘石
      :price => 300000,
      :after => {:kind => :I, :id => 4214},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 4213, :num => 2},
      ],
    },
    3380 => { # ハドロン強化の極秘石
      :price => 300000,
      :after => {:kind => :I, :id => 4219},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 4218, :num => 2},
      ],
    },
    3381 => { # テラ強化の極秘石
      :price => 300000,
      :after => {:kind => :I, :id => 4224},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 4223, :num => 2},
      ],
    },
    3382 => { # ナノ強化の極秘石
      :price => 300000,
      :after => {:kind => :I, :id => 4229},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 4228, :num => 2},
      ],
    },
    3383 => { # 永劫強化の極秘石
      :price => 300000,
      :after => {:kind => :I, :id => 4234},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 4233, :num => 2},
      ],
    },
    3384 => { # 終焉強化の極秘石
      :price => 300000,
      :after => {:kind => :I, :id => 4239},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :I, :id => 95, :num => 1},
        {:kind => :I, :id => 4238, :num => 2},
      ],
    },
    3385 => {
      :price => 77000,
      :after => {:kind => :W, :id => 4853},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4334, :num => 1},
        {:kind => :I, :id => 886, :num => 1},
      ],
    },
    3386 => {
      :price => 18000,
      :after => {:kind => :W, :id => 4112},
      :befores => [
        # 種類, ID, 必要個数
        {:kind => :W, :id => 4113, :num => 1},
        {:kind => :I, :id => 877, :num => 1},
      ],
    },

  }

  # 店一覧
  Shops = {
    # 店ID => [レシピID, レシピID, レシピID...]
    1 => [1],
    2 => [4,1],
    3 => [3,4,5,6,7,8,9,10,11],
    4 => [12,13,14,15,16,17],
    5 => [18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36],
    6 => [37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61],
    7 => [63,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,80,81,82,83,84,85,86],
    8 => [87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111],
    9 => [112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144],
    10 => [145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177],
    11 => [178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205],
    12 => [206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224],
    13 => [225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245],
    14 => [246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270],
    15 => [271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286],
    16 => [287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309],
    17 => [310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332],
    18 => [333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352],
    19 => [353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391],
    20 => [392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414],
    21 => [415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434],
    22 => [435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457],
    23 => [458,460,461,462,463,465,467,469,471,472,474,476,478,480,482,484,486,488,490,491,492,493,494,495,496,497,498,499,501,503,504,505,506,508,509,510],
    24 => [459,460,461,462,464,466,468,470,471,473,475,477,479,481,483,485,487,489,490,491,492,493,494,495,496,497,498,500,502,503,504,505,507,508,509,511],
    25 => [512,513],
    26 => [514,515,516,517],
    27 => [518,515,519,520,521,522,523,524],
    28 => [525,527,528,530,532,533,535,537,539,540,541,543,544,546,547,549,550,551,552,553,555,556,558,560,561,562,564,565,567,568,570,572,574],
    29 => [526,527,529,531,532,534,536,538,539,540,542,543,545,546,548,550,551,552,554,555,557,559,560,561,563,564,566,567,568,569,571,572,573,575],
    30 => [576,577,578,579,580,581,582,583],
    31 => [584,585,586,587,588,589,590,591,592,593],
    32 => [594,596,598,600,602,604,606,608,610,612,614,616,618,620,621,623,625,627,629,630,632,634,636,637,639,640,642,644,646,648,650,652,654,656,658,659,661,662,664,666,668,669],
    33 => [595,597,599,601,603,605,609,611,613,615,617,619,620,622,624,626,628,629,631,633,635,636,638,639,641,643,645,647,649,651,653,655,657,658,660,663,665,667,670],
    34 => [512,513,671,672,673,674,675,676],
    35 => [607,677,678,679,680,681,682,683,684],
    36 => [685,687,689,691,692,694,696,698,700,702,703,704,706,708,710,712,715,717,719,721,723,725,726,727,729,731,732,733,734,736,738,739,741,743,745,746,747,749,750,751,753,754,755],
    37 => [686,688,690,691,693,695,697,699,701,702,703,705,707,709,711,713,714,716,718,720,722,724,725,726,728,730,731,732,735,737,738,740,742,744,745,746,748,749,750,752,753,754,756],
    38 => [512,513,671,672,673,674,675,676,757,758,759,760,761,762,763],
    39 => [764,767,768,770,771,773,775,776,777,779,781,783,785,787,788,790,792,794,796,798,801,803,805,807,808,810,811,813,814,816,818,819,821,823,825,827,829,831,833,834,836,838,839,841,843,845,849,851,852,853,855,857,858,860,862,865,866,868,870,872,874],
    40 => [765,766,767,769,770,772,773,774,776,778,780,782,784,786,789,791,793,795,797,799,800,802,804,806,807,809,812,813,815,817,818,820,822,824,826,828,830,832,833,835,837,838,840,842,844,846,847,848,850,851,854,856,857,859,861,863,864,867,869,871,873,875,876],
    41 => [512,513,671,672,673,674,675,676,757,758,759,760,761,762,763,877,878,879,880,881,882],
    42 => [883,884,885,886],
    43 => [887,888,889,890,891,892,893,894,895,896,897,898,899,900,901],
    44 => [902,903,904,905,906,907,908,909,910,911,912],
    45 => [913,914,915,916,917],
    46 => [918,919,920,921,922,923,924,925,926,927,928,929,930,931,932,933,934,935,936,937,938,939,940,941,942,943,944,945,946,947,948,949],
    47 => [950,951,952,953,954,955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,970,971,972,973,974,975,976,977,978,979,980,981,982,983,984],
    48 => [985,986,987,988,989,990,991,992,993,994,995,996,997,998,999,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014],
    49 => [512,513,671,672,673,674,675,676,757,758,759,760,761,762,763,877,878,879,880,881,882,1015,1016,1017,1018],
    50 => [1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045],
    51 => [1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079],
    52 => [1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111],
    53 => [1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1131,1132,1133,1134,1135,1136,1137,1138,1139,1140,1141,1142,1143,1144],
    54 => [1145,1146,1147,1148,1149,1150,1151,1152,1153,1154,1155,1156,1157,1158,1159,1160,1161,1162,1163,1164,1165,1166,1167,1168,1169,1170,1171,1172],
    55 => [1173,1174,1175,1176,1177,1178,1179,1180,1181,1182,1183,1184,1185,1186,1187,1188,1189,1190,1191,1192,1193,1194,1195,1196,1197,1198,1199,1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212,1213,1214,1215],
    56 => [512,513,671,672,673,674,675,676,757,758,759,760,761,762,763,877,878,879,880,881,882,1015,1016,1017,1018,1216,1217,1218,1219,1220,1221,1222,1223,1224,1225,1226,1227,1228,1229,1230],
    57 => [1231,1232,1233,1234,1235,1236,1237],
    58 => [1238,1239,1240,1241,1242,1243,1244,1245,1246,1247,1248,1249,1250,1251,1252,1253,1254,1255],
    59 => [1448,1256,1257,1258,1259,1260,1261,1262,1263],
    60 => [1264,1265,1266,1267,1268,1269],
    61 => [1270,1271,1272,1273,1274,1275,1276,1277,1278,1279,1280,1281,1282,1283,1284,1285,1286,1287,1288,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299,1300,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315,1316,1317,1318],
    62 => [1319,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,1336,1337,1338,1339,1340,1341,1342,1343,1344],
    63 => [1345,1346,1347,1348,1349,1350],
    64 => [1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373],
    65 => [1374,1375,1376,1377,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393],
    66 => [1394,1395,1396,1397],
    67 => [1398,1399,1400,1401,1402,1403,1404,1405,1406,1407,1408],
    68 => [1409,1410,1411,1412],
    69 => [1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1437,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447],
    70 => [1451,1452,1453,1454,1455,1456,1457,1458,1459,1460],
    71 => [1461,1462,1463,1464,1465,1466,1467,1468,1469,1470,1471,1472,1473,1474,1475,1476,1477,1478,1479,1480,1481,1482,1483,1484,1485,1486,1487,1488,1489,1490,1491,1492,1493,1494,1495],
    72 => [1496,1497,1498,1499,1500,1501,1502,1503,1504,1505,1506],
    73 => [1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517,1518,1519,1520,1521,1522,1523,1524,1525,1526,1527,1528,1529,1530,1531,1532],
    74 => [1533,1534,1535,1536,1537,1538,1539,1540,1541,1542],
    75 => [1543,1544,1545,1546,1547,1548,1549,1550,1551,1552,1553],
    76 => [1554,1555,1556,1557,1558,1559,1560,1561,1562,1563,1564,1565,1566,1567,1568,1569,1570,1571,1572,1573,1574,1575,1576,1577,1578,1579],
    77 => [1580,1581,1582,1583,1584,1585,1586,1587,1588,1589,1590,1591,1592,1593,1594,1595,1596,1597,1598,1599,1600,1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612,1613,1614,1907,1908,1909,1910],
    78 => [1615,1616,1617,1618,1619,1620,1621,1622,1623,1624,1625,1626,1627,1628,1629,1630,1631,1632,1633,1634,1635,1636,1637,1638],
    79 => [1639,1640,1641,1642,1643,1644,1645,1646,1647,1648,1649,1650,1651,1652,1653,1654,1655,1656,1657,1658,1659,1660,1661,1662],
    80 => [1663,1664,1665,1666,1667,1668,1669,1670,1671,1672,1673,1674,1675,1676,1677,1678,1679,1680,1681,1682,1683,1684,1685,1686,1687,1688,1689],
    81 => [1690,1691,1692,1693,1694,1695,1696,1697,1698,1699,1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1711,1712,1713,1714,1715,1716,1717,1718,1719,1720,1721,1722,1723,1724,1725,1726,1727,1728,1729,1730,1731,1732,1733,1734,1735,1736,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1905,1748,1749],
    82 => [1750,1751,1752,1753,1754,1755,1756,1757,1758,1759,1760,1761,1762,1763,1764,1765,1766,1767,1768,1769,1770,1771,1772,1773],
    83 => [1774,1775,1776,1777,1778,1779,1780,1781,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797],
    84 => [1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811,1812,1813,1814,1815,1816,1817,1818,1819,1820,1821,1822,1823,1824,1825,1826,1827,1828,1829,1830,1831,1832,1833,1834,1835,1836,1837,1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1848,1849,1850,1851,1852,1853,1854,1855,1906,1856,1857],
    85 => [1858,1859,1860,1861,1862,1863,1864,1865,1866,1867,1868,1869,1870,1871,1872,1873,1874,1875,1876,1877,1878,1879,1880,1881,1882,1883,1884,1911],
    86 => [1885,1886,1887,1888,1889,1890,1891,1892,1893,1894,1895,1912,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922],
    87 => [1896,1897,1898,1899,1900,1901,1902,1903,1904,1923,1924,1925,1926,1927,1928,1929,1930,1931,1932,1933,1934],
    99 => [576,577,578,579,580,581,582,583,746,861,868],

  # 鍛冶レベル1
    101 => [2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031],

  # 鍛冶レベル2
    102 => [2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061,2062,2063,2064,2065,2066],

  # 鍛冶レベル3
    103 => [2067,2068,2069,2070,2071,2072,2073,2074,2075,2076,2077,2078,2079,2080,2081,2082,2083,2084,2085,2086,2087,2088,2089,2090,2091,2092,2093,2094,2095,2096],

  # 鍛冶レベル4
    104 => [2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,2125,2126,2127],

  # 鍛冶レベル5
    105 => [2128,2129,2130,2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,2141,2142,2143,2144,2145,2146,2147,2148,2149,2150,2151,2152,2153,2154,2155,2156,2157,2158,2159,2160,2161],

  # 鍛冶レベル6
    106 => [2162,2163,2164,2165,2166,2167,2168,2169,2170,2171,2172,2173,2174,2175,2176,2177,2178,2179,2392,2180,2181,2182,2183,2184,2185,2186,2187,2188,2189,2190,2191,2192,2193],

  # 鍛冶レベル7
    107 => [2194,2195,2196,2197,2198,2199,2200,2201,2202,2203,2204,2205,2206,2207,2208,2209,2210,2211,2212,2213,2214,2215,2216,2217,2218,2219,2220,2221,2222,2223,2224,2225,2226],

  # 鍛冶レベル8
    108 => [2227,2228,2229,2230,2231,2232,2233,2234,2235,2236,2237,2238,2239,2240,2241,2242,2243,2244,2245,2246,2247,2248,2249,2250,2251,2252,2253,2254],

  # 鍛冶レベル9
    109 => [2255,2256,2257,2258,2259,2260,2261,2262,2263,2264,2265,2266,2267,2268,2269,2270,2271,2272,2273,2274,2275,2276,2277,2278,2279,2280,2281,2282,2283,2284,2285,2286,2287,2288,2289,2290,2291,2292,2293,2294,2295,2296,2297],

  # 鍛冶レベル10
    110 => [2298,2299,2300,2301,2302,2303,2304,2305,2306,2307,2308,2309,2310,2311,2312,2313,2314,2315,2316,2317,2318,2319,2320,2321,2322,2323,2324,2325,2326,2327,2328,2329,2330,2331,2332,2333,2334,2335,2336,2337,2338,2339,2340,2341,2342,2343,2344,2345,2346],

  # 鍛冶レベル11
    111 => [2363,2364,2365,2366,2367,2368,2369,2370,2371,2372,2373,2374,2375,2376,2377,2378,2379,2380,2381,2382,2383,2384,2385,2386,2387,2388],

  # マキナ1
    112 => [2097,2098,2099,2100],

  # マキナ2
    113 => [2389,2390,2391,2097,2393,2394,2098,2395,2396,2397,2398,2099,2399,2400,2401,2402,2100,2403],

  # 求道者
    115 => [2404,2405,2406,2407,2408,2409],

  # 精霊鍛冶
    116 => [883,2359,884,2360,885,2361,886,2362],

  # ヤマタイ
    117 => [2347,2348,2349,2350,2351,2352,2353,2354,2355,2356,2357,2358],

  # 神聖鍛冶
    118 => [2410,2411,2412,2413,2414,2415,2416,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,2430,2431,2432,2433,2434,2435,2436,2437,2438,2439,2440,2441,2442,2443,2444],

  # 魔王鍛冶
    119 => [2445,2446,2447,2448,2449,2450,2451,2452,2453,2454,3385,2455,2456,2457,2458,2459,2460,2461,2462,2463,2464,2465,2466,2467,2468,2469,2470,2471,2472,2473,2474,2475,2476,2477,2478,2479,2480,2481,2482,2483],

  # 勇者鍛冶
    120 => [3386,2484,2485,2486,2487,2488,2489],

  # 混沌鍛冶
    121 => [2490,2491,2492,2493,2494,2495,2496,2497,2498,2499,2500,2501,2502,2503,2504,2505,2506,2507,2508,2509,2510,2511,2512,2513,2514,2515,2516,2517,2518,2519,2520],

  # エンリカ（混沌に親しむ者の大秘石）
    122 => [3001,3002,3003,3004,3005,3006,3007,3008,3009,3010,3011],

  # イリアスヴィル（嫌う者の大秘石）
    123 => [3012,3013,3014,3015,3016,3017,3018],

  # パイパイ（能力値UPの超秘石、混沌属性強化の超秘石）
    124 => [3019,3020,3021,3022,3023,3024,3025,3026,3027,3028,3029,3030,3031,3032,3033,3034,3035,3036,3037,3038],

  # モンテカルロ（状態異常付加の超秘石）
    125 => [3039,3040,3041,3042,3043,3044,3045,3046,3047,3048,3049,3050,3051,3052,3053,3054,3055,3056,3057,3058,3059,3060,3061,3062],

  # グランドール（属性に親しむ者の超秘石）
    126 => [3063,3064,3065,3066,3067,3068,3069,3070,3071,3072,3073,3074,3075],

  # サルーン（スキル使用可能の超秘石）
    127 => [3076,3077,3078,3079,3080,3081,3082,3083,3084,3085,3086,3087,3088,3089,3090,3091,3354,3355,3356,3357,3358,3359,3360,3092,3093,3094,3095,3096,3097,3098,3099,3100,3101,3102,3103,3104,3105,3106,3107,3108,3109,3110,3111,3112,3113,3114,3115,3116,3117,3118,3119,3120,3121,3122,3123,3124,3125,3126,3127],

  # レミナ（属性耐性の超秘石）
    128 => [3128,3129,3130,3131,3132,3133,3134,3135,3136,3137,3138,3139],

  # パイパイ習得1（属性無効の絶秘石）
    129 => [3140,3141,3142,3143,3144,3145,3146,3147,3148,3149,3150,3151],

  # パイパイ習得2（属性強化の絶秘石）
    130 => [3152,3153,3154,3155,3156,3157,3158,3159,3160,3161,3162,3163,3164],

  # パイパイ習得3（スキルタイプの絶秘石）
    131 => [3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176,3177,3178,3179,3180,3181,3182,3183,3184,3185,3186,3187,3188,3189,3190,3191,3192,3193,3194,3195,3196,3197,3198,3199,3200,3201,3202,3203,3204,3205,3206,3207,3208,3209,3210,3211,3212,3213,3214,3215,3216,3217,3218,3219,3220,3221,3222,3223,3224,3225,3226],

  # パイパイ習得4（状態異常付加の絶秘石）
    132 => [3227,3228,3229,3230,3231,3232,3233,3234,3235,3236,3237,3238,3239,3240,3241,3242,3243,3244,3245,3246,3247,3248,3249,3250],

  # パイパイ習得5（種族に親しむ者の絶秘石）
    133 => [3251,3252,3253,3254,3255,3256,3257,3258,3259,3260,3261,3262,3263,3264,3265,3266,3267,3268,3269,3270,3271,3272,3273,3274,3275,3276,3277,3278],

  # パイパイ習得6（職業に親しむ者の絶秘石）
    134 => [3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3293,3294,3295,3296,3297,3298,3299,3300,3301,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3316],

  # パイパイ習得7（環境強化の絶秘石）
    135 => [3317,3318,3319,3320,3321,3322],

  # パイパイ習得8（混沌耐性の絶秘石）
    136 => [3323,3324,3325,3326,3327,3328,3329,3330,3331,3332,3333],

  # パイパイ習得9（能力値UPの絶秘石）
    137 => [3334,3335,3336,3337,3338,3339,3340,3341,3342],

  # パイパイ習得10（混沌に親しむ者の絶秘石）
    138 => [3343,3344,3345,3346,3347,3348,3349,3350,3351,3352,3353],

  # 混沌パイパイ（極秘石）
    139 => [3361,3362,3363,3364,3365,3366,3367,3368,3369,3370,3371,3372,3373,3374,3375,3376,3377,3378,3379,3380,3381,3382,3383,3384],

  }
end

