class ChangeRecordingTimeClinicianNote < ActiveRecord::Migration
  def up
  	remove_column :clinician_notes, :dateRecorded
  	change_column :clinician_notes, :timeRecorded, :date
  end

  def down
  end
end
