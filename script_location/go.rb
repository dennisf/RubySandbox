#! /usr/bin/env ruby


puts "hello"

puts "__FILE__ is #{__FILE__}"
puts "File::expand_path(__FILE__) is #{File::expand_path(__FILE__)}"

puts "File::expand_path(File::dirname(__FILE__)) is #{File::expand_path(File::dirname(__FILE__))}"


