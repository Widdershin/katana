
class Kata
  attr_reader :filename, :tags
  attr_accessor :code
  def initialize(filename, code, tags=[])
    @filename = filename
    @code = code
    @tags = tags
  end
end
