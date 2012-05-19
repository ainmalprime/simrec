class Patient < ActiveRecord::Base
  attr_accessible :address, :dateOfBirth, :drugAllergies, :firstName, :insuranceCarrier, :lastName, :middleInitial, :patientNumber, :primaryCarePhysician, :telephone1, :telephone1type, :telephone2, :telephone2type
  has_many :visits, foreign_key: "patient_id", dependent: :destroy
  has_many :clinician_notes, through: :visits, source: "visit_id"
  validates :firstName, presence: true
end
