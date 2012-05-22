class AddImageFileIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :image_file_id, :integer
  end
end
