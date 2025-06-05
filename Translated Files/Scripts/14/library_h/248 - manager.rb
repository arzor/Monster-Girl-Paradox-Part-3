module LibraryH
  module Manager
    class << self
      attr_accessor :return_scene_data, :return_flag

      def init
        @return_scene_data = nil
        @return_flag = nil
        @background_bitmap.dispose if @background_bitmap
        @background_bitmap = nil
        @h_scene_items = nil
        @bgm = nil
        @bgs = nil
        @stack = nil
        @contents = nil
      end

      def h_scene_items
        @h_scene_items ||= init_h_scene_items
      end

      def save_bgm_and_bgs
        @bgm = RPG::BGM.last
        @bgs = RPG::BGS.last
      end

      def save_scene
        @stack = SceneManager.stack.dup
      end

      def load_scene
        return unless @stack

        SceneManager.stack = @stack
        @stack = nil
      end

      def load
        load_background_bitmap
        load_scene
        load_contents
      end

      def save_contents
        @contents = Marshal.dump(DataManager.make_save_contents)
      end

      def load_contents
        return unless @contents

        DataManager.extract_save_contents(Marshal.load(@contents))
        @contents = nil
      end

      def save_background_bitmap
        @background_bitmap.dispose if @background_bitmap
        @background_bitmap = SceneManager.background_bitmap
        SceneManager.background_bitmap = nil
      end

      def load_background_bitmap
        return unless @background_bitmap

        SceneManager.background_bitmap.dispose if SceneManager.background_bitmap
        SceneManager.background_bitmap = @background_bitmap
        @background_bitmap = nil
      end

      def save
        save_background_bitmap
        save_scene
        save_contents
      end

      def replay_bgm_and_bgs
        @bgm.replay if @bgm
        @bgs.replay if @bgs
        @bgm = nil
        @bgs = nil
      end

      private

      def init_h_scene_items
        NWConst::Library::H_SCENE_ITEMS.keys.map do |key|
          LibraryH::Charactor.new(key)
        end
      end
    end
  end
end

