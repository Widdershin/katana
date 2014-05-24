
class Kata
  attr_reader :name, :tags
  attr_accessor :code
  def initialize(name, code, tags=[])
    @name = name
    @code = code
    @tags = tags
  end

  def to_s
    "#{name} #{tag_string}"
  end

  def tag_string
    tags ? "- :#{tags.join(', :')}" : ""
  end
end



# adverts = ["This kata is proudly brought to you by: Dev Academy","This kata is proudly brought to you by: Pascals Jellybeans","This kata is proudly brought to you by: Nike","This kata is proudly brought to you by: Hings Tofu"]
