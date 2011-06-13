#! /usr/bin/env ruby

require 'pp'
require 'trollop'


begin

  options = Trollop::options do
    opt :color, "Set color",:default => "green"
    opt :count, "Set count",:default => 5,:short => "n"
  end
  pp options

rescue SystemExit
  # Don't do anything here.
rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception (go.rb): #{boom}"
end





