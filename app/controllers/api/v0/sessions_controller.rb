class Api::V0::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      render json: { errors: [{ detail: "Credentials are bad" }] }, status: :bad_request
    end

  end
end