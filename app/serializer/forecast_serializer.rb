# class ForecastSerializer
# include JSONAPI::Serializer

# attribute :id, -> { 'null' }
# attribute :type, -> { 'forecast' }

# attribute :attributes do
#     {
#       current_weather: CurrentWeatherSerializer.new(@object["current"]),
#       daily_weather: DailyWeatherSerializer.new(@object["forecast"]["forecastday"]),
#       hourly_weather: HourlyWeatherSerializer.new(@object["forecast"]["forecastday"].first["hour"])
#     }
#   end
# end