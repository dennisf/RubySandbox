#!/usr/bin/env ruby

require 'eventmachine'
require 'time'



module EventTalker 

  def post_init
    puts "Connection established"

    @startTime = Time.now

    EventMachine::add_periodic_timer 2 do
      deltaTime = Time.now - @startTime
      message = "Message at #{deltaTime.floor} seconds"
      puts "Sending #{message}"
      send_data message
    end
  end

end

EventMachine::run do
  host,port = "keemun.eol.ucar.edu",8090
  EventMachine::connect host,port,EventTalker
end

puts "bye"
