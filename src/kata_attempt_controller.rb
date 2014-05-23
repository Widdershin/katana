require_relative 'asserts'
require_relative 'kata_io_controller'
require_relative 'views'

class KatanaAttemptController

  def initialize
    @io = KataFileIO.new("katas")
    @view = ConsoleView.new
  end

  def get_kata
    katas = @io.load
    katas.sample
  end

  def list
    katas = @io.load
    @view.list_all(katas)
  end

  def try
    kata = get_kata
    @io.start_new_attempt(kata)

    result = false

    until result == true
      result = attempt_kata(kata)
      if result != true
        @view.failure_message(result)
        input = $stdin.gets.chomp
        if input == "n"
          break
        end
      end
    end
    if result == true
      @view.success_message
    end
  end

  def create(kata_name)
    @io.create(kata_name)
    open_with_subl(kata_name)
  end

  def remove(kata_name)
    @io.remove(kata_name)
  end

  def update(kata_name)
    open_with_subl(kata_name)
  end

  def help
    @view.help
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

  def open_with_subl(kata_name)
    %x(subl -wn "katas/#{kata_name}.rb")
  end
end
