# ------------
# Helper functions
# ------------

##
# Get an input from stdin
# @return String the data
def input
  $stdin.gets.strip
end

##
# Create a directory (if not already present) and set
# the protections according to the given mask
# @param path String path to the directory
# @param mask Integer umask to be used in creating the direcory
def mkdir(path, mask = 0700)
  Dir.mkdir(path, mask) unless Dir.exists?(path)
end

##
# Fill an directory with files
# @param path String path to the directory
def fill_dir(path)
  FILENAMES.each { |l| File.write("#{path}/#{l}", "Gehen Sie weiter, hier gibt es nichts zu sehen.") }
end

##
# Create the working directory for the tasks
def create_workdir
  mkdir("#{PATH}")
end

##
# Format the text for an ANSI terminal in red
# @param txt String the text to be formatted
# @return String the formatted text
def red(txt)
  "\033[1;31m#{txt}\033[0m"
end

##
# Format the text for an ANSI terminal in green
# @param txt String the text to be formatted
# @return String the formatted text
def green(txt)
  "\033[32m#{txt}\033[0m"
end

##
# Format the text for an ANSI terminal in blue
# @param txt String the text to be formatted
# @return String the formatted text
def blue(txt)
  "\033[34m#{txt}\033[0m"
end

##
# Format the text for an ANSI terminal in yellow
# @param txt String the text to be formatted
# @return String the formatted text
def yellow(txt)
  "\033[33m#{txt}\033[0m"
end

##
# Format the text for an ANSI terminal in grey
# @param txt String the text to be formatted
# @return String the formatted text
def grey(txt)
  "\033[30m#{txt}\033[0m"
end

##
# Format the text for an ANSI terminal in bold
# @param txt String the text to be formatted
# @return String the formatted text
def bold(txt)
  "\033[1m#{txt}\033[0m"
end

##
# Format the text for an ANSI terminal in underline
# @param txt String the text to be formatted
# @return String the formatted text
def underline(txt)
  "\033[4m#{txt}\033[0m"
end

##
# Provide ANSI escape sequence to clear the screen
# @return String the clearing sequence
def cls
  "\033[2J\033[H"
end

##
# Create a progress bar string
# @param max Integer maximum value
# @param actual Integer actual value
# @param width Integer width of the bar (without the a/m display)
def progress_bar(max, actual, width)
  progress = actual.to_f / max.to_f
  filled = (width * progress).to_i
  empty = (width - filled).to_i

  output = ''
  filled.times { output << "\u2588" }
  empty.times { output << "\u2591" }

  output << " #{actual}/#{max}"

  output
end

##
# Get the last exercise from the log file, if present. Otherwise
# return 0
# @return the last exercise sucessfully performed
def next_exercise_from_log
  start = 0
  if File.exists?(LOG_FILE)
    contents = File.readlines(LOG_FILE)
    start = contents.last.split("\t").first.to_i + 1
  end
  start
end

##
# Log the sucess of an exercise
# @param index the index of the exercise performed
def log_success(index, exercise)
  create_workdir
  File.open(LOG_FILE, "a") do |f|
    f.print("#{index}\t#{ENV['USER']}\t'#{exercise.title}'\t#{Time.new}\n")
  end
end

##
# Highlight words in ` ` and _ _ in the given string using ANSI escape sequences
# @param input String the input
# @return String the input with highlights
def highlight(input)
  result = input
  while result =~ /(.*)`(.*?)`(.*)/m # multiline match (m)
    result = "#{$1}#{bold($2)}#{$3}"
  end

  while result =~ /(.*)_(.*?)_(.*)/m # multiline match (m)
    result = "#{$1}#{underline($2)}#{$3}"
  end

  result
end

##
# Break the text in a way that it fits on the given width
# without having a break in the middle of a word.
# @param input String the text
# @param width Integer the width
# @return String the text with additional newlines
def fit(input, width)
  words = input.split(' ')
  result = ''
  line_length = 0
  words.each_with_index do |w, i|
    line_length += w.gsub(/`/, '').gsub(/_/, '').length # don't count ` and _
    if line_length > width
      # line full, start a new line
      result << "\n"
      line_length = w.length
    elsif i > 0
      # not the first word, add a blank
      result << ' '
      line_length += 1
    end
    result << w
  end
  result
end
