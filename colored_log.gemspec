# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'colored_log/version'

Gem::Specification.new do |spec|
  spec.name          = 'colored_log'
  spec.version       = ColoredLog::VERSION
  spec.authors       = ["mayar"]
  spec.email         = ["mayar@yandex.ru"]

  spec.summary       = 'Very simple colorized and formatted log class.'
  spec.homepage      = 'https://github.com/Mayar/colored_log'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
end
