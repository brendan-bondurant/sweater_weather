# class HourlyWeather
#   attr_accessor :time, :temperature, :conditions, :icon
#   def initialize(hourly)
#     @hourly = hourly
#   end

# def format_hourly_weather(hourly)
#   hourly.map do |hour|
#     {
#       "time": hour["time"],
#       "temperature": hour["temp_f"].to_f,
#       "conditions": hour["condition"]["text"],
#       "icon": hour["condition"]["icon"]
#     }
#   end
# end
#   def initialize(data)
#     @time = data["time"]
#     @temperature = data["temperature"]
#     @conditions = data["conditions"]
#     @icon = data["icon"]
#   end
# end