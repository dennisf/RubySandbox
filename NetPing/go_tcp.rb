#! /usr/bin/env ruby

require 'net/ping'

puts "Hello"

def do_ping(host)
  begin
    puts ""
    puts "pinging #{host}"
    pinger = Net::Ping::TCP.new('host',80,5)
    if pinger.ping 
      puts "ping successful, duration: #{pinger.duration}"      
    else
      puts "ping failed :#{pinger.exception}"
    end
  rescue Exception => boom
    puts "Exception: #{boom.class}"
    puts "Exception: #{boom}"
  end
end


do_ping('sferic.eol.ucar.edu')
do_ping('sferics.eol.ucar.edu')




