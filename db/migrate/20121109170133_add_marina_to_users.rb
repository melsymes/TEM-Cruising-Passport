class AddMarinaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :marina, :integer
  end
end
