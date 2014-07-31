require 'test_helper'

class ModelResourceTest < TestCase

  def setup
    standard_configuration
    @client = YandexMarketApiClient.get_client

    @return = { headers: {
      'Authorization' => YandexMarketApiClient.config.auth_key,
      "content-type" => "application/json; charset=utf-8"
    } }
    @model_url = YandexMarketApiClient.config.host + "/v1/model/%s"
  end

  def test_getting_model_info
    stub = stub_request(:get, @model_url % "1.json").
      with(query: { geo_id: 1}).
      to_return(@return.merge(body: load_fixture('model.json')))

    @client.model(geo_id: 1, model_id: 1).perform.parse

    assert_requested stub
  end

  def test_getting_model_details
    stub = stub_request(:get, @model_url % "1/details.json").
      with(query: { details_set: "all"}).
      to_return(@return.merge(body: load_fixture('model_details.json')))

    @client.model_details(model_id: 1, details_set: "all").perform.parse

    assert_requested stub
  end

  def test_getting_model_opinions
    stub = stub_request(:get, @model_url % "1/opinion.json").
      to_return(@return.merge(body: load_fixture('model_opinions.json')))

    @client.model_opinions(model_id: 1).perform.parse

    assert_requested stub
  end

  def test_getting_model_offers
    stub = stub_request(:get, @model_url % "1/offers.json").
      with(query: { geo_id: 1 }).
      to_return(@return.merge(body: load_fixture('model_offers.json')))

    @client.model_offers(model_id: 1, geo_id: 1).perform.parse

    assert_requested stub
  end

end
