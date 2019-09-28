#!/usr/bin/env ruby

# Script to bundle all files together into one single
# script `schnitzel`

puts "Building `schnitzel`"
File.open('../schnitzel', 'w') do |out|
  File.open('schnitzel.rb').each_line do |line|
    if line =~ /require_relative '(.*)'/
      out.puts File.read($1)
      out.puts ''
    else
      out.puts line
    end
  end
end
