#! /usr/bin/env ruby

require 'play_box'

puts "Hello"



number = SandNum::Number.new
puts "SandNum Version: #{SandNum::VERSION}"
5.times do
  puts "value: #{number.value}"
end

box = PlayBox::Count.new
puts ""
puts "PlayBox Version: #{PlayBox::VERSION}"
5.times do
  box.go
end

puts "Bye"