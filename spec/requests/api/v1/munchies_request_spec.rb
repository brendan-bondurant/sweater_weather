require 'rails_helper'

describe "Munchies API" do
  it "connects" do
    get '/api/v1/munchies'
    expect(response).to be_successful
  end
end