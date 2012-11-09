class AddNationToMarinas < ActiveRecord::Migration
  def change
    add_column :marinas, :nation, :string
  end
end
