##
# This class wraps the OpenWeather API.
# It uses the ApiClientConfigurator module to configure the API client.
class OpenWeather
    include ApiClientConfigurator

    def initialize
        @base_url = ENV["OPEN_WEATHER_API_BASE_URL"]
        @version = ENV["OPEN_WEATHER_API_VERSION"]
        @prefix = ENV["OPEN_WEATHER_API_PREFIX"]
        @api_key = ENV["OPEN_WEATHER_API_KEY"]

        configure_api_client add_query_auth: true, query_auth_key: "appid", query_auth_value: @api_key
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
    # - exclude: The parts of the weather forecast to exclude.
    def onecall(lat:, lon:, exclude:, units: "metric")
        if exclude.is_a?(Array) && exclude.length > 0
            exclude = exclude.join(",")
        end

        params = {
            lat: lat,
            lon: lon,
            exclude: exclude || "",
            units: units
        }

        response = @connection.get("onecall", params)
        response.body
    end
end
