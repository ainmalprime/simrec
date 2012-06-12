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

class ClinicianNote < ActiveRecord::Base


  attr_accessible :clinician_signature, :note_text, :note_type, :time_recorded, :visit_id
  validates :visit_id, presence: true
  belongs_to :visit


end
