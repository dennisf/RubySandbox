#! /usr/bin/env ruby

require 'pp'

puts "hello"


def process_array(array)
  puts
  pp array
  array[0...-1].each {|value| puts value}
  puts "#{array.last} last" unless array.empty?
end


full_array      = [2,4,6,8]
array_with_one  = [3]
array_with_zero = []

process_array(full_array)
process_array(array_with_one)
process_array(array_with_zero)





