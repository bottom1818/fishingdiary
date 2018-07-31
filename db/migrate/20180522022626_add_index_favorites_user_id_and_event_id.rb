class AddIndexFavoritesUserIdAndEventId < ActiveRecord::Migration[5.1]
  def change
    add_index :favorites, [:user_id, :event_id], :unique => true
  end
end
