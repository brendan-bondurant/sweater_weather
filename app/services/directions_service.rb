def conn 
  Faraday.new(url: "https://www.mapquestapi.com/directions/v2/route")
end

def route(from, to)
  key = Rails.application.credentials.mapquest[:key]
  response = conn.post do |req|
    req.params['key'] = key
    req.body = {
      from: from,
      to: to,
      format: 'json',
      ambiguities: 'ignore',
      routeType: 'fastest'
    }.to_json
    req.headers['Content-Type'] = 'application/json'
  end
  data = JSON.parse(response.body) if response.success?

end
