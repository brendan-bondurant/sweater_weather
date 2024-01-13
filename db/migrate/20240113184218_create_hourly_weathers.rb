class CreateHourlyWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :hourly_weathers do |t|
      t.time :time
      t.float :temperature
      t.string :conditions
      t.string :icon
      t.references :forecast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
