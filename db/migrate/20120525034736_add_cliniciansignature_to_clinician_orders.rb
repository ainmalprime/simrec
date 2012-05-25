class AddCliniciansignatureToClinicianOrders < ActiveRecord::Migration
  def change
    add_column :clinician_orders, :cliniciansignature, :string
  end
end
