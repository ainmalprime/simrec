class CreateActionLogEntries < ActiveRecord::Migration
  def change
    create_table :action_log_entries do |t|
      t.string :description
      t.text :content
      t.text :sim_session

      t.timestamps
    end
  end
end
