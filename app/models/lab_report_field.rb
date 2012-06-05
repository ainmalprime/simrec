class LabReportField < ActiveRecord::Base
  attr_accessible :name
  belongs_to :lab_report_template
end
