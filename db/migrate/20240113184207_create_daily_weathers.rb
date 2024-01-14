class CreateDailyWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_weathers do |t|
      t.datetime :date
      t.time :sunrise
      t.time :sunset
      t.float :max_temp
      t.float :min_temp
      t.string :condition
      t.string :icon
      t.references :forecast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
