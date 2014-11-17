# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'que/testing/version'

Gem::Specification.new do |spec|
  spec.name          = "que-testing"
  spec.version       = Que::Testing::VERSION
  spec.authors       = ["Jason Staten"]
  spec.email         = ["jstaten07@gmail.com"]
  spec.summary       = %q{Testing support for the Que queue}
  spec.description   = %q{Testing support fot the Que queue}
  spec.homepage      = "https://github.com/statianzo/que-testing"
  spec.license       = "BSD"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "que"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.4"
end
