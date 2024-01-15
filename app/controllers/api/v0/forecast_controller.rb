class Api::V0::ForecastController < ApplicationController
  def index
    facade = WeatherFacade.new(params[:location]).formatted_weather_info[:data]
    render json: facade

  end

  def show
    # require 'pry'; binding.pry
  end
end

private

def location_params
  params.permit(:location)
end