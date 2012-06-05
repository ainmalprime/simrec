class CreateLabReportTemplates < ActiveRecord::Migration
  def change
    create_table :lab_report_templates do |t|
      t.string :name

      t.timestamps
    end
  end
end
