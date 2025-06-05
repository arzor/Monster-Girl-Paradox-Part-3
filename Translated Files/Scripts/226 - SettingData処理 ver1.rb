#
# もんむす・くえすと！ＲＰＧ
# 　SettingData処理  ver1  2015/03/24
#
# ※このスクリプトは、以下の全てよりも下に導入する
# 　SettingDataフォルダの読み込みスクリプト（■データ設定）
# 　SettingDataフォルダの各ファイル内容を移行したセクション
#
#
# 機能一覧　説明は下
# ・SkillWords(Actor).rb　SKILL_WORDS　アクター0に「全アクター共通の設定」を記述
#
#
# 機能　説明
# ・SkillWords(Actor).rb　SKILL_WORDS　アクター0に「全アクター共通の設定」を記述
# アクターIDを0にして、通常のアクターと同様に設定する
# アクター0内で記述したものは共通設定となり、全アクターのSKILL_WORDSにコピーされる
#
# ただし共通設定が有効なのは、アクターがそのスキルについて設定していない場合のみ
# 設定しているアクターはその設定が使われ、共通設定は使われない
# 　・[1576] の設定がないアクター：アクター0の [1576] 設定がコピーされる
# 　・[1576] の設定があるアクター：そのアクターの [1576] 設定がそのまま残る
#

#==============================================================================
# SkillWords(Actor).rb　SKILL_WORDS　アクター0に「全アクター共通の設定」を記述
#==============================================================================
module NWConst
  module Actor
    class << self
      @word_cache = []
      WORD = /word_([aey]?)(\d+)$/
      def create_skill_words(skill_words)
        return [] unless skill_words
        return skill_words[:words] if skill_words[:words]

        r = skill_words.map do |k, v|
          match = WORD.match(k)
          next unless match

          w = Word.new(v[0], v[1], v[2])
          case match[1]
          when "a"
            w.condition = :actor?
          when "e"
            w.condition = :enemy?
          when "y"
            w.condition = :temptation?
          end
          w
        end
        words = r.compact
        if skill_words.key?(:word_1x)
          word_data = skill_words.fetch(:word_1x).clone
          index = 2
          loop do
            key = "word_#{index}x".to_sym
            break unless skill_words.key?(key)

            w = skill_words.fetch(key)
            word_data[0] += "\g[\"#{w[1]}\",#{w[2]}]\f#{w[0]}"
            index += 1
          end
          words << Word.new(word_data[0], word_data[1], word_data[2])
        end

        skill_words[:words] = words
        words
      end
    end
    SKILL_WORDS[0].each do |_, v|
      create_skill_words(v).each do |w|
        w.common = true
      end
      v[:common] = true
    end

    SKILL_WORDS[0].each do |convert_skill_key, convert_value|
      SKILL_WORDS.each_key do |actor_key|
        next if actor_key == 0
        next if SKILL_WORDS[actor_key][convert_skill_key]

        SKILL_WORDS[actor_key][convert_skill_key] = convert_value
      end
    end
  end
end

NWConst::Warp::Places.each.with_index do |place, index|
  place[:index] = index
end
