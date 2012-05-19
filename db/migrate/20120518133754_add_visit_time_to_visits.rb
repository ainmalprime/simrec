class AddVisitTimeToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :visitTime, :datetime
  end
end
