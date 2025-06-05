module CacheActorFeatures
  class << self
    def init
      @cache = {}
    end

    def init_actor(actor)
      @cache[actor] = {}
    end

    def feature_objects(actor)
      make(:feature_objects, actor)
    end

    def features(actor, code)
      make(:features, actor, code)
    end

    def features_with_id(actor, code, data_id)
      make(:features_with_id, actor, code, data_id)
    end

    def features_sum(actor, code, data_id)
      make(:features_sum, actor, code, data_id)
    end

    def features_set(actor, code)
      make(:features_set, actor, code)
    end

    def features_pi(actor, code, data_id)
      make(:features_pi, actor, code, data_id)
    end

    def features_sum_booster(actor, code, data_id)
      make(:features_sum_booster, actor, code, data_id)
    end

    def features_max(actor, code, data_id)
      make(:features_max, actor, code, data_id)
    end

    def equip_params(actor)
      make(:equip_params, actor)
    end

    def skill_change(actor, id)
      make(:skill_change, actor, id)
    end

    def cache?
      @flag
    end

    def start
      @flag = true
    end

    def stop
      @flag = false
      init
    end

    private

    def make(meth, actor, *args)
      @flag = false
      @cache[actor] ||= {}
      @cache[actor][meth] ||= {}
      @cache[actor][meth][args] ||= actor.send(meth, *args)
      @flag = true
      @cache[actor][meth][args]
    end
  end
end

CacheActorFeatures.init

module CacheUniq
  class << self
    attr_accessor :cache

    def init
      @cache = {}
    end
  end
  init
end

class Game_Actor < Game_Battler
  def features(code)
    return CacheActorFeatures.features(cache_actor, code) if CacheActorFeatures.cache?

    super
  end

  def features_with_id(code, data_id)
    return CacheActorFeatures.features_with_id(cache_actor, code, data_id) if CacheActorFeatures.cache?

    super
  end

  def features_sum(code, data_id)
    return CacheActorFeatures.features_sum(cache_actor, code, data_id) if CacheActorFeatures.cache?

    super
  end

  def features_pi(code, data_id)
    return CacheActorFeatures.features_pi(cache_actor, code, data_id) if CacheActorFeatures.cache?

    super
  end

  def features_sum_booster(feature_id, data_id)
    return CacheActorFeatures.features_sum_booster(cache_actor, feature_id, data_id) if CacheActorFeatures.cache?

    super
  end

  def features_max(code, data_id)
    return CacheActorFeatures.features_max(cache_actor, code, data_id) if CacheActorFeatures.cache?

    super
  end

  def features_set(code)
    return CacheActorFeatures.features_set(cache_actor, code) if CacheActorFeatures.cache?

    super
  end

  alias hima_cache_feature_feature_objects feature_objects
  def feature_objects
    return CacheActorFeatures.feature_objects(cache_actor) if CacheActorFeatures.cache?

    hima_cache_feature_feature_objects
  end

  alias hima_cache_feature_equip_params equip_params
  def equip_params
    return CacheActorFeatures.equip_params(cache_actor) if CacheActorFeatures.cache?

    hima_cache_feature_equip_params
  end

  alias hima_f_refresh refresh
  def refresh
    CacheActorFeatures.init_actor(self)
    CacheUniq.init
    hima_f_refresh
  end

  def cache_actor
    self
  end
end
