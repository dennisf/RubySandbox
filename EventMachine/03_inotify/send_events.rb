#!/usr/bin/env ruby

require 'eventmachine'
require 'rb-inotify'
require 'time'


def exit_loop
  EventMachine::stop_event_loop
end

module EventTalker 
  def post_init
    puts "Connection established"

  end

  def unbind
    puts "Connection terminated, Program  exit in 3 seconds"
    EventMachine::add_timer 3 , method(:exit_loop)
  end
end

module EventWatcher 
  def post_init
    puts "EventWatcher Created"

  end

  def unbind
    puts "EventWatcher unbind"
  end

  def notify_readable
    puts "notify_readable called \n"

    @notifier.process
  end

  # def receive_data data

  #   puts "Data is #{data.class}"
    
  #   puts "(EventWatcher) recieved data:  #{data}"
    
  #   @notifier.process

  # end

  def set_remote(connection)
    @remote = connection
  end

  def set_notifier(watcher)
    @notifier = watcher
  end

  def add_watch(path)
    puts "Adding watch path #{path}"
    @notifier.watch(path,:create, :moved_to, :delete, :close_write,  :recursive, &method(:process_event)) 
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

end




EventMachine::run do
  host,port = "keemun.eol.ucar.edu",8090
  talker   = EventMachine::connect host,port,EventTalker

  notifier = INotify::Notifier.new
#  notifier.watch("/scr/ctm/dennisf/watch_dir1",:create, :moved_to, :delete, :close_write,  :recursive, &method(:process_event_call)) 

  # catcher  = EventMachine::watch notifier.to_io, EventWatcher do 
  #   notifier.process
  # end

  catcher = EventMachine.watch notifier.to_io,EventWatcher
  catcher.notify_readable = true

  puts "about to set catcher params"

  catcher.set_remote talker
  catcher.set_notifier notifier
  catcher.add_watch "/scr/ctm/dennisf/watch_dir1"
end

puts "bye"
