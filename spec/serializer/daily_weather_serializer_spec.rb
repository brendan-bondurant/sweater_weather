
require 'rails_helper'

RSpec.describe DailyWeatherSerializer do
  describe '#serialize' do
    it 'serializes daily weather data' do
      daily_weather = [
        {
          "date"=>"2024-01-14",
          "day"=>
            {"maxtemp_f"=>10.7, 
            "mintemp_f"=>-3.9, 
            "condition"=>{"text"=>"Light freezing rain", "icon"=>"//cdn.weatherapi.com/weather/64x64/day/311.png"}},
            "astro"=>{"sunrise"=>"07:20 AM", "sunset"=>"04:58 PM"}
            }
          
        
      ]
      serializer = DailyWeatherSerializer.new(daily_weather)
      serialized_data = serializer.serialize
      expect(serialized_data).to match_array(
        [{:date=>"2024-01-14", 
        :sunrise=>"07:20 AM", 
        :sunset=>"04:58 PM", 
        :max_temp=>10.7, 
        :min_temp=>-3.9, 
        :condition=>"Light freezing rain", 
        :icon=>"//cdn.weatherapi.com/weather/64x64/day/311.png"}])
    end
  end
end