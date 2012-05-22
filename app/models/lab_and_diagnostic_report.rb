class LabAndDiagnosticReport < ActiveRecord::Base
  attr_accessible :clinician_order_id, :image_file_id, :release_delay, :result_text, :visible, :visit_id
end
