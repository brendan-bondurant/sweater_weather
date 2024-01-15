class Api::V1::MunchiesController < ApplicationController
  def index
    destination = params["destination"]
    food = params["food"]
    facade = RestaurantFacade.new(food, destination).restaurant_info
    restaurant = Restaurant.new(facade["businesses"].first)

  end
end