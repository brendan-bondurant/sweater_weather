class WeatherCurrent

  def initialize(current)
    # require 'pry'; binding.pry
    @current = current
  end

  def format_current_weather
    CurrentWeatherSerializer.new(@current).serialize

    # {
    #   "last_updated": @current["last_updated"],
    #   "temperature": @current["temp_f"].to_f,
    #   "feels_like": @current["feelslike_f"].to_f,
    #   "humidity": @current["humidity"].to_i,
    #   "uvi": @current["uv"].to_f,
    #   "visibility": @current["vis_miles"].to_f,
    #   "condition": @current["condition"]["text"],
    #   "icon": @current["condition"]["icon"]
    # }
  end
end

# class CurrentWeather
#   attr_reader :current
  
#   def initialize(current)
#     require 'pry'; binding.pry
#     @current = current
#   end

#   def format_current_weather(current)
#     {
#       "last_updated": current["last_updated"],
#       "temperature": current["temp_f"].to_f,
#       "feels_like": current["feelslike_f"].to_f,
#       "humidity": current["humidity"].to_i,
#       "uvi": current["uv"].to_f,
#       "visibility": current["vis_miles"].to_f,
#       "condition": current["condition"]["text"],
#       "icon": current["condition"]["icon"]
#     }
#   end
#   def initialize(data)
#     @last_updated = data["last_updated"]
#     @temperature = data["temperature"]
#     @feels_like = data["feels_like"]
#     @humidity = data["humidity"]
#     @uvi = data["uvi"]
#     @visibility = data["visibility"]
#     @condition = data["condition"]
#     @icon = data["icon"]
#   end
# end