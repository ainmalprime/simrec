class LabAndDiagnosticReport < ActiveRecord::Base
  attr_accessible :clinician_order_id, :image_file_id, :release_delay, :result_text, :visible, :visit_id, :description, :time_released
  validates :visit_id, presence: true
  belongs_to :visit
end
