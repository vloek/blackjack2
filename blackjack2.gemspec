# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blackjack2/version'

Gem::Specification.new do |spec|
  spec.name          = "blackjack2"
  spec.version       = Blackjack2::VERSION
  spec.authors       = ["Alexey Antonov"]
  spec.email         = ["lex.antonov@gmail.com"]
  spec.description   = %q{Blackjack2}
  spec.summary       = %q{Blackjack2}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "lib/blackjack2", "lib/blackjack2/model", "lib/blackjack2/commands", "lib/blackjack2/utils"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
