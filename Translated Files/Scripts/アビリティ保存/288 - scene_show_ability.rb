class AbilityForm
  class Scene_ShowAbility < Scene_MenuBase
    def start
      super
      @tab = Marshal.load(Marshal.dump(@actor.equip_abilities))
      @actor.load_abilities(@file_index) if @file_index
      CacheActorFeatures.init_actor(@actor)
      create_help_window
      create_equip_ability_window
      create_ability_type_window
    end

    def prepare(file_index)
      @file_index = file_index
    end

    def create_ability_type_window
      @ability_type_window = Foo::Ability::Window_AbilityType.new(@equip_ability_window, @equip_ability_window)
      @ability_type_window.set_handler(:ok, method(:process_ability_type_ok))
      @ability_type_window.set_handler(:cancel, method(:return_scene))
      @ability_type_window.actor = @actor
      @ability_type_window.help_window = @help_window
      @ability_type_window.refresh
      @ability_type_window.update_help
    end

    def create_equip_ability_window
      @equip_ability_window = Window_EquipAbility.new
      @equip_ability_window.set_handler(:ok, method(:process_equip_ability_ok))
      @equip_ability_window.set_handler(:cancel, method(:process_equip_ability_cancel))
      @equip_ability_window.actor = @actor
      @equip_ability_window.help_window = @help_window
    end

    def process_ability_type_ok
      if @equip_ability_window.item_max == 0
        @ability_type_window.activate
        return
      end
      @ability_type_window.deactivate
      @equip_ability_window.activate
      @equip_ability_window.select(0)
      @equip_ability_window.update_help
    end

    def process_equip_ability_ok
      if @equip_ability_window.pending_index >= 0
        stype_id = @ability_type_window.stype_id
        @actor.equip_abilities[stype_id].swap!(@equip_ability_window.pending_index, @equip_ability_window.index)
        @equip_ability_window.pending_index = -1
        @equip_ability_window.refresh
      else
        @equip_ability_window.pending_index = @equip_ability_window.index
      end
      @equip_ability_window.activate
    end

    def process_equip_ability_cancel
      if @equip_ability_window.pending_index >= 0
        @equip_ability_window.pending_index = -1
        @equip_ability_window.activate
        return
      end
      @equip_ability_window.unselect
      @ability_type_window.activate
      @ability_type_window.update_help
    end

    def return_scene
      @actor.save_abilities(@file_index)
      @actor.equip_abilities = @tab
      CacheActorFeatures.init_actor(@actor)
      super
    end
  end
end
