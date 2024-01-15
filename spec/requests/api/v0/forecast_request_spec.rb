require 'rails_helper'

describe "Forecast API" do
  it "finds the forecast", :vcr do
    headers = {
      "CONTENT_TYPE" => "application/json",
      "ACCEPT" => "application/json"
    }

    params = {
      location: "cincinnati,oh"
    }

    get '/api/v0/forecast', params: params, headers: headers
    expect(response).to be_successful
  end
end