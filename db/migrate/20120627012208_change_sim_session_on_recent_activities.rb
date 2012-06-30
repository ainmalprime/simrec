class ChangeSimSessionOnRecentActivities < ActiveRecord::Migration
  def up
  	change_column :recent_activities, :sim_session, :string
  end

  def down
  end
end
