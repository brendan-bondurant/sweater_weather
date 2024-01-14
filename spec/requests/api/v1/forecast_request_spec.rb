require 'rails_helper'

describe "Forecast API" do
  it "finds the forecast" do
    
    get '/api/v1/forecasts'
    expect(response).to be_successful

  end
end