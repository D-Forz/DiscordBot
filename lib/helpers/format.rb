module Format
  def self.help(event)
    event.send_embed do |embed|
      embed.title = 'Help'
      embed.colour = 0x00ff00
      embed.add_field(
        name: 'Commands',
        value:
        "!help - Shows this message\n" \
        "!create_character - Creates a character\n" \
        "!character - Shows your character's info\n" \
        "!hunt - Hunt for monsters\n" \
        "!heal - Heals your character to full health\n"
      )
    end
  end

  def self.character_info(event, character)
    event.send_embed do |embed|
      embed.author = Discordrb::Webhooks::EmbedAuthor.new(
        name: "#{character.name}'s info",
        icon_url: event.user.avatar_url
      )
      embed.colour = 0x7D7DFF
      embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: event.user.avatar_url)
      embed.description = "\n**PROGRESS**\n\n" \
                          "**Level:** #{character.level}\n" \
                          "**Experience:** #{character.xp}\n" \
                          "**Next level:** #{100 - character.xp} XP\n" \
                          "\n**STATS**\n\n" \
                          ":dagger: **AT:** #{character.attack}\n" \
                          ":shield: **DEF:** #{character.defense}\n" \
                          ":heart: **LIFE:** #{character.hp}\n" \
                          ":heart: **MAX LIFE:** #{character.max_hp}\n" \
                          "\n**INVENTORY**\n\n" \
                          ":coin: **Gold:** #{character.gold}"
      embed.footer = { text: 'Created by @D-Forz' }
    end
  end

  def self.battle_actions(event, monster)
    event.send_embed do |embed|
      embed.title = "What do you want to do?"
      embed.description = "#{monster.name} HP: #{monster.hp}"
      embed.colour = 0x00ff00
      embed.add_field(name: '1', value: 'Attack the monster.')
      embed.add_field(name: '2', value: 'Flee from the monster.')
    end
  end
end
