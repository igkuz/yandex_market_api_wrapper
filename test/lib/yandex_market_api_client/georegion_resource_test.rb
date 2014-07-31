require 'test_helper'

class GeoregionResourceTest < TestCase

  def setup
    standard_configuration
    @client = YandexMarketApiClient.get_client

    @return = { headers: {
      'Authorization' => YandexMarketApiClient.config.auth_key,
      "content-type" => "application/json; charset=utf-8"
    } }
    @georegions_url = YandexMarketApiClient.config.host + "/v1/georegion%s"
  end

  def test_getting_all_georegions
    stub = stub_request(:get, @georegions_url % ".json").
      to_return(@return.merge(body: load_fixture('georegions.json')))

    @client.regions.perform.parse

    assert_requested stub
  end

  def test_getting_one_georegion
    stub = stub_request(:get, @georegions_url % "/1.json").
      to_return(@return.merge(body: load_fixture('georegion.json')))

    @client.region(geo_id: 1).perform.parse

    assert_requested stub
  end

  def test_get_regions_children
    stub = stub_request(:get, @georegions_url % "/1/children.json").
      to_return(@return.merge(body: load_fixture('georegion_children.json')))

    @client.region_children(geo_id: 1).perform.parse

    assert_requested stub
  end

end
