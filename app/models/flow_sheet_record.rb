# == Schema Information
#
# Table name: flow_sheet_records
#
#  id                           :integer         primary key
#  visit_id                     :integer
#  time_recorded                :timestamp
#  temp                         :string(255)
#  blood_pressure               :string(255)
#  respiratory_rate             :string(255)
#  oxygen_saturation            :string(255)
#  intake_po                    :string(255)
#  intake_iv                    :string(255)
#  intake_other                 :string(255)
#  intake_other_description     :string(255)
#  output_urine                 :string(255)
#  output_feces                 :string(255)
#  output_blood                 :string(255)
#  output_other                 :string(255)
#  output_other_description     :string(255)
#  created_at                   :timestamp       not null
#  updated_at                   :timestamp       not null
#  heart_rate                   :string(255)
#  sim_session                  :string(255)
#  minutes_after_start_of_visit :integer
#

class FlowSheetRecord < ActiveRecord::Base
  attr_accessible :temp, :time_recorded, :blood_pressure, :heart_rate, :respiratory_rate, :oxygen_saturation, :intake_po, :intake_iv,:intake_other, :intake_other_description, :output_urine, :output_feces, :output_blood, :output_other, :output_other_description, :visit_id, :minutes_after_start_of_visit
  validates :visit_id, presence: true
  belongs_to :visit
end
