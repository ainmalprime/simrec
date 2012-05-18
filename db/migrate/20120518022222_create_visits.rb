class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :patient_id
      t.string :mrNumber
      t.string :chiefComplaint
      t.string :dischargeDiagnosis
      t.integer :isActiveSim

      t.timestamps
    end
  end
end
