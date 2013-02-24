class AddBoatNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :boat_name, :string
  end
end
