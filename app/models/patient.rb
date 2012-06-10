class Patient < ActiveRecord::Base
  attr_accessible :address, :date_of_birth, :drug_allergies, :first_name, :insurance_carrier, :last_name, :middle_initial, :patient_number, :primary_care_physician, :telephone_1, :telephone_1_type, :telephone_2, :telephone_2_type, :image_file_id
  validates :first_name, :last_name, :date_of_birth, :patient_number, presence: true
  has_many :visits, foreign_key: "patient_id", dependent: :destroy
  has_many :clinician_notes, through: :visits, source: "visit_id"
  has_many :flow_sheet_records, through: :visits, source: "visit_id"
  has_many :medical_administration_records, through: :visits, source: "visit_id"
end
