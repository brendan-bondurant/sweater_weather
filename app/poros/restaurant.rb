class Restaurant
  attr_reader :name, :address, :rating, :reviews

  def initialize(info)
    @name = info["name"]
    @address = info["location"]["display_address"].join(", ")
    @rating = info["rating"]
    @reviews = info["review_count"]
  end

end
