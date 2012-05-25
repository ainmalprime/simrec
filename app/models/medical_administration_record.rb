class MedicalAdministrationRecord < ActiveRecord::Base
  attr_accessible :actionDescription, :actionDetails, :clincian_signature, :retainOnReset, :timeRecorded, :visit_id
  validates :visit_id, presence: true
  belongs_to :visit
end
