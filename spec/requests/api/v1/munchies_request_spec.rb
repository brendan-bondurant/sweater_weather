require 'rails_helper'

describe "Munchies API" do
  it "connects", :vcr do
    destination = "Kansas City"
    food = "BBQ"
    get '/api/v1/munchies', params: { destination: destination, food: food }
    expect(response).to be_successful
  end
end