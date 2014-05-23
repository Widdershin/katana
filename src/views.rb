require 'colorize'
require 'pp'
class ConsoleView

  def sponsors
    puts "Proudly brought to you by Hings Tofu"
    pig = <<-ascii
         _//|.-~~~~-,
       _/66  \       \_@
      (")_   /   /   |
        '--'|| |-\  /
   jgs      //_/ /_/
   ascii
   puts pig.colorize(:light_magenta)
  end

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

  def display_title(kata)
    puts "You are now attempting #{kata.filename}"
  end

  def help
    help_text = <<-help
      #{"Usage: katana.rb [options]".colorize(:yellow)}

      #{"Options:".colorize(:yellow)} #{"try [:tag] [specific_kata]".colorize(:cyan)}
               #{"create <file_name>".colorize(:cyan)}
               #{"remove <file_name>".colorize(:cyan)}
               #{"update <file_name>".colorize(:cyan)}
               #{"list   (lists all katas avaliable)".colorize(:cyan)}

      help
    puts help_text
  end
end
