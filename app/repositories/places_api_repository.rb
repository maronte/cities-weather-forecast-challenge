# frozen_string_literal: true

##
# PlacesApiRepository class
# This class is responsible for getting places from the data source.
class PlacesApiRepository
  @@result_type = 'city'

  ##
  # This method initializes the repository with the given data source.
  #
  # The method receives the following parameters:
  # - data_source: The data source to get the places from.
  def initialize(data_source)
    @data_source = data_source
  end

  ##
  # This method returns the places that match the given query.
  # The query can be a city name, a country name, a region name, etc.
  #
  # The method receives the following parameters:
  # - place_query: The query to search for places.
  def get_places(place_query = '')
    @data_source.places(place_query)
  end

  ##
  # This method returns the cities that match the given query.
  # The query can be a city name, a country name, a region name, etc.
  # It filters the places by the result type "city" to get only cities from the data source.
  #
  # The method receives the following parameters:
  # - place_query: The query to search for cities.
  def get_cities(place_query = '')
    places = get_places(place_query)
    places.select { |place| place['result_type'] == @@result_type }.compact
  end
end
