#! /usr/bin/env ruby


require 'net/ftp'


begin

  puts "Creating FTP object"

  ftp = Net::FTP::new()

  puts Time.now
  ftp.connect('sferics.eol.ucar.edu')


rescue Exception => boom
  puts "Exception class  : #{boom.class}"
  puts "Exception message: #{boom}"
end

puts Time.now


