require_relative 'asserts'
require_relative 'kata_io_controller'

class KatanaAttemptController

  def initialize
    @io = KataFileIO.new("katas")
    # @views = Views.new
  end

  def get_kata
    katas = @io.load
    katas.sample
  end

  def try
    kata = get_kata
    @io.start_new_attempt(kata)

    result = false

    until result == true
      result = attempt_kata(kata)
      if result != true
        puts "Failed with: #{result}. Get back in the jar, you jelly-bean."
      end
    end

    puts "Congratulations, you're a gelatin free jet plane!"
  end

  def attempt_kata(kata)
    %x(subl -wn current_kata_attempt.rb)
    File.open("current_kata_attempt.rb") do |file|
      @code = file.read
    end

    begin
      eval @code
    rescue Exception => e
      return e.to_s
    end

    true
  end

  def create(file_name)
    @io.create(file_name)
    %x(subl -wn "katas/#{file_name}")
  end

  def remove(file_name)
    @io.remove(file_name)
  end
end
