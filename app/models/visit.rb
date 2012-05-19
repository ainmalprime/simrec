class Visit < ActiveRecord::Base
  	attr_accessible :chiefComplaint, :dischargeDiagnosis, :isActiveSim, :mrNumber, :patient_id, :visittime
   	validates :patient_id, presence: true
  	belongs_to :patient
  	has_many :clinician_notes
 
 	default_scope order: 'visits.visittime'


end
