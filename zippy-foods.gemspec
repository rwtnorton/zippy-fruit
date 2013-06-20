# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zippy_foods/version'

Gem::Specification.new do |spec|
  spec.name          = 'zippy-foods'
  spec.version       = ZippyFoods::VERSION
  spec.authors       = ['Richard W. Norton']
  spec.email         = ['rwtnorton@gmail.com']
  spec.description   = %q{Turns simple Hashes into columnar table.}
  spec.summary       = %q{Maps simple Hash to column-oriented table. }
  spec.homepage      = 'https://github.com/rwtnorton/zippy-foods'
  spec.license       = 'GPLv3'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_runtime_dependency 'minitest'
end
