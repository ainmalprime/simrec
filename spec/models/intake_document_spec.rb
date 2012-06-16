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

require 'spec_helper'

describe IntakeDocument do
  pending "add some examples to (or delete) #{__FILE__}"
end
