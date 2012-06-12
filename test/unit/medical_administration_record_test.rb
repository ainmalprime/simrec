# == Schema Information
#
# Table name: medical_administration_records
#
#  id                 :integer         primary key
#  visit_id           :integer
#  timeRecorded       :timestamp
#  actionDescription  :string(255)
#  actionDetails      :string(255)
#  clinicianSignature :string(255)
#  created_at         :timestamp       not null
#  updated_at         :timestamp       not null
#  sim_session        :string(255)
#

require 'test_helper'

class MedicalAdministrationRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
