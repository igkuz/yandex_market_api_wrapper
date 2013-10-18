module YandexMarketApiClient
  class Client < ::Weary::Client
    domain YandexMarketApiClient.config.host

    def initialize(format = nil)
      headers("Authorization" => YandexMarketApiClient.config.auth_key)
    end

    class << self
      def config
        YandexMarketApiClient.config
      end

      def format
        config.default_format
      end
    end

    get :categories, "/v#{config.api_version}/category.#{format}" do |resource|
      resource.optional :page, :count, :sort
      resource.required :geo_id
    end

    get :category, "/v#{config.api_version}/category/{category_id}.#{format}" do |resource|
      resource.optional :page, :count, :sort
      resource.required :geo_id
    end

    get :regions, "/v#{config.api_version}/georegion.#{format}" do |resource|
      resource.optional :page, :count
    end

    get :region, "/v#{config.api_version}/georegion/{geo_id}.#{format}" do |resource|
      resource.optional :page, :count
    end
  end
end
