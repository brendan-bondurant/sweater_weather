class CreateCurrentWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :current_weathers do |t|
      t.datetime :last_updated
      t.float :temperature
      t.float :feels_like
      t.integer :humidity
      t.integer :uvi
      t.integer :visibility
      t.string :condition
      t.string :icon
      t.references :forecast, null: false, foreign_key: true

      t.timestamps
    end
  end
end
