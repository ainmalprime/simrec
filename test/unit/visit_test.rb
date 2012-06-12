# == Schema Information
#
# Table name: visits
#
#  id                 :integer         primary key
#  patient_id         :integer         not null
#  mrNumber           :string(255)
#  chiefComplaint     :string(255)
#  dischargeDiagnosis :string(255)
#  created_at         :timestamp       not null
#  updated_at         :timestamp       not null
#  visittime          :timestamp
#

require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
