#! /usr/bin/env ruby

require 'net/ftp'

begin
  ftp_connection = Net::FTP::new('sferic-dev.eol.ucar.edu','anonymous','dennisf@ucar.edu')

  ftp_connection.chdir('pub/incoming/catalog/torero')

  ftp_connection.resume = true

  ftp_connection.putbinaryfile('/dev/null','test.pdf') do | data |
    puts "sending #{data.length}"
  end

  sleep 2

  ftp_connection.retrbinary("RETR " + 'test.pdf', 1, 4074184) { |data| puts "size of data: #{data.length}" }

  ftp_connection.retrbinary("RETR " + 'test.pdf', 1, 4074184) {nil}


  ftp_connection.close()
  
rescue Exception => boom
  puts "Exception class  : #{boom.class}"
  puts "Exception message: #{boom}"
end




