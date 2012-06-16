class ImproveVisitNames < ActiveRecord::Migration
  def up
#  mrNumber           :string(255)
#  chiefComplaint     :string(255)
#  dischargeDiagnosis :string(255)
#  created_at         :timestamp       not null
#  updated_at         :timestamp       not null
#  visittime          :timestamp
#  starts_hours_ago   :integer

	rename_column :visits, :mrNumber, :mr_number
	rename_column :visits, :chiefComplaint, :chief_complaint
	rename_column :visits, :visittime, :visit_time
	rename_column :visits, :starts_hours_ago, :duration_til_now_hours
  end

  def down
  end
end
