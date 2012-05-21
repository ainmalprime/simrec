class AddColumnHeartRatetoFlowSheetRecord < ActiveRecord::Migration
  def up
  	add_column :flow_sheet_records, :heartrate, :string
  end

  def down
  end
end
