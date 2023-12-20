require "test_helper"

class CitiesWeatherForecastControllerTest < ActionDispatch::IntegrationTest
  test "should get cities with weather forecast" do
    get cities_weather_forecast_daily_url
    assert_response :success

    # Assert that the response is the expected one
    expected_response_length = 16
    assert_equal expected_response_length, response.parsed_body['cities_weather_forecast'].length

    # Assert that the response has the expected keys in the first element
    expected_keys = ['city', 'weather_forecast']
    first_element = response.parsed_body['cities_weather_forecast'][0]
    assert_equal expected_keys, first_element.keys

    # Assert nested keys
    city = first_element['city']
    city_expected_keys = ['city_name', 'state', 'country']
    assert_equal city_expected_keys, city.keys

    weather_forecast = first_element['weather_forecast'][0]
    weather_forecast_expected_keys = ['date', 'weather_name', 'temp_min', 'temp_max']
    assert_equal weather_forecast_expected_keys, weather_forecast.keys
  end

  test "should get cities with weather forecast for given query" do
    city_query = 'Monterrey'
    get cities_weather_forecast_daily_url, params: { query: city_query }
    assert_response :success

    # Assert that response has the expected city
    response.parsed_body['cities_weather_forecast'].any? do |city_weather_forecast|
      city_weather_forecast['city']['city_name'] == city_query
    end
  end
end
