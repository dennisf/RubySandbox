#! /usr/bin/env ruby

require 'mail'


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
  to 'dennisf@ucar.edu,flanigan@fluth.net'
  from 'mail_test@ucar.edu'
  subject 'ruby mail gem test'
  body "test mail at #{Time.now()}"
end

