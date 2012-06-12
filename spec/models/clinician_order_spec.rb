# == Schema Information
#
# Table name: clinician_orders
#
#  id                 :integer         primary key
#  visit_id           :integer
#  order_type         :string(255)
#  note               :string(255)
#  time_recorded      :timestamp
#  status             :string(255)
#  time_processed     :timestamp
#  created_at         :timestamp       not null
#  updated_at         :timestamp       not null
#  clincian_signature :string(255)
#  sim_session        :string(255)
#

require 'spec_helper'

describe ClinicianOrder do
  pending "add some examples to (or delete) #{__FILE__}"
end
