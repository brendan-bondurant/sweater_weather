class WeatherService
  
  def conn 
    Faraday.new(url: "https://api.weatherapi.com/v1/forecast.json")
  end
  
  def forecast(city, state)
    key = Rails.application.credentials.weather[:key]
    response = conn.get do |req|
      req.params['key'] = key
      req.params['q'] = "#{city},#{state}"
    end
    JSON.parse(response.body) if response.success?
  end
end