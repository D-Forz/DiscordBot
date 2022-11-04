class DiscordBot < Discordrb::Commands::CommandBot
  def initialize
    super(token: ENV.fetch('TOKEN'), prefix: '.', ignore_bots: true, fancy_log: true)
  end

  def run
    puts 'Bot is running'
    puts "The bot invite URL is #{invite_url(permission_bits: 8)}."
    puts 'Click on it to invite the bot to your server.'

    initialize_commands
    super.run
  end

  def initialize_commands
    help_commands
    flip_coin
    create_character
    character
    hunt
    heal
  end

  def help_commands
    command(:help_commands) do |event|
      Format.help(event)
    end
  end

  def flip_coin
    command(:flip, description: 'Flips a coin.') do |event|
      event.respond ['Head', 'Tail'].sample
    end
  end

  def create_character
    command(:create_character) do |event|
      if Character.find_by(user_id: event.user.id).nil?
        Character.create(name: event.user.name, user_id: event.user.id)
        event.respond "Character #{event.user.name} created."
      else
        event.respond 'You already have a character!'
        execute_command(:character, event, [])
      end
    end
  end

  def character
    command(:character) do |event|
      if Character.find_by(user_id: event.user.id)
        character = Character.find_by(user_id: event.user.id)
        Format.character_info(event, character)
      else
        event.respond "You do not have a character! Type `.create_character` to create one."
      end
    end
  end

  def hunt
    command(:hunt) do |event|
      character = Character.find_by(user_id: event.user.id)
      monster = character.hunt
      event.respond "You encountered a #{monster.name}."
      Format.battle_actions(event, monster)
      response = event.user.await!
      case response.content
      when "1"
        Fight.battle(event, character, monster) until monster.hp <= 0 || character.hp <= 0
        if monster.hp <= 0 && character.hp.positive?
          event.respond character.defeat(monster)
        elsif character.hp <= 0
          character.destroy
          event.respond "You died to a #{monster.name}."
        end
      when "2"
        event.respond character.flee(monster)
      else
        event.respond "Invalid input."
      end
    end
  end

  def heal
    command(:heal) do |event|
      character = Character.find_by(user_id: event.user.id)
      if character.hp < character.max_hp
        character.hp = character.max_hp
        character.update(hp: character.hp)
        event.respond "You healed to #{character.max_hp} HP."
      else
        event.respond 'You are already at full health.'
      end
    end
  end
end
