class AddVisitIdToRecentActivities < ActiveRecord::Migration
  def change
    add_column :recent_activities, :visit_id, :integer
  end
end
