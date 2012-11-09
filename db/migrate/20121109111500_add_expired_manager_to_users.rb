class AddExpiredManagerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :expired_manager, :integer
  end
end
