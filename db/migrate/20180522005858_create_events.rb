class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :spot_name
      t.datetime :start_date
      t.datetime :end_date
      t.string :method
      t.string :tackle
      t.string :bait
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
