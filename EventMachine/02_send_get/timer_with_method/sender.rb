#!/usr/bin/env ruby

require 'eventmachine'
require 'time'



module EventTalker 

  def talker
    deltaTime = Time.now - @startTime
    message = "Message at #{deltaTime.floor} seconds"
    puts "Sending #{message}"
    send_data message
  end

  def post_init
    puts "Connection established"
    @startTime = Time.now
    EventMachine::add_periodic_timer(2, method(:talker))
  end

  def unbind
    puts "Connection terminated"
  end

end

EventMachine::run do
  host,port = "keemun.eol.ucar.edu",8090
  EventMachine::connect host,port,EventTalker
end

puts "bye"
