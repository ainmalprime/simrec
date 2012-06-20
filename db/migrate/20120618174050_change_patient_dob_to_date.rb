class ChangePatientDobToDate < ActiveRecord::Migration
  def up
  	change_column :patients, :date_of_birth, :date
  end

  def down
  end
end
