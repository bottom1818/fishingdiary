class CreateCaughtFishes < ActiveRecord::Migration[5.1]
  def change
    create_table :caught_fishes do |t|
      t.string :name
      t.string :size
      t.string :weight
      t.string :tackle
      t.string :bait
      t.integer :caught_number
      t.string :caught_time
      t.integer :event_id

      t.timestamps
    end
  end
end
