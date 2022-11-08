module Format
  def self.character_info(event, character)
    event.respond(
      embeds: [Discordrb::Webhooks::Embed.new(
        colour: 0xF0E68C,
        author: { name: "#{character.name}'s info", icon_url: event.user.avatar_url },
        title: "PROGRESS",
        thumbnail: { url: event.user.avatar_url },
        description: "**Level:** #{character.level}\n" \
                     "**Experience:** #{character.xp}\n" \
                     "**Next level:** #{100 - character.xp} XP\n" \
                     "\n**STATS**\n\n" \
                     ":dagger: **AT:** #{character.attack}\n" \
                     ":shield: **DEF:** #{character.defense}\n" \
                     ":heart: **LIFE:** #{character.hp}\n" \
                     ":heart: **MAX LIFE:** #{character.max_hp}\n" \
                     "\n**INVENTORY**\n\n" \
                     ":coin: **Gold:** #{character.gold}",
        footer: { text: 'Created by @D-Forz' }
      )]
    )
  end
end
