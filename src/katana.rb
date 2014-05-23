#!/usr/bin/env ruby
require_relative "kata_attempt_controller"

class Katana

  def initialize
    @katana_attempt_controller = KatanaAttemptController.new
    get_user_commands
  end

  def get_user_commands
    command = ARGV[0]
    kata_name = ARGV[1]
    case command
    when "try"
      if kata_name != nil && kata_name.start_with?(':')
        tag = kata_name.slice(1..-1)
      else
        tag = nil
      end
      @katana_attempt_controller.try(tag)
    when "create"
      @katana_attempt_controller.create(kata_name)
    when "remove"
      @katana_attempt_controller.remove(kata_name)
    when "update"
      @katana_attempt_controller.update(kata_name)
    when "list"
      @katana_attempt_controller.list
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

katana = Katana.new

