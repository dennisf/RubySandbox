#!/usr/bin/env ruby

require 'logging'

Logging.consolidate('root')
Logging.logger['root'].level  = :info
Logging.logger['Thing'].level = :debug

class Thing

  def initialize()
    @logger = Logging.logger[self]
  end

  def talk()
    @logger.info("Thing's logger name is : #{@logger.name}")
    @logger.info("Thing says something about info")
    @logger.debug("Thing says something about debug")
  end

end


logger = Logging::logger['root']

layout = Logging::layouts::pattern(:pattern=>'%6l %d : %m\n', :date_method=>'utc')

logger.add_appenders(
     Logging::appenders::stdout(:layout => layout)
)

logger.info("hello")

thing = Thing.new()

thing.talk()

logger.debug("Should not see this debug message")
logger.info("Bye")
