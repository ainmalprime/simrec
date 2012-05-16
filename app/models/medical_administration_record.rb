class MedicalAdministrationRecord < ActiveRecord::Base
  attr_accessible :actionDescription, :actionDetails, :clinicianSignature, :retainOnReset, :timeRecorded, :visit_id
end
