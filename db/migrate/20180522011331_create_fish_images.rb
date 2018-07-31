class CreateFishImages < ActiveRecord::Migration[5.1]
  def change
    create_table :fish_images do |t|
      t.text :image
      t.integer :event_id
      t.integer :caught_fish_id

      t.timestamps
    end
  end
end
