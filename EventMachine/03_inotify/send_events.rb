#!/usr/bin/env ruby

require 'eventmachine'
require 'rb-inotify'
require 'time'


def exit_loop
  EventMachine::stop_event_loop
end

module EventTalker 

  include EM::P::ObjectProtocol

  def post_init
    puts "Connection established"
  end


  def receive_object(data)
    puts "received_object: #{data}"

    @receive_callback.call data
  end

  def set_message_callback(callback)
    @receive_callback = callback
  end

  def unbind
    puts "Connection terminated, Program  exit in 3 seconds"
    EventMachine::add_timer 3 , method(:exit_loop)
  end
end

module EventHandler
  
  def initialize(watcher,talker)
    @notifier = watcher
    @remote = talker

    @remote.set_message_callback method(:process_remote_message)
  end

  def post_init
    puts "EventHandler Created"
  end

  def unbind
    puts "EventHandler unbind"
  end

  def notify_readable
    @notifier.process
  end


  def process_event(event)
    flags = event.flags
    if !flags.include? :isdir
      message =  "   #{Time.now} file event: #{flags}  name: #{event.absolute_name}"
    else
      message =  "   #{Time.now} directory event: #{flags} path:#{event.absolute_name}"
    end

    puts message
    @remote.send_data message
  end

  def process_remote_message(command_hash)

    if command_hash[:request] == "add"
      path = command_hash[:path]
      puts "Adding watch path #{path}"
      @notifier.watch(path,:create, :moved_to, :delete, :close_write,  :recursive, &method(:process_event))       
    end

    if command_hash[:request] == "terminate"
      @remote.detach
    end

  end

end




EventMachine::run do
  host,port = "sake.eol.ucar.edu",8090
  talker   = EventMachine::connect host,port,EventTalker

  notifier = INotify::Notifier.new

  catcher = EventMachine.watch notifier.to_io,EventHandler,notifier,talker
  catcher.notify_readable = true

end

puts "bye"
