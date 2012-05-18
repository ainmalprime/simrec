class Visit < ActiveRecord::Base
  attr_accessible :chiefComplaint, :dischargeDiagnosis, :isActiveSim, :mrNumber, :patient_id
   validates :patient_id, presence: true
  belongs_to :patient
 
end
