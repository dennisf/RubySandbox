#! /bin/env ruby

require "rb-inotify"

puts "Ruby Version: #{RUBY_VERSION}"
puts "Notify Example"

event_proc = lambda do |event|

  flags = event.flags

  if flags.include? :is_dir
    flags.delete :is_dir
    puts "directory event: #{flags} path:#{event.absolute_name}"
  else
    puts "file event: #{flags}  name: #{event.absolute_name}"
  end

end

processThread = Thread.new do

  notifier = INotify::Notifier.new

  notifier.watch("/scr/ctm/dennisf/watch_dir1",  :create, :moved_to, :delete, :moved_from, :recursive, &event_proc) 
  notifier.watch("/scr/ctm/dennisf/watch_dir2",  :create, :moved_to, :delete, :moved_from, :recursive, &event_proc) 

  while true do
    # Wait 5 seconds for an event then give up
    if IO.select([notifier.to_io], [], [], 5)
      notifier.process
    end
  end

end

processThread.join









