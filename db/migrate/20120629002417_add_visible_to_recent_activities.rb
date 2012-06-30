class AddVisibleToRecentActivities < ActiveRecord::Migration
  def change
    add_column :recent_activities, :visible, :integer
  end
end
