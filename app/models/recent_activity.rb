class RecentActivity < ActiveRecord::Base
  attr_accessible :description, :resource, :resource_id, :time_recorded, :visit_id, :visible
  default_scope order: '"recent_activities"."time_recorded" DESC'
end
