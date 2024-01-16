class HourlyWeatherSerializer
  def initialize(hourly)
    @hourly = hourly
  end

    def serialize
      @hourly.map do |hour|
        {
          "time": hour["time"],
          "temperature": hour["temp_f"].to_f,
          "conditions": hour["condition"]["text"],
          "icon": hour["condition"]["icon"]
        }
      end
  end
end