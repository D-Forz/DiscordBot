class DiscordBot < Discordrb::Commands::CommandBot
  include AppCommands
  include Game
  def initialize
    super(token: ENV.fetch('TOKEN'), prefix: '.', ignore_bots: true, fancy_log: true)
  end

  def run
    puts 'Bot is running'
    puts "The bot invite URL is #{invite_url(permission_bits: 8)}."
    puts 'Click on it to invite the bot to your server.'

    initialize_modules
    super.run
  end

  def initialize_modules
    # register_app_commands # Register the application commands, only needs to be done once
    initialize_game
  end
end
