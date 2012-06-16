# == Schema Information
#
# Table name: clinician_notes
#
#  id                           :integer         not null, primary key
#  visit_id                     :integer
#  time_recorded                :datetime
#  note_type                    :string(255)
#  note                         :text
#  clinician_signature          :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#  sim_session                  :string(255)
#  minutes_after_start_of_visit :integer
#

require 'test_helper'

class ClinicianNoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
