require 'rails_helper'

describe "Weather API" do
  it "finds the weather" do
    create_list(:weather, 3)

    get 'api/v1/weather'

    expect(response).to be_successful
  end
end