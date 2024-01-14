class ForecastSerializer
include JSONAPI::Serializer

  set_type :forecast
  set_id :id

  attribute :current_weather do |object|
    {
      last_updated: object.current_weather_last_updated,#["current"]["last_updated"]
      temperature: object.current_weather_temperature,#["current"]["temp_f"]
      feels_like: object.current_weather_feels_like,#["current"]["feelslike_f"]
      humidity: object.current_weather_humidity,#["current"]["humidity"]
      uvi: object.current_weather_uvi,#["current"]["uv"]
      visibility: object.current_weather_visibility, #["current"]["vis_miles"]
      condition: object.current_weather_condition, #["current"]["condition"]["text"]
      icon: object.current_weather_icon #["current"]["condition"]["icon"]
    }
  end

  attribute :daily_weather do |object| #["forecast"]["forecastday"] - iterate through pull [:day]
    object.daily_weather.map do |daily|
      {
        date: daily.date,
        sunrise: daily.sunrise,
        sunset: daily.sunset,
        max_temp: daily.max_temp,
        min_temp: daily.min_temp,
        condition: daily.condition,
        icon: daily.icon
      }
    end
  end

  attribute :hourly_weather do |object| #["forecast"]["forecastday"].first["hour"] - iterate through
    object.hourly_weather.map do |hourly|
      {
        time: hourly.time, 
        temperature: hourly.temperature,
        conditions: hourly.conditions,
        icon: hourly.icon
      }
    end
  end
end