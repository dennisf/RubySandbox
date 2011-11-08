#! /usr/bin/env ruby

dir_name = "/scr/ctm/dennisf/watch_dir1"

dir = Dir.new dir_name

dir.each do |entry|


  abs_path = File.join dir_name,entry

  if File.file? abs_path
    puts "Entry : #{entry} is a file"
  else
    puts "Entry : #{entry} is not a file"
  end

end

