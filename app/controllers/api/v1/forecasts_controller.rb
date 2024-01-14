class Api::V1::ForecastsController < ApplicationController
  def index
    def weather_results
      city = params[:city]
      state = params[:state]
      
      weather_facade = WeatherFacade.new(city, state)
      forecast_data = weather_facade.weather
      
      render json: forecast_data

    end
  end
end