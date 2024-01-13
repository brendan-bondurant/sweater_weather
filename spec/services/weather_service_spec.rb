require 'rails_helper'

describe WeatherService do
  describe "#weather_results" do
    it "connects", :vcr do
      service = WeatherService.new 
      expect(service.conn).to be_instance_of Faraday::Connection
    end

    it "returns parsed results", :vcr do
      city = "Denver"
      state = "CO" 
      search = WeatherService.new.forecast(city, state)
      expect(search).to be_a Hash
    end
  end
end