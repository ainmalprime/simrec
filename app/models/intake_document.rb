class IntakeDocument < ActiveRecord::Base
  attr_accessible :description, :image_file_id, :timerecorded, :visit_id
  validates :visit_id, presence: true
  belongs_to :visit
  has_one :image_file
end
