require 'rails_helper'

RSpec.describe Api::V0::ForecastController, type: :controller do
  describe 'GET #index', :vcr do
    it 'renders weather info as JSON' do
      location = 'New York'
      WeatherFacade.new(location)
      get :index, params: { location: location }
      expect(response).to have_http_status(:ok)
      expect(response.content_type.include?('application/json')).to eq(true)
      expect(JSON.parse(response.body).keys).to eq(["data"])
      expect(JSON.parse(response.body)["data"]["attributes"].keys).to eq(["current_weather", "daily_weather", "hourly_weather"])
    end

    it 'permits location parameter' do
      get :index, params: { location: 'Boulder' }
      expect(controller.params["location"]).to eq("Boulder")
    end
  end

end