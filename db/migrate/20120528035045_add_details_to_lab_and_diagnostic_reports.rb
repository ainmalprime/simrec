class AddDetailsToLabAndDiagnosticReports < ActiveRecord::Migration
  def change
    add_column :lab_and_diagnostic_reports, :description, :string
    add_column :lab_and_diagnostic_reports, :time_released, :datetime
  end
end
