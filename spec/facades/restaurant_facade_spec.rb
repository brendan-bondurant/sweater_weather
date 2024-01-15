require 'rails_helper'

RSpec.describe RestaurantFacade do
  it 'gets unfiltered results', :vcr do
    location = 'denver,co'
    food = 'ice cream'

    search_results = RestaurantFacade.new(food, location).restaurant_info
  end
end