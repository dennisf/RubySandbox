# -*- encoding: utf-8 -*-
require File.expand_path('../lib/play_box/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dennis Flanigan"]
  gem.email         = ["dflanigan@rallydev.com"]
  gem.description   = %q{This gem is a test}
  gem.summary       = %q{This gem is a test
                        }
  gem.homepage      = ""

  gem.files         = ["lib/play_box.rb","lib/play_box/version.rb","lib/play_box/count.rb"]
  gem.executables   = []
  gem.test_files    = []
  gem.name          = "play_box"
  gem.require_paths = ["lib"]
  gem.version       = PlayBox::VERSION
  gem.add_dependency('sand_num','1.0.0')
end
