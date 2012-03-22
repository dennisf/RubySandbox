
require 'active_record'

class Event < ActiveRecord::Base
  set_locking_column :versions

  def self.find_path_to_ingest()
    begin
      if file_event = where("status = ?","CLOSE").order("priority ASC").order("observe_time DESC").first 
        file_event.status = "PROC"
        sleep(rand(5.0))
        file_event.save
      end
    rescue ActiveRecord::StaleObjectError => boom
      puts "StaleObject: #{boom}"
      retry 
    end

    return file_event
  end
end
