# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sand_num/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dennis Flanigan"]
  gem.email         = ["dflanigan@rallydev.com"]
  gem.description   = %q{This gem is a test}
  gem.summary       = %q{This gem is a test
                        }
  gem.homepage      = ""

  gem.files         = ["lib/sand_num.rb","lib/sand_num/version.rb","lib/sand_num/number.rb"]
  gem.executables   = []
  gem.test_files    = []
  gem.name          = "sand_num"
  gem.require_paths = ["lib"]
  gem.version       = SandNum::VERSION
end
