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

puts "Callback every 2 seconds for 10 seconds"

EventMachine::run do
  EventMachine::add_periodic_timer(2,event_callback)
  EventMachine::add_timer(10,stop_callback)
  puts "All callbacks set"
end

puts "bye"

