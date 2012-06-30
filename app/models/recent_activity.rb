class RecentActivity < ActiveRecord::Base
  attr_accessible :description, :resource, :resource_id, :time_recorded, :visit_id
end
