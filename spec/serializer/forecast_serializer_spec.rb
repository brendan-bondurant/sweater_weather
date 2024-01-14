require 'rails_helper'

RSpec.describe ForecastSerializer do

  describe 'attributes' do
    it 'includes the current weather attributes',:vcr do
      city = "Denver" 
      state = "CO" 
      search_results = WeatherFacade.new(city, state)
      forecast = search_results.weather_info
      require 'pry'; binding.pry

    end

    xit 'includes the daily weather attributes' do
      expect(serialized_forecast[:daily_weather]).to match_array(forecast.daily_weather.map do |daily|
        {
          date: daily.date,
          sunrise: daily.sunrise,
          sunset: daily.sunset,
          max_temp: daily.max_temp,
          min_temp: daily.min_temp,
          condition: daily.condition,
          icon: daily.icon
        }
      end)
    end

    xit 'includes the hourly weather attributes' do
      expect(serialized_forecast[:hourly_weather]).to match_array(forecast.hourly_weather.map do |hourly|
        {
          time: hourly.time,
          temperature: hourly.temperature,
          conditions: hourly.conditions,
          icon: hourly.icon
        }
      end)
    end
  end
end