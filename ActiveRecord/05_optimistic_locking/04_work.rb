#! /usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

#$DEBUG = true

require 'active_record'
require 'pp'
require 'logger'
require 'time'

require 'connect_db'
require 'event'

puts "hello"

begin

  connect_db()

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
