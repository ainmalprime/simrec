# == Schema Information
#
# Table name: sessions
#
#  id         :integer         primary key
#  session_id :string(255)     not null
#  data       :text
#  created_at :timestamp       not null
#  updated_at :timestamp       not null
#

require 'spec_helper'

describe Session do
  pending "add some examples to (or delete) #{__FILE__}"
end
