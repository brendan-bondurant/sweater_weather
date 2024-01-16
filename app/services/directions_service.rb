class DirectionsService

  def conn 
    Faraday.new(url: "https://www.mapquestapi.com/directions/v2/route")
  end

  def route(from, to)
    key = Rails.application.credentials.mapquest[:key]
    response = conn.post do |req|
      req.params['key'] = key
      req.params['from'] = "#{from}"
      req.params['to'] = "#{to}"     
      req.params['outFormat'] = 'json'
      req.params['ambiguities'] = 'ignore'
      req.params['routeType'] = 'fastest'
    end
    data = JSON.parse(response.body) if response.success?
  end
end