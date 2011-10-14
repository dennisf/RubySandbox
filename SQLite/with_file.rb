#! /usr/bin/env ruby


require 'bundler/setup'

require 'active_record'
require 'sqlite3'

begin

  puts "ActiveRecord version : #{ActiveRecord::VERSION::STRING}"
  puts "SQLite3 version : #{SQLite3::VERSION}"

  db_config = {:adapter => "sqlite3", :database => "events.db" };

  ActiveRecord::Base::default_timezone = :utc
  ActiveRecord::Base::establish_connection(db_config)

  ActiveRecord::Schema.define do
    create_table :events do | table |
      table.string   :observation, :null => false
      table.integer  :grade,       :default => 1
      table.string   :temperature, :null => false
      table.timestamps
    end
  end

rescue Exception => boom
  puts "Exception : #{boom.class()}"
  puts "Error : #{boom}"
end


