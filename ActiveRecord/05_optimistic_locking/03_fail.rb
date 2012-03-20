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
      file_event = where("status = ?","CLOSE").order("priority ASC").order("created_at DESC").first 
    end
  end
  
  row1 = Event.find_path_to_ingest()
  row2 = Event.find_path_to_ingest()

  row1.status = "PROC"
  row1.save

  row2.status = "PROC"
  row2.save

rescue ActiveRecord::StaleObjectError => boom
  puts "StaleObject: #{boom}"
rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
