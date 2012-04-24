#!/usr/bin/env ruby


require 'log4r'

module FooStuff
  class FooCount

    def initialize
      @logger = Log4r::Logger::new("sandbox")
    end

    def log_count(number)
      number.times {|value| @logger.info("#{value}")}
    end

  end
end

logger = Log4r::Logger::new("app")
logger = Log4r::Logger::root
logger.level = Log4r::INFO
logger.outputters = Log4r::Outputter.stdout

logger.info("hello")

Log4r::Logger.each do |name,a_logger|
  logger.info("logger name: #{name}")
end


#counter = FooStuff::FooCount.new

#counter.log_count(3)

logger.info("bye")

