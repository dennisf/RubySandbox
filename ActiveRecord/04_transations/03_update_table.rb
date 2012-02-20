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

  9.times do | index |
    number = index + 1
    name = sprintf("file%02d.jpg",number)
    puts name
    
    if event_row = Event.find_by_name(name)
      unless (event_row.status == "CLOSE") || (event_row.status == "PROC")
        if (event_row.status == "INGESTED")
          if event_row.name == "file06.jpg"
            next
          end
        end
        event_row.status = "CLOSE"
        event_row.save()
      end
    else
      Event.create(:name=>name, :status=>"CLOSE")
    end
  end

  


rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
