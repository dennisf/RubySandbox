#! /usr/bin/env ruby

require 'sand_num'

puts "Hello"

number = SandNum::Number.new
puts "SandNum Version: #{SandNum::VERSION}"
5.times do
  puts "value: #{number.value}"
end

puts "Bye"