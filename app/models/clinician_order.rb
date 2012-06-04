class ClinicianOrder < ActiveRecord::Base
  attr_accessible 	:note, :order_type, :retain_on_reset, :status, :time_processed, :time_recorded, :visit_id, :clincian_signature
  validates :visit_id, presence: true
  belongs_to :visit
  serialize :order_type
end
