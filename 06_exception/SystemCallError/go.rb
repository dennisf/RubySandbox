#! /usr/bin/env ruby

require "fileutils"


begin

  FileUtils::cp("no_file.any","nowhere.any")

rescue Errno::ENOENT => missing
  puts "File does not exist"
  puts "class: #{missing.class}"
  puts "message: #{missing}"
rescue Exception => boom
  puts "Exception rescue"
  puts "class: #{boom.class}"
  puts "message: #{boom}"
end




