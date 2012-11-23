class AddActiveUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active_user, :integer
  end
end
