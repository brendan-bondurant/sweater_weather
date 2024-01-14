# FactoryBot.define do
#   factory :hourly_weather do
#     time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
#   }
#     temperature { Faker::Number.decimal(l_digits: 2) }
#     conditions { "Clear" }
#     icon { Faker::LoremFlickr.image(size: "10x10", search_terms: ['weather']) }
#     forecast { build(:forecast)}
#   end
# end