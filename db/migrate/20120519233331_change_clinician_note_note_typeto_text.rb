class ChangeClinicianNoteNoteTypetoText < ActiveRecord::Migration
  def up
  	change_column :clinician_notes, :noteText, :text
  end

  def down
  end
end
