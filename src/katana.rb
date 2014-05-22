require_relative "kata_attempt_controller"

class Katana

  def initialize
  end

  def launch
    @katana_attempt_controller = KatanaAttemptController.new
    get_user_commands
  end

  def get_user_commands
    @command = ARGV[0]
    case @command
    when "try"
      @katana_attempt_controller.try
    end
  end
end


katana =  Katana.new
katana.launch

