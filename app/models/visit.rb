# == Schema Information
#
# Table name: visits
#
#  id                     :integer         not null, primary key
#  patient_id             :integer         not null
#  mr_number              :string(255)
#  chief_complaint        :string(255)
#  discharge_diagnosis    :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  visit_time             :datetime
#  duration_til_now_hours :integer
#

class Visit < ActiveRecord::Base
  	attr_accessible :chief_complaint, :discharge_diagnosis, :mr_number, :patient_id, :visit_time, :duration_til_now_hours
   	validates :patient_id, presence: true
   	validates :visit_time, presence: true
   	validates :chief_complaint, presence: true
  	belongs_to :patient
  	has_many :clinician_notes, foreign_key: "visit_id", dependent: :destroy
  	has_many :clinician_orders, foreign_key: "visit_id", dependent: :destroy
  	has_many :flow_sheet_records, foreign_key: "visit_id", dependent: :destroy
  	has_many :lab_and_diagnostic_reports, foreign_key: "visit_id", dependent: :destroy
  	has_many :medical_administration_records, foreign_key: "visit_id", dependent: :destroy
  	has_many :intake_documents, foreign_key: "visit_id", dependent: :destroy

 	default_scope order: '"visits"."visit_time" DESC' 


end
