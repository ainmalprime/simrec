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

require 'spec_helper'

describe IntakeDocument do
  pending "add some examples to (or delete) #{__FILE__}"
end
