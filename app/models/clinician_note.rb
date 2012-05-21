class ClinicianNote < ActiveRecord::Base
  attr_accessible :clinicianSignature, :noteText, :noteType, :retainOnReset, :timeRecorded, :dateRecorded, :visit_id
  validates :visit_id, presence: true
  belongs_to :visit
end
