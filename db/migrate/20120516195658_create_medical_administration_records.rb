class CreateMedicalAdministrationRecords < ActiveRecord::Migration
  def change
    create_table :medical_administration_records do |t|
      t.integer :visit_id
      t.datetime :timeRecorded
      t.string :actionDescription
      t.string :actionDetails
      t.string :clinicianSignature
      t.integer :retainOnReset

      t.timestamps
    end
  end
end
