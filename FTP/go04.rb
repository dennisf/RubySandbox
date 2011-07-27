#! /usr/bin/env ruby

$DEBUG = true

require 'net/ftp'
require 'pp'
require 'time'

begin

  puts "Creating FTP object"

  ftp = Net::FTP::new("202.1.207.33","xxx","xxx")
  ftp.passive = true

  ftp.chdir("catalog_sync")

  files = Hash.new
  times = Array.new

  list = ftp.list()
  list.each do | list_line |
    puts list_line

    list_parts = list_line.split
    file_time = Time.parse("#{list_parts[5]} #{list_parts[6]} #{list_parts[7]}")

    files[file_time] = list_parts[8]
    times.push(file_time)
  end

  puts ""

  times.sort!
  
  times.each do | file_time |
    puts "#{file_time}  #{files[file_time]}"
  end

  while times.length > 10
    remove_time = times.shift
    puts "delete #{files[remove_time]}"
  end

  times.each do | file_time |
    puts "#{file_time}  #{files[file_time]}"
  end

rescue Exception => boom
  puts "Exception class  : #{boom.class}"
  puts "Exception message: #{boom}"
end



