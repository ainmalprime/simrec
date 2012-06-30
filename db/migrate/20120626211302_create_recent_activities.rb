class CreateRecentActivities < ActiveRecord::Migration
  def change
    create_table :recent_activities do |t|
      t.datetime :time_recorded
      t.string :description
      t.string :resource
      t.integer :resource_id

      t.timestamps
    end
  end
end
