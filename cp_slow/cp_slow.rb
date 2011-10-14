#! /usr/bin/env ruby


from_path = ARGV[0]
to_path   = ARGV[1]


begin

  if File.directory?(to_path)
    from_name = File.basename(from_path)
    to_path = File.join(to_path,from_name)
  end

  puts "copy from #{from_path} to #{to_path}"

  from_file = File.open(from_path,"r")
  to_file   = File.open(to_path,"a")
  
  while block = from_file.read(1024)
    to_file.write(block)
    printf(".")
  end
  printf("\n")

rescue Exception => boom
  puts("")
  puts("Exception: #{boom.class()}")
  puts("Error: #{boom}")
end
