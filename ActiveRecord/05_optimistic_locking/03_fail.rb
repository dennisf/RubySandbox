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

  row1 = Event.find(1)
  row2 = Event.find(1)

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
