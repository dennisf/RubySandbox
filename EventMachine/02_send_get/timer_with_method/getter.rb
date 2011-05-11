#!/usr/bin/env ruby

require 'eventmachine'
require 'time'

module EventListener


  def post_init
    puts "Connection created"
  end

  def receive_data data
    puts "Received: #{data}"
  end

  def unbind
    puts "Connection terminated"

  end

end

EventMachine::run do
  host,port = "0.0.0.0",8090
  EventMachine::start_server host,port,EventListener
  puts "Called start_server"
end

puts "bye"
