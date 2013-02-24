class AddMarinaIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :marina_id, :integer
  end
end
