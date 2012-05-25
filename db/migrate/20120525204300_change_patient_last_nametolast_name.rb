class ChangePatientLastNametolastName < ActiveRecord::Migration
  def up
  	rename_column :patients, :lastName, :last_name
  end

  def down
  end
end
