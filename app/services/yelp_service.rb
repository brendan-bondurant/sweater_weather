class YelpService
  def conn
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.yelp[:key]
    end
  end

  def type_of_food(type, location)
    response = conn.get do |req|
      req.params['term'] = "#{type}"
      req.params['location'] = "#{location}"
    end
    require 'pry'; binding.pry
    data = JSON.parse(response.body) if response.success?
  end
end
