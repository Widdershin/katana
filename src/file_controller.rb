require_relative 'models'

class FileController
  # Responsible for loading and saving katas to disk
  attr_reader :kata_folder
  def initialize(kata_folder)
    @kata_folder = kata_folder
  end

  def load
    #Load all the katas from the folder
    loaded_katas = []

    kata_files = Dir.glob(kata_folder + '/*.rb')

    kata_files.each do |filename|
      File.open(filename) do |file|
        file_contents = file.read

        first_line = file_contents.lines[0].chomp.gsub(/\s+/,"").downcase
        tags_prefix = "#tags:"

        tags = []
        if first_line.start_with? tags_prefix
          tags = first_line.slice(tags_prefix.length..-1).split(',')
        end

        new_kata = Kata.new(filename, file_contents, tags)
        loaded_katas << new_kata
      end
    end

    loaded_katas
  end

  def save(kata)
    File.open(kata.filename, "w") do |file|
      file.write(kata.code)
    end
  end

  def start_new_attempt(kata)
    File.open("current_kata_attempt.rb", "w") do |file|
      file.write(kata.code)
    end
  end

  def create(kata_name)
    %x(touch "#{kata_folder}/#{kata_name}.rb")
  end

  def remove(kata_name)
    File.delete("#{kata_folder}/#{kata_name}.rb")
  end
end

# io = KataFileIO.new('katas')

# katas = io.load

# p katas
# test_kata = katas[0]

# # eval test_kata.code

# # test_kata.code += "\n# This code is sick nasty"

# # io.start_new_attempt(test_kata)

# # io.create("our_awesome_kata")

# io.remove(test_kata)
