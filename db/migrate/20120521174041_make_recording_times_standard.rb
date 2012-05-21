class MakeRecordingTimesStandard < ActiveRecord::Migration
  def up
  	change_column :clinician_notes, :timeRecorded, :datetime
  	rename_column :flow_sheet_records, :recordingTime, :timeRecorded
  	change_column :flow_sheet_records, :timeRecorded, :datetime
  end

  def down
  end
end
