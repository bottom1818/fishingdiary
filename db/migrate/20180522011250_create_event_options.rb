class CreateEventOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :event_options do |t|
      t.string :weather
      t.string :max_temperature
      t.string :min_temperature
      t.string :wind_speed
      t.string :wind_direction
      t.string :wave_height
      t.string :location_latitude
      t.string :location_longitude
      t.string :tide
      t.datetime :first_low_tide
      t.datetime :first_high_tide
      t.datetime :second_low_tide
      t.datetime :second_high_tide
      t.integer :event_id

      t.timestamps
    end
  end
end
