#! /usr/bin/env ruby


require 'bundler/setup'

require 'active_record'
require 'sqlite3'

EVENT_DATA = [["rain",  "LAF", 45],
              ["snow",  "LAF", 11],
              ["snow",  "LAF", 15],
              ["sunny", "LAF", 55],
              ["sunny", "LAF", 56],
              ["sunny", "LAF", 65],
              ["rain",  "LAF", 55],
              ["cloudy","LAF", 62],
              ["sunny" ,"LOU", 72],
              ["sunny" ,"LOU", 65],
              ["rain"  ,"LOU", 61]]


########################################
#
#
#
########################################
class Events < ActiveRecord::Base

  def self.events_by_temperature
    order("temperature")
  end

end

########################################
#
#
#
########################################
class EventHandler

  def self.create_events()
    EVENT_DATA.each do |event_data|
      Events.create(:observation => event_data[0],
                    :location    => event_data[1],
                    :temperature => event_data[2])
    end
  end

  def self.list_by_temperature()
    event_list = Events.events_by_temperature()
    event_list.each do | event |
      printf("%8s %3s %3d\n",event.observation,event.location,event.temperature)
    end
  end

end

########################################
#
#
#
########################################
begin

  puts "ActiveRecord version : #{ActiveRecord::VERSION::STRING}"
  puts "SQLite3 version : #{SQLite3::VERSION}"

  db_config = {:adapter => "sqlite3", :database => "events.db" };

  ActiveRecord::Base::default_timezone = :utc
  ActiveRecord::Base::establish_connection(db_config)

  EventHandler::create_events()
  EventHandler::list_by_temperature()


rescue Exception => boom
  puts "Exception : #{boom.class()}"
  puts "Error : #{boom}"
end


