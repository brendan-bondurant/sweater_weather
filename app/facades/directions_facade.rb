class DirectionsFacade
  def initialize(from, to)
    @from = from
    @to = to
  end

  def weather_at_to
    json = WeatherFacade.new(@to).weather_info
    json
  end

  def travel_time
    json = DirectionsService.new.route(@from, @to)
    json["route"]["formattedTime"]
  end

  def eta_weather
    forecast = weather_at_to
    time = travel_time.split(":").map(&:to_i)
    current_time = DateTime.parse(forecast["location"]["localtime"])
    exact_eta = current_time + time[0].hours + time[1].minutes + time[2].seconds
    if exact_eta.min > 30
      rounded_eta = exact_eta.change(hour: exact_eta.hour + 1, min: 0, sec: 0)
    else
      rounded_eta = exact_eta.change(min: 0, sec: 0)
    end
    daily_weather = forecast["forecast"]["forecastday"]
    find_weather(daily_weather, rounded_eta)
  end

  def find_weather(forecast, eta)
    weather_info_day = eta.strftime("%Y-%m-%d")
    weather_info_hour = eta.strftime("%Y-%m-%d %H:%M")
    day_of_arrival = []
    weather_at_arrival = []
    forecast.find do |day|
      if day["date"] == weather_info_day
        day_of_arrival << day
      end
    end
    day_of_arrival.first["hour"].find do |hour|
      if hour["time"] == weather_info_hour
        weather_at_arrival << hour
      end
    end
    weather_at_arrival.first
  end

end