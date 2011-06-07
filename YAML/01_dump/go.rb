#! /usr/bin/env ruby

require 'yaml'

zoo_colors = Hash.new

zoo_colors[:elephant] = 'gray'
zoo_colors[:zebra]    = ['black','white']
zoo_colors[:aligator] = 'green'
zoo_colors[:lion]     = 'orange'

file = File.open "zoo_colors.yaml","w" 

YAML::dump zoo_colors,file






