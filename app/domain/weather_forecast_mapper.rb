module WeatherForecastMapper
  def self.map_full_model_to_daily_minimal_model(model)
    model["daily"].map do |daily_forecast|
      {
        # Map to ISO 8601 date format
        date: Time.at(daily_forecast["dt"]).iso8601,
        # Use first weather name
        weather_name: daily_forecast["weather"][0]["main"],
        temp_min: daily_forecast["temp"]["min"],
        temp_max: daily_forecast["temp"]["max"],
      }
    end
  end
end
