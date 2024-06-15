class Character
  attr_accessor :weapon

  def initialize(weapon: NoWeaponBehavior.new)
    @weapon = weapon
  end

  def fignt
    @weapon.fignt
  end
end

class NoWeaponBehavior
  def fignt
    puts '殴る'
  end
end

class NnifeBehavior
  def fignt
    puts '刺す'
  end
end

class GunBehavior
  def fignt
    puts '撃つ'
  end
end

character = Character.new
character.fignt
character.weapon = NnifeBehavior.new
character.fignt
character.weapon = GunBehavior.new
character.fignt
