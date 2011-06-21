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
      @paths = Array.new
      @timer = nil

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
    if !flags.include? :isdir
      message =  "   #{Time.now} file event: #{flags}  name: #{event.absolute_name}"
      @paths.push [Time.now,event.absolute_name]
      if @timer.nil?
        @timer = EventMachine::add_timer(5,method(:process_paths))
      end
    else
      message =  "   #{Time.now} directory event: #{flags} path:#{event.absolute_name}"
    end
    puts message
  end


  def process_paths

    puts "process paths"

    @timer = nil

    puts "number of movers: #{@movers.size}"
    puts "size of paths :  #{@paths.size}"

    @movers.each do | mover | 
      break if @paths.empty?

      if mover.available?
        entry_time, path = @paths[0]
        start_time = entry_time + 5

        puts "start_time: #{start_time}"
        puts "time now :#{Time.now}"
        
        if start_time < Time.now
          break
        end

        puts "About to call start_move"
        
        mover.start_move(path)
        @paths.shift
      end
    end

    if @paths.size > 0 
      @timer = EventMachine::add_timer(0.5,method(:process_paths))
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
    @available = false
  end

  def available?
    @available
  end

  def receive_object(data)
    request = data[:request]

    pp data

    case request
    when "mover_pid"
      @mover_pid = data[:pid]
      puts "Connected to mover with pid of #{@mover_pid}"
      @available = true
    when "done"
      @available = true
      puts "#{@mover_pid} is now available"
    end

    pp @available
  end

  def start_move(path)
    puts "Request sent to #{@mover_pid} to move of #{path}"
    send_object({:request=>"move",:path=>path})
    @available = false
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
