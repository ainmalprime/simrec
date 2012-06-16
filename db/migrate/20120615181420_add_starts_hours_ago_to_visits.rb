class AddStartsHoursAgoToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :starts_hours_ago, :integer
  end
end
