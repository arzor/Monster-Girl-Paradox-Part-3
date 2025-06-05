

module LibraryH
  class SpriteSet_CGViewer
    attr_accessor :index
    attr_accessor :page
    def initialize(cg_data)
      @cg_data = cg_data
      @page = 0
      @index = 0
      @cg_sprites =
        @cg_data.map do |cg|
          cg.regist.each_with_object({}) do |(id, data), h|
            h[id] = Sprite_CGViewer.new(id, data)
          end
        end
      refresh(true)
    end

    def next_page?
      @page + 1 < @cg_sprites.size
    end

    def max_index_size
      @cg_data[@page][:draw].size - 1
    end

    def next_index?
      @index < max_index_size
    end

    def refresh(force = false)
      @cg_sprites.each_with_index do |sprites, page|
        sprites.each_with_index do |(_key, sprite), _index|
          sprite.visible = page == @page

          sprite.refresh(@cg_data[@page][:draw][@index], true)
        end
      end
    end

    def update
      @cg_sprites.map(&:values).flatten.each(&:update)
    end

    def dispose
      @cg_sprites.map(&:values).flatten.each(&:dispose)
    end
  end

  class SpriteSet_Background
    def initialize
      @viewport = Viewport.new
      @back1_sprite = Sprite.new(@viewport)
      @back1_sprite.z = -100

      @back2_sprite = Sprite.new(@viewport)
      @back2_sprite.z = -99
      @picture_sprite = Sprite.new(@viewport)
      @back2_sprite.z = -98
    end

    def refresh
      @back1_sprite.bitmap = nil
      @back2_sprite.bitmap = nil
      @picture_sprite.bitmap = nil
      if $game_novel.bg_data.nil?
        @back1_sprite.bitmap = SceneManager.background_bitmap
      else
        if $game_novel.bg_data.key?(:bb1) && NWFileTest.battleback1_exist?($game_novel.bg_data[:bb1])
          @back1_sprite.bitmap = Cache.battleback1($game_novel.bg_data[:bb1])
        end
        if $game_novel.bg_data.key?(:bb2) && NWFileTest.battleback2_exist?($game_novel.bg_data[:bb1])
          @back2_sprite.bitmap = Cache.battleback2($game_novel.bg_data[:bb2])
        end
        if $game_novel.bg_data.key?(:pic) && NWFileTest.battleback2_exist?($game_novel.bg_data[:pic])
          @picture_sprite.bitmap = Cache.picture($game_novel.bg_data[:pic])
        end
      end
      all_sprites.each(&:vxa_640x480_zoom)
    end

    def update
      all_sprites.each(&:update)
    end

    def dispose
      all_sprites.each(&:dispose)
    end

    def all_sprites
      [@back1_sprite, @back2_sprite, @picture_sprite]
    end
  end

  class Scene_CGViewer < Scene_Base
    def prepare(cg_data)
      @cg_data = cg_data.showable_data
    end

    def start
      super
      @background_spriteset = SpriteSet_Background.new
      @cg_spriteset = SpriteSet_CGViewer.new(@cg_data)
      refresh_cg_sprites
      refresh_background
    end

    def terminate
      super
      @background_spriteset.dispose
      @cg_spriteset.dispose
      $game_novel.clear
    end

    def process_cg_change
      if Input.trigger?(:RIGHT) || Input.trigger?(:C)
        if @cg_spriteset.next_index?
          @cg_spriteset.index += 1
        else
          next_page
        end
        refresh_cg_sprites
      elsif Input.trigger?(:LEFT)
        if @cg_spriteset.index == 0
          before_page
        else
          @cg_spriteset.index -= 1
        end
        refresh_cg_sprites
      end
    end

    def next_page
      return return_scene unless @cg_spriteset.next_page?

      @cg_spriteset.page += 1
      @cg_spriteset.index = 0
      refresh_background
    end

    def before_page
      return if @cg_spriteset.page == 0

      @cg_spriteset.page -= 1
      @cg_spriteset.index = @cg_spriteset.max_index_size
      refresh_background
    end

    def refresh_cg_sprites
      @cg_spriteset.refresh
    end

    def refresh_background
      $game_novel.bg_data = @cg_data[@cg_spriteset.page].background
      @background_spriteset.refresh
    end

    def update
      super
      process_cg_change
      @cg_spriteset.update
      @background_spriteset.update
      return_scene if Input.trigger?(:B)
    end
  end
end
