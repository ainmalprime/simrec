class ClinicianNote < ActiveRecord::Base
  attr_accessible :clincian_signature, :note_text, :note_type, :retain_on_reset, :time_recorded, :visit_id
  validates :visit_id, presence: true
  belongs_to :visit
end
