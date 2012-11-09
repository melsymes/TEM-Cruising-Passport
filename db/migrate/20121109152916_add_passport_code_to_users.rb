class AddPassportCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :passport_code, :string
  end
end
