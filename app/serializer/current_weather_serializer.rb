class CurrentWeatherSerializer
  def initialize(current)
    @current = current
  end

    def serialize
      {
        "last_updated": @current["last_updated"],
        "temperature": @current["temp_f"].to_f,
        "feels_like": @current["feelslike_f"].to_f,
        "humidity": @current["humidity"].to_i,
        "uvi": @current["uv"].to_f,
        "visibility": @current["vis_miles"].to_f,
        "condition": @current["condition"]["text"],
        "icon": @current["condition"]["icon"]
      }
  end
end