# == Schema Information
#
# Table name: visits
#
#  id                     :integer         not null, primary key
#  patient_id             :integer         not null
#  mr_number              :string(255)
#  chief_complaint        :string(255)
#  discharge_diagnosis    :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  visit_time             :datetime
#  duration_til_now_hours :integer
#

require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
