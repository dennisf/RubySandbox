#!/usr/bin/env ruby

puts "hello"

script_directory = File::expand_path(File::dirname(__FILE__))

puts script_directory

parent_directory = File::expand_path(File::join(script_directory,".."))

puts parent_directory

