require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'gets search results', :vcr do
    city = 'Denver'
    state = 'CO'

    search_results = WeatherFacade.new(city, state).formatted_weather_info[:data]
    expect(search_results.keys).to eq([:id, :type, :attributes])
    expect(search_results[:id]).to eq(nil)
    expect(search_results[:type]).to eq('forecast')

    expect(search_results[:attributes].keys).to eq([:current_weather, :daily_weather, :hourly_weather])
    
    expect(search_results[:attributes][:current_weather].keys).to eq([:last_updated, :temperature, :feels_like, :humidity, :uvi, :visibility, :condition, :icon])
    expect(search_results[:attributes][:daily_weather].count).to eq(6)
    expect(search_results[:attributes][:daily_weather].first.keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :condition, :icon])
    expect(search_results[:attributes][:hourly_weather].count).to eq(24)
    expect(search_results[:attributes][:hourly_weather].first.keys).to eq([:time, :temperature, :conditions, :icon])
  end
  
  it 'gets search results if state is spelled out', :vcr do
    city = 'Denver'
    state = 'Colorado'

    search_results = WeatherFacade.new(city, state).formatted_weather_info[:data]
    expect(search_results.keys).to eq([:id, :type, :attributes])
  end
  it 'gets search results if state and city are not capitalized', :vcr do
    city = 'denver'
    state = 'colorado'

    search_results = WeatherFacade.new(city, state).formatted_weather_info[:data]
    expect(search_results.keys).to eq([:id, :type, :attributes])
  end
end