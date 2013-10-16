require 'test_helper'

class ClientTest < TestCase

  setup do
    YandexMarketApiClient.configure do |config|
      config.auth_key = "123"
      config.api_version = "1"
    end
  end
end
