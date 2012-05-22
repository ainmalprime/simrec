class RenameVisitTimeOnVisitsTovisittime < ActiveRecord::Migration
  def up
  	rename_column :visits, :visitTime, :visittime
  end

  def down
  	rename_column :visits, :visittime, :visitTime
  end
end
