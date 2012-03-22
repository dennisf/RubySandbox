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

  Event.delete_all

  start_time = Time.now()

  10.times do | index |
    name = "FILE%02d.jpg" % index
    start_time += 1
    event_row = Event.create(:name => name,:priority => 1, :status => 'CLOSE',:observe_time => start_time)
  end

  10.times do | index |
    name = "file%02d.jpg" % index
    start_time += 1
    event_row = Event.create(:name => name,:priority => 2, :status => 'CLOSE',:observe_time => start_time)
  end

rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
