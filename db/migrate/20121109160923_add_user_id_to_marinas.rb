class AddUserIdToMarinas < ActiveRecord::Migration
  def change
    add_column :marinas, :user_id, :integer
  end
end
