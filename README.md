[![Build Status](https://travis-ci.org/igkuz/yandex_market_api_wrapper.png)](https://travis-ci.org/igkuz/yandex_wrapper_api_wrapper)
[![Coverage Status](https://coveralls.io/repos/igkuz/yandex_market_api_wrapper/badge.png)](https://coveralls.io/r/igkuz/yandex_market_api_wrapper)

# YandexMarketApiWrapper

It's a YandexMarket API wrapper written in Ruby. Will be useful for
people having authorization key from Yandex. Provides a simple interface
to make API calls to YandexMarket. Not all methods will be supported in
the beginnig.

## Installation

Add this line to your application's Gemfile:

    gem 'yandex_market_api_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yandex_market_api_client

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

I'll use *geo_id = 225* (Russia) by default in all queries, you have to choose what geo_id do you need.

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
client.categories(geo_id: 225).perform.parse
client.categories(geo_id: 225, page: 1, count: 10, sort: "name").perform.parse
```

+ To get one category info:

```ruby
client.category(geo_id: 225, category_id: 1).perform.parse
client.category(geo_id: 225, category_id: 1).perform.parse
```

+ To get all category children:

```ruby
client.category_children(geo_id: 225, category_id: 1).perform.parse
client.category_children(geo_id: 225, category_id: 1, page: 1, count: 10, sort: "name", type: "guru").perform.parse
```

+ To get all category models:
 
```ruby
client.category_models(geo_id: 225, category_id: 1).perform.parse
client.category_models(geo_id: 225, category_id: 1, page: 1, count: 10, sort: "name", vendor_id: 1, how: "asc").perform.parse
```

### Georegion Resource

The api description is provided [here](http://api.yandex.ru/market/content/doc/dg/reference/georegions.xml).
List of optinal and required params provided in the docs on the link upper.

+ To get all georegions:

```ruby
client.regions.perform.parse
```

+ To get info for concrete geo_id:

```ruby
client.region(geo_id: 225).perform.parse
```

+ To get children for geo_id:

```ruby
client.region_children(geo_id: 225).perform.parse
```

### Shop Resource

The api description is provided [here](https://tech.yandex.ru/market/content/doc/dg/reference/shops-docpage/).
List of options and required params is provided in the docs on the link upper.

+ To get shop info:

```ruby
client.shop_info(shop_id: 24049).perform.parse
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
