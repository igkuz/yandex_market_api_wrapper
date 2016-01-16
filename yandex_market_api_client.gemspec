# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yandex_market_api_client/version'

Gem::Specification.new do |gem|
  gem.name          = "yandex_market_api_client"
  gem.version       = YandexMarketApiClient::VERSION
  gem.authors       = ["Igor Kuznetsov"]
  gem.email         = ["igkuznetsov@gmail.com"]
  gem.description   = %q{YandexMarket API client written in Ruby}
  gem.summary       = %q{It's a wrapper for YandexMarket Api calls written in Ruby. Useful for clients having authoriztion key from Yandex.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "weary"
  gem.add_development_dependency "rake"
  gem.required_ruby_version = '~> 2.0'
end
