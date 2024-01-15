require 'rails_helper'

describe "sessions" do
  before(:each) do
    @known_user = create(:user, email: 'sessions@test.com', password: 'abcd', password_confirmation: 'abcd')
  end
  it "logs in a user and returns a success response" do
    user_params = {
      email: "sessions@test.com",
      password: "abcd",
    }.to_json

    post "/api/v0/sessions", params: user_params, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to have_http_status(:success)
  end
end