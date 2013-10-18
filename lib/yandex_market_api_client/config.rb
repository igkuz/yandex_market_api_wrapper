module YandexMarketApiClient
  class Config
    attr_accessor :auth_key, :api_version, :default_format

    def api_version
      @api_version ||= "1"
    end

    def default_format
      @default_format ||= 'json'
    end

    def host
      "https://api.content.market.yandex.ru"
    end
  end
end
