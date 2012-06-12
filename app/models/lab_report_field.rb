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

class LabReportField < ActiveRecord::Base
  attr_accessible :name
  belongs_to :lab_report_template
end
