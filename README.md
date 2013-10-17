[![Build Status](https://travis-ci.org/igkuz/yandex_market_api_wrapper.png)](https://travis-ci.org/igkuz/yandex_wrapper_api_wrapper)

# YandexMarketApiWrapper

It's a YandexMarket API wrapper written in Ruby. Will be useful for
people having authorization key from Yandex. Provides a simple interface
to make API calls to YandexMarket. Not all methods will be supported in
the beginnig.

## Installation

Add this line to your application's Gemfile:

    gem 'yandex_market_api_wrapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yandex_market_api_wrapper

## Usage

### Configuration

There are several parameters that can be configured:

 * auth_key
 * api_version
 * default_format

Code example:

    YandexMarketApiClient.configure do |config|
      config.auth_key = "Your Auth Key Here"
      config.api_version = "1"
      config.default_format = "json"
    end

If no version or format options are provided, the default values will be
seted.

Default Yandex _api_version_ is **1**

Default _deafult_format_ is **json**

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
