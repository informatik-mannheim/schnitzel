#!/usr/bin/env ruby
# Generator für das chaos.tar.xz, das von der Schnitzeljagd benötigt wird

require 'fileutils'

# Where to store temporary files?
TEMP_PATH = "/tmp/chaos"

# Files to package into the chaos folder
INCLUDE = %w{ ../files/kafka1.txt ../files/kafka2.txt ../files/wortliste.txt}

# The secret to be included into one file
SECRET = '#parmigiana4life#'

# Number of files to be generated in total
NUM_FILES = 65538

# Number of textfiles to be generated
NUM_TXT_FILES = 32771

# Maximum depth of folder hierarchy
MAX_DEPTH = 15

##
# Generate a random name with the given extension
# @param length Integer length of the name
# @param extension String the extension to use
def generate_filename(length, extension = '')
  result = generate_gibberish(length, false)
  result <<  extension
  result
end

##
# Generate gibberish content for the files oder file names.
# @param length Integer length of the gibberish
# @param blanks Boolean should blanks be used?
# @return random characters
def generate_gibberish(length, blanks = false)
  chars = ('a'..'z').to_a
  result = ''
  length.times { result << chars[Random.rand(chars.length)] }

  if blanks
    length.times { |i| result[i] = ' ' if Random.rand(4) == 0 }
  end

  result
end

##
# Generate a pathname with the given depth
# @param depth Integer depth of the past
# @return String[] the pathname
def create_pathname(depth)
  result = []
  depth.times { result << generate_gibberish(10) << '/' }
  result
end

##
# Generate a number of files.
# @param num Integer number of files
# @param extension String extension of the file
def generate_files(num, extension)
  count = 0
  loop do
    # Create random directories
    path = create_pathname(Random.rand(MAX_DEPTH) + 1)
    FileUtils.mkdir_p("#{TEMP_PATH}/data/#{path.join('/')}")

    full_path = ''

    path.each do |path_element|
      full_path << path_element

      # Write between 10 and 30 files into it
      file_count = Random.rand(10) +  20
      file_count.times do
          file_name = generate_filename(10, extension)
          size = Random.rand(20) + 20
          File.write("#{TEMP_PATH}/data/#{full_path}/#{file_name}", generate_gibberish(size, true))
          count += 1
          return if count >= num
      end
    end
  end
end

# Remove temporary directory if already present
puts "Removing old tree"
FileUtils.rm_rf("#{TEMP_PATH}") if Dir.exists?("#{TEMP_PATH}")

# Generate the files
puts "Generating files"
generate_files(NUM_FILES - NUM_TXT_FILES, '')
generate_files(NUM_TXT_FILES - 1 - INCLUDE.length, '.txt')

# Insert the password file into the tree
path = create_pathname(Random.rand(MAX_DEPTH)).join('/')
FileUtils.mkdir_p("#{TEMP_PATH}/data/#{path}")
file_name = generate_filename(10, '.txt')
size = Random.rand(100) + 10
File.write("#{TEMP_PATH}/data/#{path}/#{file_name}", generate_gibberish(size, true) + SECRET)

# Copy the other content
INCLUDE.each { |src| FileUtils.cp(src, TEMP_PATH) }

# Package folder
puts "Packaging"
`cd #{TEMP_PATH}/.. && tar cfJ chaos.tar.xz chaos`
FileUtils.mv("#{TEMP_PATH}/../chaos.tar.xz", "../")

# Remove temporary files
puts "Removing generated files"

puts "Done"
FileUtils.rm_rf("#{TEMP_PATH}") if Dir.exists?("#{TEMP_PATH}")

