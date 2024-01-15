require 'rails_helper'

RSpec.describe Api::V1::MunchiesController, type: :controller do
  describe 'GET #index', :vcr do
    context 'with valid parameters' do
      let(:destination) { 'New York' }
      let(:food) { 'Pizza' }

      before do
        @weather_data = WeatherFacade.new(destination).formatted_weather_info
        @restaurant_data = RestaurantFacade.new(food, destination).restaurant_info
        @restaurant = Restaurant.new(@restaurant_data["businesses"].first)

        allow_any_instance_of(WeatherFacade).to receive(:formatted_weather_info).and_return(@weather_data)
        allow_any_instance_of(RestaurantFacade).to receive(:restaurant_info).and_return(@restaurant_data)

        get :index, params: { destination: destination, food: food }
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:success)
      end

      it 'returns the correct JSON response' do
        expected_response = {
          data: {
            id: nil,
            type: 'munchie',
            attributes: {
              destination_city: destination,
              forecast: {
                summary: @weather_data.dig(:data, :attributes, :current_weather, :condition),
                temperature: @weather_data.dig(:data, :attributes, :current_weather, :temperature)
              },
              restaurant: {
                name: @restaurant.name,
                address: @restaurant.address,
                rating: @restaurant.rating,
                reviews: @restaurant.reviews,
              }
            }
          }
        }.to_json

        expect(response.body).to eq(expected_response)
      end
    end
  end
end