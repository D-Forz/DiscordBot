module Game
  def initialize_game
    create_character
    coinflip
    profile
    hunt
    heal
  end

  def coinflip
    application_command(:coinflip) do |event|
      event.respond(content: ['Head', 'Tail'].sample)
    end
  end

  def create_character
    application_command(:create_character) do |event|
      if Character.find_by(user_id: event.user.id).nil?
        Character.create(name: event.user.name, user_id: event.user.id)
        event.respond(content: "Character #{event.user.name} created.")
      else
        event.respond(content: 'You already have a character!') do |_, view|
          view.row do |r|
            r.select_menu(
              custom_id: 'select_menu',
              placeholder: 'Select an option',
              options: [{ label: 'Profile', value: 'profile' }]
            )
          end
        end
      end
      select_menu(custom_id: 'select_menu') do |select|
        select.respond(content: "Use the command `/profile` to see your character's info.")
      end
    end
  end

  def profile
    application_command(:profile) do |event|
      if Character.find_by(user_id: event.user.id)
        character = Character.find_by(user_id: event.user.id)
        Format.character_info(event, character)
      else
        event.respond(content: "You do not have a character! Type `/create_character` to create one.")
      end
    end
  end

  def hunt
    application_command(:hunt) do |event|
      character = Character.find_by(user_id: event.user.id)
      monster = character.hunt
      event.respond(
        content: "You found a #{monster.name}!\n\nWhat do you want to do?"
      ) do |_, view|
        view.row do |row|
          row.button(label: 'Attack', style: 1, custom_id: 'attack')
          row.button(label: 'Flee', style: 1, emoji: 577663465322315786, custom_id: 'flee')
        end
      end
      button(custom_id: 'attack') do |combat|
        Fight.battle(character, monster) until monster.hp <= 0 || character.hp <= 0
        if monster.hp <= 0 && character.hp.positive?
          combat.update_message(content: character.defeat(monster, character))
        elsif character.hp <= 0
          character.destroy
          combat.update_message(content: "You died to a #{monster.name}.")
        end
      end
      button(custom_id: 'flee') do |combat|
        combat.update_message(content: character.flee(monster))
      end
    end

  end

  def heal
    application_command(:heal) do |event|
      character = Character.find_by(user_id: event.user.id)
      if character.hp < character.max_hp
        character.hp = character.max_hp
        character.update(hp: character.hp)
        event.respond(content: "You healed to #{character.max_hp} HP.")
      else
        event.respond(content: 'You are already at full health.')
      end
    end
  end
end
