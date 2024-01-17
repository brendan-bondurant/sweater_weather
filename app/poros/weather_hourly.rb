class WeatherHourly

  def initialize(hourly)
    @hourly = hourly
  end

  def format_hourly_weather
    HourlyWeatherSerializer.new(@hourly).serialize
  end
end
