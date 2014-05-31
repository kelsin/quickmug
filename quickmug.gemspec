# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quickmug/version'

Gem::Specification.new do |spec|
  spec.name          = "quickmug"
  spec.version       = QuickMug::VERSION
  spec.authors       = ["Christopher Giroir"]
  spec.email         = ["kelsin@valefor.com"]
  spec.description   = QuickMug::DESCRIPTION
  spec.summary       = QuickMug::DESCRIPTION
  spec.homepage      = %q{http://github.com/Kelsin/quickmug}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency('commander', "~> 4.2.0")
  spec.add_runtime_dependency('safe_yaml', "~> 1.0.3")
  spec.add_runtime_dependency('oauth', "~> 0.4.7")
  spec.add_runtime_dependency('ruby-smugmug', "~> 0.0.1")
  spec.add_runtime_dependency('clipboard', "~> 1.0.5")
  spec.add_runtime_dependency('ffi', "~> 1.9.3")

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
