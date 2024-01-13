class RenameTypeColumnInForecasts < ActiveRecord::Migration[7.0]
  def change
    rename_column :forecasts, :type, :forecast_type
  end
end
