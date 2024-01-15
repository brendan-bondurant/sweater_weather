require 'rails_helper'

describe "User API" do
  describe "POST /api/v0/users" do
    it "creates a new user and returns a success response" do
      user_params = {
        email: "test@test.com",
        password: "testing123",
        password_confirmation: "testing123"
      }.to_json

      post "/api/v0/users", params: user_params, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to have_http_status(:success)
      # expect(response_body['data']['type']).to eq('users')
      # expect(attributes['email']).to eq('whatever@example.com')
      # expect(attributes['api_key']).to match(/\A[a-zA-Z0-9_]+\z/)
      # require 'pry'; binding.pry
    end
    it "points out when something is missing" do
      user_params = {
        email: "",
        password: "testing123",
        password_confirmation: "testing123"
      }.to_json

      post "/api/v0/users", params: user_params, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to have_http_status(400)
      response_body = JSON.parse(response.body)
      expect(response_body['error']).to eq('Missing required fields')
    end
    it "tells you if the password doesn't match" do
      user_params = {
        email: "test@test.com",
        password: "testing123",
        password_confirmation: "testing1234"
      }.to_json

      post "/api/v0/users", params: user_params, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to have_http_status(400)
      response_body = JSON.parse(response.body)
      expect(response_body['error']).to eq('Password confirmation does not match')

    end
    it "tells you if the email isn't available" do
      user_params = {
        email: "test@test.com",
        password: "testing123",
        password_confirmation: "testing1234"
      }.to_json

      post "/api/v0/users", params: user_params, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to have_http_status(:success)

      post "/api/v0/users", params: user_params, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to have_http_status(400)
      response_body = JSON.parse(response.body)
      expect(response_body['error']).to eq('Email has already been taken')
    end
  end
end