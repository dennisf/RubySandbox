#!/usr/bin/env ruby

require 'eventmachine'
require 'time'


def exit_loop
  EventMachine::stop_event_loop
end

module EventTalker 

  def talker
    deltaTime = Time.now - @startTime
    message = "Message at #{deltaTime.floor} seconds"
    puts "Sending #{message}"
    send_data message

    if deltaTime > 10
      EventMachine::cancel_timer @timer_sig
      close_connection
    end
  end

  def post_init
    puts "Connection established"
    @startTime = Time.now
    @timer_sig = EventMachine::add_periodic_timer 2, method(:talker)
  end

  def unbind
    puts "Connection terminated, Program  exit in 3 seconds"
    EventMachine::add_timer 3 , method(:exit_loop)
  end

end

EventMachine::run do
  host,port = "keemun.eol.ucar.edu",8090
  EventMachine::connect host,port,EventTalker
end

puts "bye"
