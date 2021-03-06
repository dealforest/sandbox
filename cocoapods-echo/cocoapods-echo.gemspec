# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods/echo/version'

Gem::Specification.new do |spec|
  spec.name          = "cocoapods-echo"
  spec.version       = Cocoapods::Echo::VERSION
  spec.authors       = ["Toshihiro Morimoto"]
  spec.email         = ["dealforest.net@gmail.com"]
  spec.summary       = %q{CocoaPods plugin to echo arguments.}
  spec.description   = %q{echo arguments}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_dependency 'cocoapods'
end
