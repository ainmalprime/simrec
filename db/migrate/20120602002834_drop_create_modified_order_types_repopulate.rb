class DropCreateModifiedOrderTypesRepopulate < ActiveRecord::Migration
  def change
	drop_table :order_types
  	create_table :order_types do |t|
      t.string :description
      t.string :category

      t.timestamps
    end
  end


  def down
  end
end
