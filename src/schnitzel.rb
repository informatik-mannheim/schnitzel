#!/usr/bin/env ruby

# Interaktive Schnitzeljagd, um die Linux-Konsole kennen zu lernen.
# Basierend auf einer Idee von Eugen Krizki and Richard Vladimirskij.
# (c) 2019 Thomas Smits

# ------------
# Constants
# ------------

# Width of the terminal
LINE_WIDTH = 80

# Base path to all our files
BASE_PATH = "#{Dir.home}"

# Our directory (without base path)
PROJEKT_PATH = "linux-kurs"

# Full Path
PATH = "#{BASE_PATH}/#{PROJEKT_PATH}"

# File to log the progress
LOG_FILE = "#{PATH}/.schnitzel.log"

# Text ot ask for <ENTER>
ENTER_TEXT = "Drücken Sie <ENTER>, um die Lösung zu überprüfen:"

# Wrong solution
WRONG_SOLUTION = "Leider falsch. Probieren Sie es noch einmal."

# Correct solution
CORRECT_SOLUTION = "Korrekt. Gut gemacht!"

# Location of the prepared tar
CHAOS_URL = "https://github.com/informatik-mannheim/schnitzel/raw/master/chaos.tar.xz"

# Some "arbitrary" file names
FILENAMES = %w{ Battlefield BioShock Borderlands Burnout Castlevania Crysis Deponia
                Doom Elite Fallout Halo Hitman Minecraft Payday Prey Quake Rayman Risen
                Splatoon Thief Uncharted Witcher Wolfenstein Yakuza Zork }

# ------------
# OS dependencies
# ------------

if RUBY_PLATFORM =~ /linux/
  # Linux
  STAT_USER = 'stat -c %U'
  STAT_PERMISSIONS = 'stat -c %a'
  STAT_LINK_COUNT = 'stat -c %h'
elsif RUBY_PLATFORM =~ /darwin/
  # MacOS
  STAT_USER = 'stat -f %Su'
  STAT_PERMISSIONS = 'stat -f %Lp'
  STAT_LINK_COUNT = 'stat -f %l'
else
  # Unknown OS
  puts "Unknown operating system. Exiting..."
  exit 1
end

# Class for the definition of exercises
require_relative 'exercise.rb'

# Helper functions
require_relative 'helper.rb'

# ------------
# The exercises
# ------------

@exercises = []

require_relative 'exercises/01_man.rb'
require_relative 'exercises/02_editor.rb'
require_relative 'exercises/03_editor_2.rb'
require_relative 'exercises/04_less.rb'
require_relative 'exercises/05_mkdir.rb'
require_relative 'exercises/06_mv.rb'
require_relative 'exercises/07_rm.rb'
require_relative 'exercises/08_whoami.rb'
require_relative 'exercises/09_ls.rb'
require_relative 'exercises/10_chown.rb'
require_relative 'exercises/11_mv_2.rb'
require_relative 'exercises/12_chmod.rb'
require_relative 'exercises/13_rm_rf.rb'
require_relative 'exercises/14_wget.rb'
require_relative 'exercises/15_tar.rb'
require_relative 'exercises/16_find.rb'
require_relative 'exercises/17_grep.rb'
require_relative 'exercises/18_diff.rb'
require_relative 'exercises/19_sort.rb'
require_relative 'exercises/20_grep_sed.rb'
require_relative 'exercises/21_ls_s.rb'
require_relative 'exercises/22_ln.rb'
require_relative 'exercises/23_ps_kill.rb'

start = next_exercise

# Override current progress from
# the command line
if ARGV[0]
  start = ARGV[0].to_i
end

# Execute the exercises
@exercises.each_with_index do |exercise, index|

  # Skip already finished exercises
  next if index < start

  # Execute the exercise and log success
  puts "#{cls}"
  print progress_bar(@exercises.length, index, LINE_WIDTH - 8)
  print "\n\n"
  exercise.execute
  log_success(index, exercise)

  Kernel.sleep(2)
end

puts "#{cls}"
print progress_bar(@exercises.length, @exercises.length, LINE_WIDTH - 8)
puts green(%q{
 _    _  _                             _    _  _
| |  | |(_)                           | |  | |(_)
| |  | | _  _ __   _ __    ___  _ __  | |  | | _  _ __   _ __    ___  _ __
| |/\| || || '_ \ | '_ \  / _ \| '__| | |/\| || || '_ \ | '_ \  / _ \| '__|
\  /\  /| || | | || | | ||  __/| |    \  /\  /| || | | || | | ||  __/| |
 \/  \/ |_||_| |_||_| |_| \___||_|     \/  \/ |_||_| |_||_| |_| \___||_|

 _____  _      _        _                 ______  _
/  __ \| |    (_)      | |                |  _  \(_)
| /  \/| |__   _   ___ | | __ ___  _ __   | | | | _  _ __   _ __    ___  _ __
| |    | '_ \ | | / __|| |/ // _ \| '_ \  | | | || || '_ \ | '_ \  / _ \| '__|
| \__/\| | | || || (__ |   <|  __/| | | | | |/ / | || | | || | | ||  __/| |
 \____/|_| |_||_| \___||_|\_\\\\___||_| |_| |___/  |_||_| |_||_| |_| \___||_|
})

puts green("Alle Aufgaben gelöst. Herzlichen Glückwunsch!\n")
