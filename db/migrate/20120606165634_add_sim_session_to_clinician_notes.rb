class AddSimSessionToClinicianNotes < ActiveRecord::Migration
  def change
    add_column :clinician_notes, :sim_session, :string
  end
end
