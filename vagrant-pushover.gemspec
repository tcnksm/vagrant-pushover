# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-pushover/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-pushover"
  spec.version       = VagrantPlugins::Pushover::VERSION
  spec.authors       = ["tcnksm"]
  spec.email         = ["nsd22843@gmail.com"]
  spec.summary       = %q{Vagrant plugin that adds pushover notification }
  spec.description   = %q{Vagrant plugin that adds pushover notification to your iOS/Android. }
  spec.homepage      = "https://github.com/tcnksm/vagrant-pushover"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
