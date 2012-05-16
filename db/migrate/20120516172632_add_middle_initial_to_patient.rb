class AddMiddleInitialToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :middleInitial, :string
  end
end
