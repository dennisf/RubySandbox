#! /usr/bin/env ruby

require 'drb/drb'

class RemoteFileEvent

  @events = Array.new

  def newEvent(filename,event,eventTime)
    puts ""
    puts "  filename: #{filename}"
    puts "  event:    #{event}"
    puts "  time:     #{eventTime}"
  end

end

URI = "druby://keemun.eol.ucar.edu:8787"
DRb.start_service URI, RemoteFileEvent.new
puts "DRb server runing at #{DRb.uri}"

Signal.trap("INT") do
  puts "Server stopping"
  DRb.stop_service 
  exit
end

DRb.thread.join


