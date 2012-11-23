class AddActiveManagerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active_manager, :integer
  end
end
