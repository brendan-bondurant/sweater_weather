class DailyWeatherSerializer
  def initialize(daily)
    @daily = daily
  end

    def serialize
      @daily.map do |day|
        {
          "date": day["date"],
          "sunrise": day["astro"]["sunrise"],
          "sunset": day["astro"]["sunset"],
          "max_temp": day["day"]["maxtemp_f"].to_f,
          "min_temp": day["day"]["mintemp_f"].to_f,
          "condition": day["day"]["condition"]["text"],
          "icon": day["day"]["condition"]["icon"]
        }
      end
    end
end