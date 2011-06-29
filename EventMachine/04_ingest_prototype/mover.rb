#! /usr/bin/env ruby

require 'eventmachine'
require 'rb-inotify'
require 'time'

module CommandHandler

  include EM::P::ObjectProtocol

  def post_init
    puts "#{Process.pid} : Connection Made"
    @paths = Array.new
    @timer = nil
    @wait_seconds = 15
    @set_timer = true
    send_object({:request => "mover_pid",:pid => Process.pid})
  end


  def receive_object(data)
    request = data[:request]
    
    case request
    when "move"
      path = data[:path]
      puts "#{Process.pid}: #{Time.now}:request move #{path}"
      
      @paths.push [Time.now, path]
      if @timer.nil? and @set_timer
        @timer = EventMachine::add_timer @wait_seconds, method(:process_paths)
      end

    end
  end

  def process_paths
    @timer = nil

    if @paths.empty?
      @set_timer = true
    else
      entry_time, path = @paths[0]

      age_seconds = Time.now - entry_time

      if age_seconds > @wait_seconds
        puts "#{Process.pid}: #{Time.now}: move #{path}"
        @paths.shift
        sleep 1
        @set_timer = false
        EventMachine::next_tick method(:process_paths)
      else
        delay_seconds = @wait_seconds - age_seconds
        @timer = EventMachine::add_timer delay_seconds, method(:process_paths)
      end
    end
  end


  def unbind
    puts "#{Process.pid} : Connection Unbind"
    EventMachine::stop_event_loop
  end

end


EventMachine::run do

  host,port = "sake.eol.ucar.edu",8090
  EventMachine::connect host,port,CommandHandler

end
