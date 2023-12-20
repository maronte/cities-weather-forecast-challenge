# frozen_string_literal: true

##
# WeatherForecastApiRepository
# This class is responsible for getting the weather forecast from the data source.
##
class WeatherForecastApiRepository
  @@unit = 'metric'

  ##
  # This method initializes the repository with the given data source.
  #
  # The method receives the following parameters:
  # - data_source: The data source to get the weather forecast from.
  def initialize(data_source)
    @data_source = data_source
  end

  ##
  # This method returns the weather forecast for a given latitude and longitude.
  #
  # By default, it returns the current weather data:
  # - Current weather
  # - Minute forecast for 1 hour
  # - Hourly forecast for 48 hours
  # - Daily forecast for 7 days
  #
  # The method receives the following parameters:
  # - lat: The latitude of the location.
  # - lon: The longitude of the location.
  # - exclude: The parts of the weather forecast to exclude. Please use an array of the ForecastTypes constants.
  def get_weather_forecast(lat:, lon:, exclude:, units: @@unit)
    @data_source.onecall lat:, lon:, exclude:, units:
  end

  ##
  # This method returns the current weather data for a given latitude and longitude.
  # It uses the get_weather_forecast method to get the weather data but only
  # returns the daily weather data.

  # By default, it returns the current weather data:
  # - Daily forecast for 7 days
  # Also it can return the following weather data:
  # - Current weather
  # - Alert messages
  #
  # The method receives the following parameters:
  # - lat: The latitude of the location.
  # - lon: The longitude of the location.
  # - exclude: The parts of the weather forecast to exclude. Please use an array of the ForecastTypes constants.
  # - units: The units to use for the weather data.
  def get_daily_weather_forecast(
    lat:,
    lon:,
    exclude: [ForecastTypes::ALERTS, ForecastTypes::CURRENT],
    units: @@unit
  )
    exclude = [*exclude, ForecastTypes::MINUTELY, ForecastTypes::HOURLY]

    get_weather_forecast lat:, lon:, exclude:, units:
  end
end
