module RPG
  [Item, Weapon, Armor].each do |klass|
    klass.send(:define_method, :favorite?, &proc { $game_party.favorite_item?(self) })
  end
end
