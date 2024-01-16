require 'rails_helper'

RSpec.describe HourlyWeatherSerializer do
  describe '#serialize' do
    let(:hourly) do
      [
        {
          "time" => "12:00 PM",
          "temp_f" => "75",
          "condition" => {
            "text" => "Sunny",
            "icon" => "sun.png"
          }
        },
        {
          "time" => "1:00 PM",
          "temp_f" => "78",
          "condition" => {
            "text" => "Partly Cloudy",
            "icon" => "cloud.png"
          }
        }
      ]
    end

    subject { described_class.new(hourly) }

    it 'returns the serialized hourly weather data' do
      expected_result = [
        {
          "time": "12:00 PM",
          "temperature": 75.0,
          "conditions": "Sunny",
          "icon": "sun.png"
        },
        {
          "time": "1:00 PM",
          "temperature": 78.0,
          "conditions": "Partly Cloudy",
          "icon": "cloud.png"
        }
      ]

      expect(subject.serialize).to eq(expected_result)
    end
  end
end