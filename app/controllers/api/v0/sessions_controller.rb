class Api::V0::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    require 'pry'; binding.pry
  end
end