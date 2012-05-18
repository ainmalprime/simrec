class CreateClinicianNotes < ActiveRecord::Migration
  def change
    create_table :clinician_notes do |t|
      t.integer :visit_id
      t.datetime :timeRecorded
      t.string :noteType
      t.string :noteText
      t.string :clinicianSignature
      t.integer :retainOnReset

      t.timestamps
    end
  end
end
