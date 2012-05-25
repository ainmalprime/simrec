class CreateIntakeDocuments < ActiveRecord::Migration
  def change
    create_table :intake_documents do |t|
      t.integer :visit_id
      t.integer :image_file_id
      t.string :description
      t.datetime :timerecorded

      t.timestamps
    end
  end
end
