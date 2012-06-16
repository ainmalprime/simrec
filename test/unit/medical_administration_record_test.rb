# == Schema Information
#
# Table name: medical_administration_records
#
#  id                           :integer         not null, primary key
#  visit_id                     :integer
#  time_recorded                :datetime
#  description                  :string(255)
#  note                         :string(255)
#  clinician_signature          :string(255)
#  created_at                   :datetime        not null
#  updated_at                   :datetime        not null
#  sim_session                  :string(255)
#  minutes_after_start_of_visit :integer
#

require 'test_helper'

class MedicalAdministrationRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
