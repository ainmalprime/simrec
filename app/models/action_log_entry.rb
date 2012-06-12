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

class ActionLogEntry < ActiveRecord::Base
  attr_accessible :content, :description, :sim_session
end
