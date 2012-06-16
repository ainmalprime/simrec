class AddMinutesAfterStartOfVisitToChildren < ActiveRecord::Migration
  def change
  	  add_column :clinician_notes, :minutes_after_start_of_visit, :integer 
      add_column :clinician_orders, :minutes_after_start_of_visit, :integer 
      add_column :flow_sheet_records, :minutes_after_start_of_visit, :integer 
      add_column :medical_administration_records, :minutes_after_start_of_visit, :integer 
      add_column :lab_and_diagnostic_reports, :minutes_after_start_of_visit, :integer 
  end
end
