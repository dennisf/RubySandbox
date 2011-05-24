#!/usr/bin/env ruby

require 'eventmachine'
require 'time'
require 'socket'

module EventListener

  include EM::P::ObjectProtocol

  def post_init
    @peer_port, @peer_ip = Socket::unpack_sockaddr_in get_peername
    peer_info = Socket::getnameinfo get_peername
    @peer_host = peer_info[0]
    puts "Connection created from #{@peer_host}"

    puts "Asking #{@peer_host} to watch /scr/ctm/dennisf/watch_dir1"
    send_object({:request => "add",:path =>"/scr/ctm/dennisf/watch_dir1"})

    EventMachine::add_timer 15,method(:send_terminate)
  end

  def receive_data data
    puts "Received(#{@peer_host}): #{data}"
  end

  def unbind
    puts "Connection terminated from #{@peer_host}"
  end
  
  def send_terminate
    puts "Asking #{@peer_host} to terminate"
    send_object({:request => "terminate"})
  end

end

EventMachine::run do
  host,port = "0.0.0.0",8090
  EventMachine::start_server host,port,EventListener
end

puts "bye"
