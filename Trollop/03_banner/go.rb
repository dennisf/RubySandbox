#! /usr/bin/env ruby

require 'pp'
require 'trollop'

version_string = "version 0.0.2"

begin

  options = Trollop::options do
    version version_string
    banner <<-EOS

go.rb (#{version_string}):
  Test program to see how Trollops banner and version functions.
EOS
    opt :number, "Set number",:default => 5
    opt :color, "Set color",:default => "green"
  end

  pp "options:"
  pp options

rescue SystemExit
  puts "SystemExit was raised"
rescue Exception => boom
  puts "Exception class: #{boom.class}"
  puts "Exception (go.rb): #{boom}"
end





