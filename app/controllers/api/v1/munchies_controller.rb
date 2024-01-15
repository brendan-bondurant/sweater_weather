class Api::V1::MunchiesController < ApplicationController
  def index
    destination = params["destination"]
    food = params["food"]
    forecast_data = get_forecast_data(destination)
    restaurant_data = get_restaurant_data(food, destination)
    # require 'pry'; binding.pry

    response_data = {
      data: {
        id: nil,
        type: 'munchie',
        attributes: {
          destination_city: destination,
          forecast: forecast_data,
          restaurant: restaurant_data
        }
      }
    }
    json_response = response_data.to_json
    require 'pry'; binding.pry
    render json: json_response

  end


  private

  def get_forecast_data(destination)
    forecast = WeatherFacade.new(destination).formatted_weather_info
    summary = forecast.dig(:data, :attributes, :current_weather, :condition)
    temperature = forecast.dig(:data, :attributes, :current_weather, :temperature)

    response_data = {
      summary: summary,
      temperature: temperature
    }

    return response_data
  end

  def get_restaurant_data(food, destination)
    food = RestaurantFacade.new(food, destination).restaurant_info
    restaurant = Restaurant.new(food["businesses"].first)
  end
end

