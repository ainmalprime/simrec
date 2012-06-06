class AlterTablesForCaseReset < ActiveRecord::Migration
  def up
  	remove_column :clinician_notes, :retain_on_reset
  	remove_column :clinician_orders, :retain_on_reset
  	add_column :clinician_orders, :sim_session, :string
  	remove_column :flow_sheet_records, :retain_on_reset
  	add_column :flow_sheet_records, :sim_session, :string
  	remove_column :medical_administration_records, :retainOnReset
  	add_column :medical_administration_records, :sim_session, :string
  	add_column :lab_and_diagnostic_reports, :sim_session, :string
  end

  def down
  end
end
