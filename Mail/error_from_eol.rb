#! /usr/bin/env ruby

require 'mail'

def send_email(subject_line,message)
  Mail.defaults do
    delivery_method :smtp, 
    { :address              => "smtp.eol.ucar.edu",
      :port                 => 25,
      :domain               => 'eol.ucar.edu',
      :user_name            => nil,
      :password             => nil,
      :authentication       => nil,
      :enable_starttls_auto => true  }
  end

  Mail.deliver do
    to 'dennisf@ucar.edu'
    from 'mail_test@ucar.edu'
    subject subject_line
    body message
  end
end

def bad_things_happen()
  #  raise Exception.new("An Error Message.")
  raise "An Error Message in a string."
end


begin  

  bad_things_happen()
  
rescue Exception => boom
  message =  "Exception from test program\r\n"
  message << "Message time : #{Time.now().utc()}\r\n"
  message << "Exception Class: #{boom.class()}\r\n"
  message << "Exception Message: #{boom}\r\n\r\n"
  message << "Backtrace: \r\n"
  boom.backtrace().each do |line|
    message << line << "\r\n"
  end
  send_email("test email",message)
end




