class AddTargetToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :target, :string
  end
end
