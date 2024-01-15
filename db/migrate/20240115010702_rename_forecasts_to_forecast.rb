class RenameForecastsToForecast < ActiveRecord::Migration[7.0]
  def change
    rename_table :forecasts, :forecast
  end
end
