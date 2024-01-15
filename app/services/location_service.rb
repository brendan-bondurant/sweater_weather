class LocationService
  def conn 
    Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/address")
  end

  def lat_lon(location)
    key = Rails.application.credentials.mapquest[:key]
    response = conn.get do |req|
      req.params['key'] = key
      req.params['location'] = "#{location}"
    end
    data = JSON.parse(response.body) if response.success?
    # data["results"].first["locations"].first["latLng"] dig may be better for handling nil? 
    data.dig("results", 0, "locations", 0, "latLng")
  end
end