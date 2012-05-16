class Patient < ActiveRecord::Base
  attr_accessible :address, :dateOfBirth, :drugAllergies, :firstName, :insuranceCarrier, :lastName, :middleInitial, :patientNumber, :primaryCarePhysician, :telephone1, :telephone1type, :telephone2, :telephone2type
  has_many :visits
end
