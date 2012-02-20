#! /usr/bin/env ruby

require 'active_record'
require 'pp'
require 'logger'

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

  ActiveRecord::Schema.define do

    drop_table :events

    create_table :events do |table|
      table.string   :name,   :null=>false
      table.string   :status, :default=>'NO_EVENTS'
      table.timestamps
    end
  end


rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
