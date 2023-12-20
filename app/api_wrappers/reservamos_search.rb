# frozen_string_literal: true

##
# This class is a wrapper for the Reservamos Search API.
# It uses the ApiClientConfigurator module to configure the API client.
class ReservamosSearch
  include ApiClientConfigurator

  def initialize
    @base_url = ENV['RESERVAMOS_SEARCH_API_BASE_URL']
    @version = ENV['RESERVAMOS_SEARCH_API_VERSION']
    @prefix = ENV['RESERVAMOS_SEARCH_API_PREFIX']

    configure_api_client
  end

  ##
  # This method returns the places that match the given query.
  # The query can be a city name, a country name, a region name, etc.
  #
  # The method receives the following parameters:
  # - place_query: The query to search for places.
  def places(place_query = '')
    response = @connection.get('places', { q: place_query })
    response.body
  end
end
