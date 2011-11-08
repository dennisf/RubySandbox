#! /usr/bin/env ruby

dir_names = ["/scr/ctm/dennisf/watch_dir1","/scr/ctm/dennisf/watch_none"]


dir_names.each do | dir_name |

  if Dir::exist?(dir_name)
    puts "#{dir_name} exists"
  else
    puts "#{dir_name} does not exist"
  end

end


