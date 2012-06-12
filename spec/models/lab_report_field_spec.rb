# == Schema Information
#
# Table name: lab_report_fields
#
#  id                     :integer         primary key
#  name                   :string(255)
#  created_at             :timestamp       not null
#  updated_at             :timestamp       not null
#  lab_report_template_id :integer
#

require 'spec_helper'

describe LabReportField do
  pending "add some examples to (or delete) #{__FILE__}"
end
