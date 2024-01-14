class WeatherFacade
  def initialize(city, state)
    @city = city
    @state = state
  end

  def weather_info
    location = LocationService.new.lat_lon(@city, @state)
    latitude = location["lat"]
    longitude = location["lng"]
    json = WeatherService.new.forecast(latitude, longitude)
    json
  end

  def formatted_weather_info
    json = weather_info

    {
      "data": {
        "id": nil,
        "type": 'forecast',
        "attributes": {
          "current_weather": format_current_weather(json["current"]),
          "daily_weather": format_daily_weather(json["forecast"]["forecastday"]),
          "hourly_weather": format_hourly_weather(json["forecast"]["forecastday"].first["hour"])
        }
      }
    }
  end

  private

  def format_current_weather(current)
    {
      "last_updated": current["last_updated"],
      "temperature": current["temp_f"].to_f,
      "feels_like": current["feelslike_f"].to_f,
      "humidity": current["humidity"].to_i,
      "uvi": current["uv"].to_f,
      "visibility": current["vis_miles"].to_f,
      "condition": current["condition"]["text"],
      "icon": current["condition"]["icon"]
    }
  end

  def format_daily_weather(daily)
    daily.map do |day|
      {
        "date": day["date"],
        "sunrise": day["astro"]["sunrise"],
        "sunset": day["astro"]["sunset"],
        "max_temp": day["day"]["maxtemp_f"].to_f,
        "min_temp": day["day"]["mintemp_f"].to_f,
        "condition": day["day"]["condition"]["text"],
        "icon": day["day"]["condition"]["icon"]
      }
    end
  end

  def format_hourly_weather(hourly)
    hourly.map do |hour|
      {
        "time": hour["time"],
        "temperature": hour["temp_f"].to_f,
        "conditions": hour["condition"]["text"],
        "icon": hour["condition"]["icon"]
      }
    end
  end
end