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


  ActiveRecord::Schema.define do
    create_table :products do |table|
      table.string   :name,:null=>false
      table.datetime :last_sent
    end
  end

  ActiveRecord::Schema.define do
    create_table :product_files do | table |
      table.integer :product_id
      table.string  :filepath
      table.string  :status
    end
  end

  class Product < ActiveRecord::Base
    has_many :product_files
  end

  class ProductFile < ActiveRecord::Base
    belongs_to :product
  end

rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception: #{boom}"
end


puts "bye"
