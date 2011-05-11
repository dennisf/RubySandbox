#!/usr/bin/env ruby

require 'eventmachine'

puts "hi in 2"

EventMachine::run do
  EventMachine::add_timer(2) do
    puts "hi"
    EventMachine::stop_event_loop
  end
end

puts "bye"
