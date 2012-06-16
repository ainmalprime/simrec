# == Schema Information
#
# Table name: clinician_orders
#
#  id                           :integer         not null, primary key
#  visit_id                     :integer
#  order_type                   :string(255)
#  note                         :string(255)
#  time_recorded                :datetime
#  status                       :string(255)
#  time_processed               :datetime
#  created_at                   :datetime        not null
#  updated_at                   :datetime        not null
#  clinician_signature          :string(255)
#  sim_session                  :string(255)
#  minutes_after_start_of_visit :integer
#

require 'spec_helper'

describe ClinicianOrder do
  pending "add some examples to (or delete) #{__FILE__}"
end
