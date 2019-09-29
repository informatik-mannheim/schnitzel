#!/usr/bin/env ruby

# Script to bundle all files together into one single
# script `schnitzel`

puts "Building `schnitzel`"
File.open('../schnitzel', 'w') do |out|
    File.open('../src/schnitzel.rb').each_line do |line|
    if line =~ /require_relative '(.*)'/
	    out.puts File.read("../src/#{$1}")
      out.puts ''
    else
      out.puts line
    end
  end
end

