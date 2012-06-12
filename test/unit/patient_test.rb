# == Schema Information
#
# Table name: patients
#
#  id                     :integer         primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  date_of_birth          :string(255)
#  patient_number         :string(255)
#  address                :string(255)
#  telephone_1            :string(255)
#  telephone_1_type       :string(255)
#  telephone_2            :string(255)
#  telephone_2_type       :string(255)
#  insurance_carrier      :string(255)
#  primary_care_physician :string(255)
#  drug_allergies         :string(255)
#  created_at             :timestamp       not null
#  updated_at             :timestamp       not null
#  middle_initial         :string(255)
#  image_file_id          :integer
#

require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
