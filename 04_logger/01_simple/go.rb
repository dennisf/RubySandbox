#! /usr/bin/env ruby

require 'logger'

puts "Creating go.log file"

logger = Logger.new('go.log')
logger.level = Logger::WARN

logger.error "A error message."
logger.warn "A warning message."
logger.info "A info message."

