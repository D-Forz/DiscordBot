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

    return monster
  end

  def flee(monster)
    self.mode = 'normal'
    self.battling = 0
    update(mode:, battling:)

    return "You fled from #{monster.name}."
  end

  def defeat(monster)
    self.xp += monster.xp
    self.gold += monster.gold

    self.mode = 'normal'
    self.battling = 0

    update(xp:, gold:, mode:, battling:)
    level_up if self.xp >= 100
    return "You defeated #{monster.name} and gained #{monster.xp} XP and :coin: #{monster.gold} gold."
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
    return "You leveled up to level #{level}!"
  end
end
