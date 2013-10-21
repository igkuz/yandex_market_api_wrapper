require 'test_helper'

class CategoryResourceTest < TestCase

  def setup
    standard_configuration
    @client = YandexMarketApiClient.get_client

    @return = { headers: {
      'Authorization' => YandexMarketApiClient.config.auth_key,
      "content-type" => "application/json; charset=utf-8"
    } }
    @categories_url = YandexMarketApiClient.config.host + "/v1/%s"
    @category_url = @categories_url % 'category/%s'
  end

  def test_getting_all_categories
    stub = stub_request(:get, @categories_url % "category" + ".json").
      with(query: { geo_id: 1, page: 1, count: 1 }).
      to_return(@return.merge(body: load_fixture('categories.json')))

    @client.categories(geo_id: 1, page: 1, count: 1).perform.parse

    assert_requested stub
  end

  def test_getting_category_info
    stub = stub_request(:get, @category_url % "1" + ".json").
      with(query: { geo_id: 1 }).
      to_return(@return.merge(body: load_fixture('category.json')))

    @client.category(geo_id: 1, category_id: 1).perform.parse

    assert_requested stub
  end

  def test_getting_category_children
    stub = stub_request(:get, @category_url % "1/children" + ".json").
      with(query: { geo_id: 1 }).
      to_return(@return.merge(body: load_fixture('category_children.json')))

    @client.category_children(geo_id: 1, category_id: 1).perform.parse

    assert_requested stub
  end

  def test_getting_category_models
    stub = stub_request(:get, @category_url % "1/models" + ".json").
      with(query: { geo_id: 1 }).
      to_return(@return.merge(body: load_fixture('category_models.json')))

    @client.category_models(geo_id: 1, category_id: 1).perform.parse

    assert_requested stub
  end

  def test_getting_category_filters
    stub = stub_request(:get, @category_url % "1/filters" + ".json").
      with(query: { geo_id: 1, filter_set: "popular" }).
      to_return(@return.merge(body: load_fixture('category_filters.json')))

    @client.category_filters(geo_id: 1, category_id: 1, filter_set: "popular").perform.parse

    assert_requested stub
  end
end
