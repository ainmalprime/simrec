class CreateLabReportFields < ActiveRecord::Migration
  def change
    create_table :lab_report_fields do |t|
      t.string :name

      t.timestamps
    end
  end
end
