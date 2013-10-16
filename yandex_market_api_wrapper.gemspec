# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yandex_market_api_wrapper/version'

Gem::Specification.new do |gem|
  gem.name          = "yandex_market_api_wrapper"
  gem.version       = YandexMarketApiWrapper::VERSION
  gem.authors       = ["Igor Kuznetsov"]
  gem.email         = ["igkuznetsov@gmail.com"]
  gem.description   = %q{YandexMarket API wrapper written in Ruby}
  gem.summary       = %q{It's a wrapper for YandexMarket Api written in Ruby. Useful for clients having authoriztion key from yandex.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
