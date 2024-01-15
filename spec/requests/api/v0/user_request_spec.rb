require 'rails_helper'

describe "User API" do

    
    it "creates a new user and returns a success response" do
      random_email = Faker::Internet.email
      valid_attributes = {
          email: random_email,
          password: 'password',
          password_confirmation: 'password'
        }
      post "/api/v0/users", params: valid_attributes.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      expect(response).to have_http_status(:success)
      response_body = JSON.parse(response.body)
      expect(response_body['data']['type']).to eq('users')
      expect(response_body['data']['attributes']['api_key']).to match(/\A[a-zA-Z0-9_]+\z/)
      email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      expect(response_body['data']['attributes']['email']).to match(email_regex)

    end

    it "points out when something is missing" do
      user_params = {
        email: "",
        password: "testing123",
        password_confirmation: "testing123"
      }.to_json

      post "/api/v0/users", params: user_params, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to have_http_status(422)
      response_body = JSON.parse(response.body)
      expect(response_body['errors']).to eq(["Email can't be blank"])
    end
    
    it "tells you if the password doesn't match" do
      random_email = Faker::Internet.email
      user_params = {
          email: random_email,
          password: 'password',
          password_confirmation: 'otherpassword'
        }.to_json

      post "/api/v0/users", params: user_params, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to have_http_status(422)
      response_body = JSON.parse(response.body)
      expect(response_body['errors']).to eq(["Password confirmation doesn't match Password"])

    end
    it "tells you if the email isn't available" do
      random_email = Faker::Internet.email
      user_params = {
          email: random_email,
          password: 'password',
          password_confirmation: 'password'
        }.to_json

      post "/api/v0/users", params: user_params, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to have_http_status(:success)

      post "/api/v0/users", params: user_params, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to have_http_status(422)
      response_body = JSON.parse(response.body)
      expect(response_body['errors']).to eq(['Email has already been taken'])
    end
  end

