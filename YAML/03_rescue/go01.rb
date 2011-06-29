#! /usr/bin/env ruby

require 'yaml'

begin
  food = YAML::load_file('mood.yaml')
rescue Exception => boom
  puts "Rescue class: #{boom.class}"
  puts "Rescue : #{boom}"
end



