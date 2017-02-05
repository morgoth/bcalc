# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bcalc/version"

Gem::Specification.new do |spec|
  spec.name          = "bcalc"
  spec.version       = Bcalc::VERSION
  spec.authors       = ["Wojciech Wnętrzak"]
  spec.email         = ["w.wnetrzak@gmail.com"]

  spec.summary       = %q{C lib wrapper for Bridge Calculator}
  spec.description   = %q{C lib wrapper for Bridge Calculator}
  spec.homepage      = "https://github.com/morgoth/bcalc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0"

  spec.add_dependency "ffi"

  spec.add_development_dependency "bundler", ">= 1.14"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "minitest", ">= 5.0"
end
