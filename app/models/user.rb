class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates_uniqueness_of :email
  validates :password, presence: true

  before_create :generate_api_key

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(10)
  end
end