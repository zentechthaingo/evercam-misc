# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'evercam_misc/version'

Gem::Specification.new do |spec|
  spec.name          = "evercam_misc"
  spec.version       = EvercamMisc::VERSION
  spec.authors       = ["Evercam.io"]
  spec.email         = ["howrya@evercam.io"]
  spec.summary       = %q{Miscellaneous classes used by the Evercam application.}
  spec.description   = %q{Miscellaneous classes extracted from the ./lib directory and used by other Evercam system components.}
  spec.homepage      = "https://evecam.io"
  spec.license       = "Commercial"

  spec.files         = Dir.glob("{bin,lib}/**/*") + %w(LICENSE.txt README.md CHANGELOG.md)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.2"

  spec.add_dependency "3scale_client"
  spec.add_dependency "dotenv", "~> 0.10"
  spec.add_dependency "sidekiq", "~> 2.17"
end
