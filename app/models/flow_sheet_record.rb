class FlowSheetRecord < ActiveRecord::Base
  attr_accessible :bloodPressure, :intakeIV, :intakeOther, :intakeOtherDescription, :intakePO, :outputBlood, :outputFeces, :outputOther, :outputOtherDescription, :outputUrine, :oxygenSaturation, :timeRecorded, :respiratoryRate, :retainOnReset, :temp, :visit_id
end
