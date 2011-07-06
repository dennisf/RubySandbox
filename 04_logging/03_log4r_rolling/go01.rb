#! /usr/bin/env ruby

require 'time'
require 'log4r'

logger = Log4r::Logger.new('mover')
log_formatter = Log4r::PatternFormatter.new(:pattern=>"#{Process.pid}:%d: %m")
logger.outputters << Log4r::RollingFileOutputter.new('rolling_file',:filename => "one-.log",
                                                     :formatter=>log_formatter, :maxtime=>10)
logger.outputters << Log4r::StdoutOutputter.new('stdout',:formatter=>log_formatter)


logger.info("start")

12.times do | count|
  logger.info("count #{count}")
  sleep(1)
end

logger.info("end")

