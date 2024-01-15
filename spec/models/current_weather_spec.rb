require 'rails_helper'

RSpec.describe CurrentWeather, type: :model do
  describe 'associations' do
    it 'belongs to forecast' do 
      expect(CurrentWeather.reflect_on_association(:forecast).macro).to eq(:belongs_to)
    end
  end
end

#this test caused a ton of problems. i misnamed something in a migration, and when I fixed it, it screwed everything up and took 2 hours to fix. Hence the weird syntax
