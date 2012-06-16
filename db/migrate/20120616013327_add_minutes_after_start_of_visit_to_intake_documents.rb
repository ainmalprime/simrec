class AddMinutesAfterStartOfVisitToIntakeDocuments < ActiveRecord::Migration
  def change
    add_column :intake_documents, :minutes_after_start_of_visit, :integer
  end
end
