#!/usr/bin/env ruby

require 'eventmachine'
require 'time'

startTime = Time.now

event_callback = lambda do 
  timeGap = Time.now - startTime
  puts "Callback at #{timeGap.floor} seconds."
end

stop_callback = lambda do 
  EventMachine::stop_event_loop 
  puts "End Loop"
end

puts "Callback every 3 and 5 seconds for 16 seconds"

EventMachine::run do
  EventMachine::add_periodic_timer(3,event_callback)
  EventMachine::add_periodic_timer(5,event_callback)
  EventMachine::add_timer(16,stop_callback)
end

puts "bye"

