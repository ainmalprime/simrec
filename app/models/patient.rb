class Patient < ActiveRecord::Base
  attr_accessible :address, :dateOfBirth, :drugAllergies, :firstName, :insuranceCarrier, :lastName, :middleInitial, :patientNumber, :primaryCarePhysician, :telephone1, :telephone1type, :telephone2, :telephone2type, :image_file_id
  validates :firstName, presence: true
  has_many :visits, foreign_key: "patient_id", dependent: :destroy
  has_many :clinician_notes, through: :visits, source: "visit_id"
  has_many :flow_sheet_records, through: :visits, source: "visit_id"
  has_many :medical_administration_records, through: :visits, source: "visit_id"


end
