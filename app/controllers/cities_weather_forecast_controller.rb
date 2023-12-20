# frozen_string_literal: true

class CitiesWeatherForecastController < ApplicationController
  include ThrowsHttpErrors

  # Rescue from some error from api client that uses this controller
  rescue_from Faraday::Error, with: :server_error

  def daily
    query = params[:q]
    cities_weather_forecast_service = CitiesWeatherForecastService.new(query)
    cities_weather_forecast = cities_weather_forecast_service.call
    render json: { cities_weather_forecast: }
  end
end
