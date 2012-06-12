# == Schema Information
#
# Table name: intake_documents
#
#  id            :integer         primary key
#  visit_id      :integer
#  image_file_id :integer
#  description   :string(255)
#  timerecorded  :timestamp
#  created_at    :timestamp       not null
#  updated_at    :timestamp       not null
#

class IntakeDocument < ActiveRecord::Base
  attr_accessible :description, :image_file_id, :timerecorded, :visit_id
  validates :visit_id, presence: true
  belongs_to :visit
  has_one :image_file
end
