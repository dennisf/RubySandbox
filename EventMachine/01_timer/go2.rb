#!/usr/bin/env ruby

require 'eventmachine'
require 'time'

startTime = Time.now

event_callback = lambda do 
  timeGap = Time.now - startTime
  puts "Callback at #{timeGap.floor} seconds."
  EventMachine::stop_event_loop
end

puts "Callback in 2 seconds."

EventMachine::run do
  EventMachine::add_timer(2,event_callback)
end

puts "bye"
