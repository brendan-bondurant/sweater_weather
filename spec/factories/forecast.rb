FactoryBot.define do
  factory :forecast do

    type { "forecast" }

    current_weather { build(:current_weather, forecast: instance) }
    after(:create) do |forecast|
      create_list(:daily_weather, 5, forecast: forecast)
      create_list(:hourly_weather, 24, forecast: forecast)
    end
  end
end