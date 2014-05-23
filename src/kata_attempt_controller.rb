require_relative 'asserts'
require_relative 'kata_io_controller'

class KatanaAttemptController

  def initialize
    @io = KataFileIO.new("katas")
    # @views = Views.new
  end

  def get_kata_for_tag(tag)
    katas = @io.load
    katas.select{|kata| kata.tags.include? tag}.sample
  end

  def get_kata
    katas = @io.load
    katas.sample
  end

  def try(tag=nil)
    if tag
      kata = get_kata_for_tag(tag)
    else
      kata = get_kata
    end
    @io.start_new_attempt(kata)

    result = false

    until result == true
      result = attempt_kata(kata)
      if result != true
        puts "Failed with: #{result}. Get back in the jar, you jellybean."
        puts "Would you like to retry? y/n"
        input = $stdin.gets.chomp
        if input == "n"
          break
        end
      end
    end
    if result == true
      puts "Congratulations, you're a gelatin-free jet plane!"
    end
  end

  def attempt_kata(kata)
    %x(subl -wn current_kata_attempt.rb)
    code = File.open("current_kata_attempt.rb") do |file|
      file.read
    end

    begin
      eval code
    rescue Exception => e
      return e.to_s
    end

    true
  end

  def create(kata_name)
    @io.create(kata_name)
    open_with_subl(kata_name)
  end

  def remove(kata_name)
    @io.remove(kata_name)
  end

  def open_with_subl(kata_name)
    %x(subl -wn "katas/#{kata_name}.rb")
  end

  def update(kata_name)
    open_with_subl(kata_name)
  end
end
