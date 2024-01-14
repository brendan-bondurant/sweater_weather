# FactoryBot.define do
#   factory :forecast do
#     forecast_type { "forecast" }
#     after(:create) do |forecast|
#       create(:current_weather, forecast: forecast)
#       create_list(:daily_weather, 5, forecast: forecast)
#       create_list(:hourly_weather, 24, forecast: forecast)
#     end
#   end
# end
