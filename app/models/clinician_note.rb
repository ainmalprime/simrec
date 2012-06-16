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

class ClinicianNote < ActiveRecord::Base


  attr_accessible :clinician_signature, :note, :note_type, :time_recorded, :visit_id, :minutes_after_start_of_visit
  validates :visit_id, presence: true
  belongs_to :visit


end
