class ChangeDatatypeSecondHighTideOfEventOptions < ActiveRecord::Migration[5.1]
  def change
    change_column :event_options, :second_high_tide, :string
  end
end
