module Fight
  def self.attack(attacker, defender)
    defense = [defender.defense, 1].max
    chance_to_hit = Random.rand(0..(attacker.attack / defense))
    damage = chance_to_hit.positive? ? attacker.attack : 0

    defender.hp -= damage
    defender.hp
  end

  def self.battle(character, monster)
    monster.hp = Fight.attack(character, monster)
    return if monster.hp <= 0

    character.hp = Fight.attack(monster, character)
    character.update(hp: character.hp)
  end
end
