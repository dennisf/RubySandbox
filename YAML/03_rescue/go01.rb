#! /usr/bin/env ruby

require 'yaml'

begin
  food = YAML::load_file('mood.yaml')
rescue Exception => boom
  puts "Rescue : #{boom}"
end



