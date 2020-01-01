#!/usr/bin/env ruby

# Script to bundle all files together into one single
# script `schnitzel`

# Allow calling this script form the +bin+ folder
# or its parent

prefix = if __FILE__ =~ %r{bin/}
           "."
         else
           ".."
         end

puts "Building `schnitzel`"

# Join files together to the schnitzel script
File.open("#{prefix}/schnitzel", 'w') do |out|
    File.open("#{prefix}/src/schnitzel.rb").each_line do |line|
    if line =~ /require_relative '(.*)'/
	    out.puts File.read("#{prefix}/src/#{$1}")
      out.puts ''
    else
      out.puts line
    end
  end
end

# Set the executable bit
File.chmod(0755, '../schnitzel')

