require_relative 'models'

class KataFileIO
  # Responsible for loading and saving katas to disk
  attr_reader :kata_folder
  def initialize(kata_folder)
    @kata_folder = kata_folder
  end

  def load
    #Load all the katas from the folder
    loaded_katas = []

    kata_files = Dir.glob(kata_folder + '/*.rb')

    puts(kata_folder + '/*.rb')

    kata_files.each do |filename|
      File.open(filename) do |file|
        file_contents = file.read
        new_kata = Kata.new(file_contents)
        loaded_katas << new_kata
      end
    end

    loaded_katas
  end
end

# io = KataFileIO.new('katas')

# katas = io.load

# p katas
# eval katas[0].code
