# class Forecast
#   attr_accessor :current_weather, :daily_weather, :hourly_weather, :location

#   def initialize(data)
#     attributes = data["data"]["attributes"]
#     @current_weather = CurrentWeather.new(attributes["current_weather"])
#     @daily_weather = attributes["daily_weather"].map { |day_data| DailyWeather.new(day_data) }
#     @hourly_weather = attributes["hourly_weather"].map { |hour_data| HourlyWeather.new(hour_data) }
#     @location = data["data"]["location"]
#   end
# end