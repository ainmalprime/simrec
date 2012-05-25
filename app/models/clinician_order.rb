class ClinicianOrder < ActiveRecord::Base
  attr_accessible :ordernote, :ordertype, :retainOnReset, :status, :timeprocessed, :timerecorded, :visit_id, :cliniciansignature
  validates :visit_id, presence: true
  belongs_to :visit
end
