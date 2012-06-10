class ImprovePatientPropertyNames < ActiveRecord::Migration
  def up
  	rename_column :patients, :firstName, :first_name
  	rename_column :patients, :dateOfBirth, :date_of_birth
  	rename_column :patients, :patientNumber, :patient_number
  	rename_column :patients, :telephone1, :telephone_1
  	rename_column :patients, :telephone1type, :telephone_1_type
  	rename_column :patients, :telephone2, :telephone_2
  	rename_column :patients, :telephone2type, :telephone_2_type
  	rename_column :patients, :insuranceCarrier, :insurance_carrier
  	rename_column :patients, :primaryCarePhysician, :primary_care_physician
  	rename_column :patients, :drugAllergies, :drug_allergies
  	rename_column :patients, :middleInitial, :middle_initial
  end

  def down
  end
end
