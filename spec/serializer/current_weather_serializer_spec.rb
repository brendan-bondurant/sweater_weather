require 'rails_helper'


RSpec.describe CurrentWeatherSerializer do
  describe '#serialize' do
    let(:current) do
      {
        "last_updated" => "2021-09-01 12:00",
        "temp_f" => "75.5",
        "feelslike_f" => "72.3",
        "humidity" => "80",
        "uv" => "5.2",
        "vis_miles" => "10.0",
        "condition" => {
          "text" => "Sunny",
          "icon" => "sun.png"
        }
      }
    end

    subject { described_class.new(current) }

    it 'returns the serialized current weather data' do
      expected_result = {
        "last_updated": "2021-09-01 12:00",
        "temperature": 75.5,
        "feels_like": 72.3,
        "humidity": 80,
        "uvi": 5.2,
        "visibility": 10.0,
        "condition": "Sunny",
        "icon": "sun.png"
      }

      expect(subject.serialize).to eq(expected_result)
    end
  end
end