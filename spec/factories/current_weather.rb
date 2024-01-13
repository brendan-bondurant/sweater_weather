FactoryBot.define do
  factory :current_weather do
    last_updated { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    temperature { Faker::Number.decimal(l_digits: 2) }
    feels_like { Faker::Number.decimal(l_digits: 2) }
    humidity { Faker::Number.number(digits: 2) }
    uvi { Faker::Number.digit }
    visibility { Faker::Number.digit }
    condition { "Sunny" }
    icon { Faker::LoremFlickr.image(size: "10x10", search_terms: ['weather']) }
    forecast { build(:forecast)}
  end
end
