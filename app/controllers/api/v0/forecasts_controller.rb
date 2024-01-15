class Api::V0::ForecastsController < ApplicationController
  def index
    render json: Forecast.all
  end
end