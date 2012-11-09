class AddMarinaStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :marina_state, :string
  end
end
