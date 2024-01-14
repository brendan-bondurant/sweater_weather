class Forecast < ApplicationRecord
  has_one :current_weather
  has_many :daily_weathers
  has_many :hourly_weathers
end
