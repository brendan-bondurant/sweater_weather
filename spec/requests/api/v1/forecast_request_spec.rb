require 'rails_helper'

describe "Forecast API" do
  it "finds the forecast" do
    forecast = create(:forecast)
    
    get '/api/v1/forecast'
    expect(response).to be_successful
  end
end