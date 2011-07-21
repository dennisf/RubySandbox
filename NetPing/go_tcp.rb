#! /usr/bin/env ruby

require 'net/ping'

puts "Hello"

begin

  pinger = Net::Ping::TCP.new('sferic.eol.ucar.edu',7,5)

rescue Exception => boom
  puts "Exception: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "Bye"
