require 'test_helper'

class ShopResourceTest < TestCase

  def setup
    standard_configuration
    @client = YandexMarketApiClient.get_client

    @return = { headers: {
      'Authorization' => YandexMarketApiClient.config.auth_key,
      "content-type" => "application/json; charset=utf-8"
    } }
    @shop_url = YandexMarketApiClient.config.host + "/v1/shop/%s"
  end

  def test_getting_shop_info
    stub = stub_request(:get, @shop_url % "24049.json").
      to_return(@return.merge(body: load_fixture('shop.json')))

    @client.shop_info(shop_id: 24049).perform.parse

    assert_requested stub
  end
end
