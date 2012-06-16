class ImproveVisitNamesAgain < ActiveRecord::Migration
  def up
  	rename_column :visits, :dischargeDiagnosis, :discharge_diagnosis
  end

  def down
  end
end
