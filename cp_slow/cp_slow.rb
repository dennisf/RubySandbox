#! /usr/bin/env ruby


from_path = ARGV[0]
to_path   = ARGV[1]


begin

  if File.directory?(to_path)
    from_name = File.basename(from_path)
    to_path = File.join(to_path,from_name)
  end

  puts "copy from #{from_path} to #{to_path}"

  end_of_file = false
  from_file = File.open(from_path,"r")

  until end_of_file
    to_file   = File.open(to_path,"a")
    block_count = 0
    until  (block_count >= 80) or end_of_file
      if block = from_file.read(1024)
        to_file.write(block)
        printf(".")
        block_count += 1
      else
        end_of_file = true
      end
    end
    to_file.close()
    printf("C\n")
    sleep(2) unless end_of_file
  end

rescue Exception => boom
  puts("")
  puts("Exception: #{boom.class()}")
  puts("Error: #{boom}")
end
