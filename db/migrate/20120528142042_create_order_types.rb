class CreateOrderTypes < ActiveRecord::Migration
  def change
    create_table :order_types do |t|
      t.string :description

      t.timestamps
    end
  end
end
