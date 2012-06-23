# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sencha-touch2-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Paul Schyska"]
  gem.email         = ["pschyska@googlemail.com"]
  gem.description   = %q{Rails asset gem for the Sencha Touch Framework}
  gem.summary       = %q{Rails asset gem for the Sencha Touch Framework}
  gem.homepage      = "https://github.com/pschyska/sencha-touch2-rails"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sencha-touch2-rails"
  gem.require_paths = ["lib"]
  gem.version       = Sencha::Touch2::Rails::VERSION

  gem.add_dependency "railties", "~> 3.1"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "compass"
end
