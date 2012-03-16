#!/usr/bin/env ruby

require 'logging'

logger = Logging::logger['go02']
logger.level  = :debug

layout = Logging::layouts::pattern(:pattern=>'%6l %d : %m\n', :date_method=>'utc')

logger.add_appenders(
     Logging::appenders::stdout(:layout => layout)
)

logger.info("hello info")
logger.debug("hello debug")





