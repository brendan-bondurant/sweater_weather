require 'rails_helper'


describe YelpService do
    describe "#location_results" do
      it "connects", :vcr do
        service = YelpService.new 
        expect(service.conn).to be_instance_of Faraday::Connection
      end

      it "type of restaurant based on location", :vcr do
        location = "denver,co"
        type = "bbq"
        search = YelpService.new.type_of_food(type, location)
        # require 'pry'; binding.pry
        expect(search).to be_a Hash
        expect(search.to_s.include?("bbq")).to eq(true)
        expect(search.to_s.include?("denver")).to eq(true)
        expect(search.to_s.include?("co")).to eq(true)
      end
    end
  end