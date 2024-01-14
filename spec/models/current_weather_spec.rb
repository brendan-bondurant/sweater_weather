require 'rails_helper'

RSpec.describe CurrentWeather, type: :model do
  describe 'associations' do
    it { should belong_to(:forecast) }
  end
end