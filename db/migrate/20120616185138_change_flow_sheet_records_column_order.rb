class ChangeFlowSheetRecordsColumnOrder < ActiveRecord::Migration
  def up
  	  drop_table :flow_sheet_records
	  create_table "flow_sheet_records", :force => true do |t|
	    t.integer   "visit_id"
	    t.timestamp "time_recorded"
	    t.integer   "minutes_after_start_of_visit"
	    t.string    "temp"
	    t.string    "blood_pressure"
		t.string    "heart_rate"
	    t.string    "respiratory_rate"
	    t.string    "oxygen_saturation"
	    t.string    "intake_po"
	    t.string    "intake_iv"
	    t.string    "intake_other"
	    t.string    "intake_other_description"
	    t.string    "output_urine"
	    t.string    "output_feces"
	    t.string    "output_blood"
	    t.string    "output_other"
	    t.string    "output_other_description"
	    t.string    "sim_session"
	    t.timestamp "created_at",                   :null => false
	    t.timestamp "updated_at",                   :null => false

	  end
  end

  def down
  end
end
