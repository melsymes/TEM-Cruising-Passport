class AddExpiredUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :expired_user, :integer
  end
end
