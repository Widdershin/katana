require 'colorize'

class ConsoleView

  def success_message
    puts "Congratulations, you're a gelatin-free jet plane!".colorize(:green)
  end

  def failure_message(result)
    puts "Failed with: #{result}. Get back in the jar, you jellybean.".colorize(:red)
    puts "Would you like to retry? y/n".colorize(:red)
  end

end

