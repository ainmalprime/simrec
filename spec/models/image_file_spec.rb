# == Schema Information
#
# Table name: image_files
#
#  id           :integer         primary key
#  description  :string(255)
#  content_type :string(255)
#  filename     :string(255)
#  binary_data  :binary
#  created_at   :timestamp       not null
#  updated_at   :timestamp       not null
#

require 'spec_helper'

describe ImageFile do
  pending "add some examples to (or delete) #{__FILE__}"
end
