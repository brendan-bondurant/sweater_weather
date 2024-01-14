require 'rails_helper'

RSpec.describe DailyWeather, type: :model do
  describe 'associations' do
    it { should belong_to(:forecast) }
  end
end