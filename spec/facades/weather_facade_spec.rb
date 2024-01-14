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
    expect(search_results.to_s).not_to include("tz_id", "country", "astro", "region")
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

    expected_result = 

    search_results = WeatherFacade.new(city, state).formatted_weather_info[:data]
    expect(search_results.keys).to eq([:id, :type, :attributes])
  end
  it 'has the correct format', :vcr do
    city = 'denver'
    state = 'colorado'
    expected_result = {
      'data':  {
        'id': nil,
        'type': "forecast",
        'attributes':  {
          'current_weather':  {
            'last_updated': "2024-01-14 16:30",
            'temperature': 8.1,
            'feels_like': 1.5,
            'humidity': 54,
            'uvi': 2.0,
            'visibility': 9.0,
            'condition': "Partly cloudy",
            'icon': "//cdn.weatherapi.com/weather/64x64/day/116.png"
          },
          'daily_weather':  [
            {
              'date': "2024-01-14", 
              'sunrise': "07:20 AM", 
              'sunset': "04:58 PM", 
              'max_temp': 11.1, 
              'min_temp': -3.9, 
              'condition': "Light snow", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/326.png"
            },
            {
              'date': "2024-01-15",
              'sunrise': "07:20 AM", 
              'sunset': "05:00 PM", 
              'max_temp': 6.0, 
              'min_temp': 3.3, 
              'condition': "Moderate snow", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/332.png"},
            {
              'date': "2024-01-16",
              'sunrise': "07:19 AM", 
              'sunset': "05:01 PM", 
              'max_temp': 30.0, 
              'min_temp': 4.1, 
              'condition': "Sunny", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/113.png"},
            {
              'date': "2024-01-17",
              'sunrise': "07:19 AM", 
              'sunset': "05:02 PM", 
              'max_temp': 35.3, 
              'min_temp': 17.8,
              'condition': "Sunny", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/113.png"},
            {
              'date': "2024-01-18",
              'sunrise': "07:18 AM",
              'sunset': "05:03 PM",
              'max_temp': 33.2,
              'min_temp': 17.3,
              'condition': "Light freezing rain",
              'icon': "//cdn.weatherapi.com/weather/64x64/day/311.png"},
            {
              'date': "2024-01-19", 
              'sunrise': "07:18 AM", 
              'sunset': "05:04 PM", 
              'max_temp': 37.1, 
              'min_temp': 18.5, 
              'condition': "Partly cloudy", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/116.png"}
            ],
          'hourly_weather':  [
            {
              'time': "2024-01-14 00:00", 
              'temperature': -2.2, 
              'conditions': "Partly cloudy", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/116.png"
            },
            {
              'time': "2024-01-14 01:00", 
              'temperature': -2.4, 
              'conditions': "Partly cloudy", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/116.png"
            },
            {
              'time': "2024-01-14 02:00", 
              'temperature': -2.3, 
              'conditions': "Light freezing rain", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/311.png"
            },
            {
              'time': "2024-01-14 03:00", 
              'temperature': -2.0, 
              'conditions': "Light freezing rain", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/311.png"
            },
            {
              'time': "2024-01-14 04:00", 
              'temperature': -1.7, 
              'conditions': "Light snow", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/326.png"
            },
            {
              'time': "2024-01-14 05:00", 
              'temperature': -1.4, 
              'conditions': "Patchy moderate snow", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/329.png"
            },
            {
              'time': "2024-01-14 06:00", 
              'temperature': -1.4, 
              'conditions': "Light snow", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/326.png"
            },
            {
              'time': "2024-01-14 07:00", 
              'temperature': -1.4, 
              'conditions': "Light snow", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/326.png"
            },
            {
              'time': "2024-01-14 08:00", 
              'temperature': -1.0, 
              'conditions': "Light snow", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/326.png"
            },
            {
              'time': "2024-01-14 09:00", 
              'temperature': -0.2, 
              'conditions': "Light snow", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/326.png"
            },
            {
              'time': "2024-01-14 10:00", 
              'temperature': 0.7, 
              'conditions': "Patchy light snow", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/323.png"
            },
            {
              'time': "2024-01-14 11:00", 
              'temperature': 2.1, 
              'conditions': "Patchy moderate snow", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/329.png"
            },
            {
              'time': "2024-01-14 12:00", 
              'temperature': 4.0, 
              'conditions': "Patchy light snow", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/323.png"
            },
            {
              'time': "2024-01-14 13:00", 
              'temperature': 6.0, 
              'conditions': "Light freezing rain", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/311.png"
            },
            {
              'time': "2024-01-14 14:00", 
              'temperature': 7.9, 
              'conditions': "Sunny", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
              'time': "2024-01-14 15:00", 
              'temperature': 9.5, 
              'conditions': "Sunny", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/113.png"
            },
            {
              'time': "2024-01-14 16:00", 
              'temperature': 8.1, 
              'conditions': "Partly cloudy", 
              'icon': "//cdn.weatherapi.com/weather/64x64/day/116.png"
            },
            {
              'time': "2024-01-14 17:00", 
              'temperature': 10.0, 
              'conditions': "Clear", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
              'time': "2024-01-14 18:00", 
              'temperature': 9.5, 
              'conditions': "Clear", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
              'time': "2024-01-14 19:00", 
              'temperature': 8.9, 
              'conditions': "Clear", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/113.png"},
            {
              'time': "2024-01-14 20:00", 
              'temperature': 8.5, 
              'conditions': "Clear", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
              'time': "2024-01-14 21:00", 
              'temperature': 8.2, 
              'conditions': "Clear", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
              'time': "2024-01-14 22:00", 
              'temperature': 7.7, 
              'conditions': "Clear", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/113.png"
            },
            {
              'time': "2024-01-14 23:00", 
              'temperature': 7.4, 
              'conditions': "Partly cloudy", 
              'icon': "//cdn.weatherapi.com/weather/64x64/night/116.png"
              }
            ]
          }
        }
      }

    search_results = WeatherFacade.new(city, state).formatted_weather_info
    expect(search_results).to eq(expected_result)
  end
end