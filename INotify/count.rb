#! /bin/env ruby


runThread = Thread.new do
  0.upto(10) do |y|
    puts "Sleeping #{y}"
    sleep(2)
  end
end

countThread = Thread.new do
  0.upto(20) do |x|
    puts "Quick sleep #{x}"
    sleep(1)
  end
end

countThread.join


