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

  Event.transaction do
    if event_row = Event.lock.where("status = ?","CLOSE").order("updated_at ASC").first
      event_row.status = "PROC"
      event_row.save()
    end
  end

rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
