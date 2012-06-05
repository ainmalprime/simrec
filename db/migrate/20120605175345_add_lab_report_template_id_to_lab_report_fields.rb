class AddLabReportTemplateIdToLabReportFields < ActiveRecord::Migration
  def change
    add_column :lab_report_fields, :lab_report_template_id, :integer
  end
end
