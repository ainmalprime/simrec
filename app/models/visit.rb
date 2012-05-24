class Visit < ActiveRecord::Base
  	attr_accessible :chiefComplaint, :dischargeDiagnosis, :isActiveSim, :mrNumber, :patient_id, :visittime
   	validates :patient_id, presence: true
   	validates :visittime, presence: true
   	validates :chiefComplaint, presence: true
  	belongs_to :patient
  	has_many :clinician_notes, foreign_key: "visit_id", dependent: :destroy
  	has_many :flow_sheet_records, foreign_key: "visit_id", dependent: :destroy
  	has_many :medical_administration_records, foreign_key: "visit_id", dependent: :destroy

 	default_scope order: '"visits"."visittime" DESC' 


end
