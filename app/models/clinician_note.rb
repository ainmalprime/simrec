class ClinicianNote < ActiveRecord::Base
  attr_accessible :clinicianSignature, :noteText, :noteType, :retainOnReset, :timeRecorded, :visit_id
end
