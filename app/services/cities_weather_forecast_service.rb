##
# CitiesWeatherForecastService
# This class is responsible for getting the weather forecast for a list of cities
# from the data sources.
##
class CitiesWeatherForecastService
  def initialize(city_query)
    # The city_query parameter is the query to search for cities.
    @city_query = city_query
    # The places_repository is the repository to get the cities from
    # and it uses ReservamosSearch as data source.
    @places_repository = PlacesApiRepository.new(ReservamosSearch.new)
    # The weather_forecast_repository is the repository to get the weather forecast from
    # and it uses OpenWeather as data source.
    @weather_forecast_repository = WeatherForecastApiRepository.new(OpenWeather.new)
  end

  ##
  # This method returns the weather forecast for a list of cities.
  #
  # The method receives the following parameters:
  # - city_query: The query to search for cities.
  def call
    cities = @places_repository.get_cities(@city_query)
    result = nil

    # This method uses the Async gem to make the requests to the data sources in parallel.
    Async do
      result = cities.map do |city|
        city_weather_forecast = { city: city, weather_forecast: nil }

        Async {
          city_weather_forecast[:weather_forecast] =
          @weather_forecast_repository.get_daily_weather_forecast lat: city["lat"], lon: city["long"]
        }

        city_weather_forecast
      end
    end

    result
  end

end
