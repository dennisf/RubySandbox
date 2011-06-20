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


end


EventMachine::run do

  host,port = "sake.eol.ucar.edu",8090
  EventMachine::connect host,port,CommandHandler

end
