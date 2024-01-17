class Api::V0::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])

    if @user.authenticate(params[:password])
      render json: user_response, status: :ok
    else
      render json: { errors: [{ detail: "Credentials are bad" }] }, status: :bad_request
    end

  end

  private
  def user_response
    {
      data: {
        type: "users",
        id: @user.id.to_s,
        attributes: {
          email: @user.email,
          api_key: @user.api_key
        }
      }
    }
  end
end