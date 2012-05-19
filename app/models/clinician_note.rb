class ClinicianNote < ActiveRecord::Base
  attr_accessible :clinicianSignature, :noteText, :noteType, :retainOnReset, :timeRecorded, :dateRecorded, :visit_id
  belongs_to :visit
end
