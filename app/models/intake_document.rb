# == Schema Information
#
# Table name: intake_documents
#
#  id                           :integer         not null, primary key
#  visit_id                     :integer
#  image_file_id                :integer
#  description                  :string(255)
#  time_recorded                :datetime
#  created_at                   :datetime        not null
#  updated_at                   :datetime        not null
#  minutes_after_start_of_visit :integer
#

class IntakeDocument < ActiveRecord::Base
  attr_accessible :description, :image_file_id, :time_recorded, :visit_id, :minutes_after_start_of_visit
  validates :visit_id, presence: true
  belongs_to :visit
  has_one :image_file
end
