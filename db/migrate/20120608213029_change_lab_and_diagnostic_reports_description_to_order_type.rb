class ChangeLabAndDiagnosticReportsDescriptionToOrderType < ActiveRecord::Migration
  def up
  	rename_column :lab_and_diagnostic_reports, :description, :order_type
  end

  def down
  end
end
