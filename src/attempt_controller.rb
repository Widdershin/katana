require_relative 'asserts'
require_relative 'file_controller'
require_relative 'views'

class AttemptController

  def initialize
    @kata_files = FileController.new("katas")
    @view = ConsoleView.new
  end

  def get_kata_for_tag(tag)
    katas = @kata_files.load
    katas.select{|kata| kata.tags.include? tag}.sample
  end

  def get_specific_kata(specific)
    katas = @kata_files.load
    katas.find {|kata| kata.filename.end_with? "/#{specific}.rb" }
  end

  def get_random_kata
    katas = @kata_files.load
    katas.sample
  end

  def list
    katas = @kata_files.load
    @view.list_all(katas)
  end

  def try_tag(tag)
    kata = get_kata_for_tag(tag)
    try(kata)
  end

  def try_specific(specific_kata)
    kata = get_specific_kata(specific_kata)
    try(kata)
  end

  def try_random
    kata = get_random_kata
    try(kata)
  end

  def try(kata)
    @view.display_title(kata)

    @kata_files.start_new_attempt(kata)

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
    @view.sponsors
  end

  def create(kata_name)
    @kata_files.create(kata_name)
    open_with_subl(kata_name)
  end

  def remove(kata_name)
    @kata_files.remove(kata_name)
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
