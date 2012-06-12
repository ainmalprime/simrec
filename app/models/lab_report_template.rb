# == Schema Information
#
# Table name: lab_report_templates
#
#  id         :integer         primary key
#  name       :string(255)
#  created_at :timestamp       not null
#  updated_at :timestamp       not null
#

class LabReportTemplate < ActiveRecord::Base
  attr_accessible :name, :lab_report_fields_attributes
  has_many :lab_report_fields, dependent: :destroy
  accepts_nested_attributes_for :lab_report_fields, reject_if: lambda {|l| l[:name].blank?}, allow_destroy: true

end
