module YandexMarketApiClient
  class Client < ::Weary::Client

    def initialize
      headers("Authorization" => "13")
    end

    get :test, "http//test.com" do

    end
  end
end
