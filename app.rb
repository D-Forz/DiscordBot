require 'discordrb'
require 'discordrb/webhooks'
require 'dotenv/load'
require 'active_record'

# Initialize the database
db_config = YAML.load(File.open("config/database.yml"), aliases: true)
ActiveRecord::Base.establish_connection(db_config)

# Require all the ruby files you have created in `lib`
# Be careful with this, the order of the files is important
dir = File.dirname(__FILE__)
Dir[File.join(dir, 'lib/**/*.rb')].each { |file| require file }

# Launch the app!
discord_bot = DiscordBot.new
# discord_bot.ready do |event|
#   event.bot.playing = 'with Ruby'
# end # Issue with this method, error in console, still works
discord_bot.run
