class AddPendingManagerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pending_manager, :integer
  end
end
