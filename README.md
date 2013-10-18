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

### Basic Information

The structure of the api response will not be provided here in case of large data in it. 
You can look for it in Yandex docs [here](http://api.yandex.ru/market/content/doc/dg/concepts/about.xml).

### Configuration

There are several parameters that can be configured:

 * auth_key
 * api_version
 * default_format

Code example:

```ruby
YandexMarketApiClient.configure do |config|
  config.auth_key = "Your Auth Key Here"
  config.api_version = "1"
  config.default_format = "json"
end
```

If no version or format options are provided, the default values will be
seted.

Default Yandex *api_version* is **1**

Default *deafult_format* is **json**

### Client instance

To get a client instance you have to call `get_client` method:

```ruby
client = YandexMarketApiClient.get_client
```

### Category Resource

The api description is provided [here](http://api.yandex.ru/market/content/doc/dg/reference/categories.xml).
List of optinal and required params provided in the docs on the link upper.

+ To get all categories:

```ruby
client.categories(geo_id: 255).perform.parse
client.categories(geo_id: 255, page: 1, count: 10, sort: "name").perform.parse
```

+ To get one category info:

```ruby
client.category(geo_id: 255, category_id: 1).perform.parse
client.category(geo_id: 255, category_id: 1).perform.parse
```

+ To get all category children:

```ruby
client.category_children(geo_id: 255, category_id: 1).perform.parse
client.category_children(geo_id: 255, category_id: 1, page: 1, count: 10, sort: "name", type: "guru").perform.parse
```

+ To get all category models:
 
```ruby
client.category_models(geo_id: 255, category_id: 1).perform.parse
client.category_models(geo_id: 255, category_id: 1, page: 1, count: 10, sort: "name", vendor_id: 1, how: "asc").perform.parse
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
