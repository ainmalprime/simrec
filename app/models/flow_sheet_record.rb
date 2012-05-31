class FlowSheetRecord < ActiveRecord::Base
  attr_accessible :temp, :time_recorded, :blood_pressure, :heart_rate, :respiratory_rate, :oxygen_saturation, :intake_po, :intake_iv,:intake_other, :intake_other_description, :output_urine, :output_feces, :output_blood, :output_other, :output_other_description, :visit_id
  validates :visit_id, presence: true
  belongs_to :visit
end
