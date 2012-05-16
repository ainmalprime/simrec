class Visit < ActiveRecord::Base
  attr_accessible :chiefComplaint, :isActiveSim, :mrNumber, :patient_id, :visitSubject

  belongs_to :patient
  
end
