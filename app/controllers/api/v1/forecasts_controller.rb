class Api::V1::ForecastsController < ApplicationController
  def index
    def weather_results


      
      render json: ForecastSerializer.new(Forecast.all)
    end
  end
end