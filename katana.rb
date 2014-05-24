#!/usr/bin/env ruby
require_relative "src/attempt_controller"

class Katana

  def initialize
    @katana_attempt_controller = AttemptController.new
    get_user_commands
  end

  def get_user_commands
    command = ARGV[0]
    kata_name = ARGV[1]
    case command
    when "try"
      if kata_name != nil
        if kata_name.start_with?(':')
          tag = kata_name.slice(1..-1)
          @katana_attempt_controller.try_tag(tag)
        else
          @katana_attempt_controller.try_specific(kata_name)
        end
      else
        @katana_attempt_controller.try_random
      end
    when "add"
      @katana_attempt_controller.create(kata_name)
    when "remove"
      @katana_attempt_controller.remove(kata_name)
    when "update"
      @katana_attempt_controller.update(kata_name)
    when "list"
      @katana_attempt_controller.list
    when "help"
      @katana_attempt_controller.help
    else
      puts "Invalid usage"
      @katana_attempt_controller.help
    end
  end
end

katana = Katana.new
