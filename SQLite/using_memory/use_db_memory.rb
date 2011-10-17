#! /usr/bin/env ruby

require 'bundler/setup'

require 'active_record'
require 'sqlite3'

$DEBUG = true

########################################
#
#
#
########################################
class FileEvent < ActiveRecord::Base

  def self.events_by_temperature
    order("temperature")
  end

end

########################################
#
#
#
########################################
class EventsDatabase

  @@EVENT_DATA = [["rain",  "LAF", 45],
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
        
  def self.create_database()
    ActiveRecord::Schema.define do
      create_table :file_events do | table |
        table.string  :observation, :null => false
        table.string  :location,    :null => false
        table.integer :temperature, :null => false
        table.timestamps
      end
    end
  end


  def self.create_events()

    @@EVENT_DATA.each do |event_data|
      FileEvent.create(:observation => event_data[0],
                       :location    => event_data[1],
                       :temperature => event_data[2])
    end
  end


  def self.list_by_temperature()
    event_list = FileEvent.events_by_temperature()
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

  db_config = {:adapter => "sqlite3", :database => ":memory:" };

  ActiveRecord::Base::default_timezone = :utc
  ActiveRecord::Base::establish_connection(db_config)

  EventsDatabase::create_database()
  EventsDatabase::create_events()
  EventsDatabase::list_by_temperature()

  puts "rain: "
  if rain_events = FileEvent.find_all_by_observation("rain")

    puts "rain_events: #{rain_events.class()}"
    rain_events.each do | rain |
      puts "#{rain.observation()}, #{rain.temperature()}, #{rain.location()}"
    end
  else
    put "No rain events"
  end

rescue Exception => boom
  puts "Exception : #{boom.class()}"
  puts "Error : #{boom}"
  
  boom.backtrace().each do | line |
    puts(line)
  end

end
