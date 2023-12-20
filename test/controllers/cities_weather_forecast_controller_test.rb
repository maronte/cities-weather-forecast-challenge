require "test_helper"

class CitiesWeatherForecastControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get cities_weather_forecast_get_url
    assert_response :success
  end
end
