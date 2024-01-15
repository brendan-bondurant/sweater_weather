class RestaurantFacade
  def initialize(food_type, location)
    @food_type = food_type
    @location = location
  end


  def restaurant_info
    json = YelpService.new.type_of_food(@food_type, @location)
  end
end