# frozen_string_literal: true

##
# This module is responsible for configuring the API clients.
# All API clients must include this module.
#
# It uses the Faraday gem to make HTTP requests and that gem is configured
# with this module.
module ApiClientConfigurator
  ##
  # This method is responsible for configuring the API client.
  # It uses the Faraday gem to make HTTP requests and that gem is configured
  # with this method.
  #
  # The method receives some parameters to configure the API client:
  # - pararell_support: If true, the API client will be configured to make
  #   parallel requests.
  # - add_query_auth: If true, the API client will be configured to add
  #   authentication in the query params.
  # - query_auth_key: The key of the authentication in the query params.
  # - query_auth_value: The value of the authentication in the query params.
  def configure_api_client(
    pararell_support: false,
    add_query_auth: false,
    query_auth_key: nil,
    query_auth_value: nil
  )
    configure_route

    @connection = Faraday.new(url: @api_url) do |builder|
      # Sets the Content-Type header to application/json on each request.
      # Also, if the request body is a Hash, it will automatically be encoded as JSON.
      builder.request :json

      # Parses JSON response bodies.
      # If the response body is not valid JSON, it will raise a Faraday::ParsingError.
      builder.response :json

      # Raises an error on 4xx and 5xx responses.
      builder.response :raise_error

      # Logs requests and responses.
      # By default, it only logs the request method and URL, and the request/response headers.
      builder.response :logger

      # Add parallel support for requests
      builder.adapter :async_http if pararell_support

      # Add query authentication
      builder.params[query_auth_key] = query_auth_value if add_query_auth
    end
  end

  private

  ##
  # This method is responsible for configuring the API route adding
  # the prefix and version if they are present.
  def configure_route
    @api_url = @base_url

    @api_url += "/#{@prefix}" unless @prefix.nil?

    @api_url += "/#{@version}" unless @version.nil?

    @apiurl
  end
end
