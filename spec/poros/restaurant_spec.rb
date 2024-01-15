require 'rails_helper'

RSpec.describe Restaurant do
  it 'exists', :vcr do
    location = 'denver,co'
    food = 'ice cream'

    search_results = RestaurantFacade.new(food, location).restaurant_info
    info = Restaurant.new(search_results["businesses"].first)
    
    expect(info.name).to eq("Little Man Ice Cream")
    expect(info.address).to eq("2620 16th St, Denver, CO 80211")
    expect(info.rating).to eq(4.5)
    expect(info.reviews).to eq(2785)
  end
end