#! /usr/bin/env ruby


require 'drb'
require 'time'

remoteObject = DRbObject.new nil, 'druby://keemun.eol.ucar.edu:8787'

filecount = 1

while filecount < 15 do

  filename = "client2_#{filecount}.nop"
  event = "create"
  nowTime = Time.now

  puts ""
  puts "Sending:"
  puts "  Filename: #{filename}"
  puts "  Event:    #{event}"
  puts "  Time:     #{nowTime}"
  
  remoteObject.newEvent(filename,"create",nowTime)

  filecount += 1

  sleep 0.7
end

puts ""
puts "Client 1 Ending"
