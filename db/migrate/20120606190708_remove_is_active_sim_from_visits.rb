class RemoveIsActiveSimFromVisits < ActiveRecord::Migration
  def up
  	remove_column :visits, :isActiveSim
  end

  def down
  end
end
