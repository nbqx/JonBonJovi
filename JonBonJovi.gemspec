# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'JonBonJovi/version'

Gem::Specification.new do |spec|
  spec.name          = "JonBonJovi"
  spec.version       = JonBonJovi::VERSION
  spec.authors       = ["nbqx"]
  spec.email         = ["nbqxnbq@gmail.com"]
  spec.description   = ""
  spec.summary       = ""
  spec.homepage      = ""

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "eventmachine"
  spec.add_dependency "sinatra"
  spec.add_dependency "haml"
  spec.add_dependency "launchy"
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
