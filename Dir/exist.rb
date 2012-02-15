#! /usr/bin/env ruby

#dir_names = ["/scr/ctm/dennisf/watch_dir1","/scr/ctm/dennisf/watch_none"]
dir_names = ["/scr/ctm/dennisf/watch_dir1","/scr/ctm/dennisf/watch_none"]

dir_names = %w(test1 test2 test3)

dir_names.each do | dir_name |
  puts ""

  if Dir::exist?(dir_name)
    puts "#{dir_name} exists"
    puts "#{dir_name} is a directory" if File::directory?(dir_name)
    puts "#{dir_name} is writable"    if File::writable?(dir_name)
  else
    puts "#{dir_name} does not exist"
  end


end


