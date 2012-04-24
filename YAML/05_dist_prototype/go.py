#! /usr/bin/env ruby

require 'yaml'
require 'pp'

puts "hello"



class MoveDirectories

  def initialize(config)
    @directories = Hash.new()
    config.each do | dir,conditions |
      if conditions.nil?
        @directories[dir] = ['.*']
      else
        @directories[dir] = conditions
      end
    end
  end

  def resolve(product_path)

    filename = File::basename(product_path)

    paths = Array.new()
    
    @directories.each do |dir, conditions |
      conditions.each do | condition |
        if Regexp.new(condition).match filename
          paths << dir
          break
        end
      end
    end

    return paths
  end

end

configure = YAML::load_file('move_dirs.yaml')

move_config = configure["move_directories"]

move_paths = MoveDirectories.new(move_config)

products = ["ops.skewT.20120424110300.profile.jpg",
            "reseach.gv.20120424110300.path.kml",
            "report.ship.20120424110300.plan.pdf",
            "ops.radar.20120424110300.dbz.jpg",
            "ops.radar.20120424110300.dbz.jpg.gz"]

products.each do | product |
  puts product
  paths = move_paths.resolve(product)
  paths.each do | path |
    puts "  " + path
  end
  puts ''
end


puts "bye"
