#!/usr/bin/env ruby

require 'eventmachine'
require 'time'

startTime = Time.now

event_callback = lambda do 
  timeGap = Time.now - startTime
  puts "Callback at #{timeGap} seconds."
end

stop_callback = lambda do 
  EventMachine::stop_event_loop 
  puts "End Loop"
end

EventMachine::run do
  EventMachine::add_periodic_timer(2,event_callback)
  EventMachine::add_timer(30,stop_callback)
  
  trap("INT") do
    puts "Interupt caught"
    EM::stop_event_loop()
  end
end

puts "bye"

