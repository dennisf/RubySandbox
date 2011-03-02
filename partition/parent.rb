#! /usr/bin/env ruby

def split_path(path,breakIndex)

  breakLocation = -1

  pathParts = []

  (0..breakIndex).each do |index|
    breakLocation = path.rindex('/',breakLocation)
    if breakLocation == 0 
      pathParts = [nil,path]
    else
      pathParts = [path[0..(breakLocation -1)],path[(breakLocation + 1)..-1]]
      breakLocation -= 1
    end
  end
  
  return pathParts

end

dir = "/scr/ctm/dennisf/watch_dir1/subdir1/file01"

puts dir

(0..6).each do |splitIndex| 
  parts =  split_path(dir,splitIndex)
  puts ""
  puts "split: #{splitIndex}"
  if parts[0].nil?
    puts "  0 : nil"
    puts "  1 : #{parts[1]}"
  else
    puts "  0 : #{parts[0]}"
    puts "  1 : #{parts[1]}"
  end
end
