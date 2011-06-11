#! /usr/bin/env ruby

require "rbconfig.rb"
include Config

keys = %w{ RUBY_PROGRAM_VERSION MAJOR MINOR TEENY}

keys.each do |key|
  puts "CONFIG[\"#{key}\"] is #{CONFIG[key]}"
end

