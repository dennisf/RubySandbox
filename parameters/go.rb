#! /usr/bin/env ruby

require 'pp'

def resolve(*list)
  pp list
  list.flatten!
  pp list
  puts ''
end

one = [1]

two = [2,3]

resolve(one)
resolve(two)
resolve(one,two)
resolve(one,two,4)

