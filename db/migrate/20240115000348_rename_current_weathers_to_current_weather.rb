class RenameCurrentWeathersToCurrentWeather < ActiveRecord::Migration[7.0]
  def change
    rename_table :current_weathers, :current_weather
  end
end
