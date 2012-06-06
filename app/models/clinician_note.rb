class ClinicianNote < ActiveRecord::Base


  attr_accessible :clinician_signature, :note_text, :note_type, :time_recorded, :visit_id
  validates :visit_id, presence: true
  belongs_to :visit


end
