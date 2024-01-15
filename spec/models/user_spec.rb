require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should have_secure_password}
    it {should validate_presence_of(:email)}
    it { should_not allow_value(nil).for(:email) }
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end
end