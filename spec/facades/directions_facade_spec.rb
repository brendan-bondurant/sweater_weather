require 'rails_helper'

RSpec.describe DirectionsFacade do
  it 'gets weather at destination', :vcr do
    from = 'denver,co'
    to = 'st louis,mo'

    search_results = DirectionsFacade.new(from, to).weather_at_to
    expect(search_results.keys).to eq(["location", "current", "forecast"])
    expect(search_results["forecast"].keys).to eq(["forecastday"])
    expect(search_results["location"]["localtime"]).to eq("2024-01-16 10:40")
    expect(search_results["forecast"]["forecastday"].to_s.include?("2024-01-17")).to eq(true)
    expect(search_results["forecast"]["forecastday"].to_s.include?("2024-01-18")).to eq(true)
    expect(search_results["forecast"]["forecastday"].to_s.include?("2024-01-19")).to eq(true)
    expect(search_results["forecast"]["forecastday"].to_s.include?("2024-01-20")).to eq(true)
  end
end