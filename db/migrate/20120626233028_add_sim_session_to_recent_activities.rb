class AddSimSessionToRecentActivities < ActiveRecord::Migration
  def change
    add_column :recent_activities, :sim_session, :integer
  end
end
