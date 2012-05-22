class CreateImageFiles < ActiveRecord::Migration
  def change
    create_table :image_files do |t|
      t.string :description
      t.string :content_type
      t.string :filename
      t.binary :binary_data

      t.timestamps
    end
  end
end
