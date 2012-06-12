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

class Patient < ActiveRecord::Base
  attr_accessible :address, :date_of_birth, :drug_allergies, :first_name, :insurance_carrier, :last_name, :middle_initial, :patient_number, :primary_care_physician, :telephone_1, :telephone_1_type, :telephone_2, :telephone_2_type, :image_file_id
  validates :first_name, :last_name, :date_of_birth, :patient_number, presence: true
  has_many :visits, foreign_key: "patient_id", dependent: :destroy
  has_many :clinician_notes, through: :visits, source: "visit_id"
  has_many :flow_sheet_records, through: :visits, source: "visit_id"
  has_many :medical_administration_records, through: :visits, source: "visit_id"
end
