#! /bin/env ruby


require "rb-inotify"

puts "Notify Example"

processThread = Thread.new do

  notifier = INotify::Notifier.new

  notifier.watch("/scr/ctm/dennisf/watch_dir", :create, :moved_to, :delete, :moved_from, :recursive) do |event|
    puts "name: #{event.absolute_name} event: #{event.flags}"
  end

  notifier.run

end

0.upto(4) do |x|
  puts x
  sleep(1)
end









