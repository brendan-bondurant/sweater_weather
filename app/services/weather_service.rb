class WeatherService
  
  def conn 
    Faraday.new(url: "https://api.weatherapi.com/v1/forecast.json")
  end
  
  def forecast(lat, lon)
    key = Rails.application.credentials.weather[:key]
    response = conn.get do |req|
      req.params['key'] = key
      req.params['q'] = "#{lat},#{lon}"
      req.params['days'] = "6"
    end
    data = JSON.parse(response.body) if response.success?
  end

  # def daily_forecast(lat, lon, day)
  #   key = Rails.application.credentials.weather[:key]
  #   response = conn.get do |req|
  #     req.params['key'] = key
  #     req.params['q'] = "#{lat},#{lon}"
  #     req.params['dt'] = "#{day}"
  #   end
  #   data = JSON.parse(response.body)
  # end
end