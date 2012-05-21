# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120520043458) do

  create_table "clinician_notes", :force => true do |t|
    t.integer  "visit_id"
    t.time     "timeRecorded"
    t.string   "noteType"
    t.text     "noteText",           :limit => 255
    t.string   "clinicianSignature"
    t.integer  "retainOnReset"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "dateRecorded"
  end

  create_table "flow_sheet_records", :force => true do |t|
    t.integer  "visit_id"
    t.date     "recordingTime"
    t.string   "temp"
    t.string   "bloodPressure"
    t.string   "respiratoryRate"
    t.string   "oxygenSaturation"
    t.string   "intakePO"
    t.string   "intakeIV"
    t.string   "intakeOther"
    t.string   "intakeOtherDescription"
    t.string   "outputUrine"
    t.string   "outputFeces"
    t.string   "outputBlood"
    t.string   "outputOther"
    t.string   "outputOtherDescription"
    t.integer  "retainOnReset"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "heartrate"
  end

  create_table "medical_administration_records", :force => true do |t|
    t.integer  "visit_id"
    t.datetime "timeRecorded"
    t.string   "actionDescription"
    t.string   "actionDetails"
    t.string   "clinicianSignature"
    t.integer  "retainOnReset"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "dateOfBirth"
    t.string   "patientNumber"
    t.string   "address"
    t.string   "telephone1"
    t.string   "telephone1type"
    t.string   "telephone2"
    t.string   "telephone2type"
    t.string   "insuranceCarrier"
    t.string   "primaryCarePhysician"
    t.string   "drugAllergies"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "middleInitial"
  end

  create_table "visits", :force => true do |t|
    t.integer  "patient_id",         :null => false
    t.string   "mrNumber"
    t.string   "chiefComplaint"
    t.string   "dischargeDiagnosis"
    t.integer  "isActiveSim"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.datetime "visitTime"
  end

end
