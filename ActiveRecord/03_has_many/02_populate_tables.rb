#! /usr/bin/env ruby

#$DEBUG = true

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

  class Product < ActiveRecord::Base
    has_many :product_files
  end

  class ProductFile < ActiveRecord::Base
    belongs_to :product
  end

  start_time    = Time::parse("May 22 13:00:00 UTC")
  goes_products = ["goes-13-vis","goes-13-ir"]

  goes_times = Array.new
  20.times do | index |
    goes_times.push(start_time + (index * 15 * 60))
  end

  goes_products.each do |product|
    product_row = Product.create(:name => product, :last_sent => Time.now())
    goes_times.each do | product_time |
      time_string = product_time.strftime("%Y%m%d-%H%M%S")
      goes_path = "#{product}_#{time_string}.jpg"
      product_row.product_files.create(:filepath => goes_path,:status => "new")
    end
  end
  
  kml_products  = ["gv-flight-track"]




rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
