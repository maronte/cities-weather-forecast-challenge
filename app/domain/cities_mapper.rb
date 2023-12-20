module CitiesMapper
  def self.map_full_model_to_minimal_model(model)
    {
      city_name: model["city_name"],
      state: model["state"],
      country: model["country"]
    }
  end
end
