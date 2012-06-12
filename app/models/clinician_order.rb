# == Schema Information
#
# Table name: clinician_orders
#
#  id                 :integer         primary key
#  visit_id           :integer
#  order_type         :string(255)
#  note               :string(255)
#  time_recorded      :timestamp
#  status             :string(255)
#  time_processed     :timestamp
#  created_at         :timestamp       not null
#  updated_at         :timestamp       not null
#  clincian_signature :string(255)
#  sim_session        :string(255)
#

class ClinicianOrder < ActiveRecord::Base
  attr_accessible 	:note, :order_type, :status, :time_processed, :time_recorded, :visit_id, :clincian_signature
  validates :visit_id, presence: true
  belongs_to :visit
  serialize :order_type
end
