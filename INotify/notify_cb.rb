#! /bin/env ruby

require "rb-inotify"

puts "Ruby Version: #{RUBY_VERSION}"
puts "Notify Example"


event_callback = lambda do |event|
    puts "callback : name: #{event.absolute_name} event: #{event.flags}"
end

processThread = Thread.new do

  notifier = INotify::Notifier.new

  # notifier.watch("/scr/ctm/dennisf/watch_dir1", :create, :moved_to, :delete, :moved_from, :recursive) do |event|
  #   puts "name: #{event.absolute_name} event: #{event.flags}"
  # end

  notifier.watch("/scr/ctm/dennisf/watch_dir1", :create, :moved_to, :delete, :moved_from, :recursive, &event_callback) 
  notifier.watch("/scr/ctm/dennisf/watch_dir2", :create, :moved_to, :delete, :moved_from, :recursive, &event_callback) 

  while true do
    # Wait 5 seconds for an event then give up
    puts "process loop about to select"
    if IO.select([notifier.to_io], [], [], 60)
      notifier.process
    end
  end

end

processThread.join









