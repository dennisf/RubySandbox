#! /usr/bin/env ruby

sleep_seconds = rand(4) + 1

puts "#{Process.pid} Worker start sleep #{sleep_seconds}"

sleep sleep_seconds

puts "#{Process.pid} Worker stop"
