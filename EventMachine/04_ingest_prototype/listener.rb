#!/usr/bin/env ruby

# $DEBUG = true

require 'eventmachine'
require 'rb-inotify'
require 'time'
require 'pp'

module InotifyHandler

  def initialize(inotifier_instance,watch_paths)
    begin
      @inotifier = inotifier_instance
      @movers = Array.new

      watch_paths.each do | path |
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
    if flags.include? :isdir
      puts  "   #{Time.now} directory event: #{flags} path:#{event.absolute_name}"
    else
      puts  "   #{Time.now} file event: #{flags}  name: #{event.absolute_name}"

      if @movers.empty?
        puts "No movers to call !!"
        EventMachine::stop_event_loop
      else
        @movers.first.add_path(event.absolute_name)
        @movers.rotate!
      end
    end

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

  def add_path(path)
    puts "Request sent to #{@mover_pid} to move #{path}"
    send_object({:request=>"move",:path=>path})
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

  mover_command = './mover.rb'
  5.times do 
    pid = Process.spawn mover_command
    puts "Spawning mover.rb with pid of #{pid}"
  end

end
