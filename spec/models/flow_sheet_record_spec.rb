# == Schema Information
#
# Table name: flow_sheet_records
#
#  id                       :integer         primary key
#  visit_id                 :integer
#  time_recorded            :timestamp
#  temp                     :string(255)
#  blood_pressure           :string(255)
#  respiratory_rate         :string(255)
#  oxygen_saturation        :string(255)
#  intake_po                :string(255)
#  intake_iv                :string(255)
#  intake_other             :string(255)
#  intake_other_description :string(255)
#  output_urine             :string(255)
#  output_feces             :string(255)
#  output_blood             :string(255)
#  output_other             :string(255)
#  output_other_description :string(255)
#  created_at               :timestamp       not null
#  updated_at               :timestamp       not null
#  heart_rate               :string(255)
#  sim_session              :string(255)
#

require 'spec_helper'

describe FlowSheetRecord do
  pending "add some examples to (or delete) #{__FILE__}"
end
