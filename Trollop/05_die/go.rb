#! /usr/bin/env ruby

require 'pp'
require 'trollop'


begin

  options = Trollop::options do
    opt :color, "Set color",:default => "green"
    opt :number, "Set count; must be from 1 to 10",:default => 5
  end
  
  Trollop::die :number, "must be a number from 1 to 10" if not (1..10).to_a.include? options[:number]

  pp options

rescue SystemExit
  # Don't do anything here.
rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception (go.rb): #{boom}"
end





