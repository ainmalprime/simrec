class CreateFlowSheetRecords < ActiveRecord::Migration
  def change
    create_table :flow_sheet_records do |t|
      t.integer :visit_id
      t.date :recordingTime
      t.string :temp
      t.string :bloodPressure
      t.string :respiratoryRate
      t.string :oxygenSaturation
      t.string :intakePO
      t.string :intakeIV
      t.string :intakeOther
      t.string :intakeOtherDescription
      t.string :outputUrine
      t.string :outputFeces
      t.string :outputBlood
      t.string :outputOther
      t.string :outputOtherDescription
      t.integer :retainOnReset

      t.timestamps
    end
  end
end
