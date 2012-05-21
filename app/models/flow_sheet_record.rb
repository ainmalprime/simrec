class FlowSheetRecord < ActiveRecord::Base
  attr_accessible :bloodPressure, :heartrate, :intakeIV, :intakeOther, :intakeOtherDescription, :intakePO, :outputBlood, :outputFeces, :outputOther, :outputOtherDescription, :outputUrine, :oxygenSaturation, :timeRecorded, :respiratoryRate, :retainOnReset, :temp, :visit_id
  validates :visit_id, presence: true
  belongs_to :visit
end
