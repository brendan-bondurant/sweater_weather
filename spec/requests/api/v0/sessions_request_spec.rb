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
  it "can't login with wrong password" do
    user_params = {
      email: "sessions@test.com",
      password: "bcd",
    }.to_json

    post "/api/v0/sessions", params: user_params, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
    expect(response).to have_http_status(400)
    response_body = JSON.parse(response.body)
    expect(response_body['errors']).to eq([{"detail"=>"Credentials are bad"}])
  end
end