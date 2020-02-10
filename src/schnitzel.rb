#!/usr/bin/env ruby

# Interaktive Schnitzeljagd, um die Linux-Konsole kennen zu lernen.
# Basierend auf einer Idee von Eugen Krizki and Richard Vladimirskij,
# siehe https://github.com/limecakeio/pepio
# (c) 2019 Thomas Smits

# Settings and constants
require_relative 'settings.rb'

# Class for the definition of exercises
require_relative 'exercise.rb'

# Helper functions
require_relative 'helper.rb'

# ------------
# The exercises
# ------------

@exercises = []

# Include the different exercises here
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
require_relative 'exercises/21_ln_s.rb'
require_relative 'exercises/22_ln.rb'
require_relative 'exercises/23_ps_kill.rb'
require_relative 'exercises/24_cal.rb'
require_relative 'exercises/25_df.rb'
require_relative 'exercises/26_du.rb'
require_relative 'exercises/27_bc.rb'
require_relative 'exercises/28_tr.rb'

start = next_exercise_from_log

# Override current progress from
# the command line
if ARGV[0]
  start = ARGV[0].to_i
end

# determine OS. Currently supported :linux and :macos
os = if RUBY_PLATFORM =~ /linux/
       :linux
     elsif RUBY_PLATFORM =~ /darwin/
       :macos
     else
       nil
     end

# Execute the exercises
@exercises.each_with_index do |exercise, index|

  # Skip already finished exercises
  next if index < start

  # Execute the exercise and log success
  puts "#{cls}"
  print progress_bar(@exercises.length, index, LINE_WIDTH)
  print "\n\n"
  exercise.execute(os)
  log_success(index, exercise)

  # Give user time to read the message before moving to the next screen
  Kernel.sleep(2)
end

# Final message - won the game
puts "#{cls}"
print progress_bar(@exercises.length, @exercises.length, LINE_WIDTH)
puts green(WINNER_MESSAGE)
needed_time = ((get_end_time - get_first_starttime)/60).round
puts green("Sie haben alle Aufgaben in #{needed_time} Minuten gelöst. Herzlichen Glückwunsch!\n")
