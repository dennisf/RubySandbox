#! /usr/bin/env ruby

require 'active_record'
require 'pp'
require 'logger'
require 'time'

puts "hello"

begin

  dbconfig = {
    :adapter  => "mysql",
    :host     => "localhost",
    :username => "watchdog",
    :password => "SaBi1435",
    :database => "doghouse"
  }

  ActiveSupport::LogSubscriber.colorize_logging = false
  ActiveRecord::Base.logger = Logger.new(STDERR)
  ActiveRecord::Base.establish_connection(dbconfig)


  products = ["goes-13-vis","goes-13-ir","gv-flight-track"]

  start_time = Time::parse("May 22 13:00:00 UTC")


rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
