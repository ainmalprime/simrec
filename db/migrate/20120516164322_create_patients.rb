class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstName
      t.string :lastName
      t.string :dateOfBirth
      t.string :patientNumber
      t.string :address
      t.string :telephone1
      t.string :telephone1type
      t.string :telephone2
      t.string :telephone2type
      t.string :insuranceCarrier
      t.string :primaryCarePhysician
      t.string :drugAllergies

      t.timestamps
    end
  end
end
