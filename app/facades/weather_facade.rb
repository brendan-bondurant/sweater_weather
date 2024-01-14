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
  end
end