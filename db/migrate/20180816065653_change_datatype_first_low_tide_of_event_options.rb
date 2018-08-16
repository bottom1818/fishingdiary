class ChangeDatatypeFirstLowTideOfEventOptions < ActiveRecord::Migration[5.1]
  def change
    change_column :event_options, :first_low_tide, :string
  end
end
