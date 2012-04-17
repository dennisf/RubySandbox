#! /usr/bin/env ruby

require 'pp'

catalog_dir = "/net/web/catalog"

product_dir = "/net/web/catalog/ops/radar/20120406"

puts catalog_dir

puts product_dir


if product_dir.start_with?(catalog_dir)
  puts "#{product_dir} starts with #{catalog_dir}"
else
  puts "#{product_dir} DOES NOT starts with #{catalog_dir}"
  exit
end

subdir = product_dir.gsub(Regexp::new(catalog_dir),'')

if subdir.start_with?('/')
  subdir = subdir[1..-1]
end

pp subdir.split('/')



