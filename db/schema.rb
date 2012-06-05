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

ActiveRecord::Schema.define(:version => 20120605175345) do

  create_table "clinician_notes", :force => true do |t|
    t.integer  "visit_id"
    t.datetime "time_recorded"
    t.string   "note_type"
    t.text     "note_text",           :limit => 255
    t.string   "clinician_signature"
    t.integer  "retain_on_reset"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clinician_orders", :force => true do |t|
    t.integer  "visit_id"
    t.string   "order_type"
    t.string   "note"
    t.datetime "time_recorded"
    t.string   "status"
    t.datetime "time_processed"
    t.integer  "retain_on_reset"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "clincian_signature"
  end

  create_table "flow_sheet_records", :force => true do |t|
    t.integer  "visit_id"
    t.datetime "time_recorded"
    t.string   "temp"
    t.string   "blood_pressure"
    t.string   "respiratory_rate"
    t.string   "oxygen_saturation"
    t.string   "intake_po"
    t.string   "intake_iv"
    t.string   "intake_other"
    t.string   "intake_other_description"
    t.string   "output_urine"
    t.string   "output_feces"
    t.string   "output_blood"
    t.string   "output_other"
    t.string   "output_other_description"
    t.integer  "retain_on_reset"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "heart_rate"
  end

  create_table "image_files", :force => true do |t|
    t.string   "description"
    t.string   "content_type"
    t.string   "filename"
    t.binary   "binary_data"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "intake_documents", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "image_file_id"
    t.string   "description"
    t.datetime "timerecorded"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "lab_and_diagnostic_reports", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "clinician_order_id"
    t.integer  "image_file_id"
    t.integer  "release_delay"
    t.integer  "visible"
    t.text     "result_text"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "description"
    t.datetime "time_released"
  end

  create_table "lab_report_fields", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "lab_report_template_id"
  end

  create_table "lab_report_templates", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "order_types", :force => true do |t|
    t.string   "description"
    t.string   "category"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "firstName"
    t.string   "last_name"
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
    t.integer  "image_file_id"
  end

  create_table "searches", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "visits", :force => true do |t|
    t.integer  "patient_id",         :null => false
    t.string   "mrNumber"
    t.string   "chiefComplaint"
    t.string   "dischargeDiagnosis"
    t.integer  "isActiveSim"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.datetime "visittime"
  end

end
