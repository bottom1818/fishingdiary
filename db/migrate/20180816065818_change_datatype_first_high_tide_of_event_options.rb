class ChangeDatatypeFirstHighTideOfEventOptions < ActiveRecord::Migration[5.1]
  def change
    change_column :event_options, :first_high_tide, :string
  end
end
