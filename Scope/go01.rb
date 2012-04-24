#! /usr/bin/env ruby


puts "hello"


def some_function(num)
  return nil if num < 0
  return "#{num} is positive"
end


unless value1 = some_function(2)
  puts "value1 was nil"
end
puts "value1: #{value1}"

unless value2 = some_function(-4)
  puts "value2 was nil"
  value2 = some_function(4)
end
puts "value2: #{value2}"


