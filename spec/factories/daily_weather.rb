FactoryBot.define do
  factory :daily_weather do
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    sunrise { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
  }
    sunset { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
  }
    max_temp { Faker::Number.decimal(l_digits: 2) }
    min_temp { Faker::Number.decimal(l_digits: 2) }
    condition { "Partly Cloudy" }
    icon { Faker::LoremFlickr.image(size: "10x10", search_terms: ['weather']) }
    forecast { build(:forecast)}
  end
end
