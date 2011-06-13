#! /usr/bin/env ruby

require 'pp'
require 'trollop'


begin

  options = Trollop::options do
    opt :color, "Set color",:default => "green"
    opt :number, "Set count",:default => 5
  end
  
  Trollop::die :number, "must be a number from 1 to 10" if options[:number] not [1..10]

  pp options

rescue SystemExit
  # Don't do anything here.
rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception (go.rb): #{boom}"
end





