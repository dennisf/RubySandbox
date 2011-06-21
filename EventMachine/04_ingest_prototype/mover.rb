#! /usr/bin/env ruby

require 'eventmachine'
require 'rb-inotify'
require 'time'

module CommandHandler

  include EM::P::ObjectProtocol

  def post_init

    puts "#{Process.pid} : Connection Made"

    send_object({:request => "mover_pid",:pid => Process.pid})
  end


  def receive_object(data)
    request = data[:request]
    
    case request
    when "move"
      path = data[:path]
      puts "move #{path}"
      sleep 1
      send_object({:request=>"done"})
    end
  end

end


EventMachine::run do

  host,port = "sake.eol.ucar.edu",8090
  EventMachine::connect host,port,CommandHandler

end
