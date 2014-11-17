#!/usr/bin/env ruby
#simple script removes all png files in a specified directory or the current
#if no directory is specified .
if ARGV.empty?
	some_dir = "."
else
	some_dir = ARGV.first
end

Dir.glob(some_dir + '/*.png').each { |f| File.delete(f) }
