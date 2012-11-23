class CreateMarinas < ActiveRecord::Migration
  def change
    create_table :marinas do |t|
      t.string :name
      t.string :address
      t.string :address1
      t.string :town
      t.string :county
      t.string :country
      t.string :postcode

      t.timestamps
    end
  end
end
