require 'rails_helper'

RSpec.describe "directions request" do
  it "connects", :vcr do
    service = DirectionsService.new 
    expect(service.conn).to be_instance_of Faraday::Connection
  end
end