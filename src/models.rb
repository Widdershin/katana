
class Kata
  attr_reader :filename
  attr_accessor :code
  def initialize(filename, code)
    @filename = filename
    @code = code
  end
end
