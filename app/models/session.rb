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

class Session < ActiveRecord::Base
  # attr_accessible :title, :body
end
