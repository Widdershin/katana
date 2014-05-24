#!/usr/bin/env ruby
require_relative "src/attempt_controller"

class Katana

  def initialize
    @attempt = AttemptController.new
  end

  def start(input)
    route_user_command(input)
  end

  def route_user_command(input)
    command, argument = input
    
    case command
    when "try"
      if argument.nil?
        @attempt.try_random
      elsif argument.start_with?(':')
        tag = get_tag(argument)
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

  def get_tag(argument)
    argument.slice(1..-1)
  end

  private :route_user_command, :get_tag
end

katana = Katana.new
katana.start(ARGV)