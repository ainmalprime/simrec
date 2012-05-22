class CreateLabAndDiagnosticReports < ActiveRecord::Migration
  def change
    create_table :lab_and_diagnostic_reports do |t|
      t.integer :visit_id
      t.integer :clinician_order_id
      t.integer :image_file_id
      t.integer :release_delay
      t.integer :visible
      t.text :result_text

      t.timestamps
    end
  end
end
