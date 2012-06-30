class AddOrderTypeToRecentActivities < ActiveRecord::Migration
  def change
    add_column :recent_activities, :order_type, :string
  end
end
