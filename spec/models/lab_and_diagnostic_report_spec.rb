# == Schema Information
#
# Table name: lab_and_diagnostic_reports
#
#  id                           :integer         primary key
#  visit_id                     :integer
#  clinician_order_id           :integer
#  image_file_id                :integer
#  release_delay                :integer
#  visible                      :integer
#  result_text                  :text
#  created_at                   :timestamp       not null
#  updated_at                   :timestamp       not null
#  order_type                   :string(255)
#  time_released                :timestamp
#  sim_session                  :string(255)
#  minutes_after_start_of_visit :integer
#

require 'spec_helper'

describe LabAndDiagnosticReport do
  pending "add some examples to (or delete) #{__FILE__}"
end
