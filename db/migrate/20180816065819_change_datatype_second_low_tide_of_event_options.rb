class ChangeDatatypeSecondLowTideOfEventOptions < ActiveRecord::Migration[5.1]
  def change
    change_column :event_options, :second_low_tide, :string
  end
end
