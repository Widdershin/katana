

class KatanaAttemptController

  def initialize
  end

  def try
    %x(subl -wn current_kata_attempt.rb)
    File.open("current_kata_attempt.rb") do |file|
      code = file.read
      eval code
    end
  end

end
