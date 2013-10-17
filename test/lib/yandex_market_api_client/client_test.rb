require 'test_helper'

class ClientTest < TestCase

  def setup
    YandexMarketApiClient.configure do |config|
      config.auth_key = "123"
      config.api_version = "1"
    end
  end

  def test_should_get_instance
  end
end
