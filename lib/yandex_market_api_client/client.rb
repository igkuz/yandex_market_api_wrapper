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

    get :category_children, "/v#{config.api_version}/category/{category_id}/children.#{format}" do |resource|
      resource.optional :page, :count, :sort, :type
      resource.required :geo_id
    end

    get :category_models, "/v#{config.api_version}/category/{category_id}/models.#{format}" do |resource|
      resource.optional :page, :count, :sort,
                        :vendor_id, :how    # how - asc или desc для сортировки
      resource.required :geo_id
    end

    get :category_filters, "/v#{config.api_version}/category/{category_id}/filters.#{format}" do |resource|
      resource.optional :filter_set, # basic, popular, all  basic - default
                        :by_popularity #0, 1
      resource.required :geo_id
    end

    get :regions, "/v#{config.api_version}/georegion.#{format}" do |resource|
      resource.optional :page, :count
    end

    get :region, "/v#{config.api_version}/georegion/{geo_id}.#{format}" do |resource|
      resource.optional :page, :count
    end

    get :model, "/v#{config.api_version}/model/{model_id}.#{format}" do |resource|
      resource.required :geo_id
    end

    get :model_details, "/v#{config.api_version}/model/{model_id}/details.#{format}" do |resource|
      resource.optional :details_set # all, main
    end

    get :model_opinions, "/v#{config.api_version}/model/{model_id}/opinion.#{format}" do |resource|
      resource.optional :sort, # grade, rank, date - default
                        :how, # asc, desc - default
                        :grade, # 2, 1, 0, -1, -2
                        :page, :count
    end

  end
end
