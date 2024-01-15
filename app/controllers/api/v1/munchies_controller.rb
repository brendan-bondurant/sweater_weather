class Api::V1::MunchiesController < ApplicationController
  def index
    destination = params["destination"]
    food = params["food"]
    forecast_data = get_forecast_data(destination)
    restaurant_data = get_restaurant_data(food, destination)
    require 'pry'; binding.pry
  end


  private

  def get_forecast_data(destination)
    forecast = WeatherFacade.new(destination).formatted_weather_info
  end

  def get_restaurant_data(food, destination)
    food = RestaurantFacade.new(food, destination).restaurant_info
    restaurant = Restaurant.new(food["businesses"].first)
  end
end

