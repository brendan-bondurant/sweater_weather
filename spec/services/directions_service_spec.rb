require 'rails_helper'


describe DirectionsService do
    describe "#location_results" do
      it "connects", :vcr do
        service = DirectionsService.new 
        expect(service.conn).to be_instance_of Faraday::Connection
      end

      it "returns route", :vcr do
        from = "denver,co"
        to = "charlotte,nc"
        directions = DirectionsService.new.route(from, to)
        expect(directions).to be_a Hash
        expect(directions.keys).to eq(["route", "info"])
        expect(directions['route']["formattedTime"]).to eq("21:42:07")
      end
    end
  end