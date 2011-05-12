#!/usr/bin/env ruby

require 'eventmachine'
require 'time'
require 'socket'

module EventListener


  def post_init
    @peer_port, @peer_ip = Socket::unpack_sockaddr_in get_peername
    peer_info = Socket::getnameinfo get_peername
    @peer_host = peer_info[0]
    puts "Connection created from #{@peer_host}"
  end

  def receive_data data
    puts "Received(#{@peer_host}): #{data}"
  end

  def unbind
    puts "Connection terminated from #{@peer_host}"
  end

end

EventMachine::run do
  host,port = "0.0.0.0",8090
  EventMachine::start_server host,port,EventListener
  puts "Called start_server"
end

puts "bye"
