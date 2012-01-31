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
  
  event_row = Event.create(:name => 'file01.jpg', :status => 'CLOSE')
  event_row = Event.create(:name => 'file02.jpg', :status => 'PROC')
  event_row = Event.create(:name => 'file03.jpg', :status => 'ERROR')
  event_row = Event.create(:name => 'file04.jpg', :status => 'CLOSE')
  event_row = Event.create(:name => 'file05.jpg', :status => 'INGESTED')
  event_row = Event.create(:name => 'file06.jpg', :status => 'INGESTED')
  event_row = Event.create(:name => 'file07.jpg', :status => 'JAILED')

rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
