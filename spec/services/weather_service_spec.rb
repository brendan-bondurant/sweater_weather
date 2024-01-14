require 'rails_helper'

describe WeatherService do
  describe "#weather_results" do
    it "connects", :vcr do
      service = WeatherService.new 
      expect(service.conn).to be_instance_of Faraday::Connection
    end

    it "returns parsed results", :vcr do
      coordinates = ({"lat"=>39.74001, "lng"=>-104.99202})
      lat = coordinates["lat"]
      lon = coordinates["lon"]
      # city = "Denver"
      # state = "CO" 
      search = WeatherService.new.forecast(lat, lon)
      expect(search).to be_a Hash
    end
  end
end