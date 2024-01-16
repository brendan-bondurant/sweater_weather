class DirectionsFacade
  def initialize(from, to)
    @from = from
    @to = to
  end

  def weather_at_to
    json = WeatherFacade.new(@to).weather_info
    json
  end

end