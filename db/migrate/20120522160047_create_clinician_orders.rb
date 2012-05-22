class CreateClinicianOrders < ActiveRecord::Migration
  def change
    create_table :clinician_orders do |t|
      t.integer :visit_id
      t.string :ordertype
      t.string :ordernote
      t.datetime :timerecorded
      t.string :status
      t.datetime :timeprocessed
      t.integer :retainOnReset

      t.timestamps
    end
  end
end
