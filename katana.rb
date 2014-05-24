#!/usr/bin/env ruby
require_relative "src/attempt_controller"

class Katana

  def initialize
    @attempt = AttemptController.new
    get_user_commands
  end

  def get_user_commands
    command = ARGV[0]
    argument = ARGV[1]
    case command
    when "try"
      if argument.nil?
        @attempt.try_random
      elsif rgument.start_with?(':')
        tag = argument.slice(1..-1)
        @attempt.try_tag(tag)
      else
        @attempt.try_specific(argument)
      end
    when "add"
      @attempt.create(argument)
    when "remove"
      @attempt.remove(argument)
    when "update"
      @attempt.update(argument)
    when "list"
      @attempt.list
    when "help"
      @attempt.help
    else
      puts "Invalid usage"
      @attempt.help
    end
  end
end

katana = Katana.new
