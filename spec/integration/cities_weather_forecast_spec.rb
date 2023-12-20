# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'cities_weather_forecast', type: :request do
  path '/cities-weather-forecast/daily' do
    get('daily cities_weather_forecast') do
      parameter q: :string, in: :query, required: false
      response(200, 'successful') do
        schema type: :object,
               properties: {
                 cities_weather_forecast: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       city: {
                         type: :object,
                         properties: {
                           city_name: { type: :string },
                           state: { type: :string },
                           country: { type: :string }
                         }
                         # required: %w[city_name state country]
                       },
                       weather_forecast: {
                         type: :array,
                         items: {
                           type: :object,
                           properties: {
                             date: { type: :string },
                             weather_name: { type: :string },
                             temp_min: { type: :number },
                             temp_max: { type: :number }
                           }
                           # required: %w[date weather_name temp_min temp_max]
                         }
                       }
                     }
                     # required: %w[city weather_forecast]
                   }
                 }
               }
        # required: %w[cities_weather_forecast]
        run_test!
      end
    end
  end
end
