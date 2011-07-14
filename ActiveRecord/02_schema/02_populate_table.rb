#! /usr/bin/env ruby

require 'active_record'
require 'pp'
require 'logger'

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

  class Animals < ActiveRecord::Base
  end

  puts "Value of connected: #{ActiveRecord::Base.connected?}"

  class Colors < ActiveRecord::Base
  end

  color_values = ["blue","green","red","white","black"]

  color_values.each do | value | 
    puts value
    color = Colors.create(:color => value)
  end
  
  
  puts "Value of connected: #{ActiveRecord::Base.connected?}"

rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
