#===============================================================================
# ■ 遅延型スクリーンショット撮影さん for RGSS3
#-------------------------------------------------------------------------------
#　2012/06/10　Ru/むっくRu
#-------------------------------------------------------------------------------
#  PrintScreenを押すと指定フォルダに
#  ゲーム画面のスクリーンショットを保存する機能を追加します
#  （処理落ち対策として，押してから数秒後にファイルが生成されます）
#-------------------------------------------------------------------------------
# 【問題点など】
#  保存の際にゲームのフレームレートが少し落ちます（処理落ち）
#-------------------------------------------------------------------------------
# 【更新履歴】
# 2012/06/10 保存中にF12リセットを行うと強制終了する不具合を修正
# 2012/01/07 戦闘中にうまく撮影できないのを修正？
# 2011/12/27 ぶっぱ
#-------------------------------------------------------------------------------
# 【参考：PNG画像生成処理】
#  http://d.hatena.ne.jp/ku-ma-me/20091003/p1
#-------------------------------------------------------------------------------

#===============================================================================
# ● 設定項目
#===============================================================================
module HZM_VXA
  module ScreenShot
    # 保存するフォルダ名（末尾に/は付けない）
    DIRNAME = 'Save'
    # 保存するファイル名．拡張子（.png）は不要
    # 　%Y …… 西暦
    # 　%m …… 月(01-12)
    # 　%d …… 日(01-31)
    # 　%H …… 時(00-23)
    # 　%M …… 分(00-59)
    # 　%S …… 秒(00-59)
    FILENAME = "%Y%m%d_%H%M%S"
    
    # スクリーンショットに著作表示を入れる
    #   true  …… 入れる
    #   false …… 入れない
    USE_COPYRIGHT = false
    # 著作表示の文字
    COPYRIGHT_TEXT = ''
    # 著作表示の色
    COPYRIGHT_COLOR = Color.new(255, 255, 255)
    # 著作表示の大きさ
    COPYRIGHT_SIZE  = 16
    # 著作表示の位置（0：左寄せ，1：中央寄せ，2：右寄せ）
    COPYRIGHT_ALIGN = 2
    
    # 1フレームに処理する回数
    # ※この値を増やすとファイルが生成されるまでの時間が短くなりますが，
    #   一度にかかる負荷量も増えるため，処理落ちが激しくなります
    RUN_SPEED = 3
  end
end

#===============================================================================
# ↑ 　 ここまで設定 　 ↑
# ↓ 以下、スクリプト部 ↓
#===============================================================================

module HZM_VXA
  module ScreenShot
    VK_SNAPSHOT = 0x2c
    GetKeyState = Win32API.new('user32', 'GetKeyState', %w(l), 'i')
    #---------------------------------------------------------------------------
    # ● 初期化
    #---------------------------------------------------------------------------
    def self.init
      @pressed = false
      @list = []
    end


    #---------------------------------------------------------------------------
    # ● 更新
    #---------------------------------------------------------------------------
    def self.update
      add  if press?
      RUN_SPEED.times { develop }
    end
    #---------------------------------------------------------------------------
    # ● PrintScreen監視
    #---------------------------------------------------------------------------
    def self.press?
      if @pressed
        @pressed = (GetKeyState.call(VK_SNAPSHOT) < 0)
        false
      else
        @pressed = (GetKeyState.call(VK_SNAPSHOT) < 0)
      end
    end
    #---------------------------------------------------------------------------
    # ● 今の画面を現像待ちに追加
    #---------------------------------------------------------------------------
    def self.add
      bitmap = Graphics.snap_to_bitmap
      if USE_COPYRIGHT
        bitmap.font.size  = COPYRIGHT_SIZE
        bitmap.font.color = COPYRIGHT_COLOR
        bitmap.draw_text(0, bitmap.height - COPYRIGHT_SIZE, bitmap.width, COPYRIGHT_SIZE, COPYRIGHT_TEXT, COPYRIGHT_ALIGN)
      end
      filename = "#{Time.now.getlocal.strftime(FILENAME)}"
      @list.push({
        :bitmap => bitmap,
        :filename => filename
      })
    end
    #---------------------------------------------------------------------------
    # ● 現像処理
    #---------------------------------------------------------------------------
    def self.develop
      return if @list.empty?
      data = @list.first
      if data[:line] == nil  # 未処理
        data[:line] = 0
        data[:img] = []
      elsif data[:line] < data[:bitmap].height # 解析中
        data[:img].push 0
        for i in 0...data[:bitmap].width
          c = data[:bitmap].get_pixel(i, data[:line])
          data[:img].push(c.red, c.green, c.blue)
        end
        data[:line] += 1
      else  # 保存処理
        Dir.mkdir(DIRNAME) unless File.exist?(DIRNAME)
        cnt = Dir.glob("#{data[:filename]}*.png").size
        footer = cnt > 0 ? "_#{cnt}" : ""
        File.open("#{data[:filename]}.png", 'wb') do |file|
          file.write "\x89PNG\r\n\x1a\n"
          file.write createChunk('IHDR', [data[:bitmap].width, data[:bitmap].height, 8, 2, 0, 0, 0].pack('N2C5'))
          file.write createChunk('IDAT', Zlib::Deflate.deflate(data[:img].pack('C*')))
          file.write createChunk('IEND', '')
        end
        data[:bitmap].dispose
        @list.shift
      end
    end
    #---------------------------------------------------------------------------
    # ● PNGチャンク作成
    #---------------------------------------------------------------------------
    def self.createChunk(type, data)
      [data.bytesize, type, data, Zlib.crc32(type + data)].pack('NA4A*N')
    end

    def self.exist?
      !@list.empty?
    end

    def self.save(bitmap, fn)
      init
      @list.push({
        :bitmap => bitmap,
        :filename => fn
      })
      develop while !@list.empty?
    end
  end
end



class Bitmap
  def save(fn, type = nil, back = nil)
    begin
      HZM_VXA::ScreenShot.save(self, fn)
    rescue
    end
  end
end