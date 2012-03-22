#! /usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require 'active_record'
require 'pp'
require 'logger'

require 'connect_db'

puts "hello"

begin

  connect_db()

  ActiveRecord::Schema.define do

    drop_table :events if table_exists? :events

    create_table :events do |table|
      table.string    :name,   :null=>false
      table.integer   :priority, :default=>0
      table.string    :status, :default=>'NO_EVENTS'
      table.integer   :versions, :default=>0
      table.timestamp :observe_time
    end
  end


rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
