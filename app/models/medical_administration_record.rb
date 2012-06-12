# == Schema Information
#
# Table name: medical_administration_records
#
#  id                 :integer         primary key
#  visit_id           :integer
#  timeRecorded       :timestamp
#  actionDescription  :string(255)
#  actionDetails      :string(255)
#  clinicianSignature :string(255)
#  created_at         :timestamp       not null
#  updated_at         :timestamp       not null
#  sim_session        :string(255)
#

class MedicalAdministrationRecord < ActiveRecord::Base
  attr_accessible :actionDescription, :actionDetails, :clinicianSignature, :timeRecorded, :visit_id
  validates :visit_id, presence: true
  belongs_to :visit
end
