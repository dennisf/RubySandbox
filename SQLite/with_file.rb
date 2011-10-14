#! /usr/bin/env ruby


require 'bundler/setup'

require 'active_record'
require 'sqlite3'

puts "ActiveRecord version : #{ActiveRecord::VERSION::STRING}"
puts "SQLite3 version : #{SQLite3::VERSION}"

db_config = {:adapter => "sqlite3", :database => "sightings.db" };

ActiveRecord::Base.establish_connection(db_config)
