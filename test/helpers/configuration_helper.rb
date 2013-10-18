module ConfigurationHelper

  def standard_configuration
    YandexMarketApiClient.configure do |config|
      config.auth_key = "123"
      config.api_version = "1"
      config.host = "http://test.com"
    end
  end
end
