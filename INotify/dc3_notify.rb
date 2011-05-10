#! /bin/env ruby

require "rb-inotify"

puts "Ruby Version: #{RUBY_VERSION}"
puts "Notify Example"

dir_to_watch = "/scr/tmp/snorman/ftp/pub/incoming/catalog/dc3_2011"

event_proc = lambda do |event|

  puts "hello world"
  puts "#{event.absolute_name}   #{event.flags}"

end

processThread = Thread.new do

  notifier = INotify::Notifier.new

  notifier.watch("/scr/ctm/dennisf/watch_dir1", :create, :moved_to, :delete, :moved_from, :recursive, &event_proc)
#  notifier.watch("/scr/tmp/snorman/ftp/pub/incoming/catalog/dc3_2011",  :create, :moved_to, :delete, :moved_from, :recursive, &event_proc) 
#  notifier.watch("/scr/tmp/snorman/ftp/pub/incoming/catalog/dc3_2011",  :create, :moved_to, :delete, &event_proc) 

  while true do
    #test = IO.select([notifier.to_io], [], [], 5)
    #puts "test: #{test.class}"
    # Wait 5 seconds for an event then give up
    if IO.select([notifier.to_io], [], [], 5)
      puts "here i am"
      notifier.process
    end
  end

end

processThread.join
