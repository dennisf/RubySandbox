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

  end

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
