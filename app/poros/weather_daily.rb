class WeatherDaily

  def initialize(daily)
    @daily = daily
  end

  def format_daily_weather
    DailyWeatherSerializer.new(@daily).serialize
  end
end





# class DailyWeather
# #   attr_accessor :date, :sunrise, :sunset, :max_temp, :min_temp, :condition, :icon
#   def initialize(daily)
#     @daily = daily
#   end

# def format_daily_weather(daily)
#   daily.map do |day|
#     {
#       "date": day["date"],
#       "sunrise": day["astro"]["sunrise"],
#       "sunset": day["astro"]["sunset"],
#       "max_temp": day["day"]["maxtemp_f"].to_f,
#       "min_temp": day["day"]["mintemp_f"].to_f,
#       "condition": day["day"]["condition"]["text"],
#       "icon": day["day"]["condition"]["icon"]
#     }
#   end
# end
#   def initialize(data)
#     @date = data["date"]
#     @sunrise = data["sunrise"]
#     @sunset = data["sunset"]
#     @max_temp = data["max_temp"]
#     @min_temp = data["min_temp"]
#     @condition = data["condition"]
#     @icon = data["icon"]
#   end
# end
  