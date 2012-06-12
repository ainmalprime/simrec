# == Schema Information
#
# Table name: clinician_notes
#
#  id                  :integer         primary key
#  visit_id            :integer
#  time_recorded       :timestamp
#  note_type           :string(255)
#  note_text           :text
#  clinician_signature :string(255)
#  created_at          :timestamp
#  updated_at          :timestamp
#  sim_session         :string(255)
#

require 'test_helper'

class ClinicianNoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
