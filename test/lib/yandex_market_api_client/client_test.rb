require 'test_helper'

class ClientTest < TestCase

  def setup
    YandexMarketApiClient.configure do |config|
      config.auth_key = "123"
      config.api_version = "1"
    end
  end

  def test_should_get_instance
    @client = YandexMarketApiClient.get_client
    assert_kind_of(YandexMarketApiClient::Client, @client)
  end
end
