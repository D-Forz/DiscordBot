module AppCommands
  def register_app_commands
    register_application_command(:coinflip, 'Flip a coin') do |cmd|
      cmd.string(:choice, 'Heads or tails?', required: false)
    end
    register_application_command(:create_character, 'Create a character')
    register_application_command(:profile, 'Show your character')
    register_application_command(:hunt, 'Hunt for monsters')
    register_application_command(:heal, 'Heal your character')
  end
end
