# == Schema Information
#
# Table name: order_types
#
#  id          :integer         primary key
#  description :string(255)
#  category    :string(255)
#  created_at  :timestamp       not null
#  updated_at  :timestamp       not null
#

class OrderType < ActiveRecord::Base
  attr_accessible :description, :category
end
