require 'colorize'
require 'pp'
class ConsoleView

  def success_message
    puts "Congratulations, you're a gelatin-free jet plane!".colorize(:green)
  end

  def failure_message(result)
    puts "Failed with: #{result}. Get back in the jar, you jellybean.".colorize(:red)
    puts "Would you like to retry? y/n".colorize(:red)
  end

  def list_all(katas)
    puts katas
  end

  def help
    help_text = <<-help
      #{"Usage: katana.rb [options]".colorize(:yellow)}

      #{"Options:".colorize(:yellow)} #{"try".colorize(:cyan)}
               #{"create [file_name]".colorize(:cyan)}
               #{"remove [file_name]".colorize(:cyan)}
               #{"update [file_name]".colorize(:cyan)}
               #{"list   (lists all katas avaliable)".colorize(:cyan)}

      help
    puts help_text
  end

end

