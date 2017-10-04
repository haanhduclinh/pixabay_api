# frozen_string_literal: true
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'version'

Gem::Specification.new do |s|
  s.name          = 'pixabay_api'
  s.version       = PixabayApi::VERSION
  s.date          = '2017-09-29'
  s.summary       = 'awesome_gem is the best'
  s.description   = 'API get free picture from pixabay'
  s.authors       = ['Eric Duc Linh']
  s.email         = 'haanhduclinh@yahoo.com'
  s.homepage      = 'https://github.com/haanhduclinh/pixabay_api'
  s.licenses      = 'MIT'
  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.require_paths = ['lib']
  s.add_development_dependency 'bundler', '~> 1.15'
  s.add_development_dependency 'webmock', '~> 3.0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rubocop', '~> 0.47.1'
  s.add_development_dependency 'pry', '~> 0.11.1'
  s.add_dependency 'http', '~> 2.2'
end
