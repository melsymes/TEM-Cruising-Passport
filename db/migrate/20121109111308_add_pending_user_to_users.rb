class AddPendingUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pending_user, :integer
  end
end
