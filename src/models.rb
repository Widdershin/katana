
class Kata
  attr_reader :filename, :tags
  attr_accessor :code
  def initialize(filename, code, tags=[])
    @filename = filename
    @code = code
    @tags = tags
  end

  def to_s
    @filename
  end
end



# adverts = ["This kata is proudly brought to you by: Dev Academy","This kata is proudly brought to you by: Pascals Jellybeans","This kata is proudly brought to you by: Nike","This kata is proudly brought to you by: Hings Tofu"]
