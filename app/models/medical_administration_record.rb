class MedicalAdministrationRecord < ActiveRecord::Base
  attr_accessible :actionDescription, :actionDetails, :clinicianSignature, :retainOnReset, :timeRecorded, :visit_id
  validates :visit_id, presence: true
  belongs_to :visit
end
