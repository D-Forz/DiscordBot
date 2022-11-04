require 'discordrb'
require 'discordrb/webhooks'
require 'dotenv/load'
require 'active_record'

# Initialize the database
db_config = YAML.load(File.open("config/database.yml"), aliases: true)
ActiveRecord::Base.establish_connection(db_config)

# Require all the ruby files you have created in `lib`
dir = File.dirname(__FILE__)
Dir[File.join(dir, 'lib/**/*.rb')].each { |file| require file }

# Launch the app!
discord_bot = DiscordBot.new
discord_bot.run
