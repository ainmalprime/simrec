class ChangeRecordingTimeNameToTimeRecorded < ActiveRecord::Migration
  def up
  	change_column :clinician_notes, :timeRecorded, :time
  	add_column :clinician_notes, :dateRecorded, :date
  end

  def down

  end
end
