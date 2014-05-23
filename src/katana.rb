require_relative "kata_attempt_controller"

class Katana

  def initialize
    @katana_attempt_controller = KatanaAttemptController.new
    get_user_commands
  end

  def get_user_commands
    @command = ARGV[0]
    @file = ARGV[1]
    case @command
    when "try"
      @katana_attempt_controller.try
    when "create"
      @katana_attempt_controller.create(@file)
    when "remove"
      @katana_attempt_controller.remove(@file)
    when "help"
      help_text = <<-help
      Usage: katana.rb [options]

      options: try
               create [file_name]
               remove [file_name]
      help
      puts help_text
    end
  end
end


katana =  Katana.new
katana

