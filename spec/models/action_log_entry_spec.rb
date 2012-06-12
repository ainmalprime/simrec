# == Schema Information
#
# Table name: action_log_entries
#
#  id          :integer         primary key
#  description :string(255)
#  content     :text
#  sim_session :text
#  created_at  :timestamp       not null
#  updated_at  :timestamp       not null
#

require 'spec_helper'

describe ActionLogEntry do
  pending "add some examples to (or delete) #{__FILE__}"
end
