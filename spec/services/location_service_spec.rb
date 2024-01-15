require 'rails_helper'


describe LocationService do
    describe "#location_results" do
      it "connects", :vcr do
        service = LocationService.new 
        expect(service.conn).to be_instance_of Faraday::Connection
      end

      it "returns lat and lon", :vcr do
        location = "denver,co"
        search = LocationService.new.lat_lon(location)
        expect(search).to be_a Hash
        expect(search).to eq({"lat"=>39.74001, "lng"=>-104.99202})
      end
    end
  end