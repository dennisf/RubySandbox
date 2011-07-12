#! /usr/bin/env ruby

require 'net/ftp'

begin
  ftp_connection = Net::FTP::new('lcatalog.eol.ucar.edu')
  ftp_connection.login('anonymous','rubytest@ucar.edu')

  ftp_connection.chdir('pub/incoming/catalog/test_area')

  file_list = ftp_connection.list()

  file_list.each do |file_listing|
    puts file_listing
  end

  ftp_connection.putbinaryfile('small.file')

  ftp_connection.putbinaryfile('large.jpg') do |data|
    puts "Sending #{data.length}"
  end

  ftp_connection.close()
  
rescue Exception => boom
  puts "Exception class  : #{boom.class}"
  puts "Exception message: #{boom}"
end




