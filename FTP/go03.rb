#! /usr/bin/env ruby

$DEBUG = true

require 'net/ftp'


begin

  puts "Creating FTP object"

  ftp = Net::FTP::new("202.1.207.33","xxx","xxx")
  ftp.debug_mode = true
  ftp.passive = true

  ftp.chdir("catalog_sync")

  puts "sending small.file"
  ftp.putbinaryfile('small.file')

  puts "sending large.jpg"
  ftp.putbinaryfile('large.jpg') do |data|
    puts "Sending #{data.length}"
  end

  puts "bye"

rescue Exception => boom
  puts "Exception class  : #{boom.class}"
  puts "Exception message: #{boom}"
end

puts Time.now


