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

  it 'pulls the eta', :vcr do
    from = 'denver,co'
    to = 'salida,co'

    search_results = DirectionsFacade.new(from, to).travel_time
    expect(search_results).to eq("02:26:12")
  end

  it 'gets weather at eta', :vcr do
    from = 'olathe,ks'
    to = 'salida,co'

    weather_at_eta = DirectionsFacade.new(from, to).eta_weather
    expect(weather_at_eta).to eq({"time"=>"2024-01-16 21:00", "temp_f"=>6.6, "condition"=>{"text"=>"Clear", "icon"=>"//cdn.weatherapi.com/weather/64x64/night/113.png", "code"=>1000}, "short_rad"=>0.04, "diff_rad"=>0.02})
  end

  it 'finds the weather', :vcr do
    from = "Boulder,CO"
    to = "Atlanta"
    info = DirectionsFacade.new(from, to).weather_at_to
    expect(info["location"]["name"]).to eq(to)
  end

  it 'checks travel_time', :vcr do
    from = "Salida,CO"
    to = "Burlington,vt"
    info = DirectionsFacade.new(from, to).travel_time
    expect(info).to eq("29:32:14")
  end

end