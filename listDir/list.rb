#! /usr/bin/env ruby

puts "ls -l in this directory"

puts `ls -l`

puts "ls with -t too"

puts %x[ls -lt]


