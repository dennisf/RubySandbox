#!/usr/bin/env ruby

# $DEBUG = true

require 'eventmachine'
require 'rb-inotify'
require 'time'

module InotifyHandler

  def initialize(inotifier_instance,watch_paths)
    begin
      @inotifier = inotifier_instance
      @movers = Array.new

      watch_paths.each do | path |
        puts "About to set watching #{path}"
        @inotifier.watch(path,:create,:moved_to,:recursive,&method(:handle_event))
        puts "watching #{path}"
      end
    rescue Exception => boom
      puts "Exception Class: #{boom.class}"
      puts "Exception: #{boom}"
    end
  end

  def handle_event(event)
    flags = event.flags
    if !flags.include? :isdir
      message =  "   #{Time.now} file event: #{flags}  name: #{event.absolute_name}"
    else
      message =  "   #{Time.now} directory event: #{flags} path:#{event.absolute_name}"
    end
    puts message
  end


  def notify_readable
    @inotifier.process
  end

  def add_mover(mover_connection)
    @movers.push mover_connection
    puts "Mover added"
  end



end


module ConnectionHandler

  include EM::P::ObjectProtocol

  def post_init
    puts "Connection Made"
  end

  def receive_object(data)
    request = data[:request]

    case request
      when "mover_pid"
      @mover_pid = data[:pid]
      puts "Connected to mover with pid of #{@mover_pid}"
    end
  end
end



inotifier = INotify::Notifier.new
watch_paths = Array.new
watch_paths.push "/scr/ctm/dennisf/ingest_dev/watch_dir1"
watch_paths.push "/scr/ctm/dennisf/ingest_dev/watch_dir2"

EventMachine::run do

  inotifier_handler = EventMachine::watch inotifier.to_io,InotifyHandler,inotifier,watch_paths
  inotifier_handler.notify_readable = true

  host,port = "0.0.0.0",8090
  EventMachine::start_server host,port,ConnectionHandler do |connection|

    inotifier_handler.add_mover connection

  end

end
