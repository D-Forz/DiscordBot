module Fight
  def self.attack(attacker, defender)
    defense = [defender.defense, 1].max
    chance_to_hit = Random.rand(0..(attacker.attack / defense))
    damage = chance_to_hit.positive? ? attacker.attack : 0

    defender.hp -= damage
    return damage, defender.hp
  end

  def self.battle(event, character, monster)
    damage, monster.hp = Fight.attack(character, monster)
    event.respond "You attacked the #{monster.name}. You dealt :dagger:" \
                  "#{damage} damage. It has #{monster.hp} HP left."
    sleep(2)
    return if monster.hp <= 0

    damage, character.hp = Fight.attack(monster, character)
    event.respond "The #{monster.name} attacked you. It dealt :dagger:" \
                  "#{damage} damage. You have #{character.hp} HP left."
    sleep(2)
  end
end
