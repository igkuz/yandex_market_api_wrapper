module YandexMarketApiClient
  class Config
    attr_accessor :auth_key, :api_version

    def api_version
      @api_version ||= "1"
    end
  end
end
