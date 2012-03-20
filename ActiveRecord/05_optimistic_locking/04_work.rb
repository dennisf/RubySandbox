#! /usr/bin/env ruby

#$DEBUG = true

require 'active_record'
require 'pp'
require 'logger'
require 'time'

puts "hello"

begin

  dbconfig = {
    :adapter  => "mysql2",
    :host     => "localhost",
    :username => "dennisf",
    :password => "haha1201",
    :database => "sandbox_dennisf"
  }

  ActiveSupport::LogSubscriber.colorize_logging = false
  ActiveRecord::Base.logger = Logger.new(STDERR)
  ActiveRecord::Base.establish_connection(dbconfig)

  class Event < ActiveRecord::Base
    def self.find_path_to_ingest()
      begin
        if file_event = where("status = ?","CLOSE").order("priority ASC").order("observe_time DESC").first 
          file_event.status = "PROC"
          sleep(rand(5.0))
          file_event.save
        end
      rescue ActiveRecord::StaleObjectError => boom
        puts "StaleObject: #{boom}"
        retry
      end

      return file_event
    end
  end
  

  10.times do  
    if event_row = Event.find_path_to_ingest()
      puts "Processing row #{event_row.id} name: #{event_row.name}"
    else
      break
    end
  end


rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
