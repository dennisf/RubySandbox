#! /usr/bin/env ruby 

require 'fssm'

puts "FSSM Example"


monitor = FSSM::Monitor.new


monitor.path '/Volumes/Media/watch_dir' do

  update do |base,relative|
    puts "update: #{base}  #{relative}"
  end

  delete do |base,relative|
    puts "delete: #{base}  #{relative}"
  end

  create do |base,relative|
    puts "create: #{base}  #{relative}"
  end

end



processThread = Thread.new do
  monitor.run
end

0.upto(50) do |x|
  puts x
  sleep(1)
end












