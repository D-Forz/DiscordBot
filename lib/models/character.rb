class Character < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true }
  validates :user_id, presence: true, uniqueness: true

  def hunt
    while true
      monster_type = Monster.all.sample

      break if monster_type.min_level <= level
    end

    monster = monster_type

    self.mode = 'battling'
    self.battling = 1
    update(mode:, battling:)

    monster
  end

  def flee(monster)
    self.mode = 'normal'
    self.battling = 0
    update(mode:, battling:)

    "You fled from #{monster.name}."
  end

  def defeat(monster, character)
    self.xp += monster.xp
    self.gold += monster.gold

    self.mode = 'normal'
    self.battling = 0

    update(xp:, gold:, mode:, battling:)
    message = self.xp >= 100 ? level_up : "lost #{character.max_hp - character.hp} HP, and now have #{character.hp} HP."
    "#{character.name} found and defeat a **#{monster.name}**!\n" \
      "got #{monster.xp} XP and #{monster.gold} gold.\n" \
      "#{message}"
  end

  def level_up
    self.level += 1
    self.max_hp += 10
    self.hp = self.max_hp
    self.mp += 10
    self.attack += 2
    self.defense += 1
    self.xp = 0

    update(level:, max_hp:, hp:, mp:, attack:, defense:, xp:)
    "leveled up to level #{level}!"
  end
end
