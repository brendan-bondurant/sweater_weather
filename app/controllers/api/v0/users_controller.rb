class Api::V0::UsersController < ApplicationController

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      
      render json: user_response, status: :created
    else
      # require 'pry'; binding.pry
      render json: { errors: @new_user.errors.full_messages }, status: :unprocessable_entity

    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def user_response
    
    {
      data: {
        type: "users",
        id: @new_user.id.to_s,
        attributes: {
          email: @new_user.email,
          api_key: @new_user.api_key
        }
      }
    }
  end
end
