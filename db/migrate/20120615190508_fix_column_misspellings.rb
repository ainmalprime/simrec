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

# == Schema Information
#
# Table name: medical_administration_records
#
#  id                 :integer         primary key
#  visit_id           :integer
#  timeRecorded       :timestamp
#  actionDescription  :string(255)
#  actionDetails      :string(255)
#  clinicianSignature :string(255)
#  created_at         :timestamp       not null
#  updated_at         :timestamp       not null
#  sim_session        :string(255)
#
# == Schema Information
#
# Table name: clinician_notes
#
#  id                  :integer         primary key
#  visit_id            :integer
#  time_recorded       :timestamp
#  note_type           :string(255)
#  note_text           :text
#  clinician_signature :string(255)
#  created_at          :timestamp
#  updated_at          :timestamp
#  sim_session         :string(255)
#
# == Schema Information
#
# Table name: intake_documents
#
#  id            :integer         primary key
#  visit_id      :integer
#  image_file_id :integer
#  description   :string(255)
#  timerecorded  :timestamp
#  created_at    :timestamp       not null
#  updated_at    :timestamp       not null
#

class FixColumnMisspellings < ActiveRecord::Migration
  def up
  	# Table name: clinician_orders
  	#  clincian_signature :string(255)
  	rename_column :clinician_orders, :clincian_signature, :clinician_signature
  	# Table name: medical_administration_records
  	#  timeRecorded       :timestamp
	#  actionDescription  :string(255)
	#  actionDetails      :string(255)
	#  clinicianSignature :string(255)
	rename_column :medical_administration_records, :timeRecorded, :time_recorded
	rename_column :medical_administration_records, :actionDescription, :description
	rename_column :medical_administration_records, :actionDetails, :note
	rename_column :medical_administration_records, :clinicianSignature, :clinician_signature
	# Table name: clinician_notes
	#  note_text           :text
	rename_column :clinician_notes, :note_text, :note
	# Table name: intake_documents
	#  timerecorded  :timestamp
	rename_column :intake_documents, :timerecorded, :time_recorded

  end

  def down
  end
end
